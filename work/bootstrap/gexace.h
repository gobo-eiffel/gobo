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

/* ET_XACE_XML_GENERATOR */
typedef struct S43 T43;

/* ET_XACE_GE_GENERATOR */
typedef struct S44 T44;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct S45 T45;

/* ET_XACE_SE_GENERATOR */
typedef struct S46 T46;

/* ET_XACE_ISE_GENERATOR */
typedef struct S47 T47;

/* ET_XACE_VE_GENERATOR */
typedef struct S48 T48;

/* ET_XACE_VE41_GENERATOR */
typedef struct S49 T49;

/* KL_STRING_ROUTINES */
typedef struct S50 T50;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S51 T51;

/* SPECIAL [STRING_8] */
typedef struct S53 T53;

/* SPECIAL [INTEGER_32] */
typedef struct S54 T54;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S55 T55;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S56 T56;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S57 T57;

/* DS_LINKABLE [GEXACE_COMMAND] */
typedef struct S58 T58;

/* KL_STANDARD_FILES */
typedef struct S60 T60;

/* KL_STDERR_FILE */
typedef struct S61 T61;

/* KL_STDOUT_FILE */
typedef struct S62 T62;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S63 T63;

/* DS_LINKABLE [STRING_8] */
typedef struct S65 T65;

/* ARRAY [STRING_8] */
typedef struct S66 T66;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct S67 T67;

/* DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct S68 T68;

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

/* ET_XACE_SYSTEM_PARSER */
typedef struct S78 T78;

/* ET_XACE_SYSTEM */
typedef struct S79 T79;

/* KL_TEXT_INPUT_FILE */
typedef struct S80 T80;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S82 T82;

/* ET_XACE_LIBRARY_PARSER */
typedef struct S83 T83;

/* ET_XACE_LIBRARY */
typedef struct S84 T84;

/* ET_XACE_PARSER */
typedef struct S85 T85;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S87 T87;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S88 T88;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S89 T89;

/* ET_XACE_AST_FACTORY */
typedef struct S90 T90;

/* XM_DOCUMENT */
typedef struct S91 T91;

/* XM_ELEMENT */
typedef struct S92 T92;

/* XM_POSITION_TABLE */
typedef struct S93 T93;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S95 T95;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S96 T96;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S97 T97;

/* ET_XACE_VALIDATOR */
typedef struct S98 T98;

/* ET_XACE_PREPROCESSOR */
typedef struct S99 T99;

/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8] */
typedef struct S100 T100;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S101 T101;

/* XM_EIFFEL_PARSER */
typedef struct S102 T102;

/* SPECIAL [NATURAL_8] */
typedef struct S107 T107;

/* UT_MESSAGE */
typedef struct S108 T108;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct S109 T109;

/* ET_XACE_CLUSTERS */
typedef struct S110 T110;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct S111 T111;

/* ET_XACE_OPTIONS */
typedef struct S112 T112;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S113 T113;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S114 T114;

/* DS_HASH_SET [STRING_8] */
typedef struct S115 T115;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S116 T116;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct S117 T117;

/* ET_XACE_CLUSTER */
typedef struct S118 T118;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S119 T119;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct S120 T120;

/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct S121 T121;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct S122 T122;

/* ET_XACE_CLASS_OPTIONS */
typedef struct S123 T123;

/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct S124 T124;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct S125 T125;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct S126 T126;

/* ET_XACE_EXTERNALS */
typedef struct S127 T127;

/* ET_XACE_OPTION_NAMES */
typedef struct S128 T128;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct S129 T129;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct S130 T130;

/* ET_XACE_ASSEMBLY */
typedef struct S131 T131;

/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE] */
typedef struct S132 T132;

/* ET_XACE_EXPORTED_FEATURE */
typedef struct S135 T135;

/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE] */
typedef struct S136 T136;

/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S138 T138;

/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S139 T139;

/* XM_ATTRIBUTE */
typedef struct S141 T141;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S142 T142;

/* DS_HASH_TABLE [INTEGER_32, STRING_8] */
typedef struct S144 T144;

/* UNIX_FILE_INFO */
typedef struct S147 T147;

/* SPECIAL [NATURAL_64] */
typedef struct S148 T148;

/* XM_NAMESPACE_RESOLVER */
typedef struct S149 T149;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S150 T150;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S151 T151;

/* XM_CALLBACKS_NULL */
typedef struct S152 T152;

/* UT_TEMPLATE_EXPANDER */
typedef struct S154 T154;

/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8] */
typedef struct S156 T156;

/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8] */
typedef struct S158 T158;

/* SPECIAL [ET_XACE_LIBRARY] */
typedef struct S159 T159;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY] */
typedef struct S160 T160;

/* XM_EIFFEL_SCANNER */
typedef struct S161 T161;

/* XM_DEFAULT_POSITION */
typedef struct S162 T162;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S164 T164;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S165 T165;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S166 T166;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S168 T168;

/* SPECIAL [ANY] */
typedef struct S169 T169;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S170 T170;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S171 T171;

/* XM_EIFFEL_DECLARATION */
typedef struct S172 T172;

/* XM_DTD_EXTERNAL_ID */
typedef struct S173 T173;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S174 T174;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S175 T175;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S176 T176;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S177 T177;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S178 T178;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S179 T179;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S180 T180;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S181 T181;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S182 T182;

/* SPECIAL [BOOLEAN] */
typedef struct S183 T183;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S184 T184;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S185 T185;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S186 T186;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S187 T187;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S188 T188;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S189 T189;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S191 T191;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S193 T193;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S194 T194;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S195 T195;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S196 T196;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S197 T197;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S198 T198;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S199 T199;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S201 T201;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S202 T202;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S204 T204;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct S205 T205;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct S206 T206;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct S207 T207;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct S208 T208;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S209 T209;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct S210 T210;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct S211 T211;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct S212 T212;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct S213 T213;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct S214 T214;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct S215 T215;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct S216 T216;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S217 T217;

/* KL_OPERATING_SYSTEM */
typedef struct S218 T218;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S220 T220;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S221 T221;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S222 T222;

/* ARRAY [INTEGER_32] */
typedef struct S223 T223;

/* UC_UTF8_ROUTINES */
typedef struct S224 T224;

/* UC_UTF8_STRING */
typedef struct S226 T226;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S227 T227;

/* KL_INTEGER_ROUTINES */
typedef struct S228 T228;

/* KL_PLATFORM */
typedef struct S229 T229;

/* UT_TRISTATE */
typedef struct S230 T230;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct S231 T231;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct S232 T232;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S233 T233;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S234 T234;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S235 T235;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S236 T236;

/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S237 T237;

/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S238 T238;

/* DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct S239 T239;

/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE] */
typedef struct S240 T240;

/* SPECIAL [DS_HASH_SET [STRING_8]] */
typedef struct S241 T241;

/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S243 T243;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]] */
typedef struct S245 T245;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
typedef struct S247 T247;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
typedef struct S249 T249;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S250 T250;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S251 T251;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S253 T253;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8] */
typedef struct S254 T254;

/* TO_SPECIAL [ET_XACE_LIBRARY] */
typedef struct S255 T255;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S256 T256;

/* YY_BUFFER */
typedef struct S257 T257;

/* YY_FILE_BUFFER */
typedef struct S258 T258;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S261 T261;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S262 T262;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S263 T263;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S264 T264;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S265 T265;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S266 T266;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S268 T268;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S270 T270;

/* TO_SPECIAL [ANY] */
typedef struct S271 T271;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S272 T272;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S273 T273;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S274 T274;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S275 T275;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S276 T276;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S277 T277;

/* DS_BILINKABLE [STRING_8] */
typedef struct S278 T278;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S279 T279;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S280 T280;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S281 T281;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S282 T282;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S283 T283;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S284 T284;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S285 T285;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S286 T286;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S287 T287;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S288 T288;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct S289 T289;

/* UC_UNICODE_ROUTINES */
typedef struct S290 T290;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S291 T291;

/* EXECUTION_ENVIRONMENT */
typedef struct S293 T293;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S295 T295;

/* UC_UTF16_ROUTINES */
typedef struct S296 T296;

/* TO_SPECIAL [ET_XACE_CLUSTER] */
typedef struct S297 T297;

/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S298 T298;

/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S299 T299;

/* TO_SPECIAL [DS_HASH_SET [STRING_8]] */
typedef struct S300 T300;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
typedef struct S301 T301;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S303 T303;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S304 T304;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S306 T306;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S307 T307;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S308 T308;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S309 T309;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S310 T310;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S311 T311;

/* XM_COMMENT */
typedef struct S312 T312;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S313 T313;

/* XM_CHARACTER_DATA */
typedef struct S314 T314;

/* XM_NAMESPACE */
typedef struct S315 T315;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S317 T317;

/* KL_CHARACTER_BUFFER */
typedef struct S318 T318;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S319 T319;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S320 T320;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S321 T321;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S324 T324;

/* C_STRING */
typedef struct S326 T326;

/* DS_LINKABLE [XM_NODE] */
typedef struct S328 T328;

/* XM_NODE_TYPER */
typedef struct S330 T330;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S336 T336;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S337 T337;

/* KL_STRING_INPUT_STREAM */
typedef struct S339 T339;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S340 T340;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S341 T341;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S342 T342;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S343 T343;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct S344 T344;

/* MANAGED_POINTER */
typedef struct S345 T345;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S346 T346;

/* PLATFORM */
typedef struct S347 T347;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S348 T348;

/* EXCEPTIONS */
typedef struct S349 T349;

/* STRING_SEARCHER */
typedef struct S350 T350;

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
struct S250 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S348 {
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
	T0* a1; /* generators */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T0* a4; /* xace_filename */
	T1 a5; /* is_shallow */
	T1 a6; /* is_ve */
	T0* a7; /* output_filename */
};

/* Struct for type GEXACE_LIBRARY_COMMAND */
struct S40 {
	int id;
	T0* a1; /* generators */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T0* a4; /* xace_filename */
	T1 a5; /* is_shallow */
	T1 a6; /* is_ve */
	T0* a7; /* output_filename */
};

/* Struct for type GEXACE_VALIDATE_COMMAND */
struct S41 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T0* a3; /* xace_filename */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_XML_GENERATOR */
struct S43 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T1 a3; /* is_shallow */
};

/* Struct for type ET_XACE_GE_GENERATOR */
struct S44 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_GENERATOR] */
struct S45 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type ET_XACE_SE_GENERATOR */
struct S46 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_ISE_GENERATOR */
struct S47 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_VE_GENERATOR */
struct S48 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T1 a3; /* is_shallow */
};

/* Struct for type ET_XACE_VE41_GENERATOR */
struct S49 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type KL_STRING_ROUTINES */
struct S50 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S51 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [STRING_8] */
struct S53 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S54 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S55 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S56 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S57 {
	int id;
};

/* Struct for type DS_LINKABLE [GEXACE_COMMAND] */
struct S58 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_STANDARD_FILES */
struct S60 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S61 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_STDOUT_FILE */
struct S62 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S63 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S65 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [STRING_8] */
struct S66 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
struct S67 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [ET_XACE_GENERATOR] */
struct S68 {
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
	T6 a4; /* last_byte_index_input */
	T6 a5; /* last_byte_index_result */
	T0* a6; /* area */
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
	T6 a6; /* conversion_type */
	T0* a7; /* leading_separators */
	T0* a8; /* trailing_separators */
	T1 a9; /* leading_separators_acceptable */
	T1 a10; /* trailing_separators_acceptable */
};

/* Struct for type ET_XACE_SYSTEM_PARSER */
struct S78 {
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
struct S79 {
	int id;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S80 {
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
struct S82 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type ET_XACE_LIBRARY_PARSER */
struct S83 {
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
struct S84 {
	int id;
	T0* a1; /* name */
	T0* a2; /* options */
	T0* a3; /* clusters */
	T0* a4; /* library_prefix */
	T0* a5; /* libraries */
};

/* Struct for type ET_XACE_PARSER */
struct S85 {
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
struct S87 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S88 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S89 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type ET_XACE_AST_FACTORY */
struct S90 {
	int id;
};

/* Struct for type XM_DOCUMENT */
struct S91 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T6 a5; /* count */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S92 {
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
struct S93 {
	int id;
	T0* a1; /* table */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S95 {
	int id;
	T0* a1; /* error */
	T0* a2; /* tree */
	T0* a3; /* start */
	T0* a4; /* last */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S96 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S97 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type ET_XACE_VALIDATOR */
struct S98 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_PREPROCESSOR */
struct S99 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8] */
struct S100 {
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
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S101 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S102 {
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
struct S107 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type UT_MESSAGE */
struct S108 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NOT_XACE_FILE_ERROR */
struct S109 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_CLUSTERS */
struct S110 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARIES */
struct S111 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_XACE_OPTIONS */
struct S112 {
	int id;
	T0* a1; /* declared_abstract */
	T0* a2; /* declared_recursive */
	T0* a3; /* declared_read_only */
	T0* a4; /* declared_address_expression */
	T0* a5; /* declared_arguments */
	T0* a6; /* declared_array_optimization */
	T0* a7; /* declared_assertion */
	T0* a8; /* declared_check_vape */
	T0* a9; /* declared_cls_compliant */
	T0* a10; /* declared_console_application */
	T0* a11; /* declared_dead_code_removal */
	T0* a12; /* declared_debug_option */
	T0* a13; /* declared_debug_tag */
	T0* a14; /* declared_document */
	T0* a15; /* declared_dotnet_naming_convention */
	T0* a16; /* declared_dynamic_runtime */
	T0* a17; /* declared_exception_trace */
	T0* a18; /* declared_il_verifiable */
	T0* a19; /* declared_inlining */
	T6 a20; /* declared_inlining_size */
	T0* a21; /* declared_line_generation */
	T0* a22; /* declared_metadata_cache_path */
	T0* a23; /* declared_msil_assembly_compatibility */
	T0* a24; /* declared_msil_clr_version */
	T0* a25; /* declared_msil_generation */
	T0* a26; /* declared_msil_generation_version */
	T0* a27; /* declared_multithreaded */
	T0* a28; /* declared_override_cluster */
	T0* a29; /* declared_precompiled */
	T0* a30; /* declared_profile */
	T0* a31; /* declared_shared_library_definition */
	T0* a32; /* declared_target */
	T0* a33; /* declared_trace */
	T0* a34; /* declared_use_cluster_name_as_namespace */
	T0* a35; /* declared_use_full_cluster_name_as_namespace */
	T0* a36; /* declared_finalize_option */
	T0* a37; /* declared_case_insensitive */
	T0* a38; /* declared_garbage_collector */
	T0* a39; /* declared_high_memory_compiler */
	T0* a40; /* declared_manifest_string_trace */
	T0* a41; /* declared_verbose */
	T0* a42; /* declared_warning */
	T0* a43; /* declared_clean */
	T0* a44; /* declared_gc_info */
	T0* a45; /* declared_split */
	T0* a46; /* declared_strip_option */
	T0* a47; /* declared_wedit */
	T0* a48; /* declared_assembly */
	T0* a49; /* declared_callback */
	T0* a50; /* declared_component */
	T0* a51; /* declared_create_keyword_extension */
	T0* a52; /* declared_culture */
	T0* a53; /* declared_c_compiler_options */
	T0* a54; /* declared_debugger */
	T0* a55; /* declared_exclude */
	T0* a56; /* declared_include */
	T0* a57; /* declared_export_option */
	T0* a58; /* declared_flat_fst_optimization */
	T6 a59; /* declared_fst_expansion_factor */
	T0* a60; /* declared_fst_optimization */
	T0* a61; /* declared_header */
	T6 a62; /* declared_heap_size */
	T0* a63; /* declared_jumps_optimization */
	T0* a64; /* declared_layout */
	T0* a65; /* declared_layout_optimization */
	T0* a66; /* declared_leaves_optimization */
	T0* a67; /* declared_link */
	T0* a68; /* declared_linker */
	T0* a69; /* declared_linux_fpu_double_precision */
	T0* a70; /* declared_map */
	T0* a71; /* declared_no_default_lib */
	T0* a72; /* declared_portable_code_generation */
	T0* a73; /* declared_prefix_option */
	T0* a74; /* declared_public_key_token */
	T0* a75; /* declared_reloads_optimization */
	T6 a76; /* declared_stack_size */
	T0* a77; /* declared_storable_filename */
	T0* a78; /* declared_version */
	T0* a79; /* declared_visible_filename */
	T0* a80; /* declared_namespace */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S113 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S114 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S115 {
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
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S116 {
	int id;
	T6 a1; /* count */
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
struct S117 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_CLUSTER */
struct S118 {
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
	T0* a15; /* parent */
	T1 a16; /* is_mounted */
	T0* a17; /* provider_constraint */
	T0* a18; /* dependant_constraint */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
struct S119 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARY */
struct S120 {
	int id;
	T0* a1; /* pathname */
	T0* a2; /* library */
	T0* a3; /* position */
	T0* a4; /* library_prefix */
	T1 a5; /* is_root */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
struct S121 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
struct S122 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_CLASS_OPTIONS */
struct S123 {
	int id;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
struct S124 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
struct S125 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_FEATURE_OPTIONS */
struct S126 {
	int id;
	T0* a1; /* feature_name */
	T0* a2; /* options */
};

/* Struct for type ET_XACE_EXTERNALS */
struct S127 {
	int id;
	T0* a1; /* c_compiler_options */
	T0* a2; /* include_directories */
	T0* a3; /* link_libraries */
};

/* Struct for type ET_XACE_OPTION_NAMES */
struct S128 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
struct S129 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
struct S130 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_ASSEMBLY */
struct S131 {
	int id;
	T0* a1; /* tag */
	T0* a2; /* assembly_name */
	T0* a3; /* version */
	T0* a4; /* culture */
	T0* a5; /* public_key_token */
	T0* a6; /* class_prefix */
	T0* a7; /* assembly_pathname */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE] */
struct S132 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type ET_XACE_EXPORTED_FEATURE */
struct S135 {
	int id;
	T0* a1; /* class_name */
	T0* a2; /* feature_name */
	T0* a3; /* external_name */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE] */
struct S136 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8] */
struct S138 {
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
};

/* Struct for type DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
struct S139 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type XM_ATTRIBUTE */
struct S141 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S142 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* before */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, STRING_8] */
struct S144 {
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
};

/* Struct for type UNIX_FILE_INFO */
struct S147 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S148 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S149 {
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
struct S150 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S151 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S152 {
	int id;
};

/* Struct for type UT_TEMPLATE_EXPANDER */
struct S154 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8] */
struct S156 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8] */
struct S158 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_XACE_LIBRARY] */
struct S159 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY] */
struct S160 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S161 {
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
struct S162 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S164 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* internal_cursor */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S165 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S166 {
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
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S168 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S169 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S170 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S171 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S172 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S173 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S174 {
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
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S175 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S176 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S177 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S178 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S179 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S180 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S181 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S182 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S183 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S184 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S185 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S186 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S187 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S188 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S189 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S191 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S193 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S194 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S195 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S196 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S197 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S198 {
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
struct S199 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S201 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S202 {
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
struct S204 {
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
struct S205 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
struct S206 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
struct S207 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
struct S208 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
struct S209 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
struct S210 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ATTRIBUTE_ERROR */
struct S211 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ELEMENT_ERROR */
struct S212 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
struct S213 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_ELEMENT_ERROR */
struct S214 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
struct S215 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
struct S216 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S217 {
	int id;
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S218 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S220 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S221 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S222 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S223 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S224 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S226 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S227 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S228 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S229 {
	int id;
};

/* Struct for type UT_TRISTATE */
struct S230 {
	int id;
	T2 a1; /* value */
};

/* Struct for type SPECIAL [ET_XACE_CLUSTER] */
struct S231 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
struct S232 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S233 {
	int id;
	T0* a1; /* container */
};

/* Struct for type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S234 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
struct S235 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
struct S236 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
struct S237 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
struct S238 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_ASSEMBLY] */
struct S239 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_EXPORTED_FEATURE] */
struct S240 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [DS_HASH_SET [STRING_8]] */
struct S241 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8] */
struct S243 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]] */
struct S245 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
struct S247 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
struct S249 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S251 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S253 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8] */
struct S254 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [ET_XACE_LIBRARY] */
struct S255 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S256 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S257 {
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
struct S258 {
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
struct S261 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S262 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S263 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S264 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S265 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S266 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S268 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S270 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S271 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S272 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S273 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S274 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S275 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S276 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S277 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S278 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S279 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S280 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S281 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S282 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S283 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S284 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S285 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S286 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S287 {
	int id;
	T0* a1; /* area */
};

/* Struct for type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
struct S288 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_INVALID_EXPRESSION_ERROR */
struct S289 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S290 {
	int id;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S291 {
	int id;
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S293 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S295 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S296 {
	int id;
};

/* Struct for type TO_SPECIAL [ET_XACE_CLUSTER] */
struct S297 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S298 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
struct S299 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [STRING_8]] */
struct S300 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
struct S301 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S303 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S304 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S306 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S307 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S308 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S309 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S310 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S311 {
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
};

/* Struct for type XM_COMMENT */
struct S312 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S313 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S314 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S315 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S317 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S318 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S319 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S320 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S321 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S324 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type C_STRING */
struct S326 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S328 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S330 {
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
struct S336 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S337 {
	int id;
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S339 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* string */
	T6 a4; /* location */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S340 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S341 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S342 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S343 {
	int id;
};

/* Struct for type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
struct S344 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type MANAGED_POINTER */
struct S345 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S346 {
	int id;
	T0* a1; /* area */
};

/* Struct for type PLATFORM */
struct S347 {
	int id;
};

/* Struct for type EXCEPTIONS */
struct S349 {
	int id;
};

/* Struct for type STRING_SEARCHER */
struct S350 {
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
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T57 GE_default57;
extern T58 GE_default58;
extern T60 GE_default60;
extern T61 GE_default61;
extern T62 GE_default62;
extern T63 GE_default63;
extern T65 GE_default65;
extern T66 GE_default66;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T76 GE_default76;
extern T78 GE_default78;
extern T79 GE_default79;
extern T80 GE_default80;
extern T82 GE_default82;
extern T83 GE_default83;
extern T84 GE_default84;
extern T85 GE_default85;
extern T87 GE_default87;
extern T88 GE_default88;
extern T89 GE_default89;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T93 GE_default93;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
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
extern T135 GE_default135;
extern T136 GE_default136;
extern T138 GE_default138;
extern T139 GE_default139;
extern T141 GE_default141;
extern T142 GE_default142;
extern T144 GE_default144;
extern T147 GE_default147;
extern T148 GE_default148;
extern T149 GE_default149;
extern T150 GE_default150;
extern T151 GE_default151;
extern T152 GE_default152;
extern T154 GE_default154;
extern T156 GE_default156;
extern T158 GE_default158;
extern T159 GE_default159;
extern T160 GE_default160;
extern T161 GE_default161;
extern T162 GE_default162;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
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
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T201 GE_default201;
extern T202 GE_default202;
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
extern T220 GE_default220;
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
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
extern T239 GE_default239;
extern T240 GE_default240;
extern T241 GE_default241;
extern T243 GE_default243;
extern T245 GE_default245;
extern T247 GE_default247;
extern T249 GE_default249;
extern T250 GE_default250;
extern T251 GE_default251;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T261 GE_default261;
extern T262 GE_default262;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T268 GE_default268;
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
extern T293 GE_default293;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T303 GE_default303;
extern T304 GE_default304;
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
extern T324 GE_default324;
extern T326 GE_default326;
extern T328 GE_default328;
extern T330 GE_default330;
extern T336 GE_default336;
extern T337 GE_default337;
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

extern T0* GE_ms(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T35x2345(T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T42x2366(T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T42x2365(T0* C);
/* Call to XM_NODE.parent */
extern T0* T143x5174(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T161x7667(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T161x7542T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T161x7672(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T161x7553(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T161x7663(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T161x7551(T0* C);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T29x1913T0(T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T29x1918(T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T42x2370T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T42x2369T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T103x5458T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T104x5514T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T104x5515T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T104x5520(T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T104x5513(T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T104x5519T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T104x5521T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T104x5518T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T104x5522T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T104x5516T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T104x5517T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T104x5512(T0* C);
/* Call to XM_NODE.node_set_parent */
extern void T143x5182T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T143x5184T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T161x7538(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T161x7537T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T161x7543T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T161x7534(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T161x7678(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T161x7536T0(T0* C, T0* a1);
/* GEXACE.make */
extern T0* T21c20(void);
/* KL_EXCEPTIONS.die */
extern void T30f2(T0* C, T6 a1);
/* GEXACE.exceptions */
extern unsigned char ge134os1592;
extern T0* ge134ov1592;
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
extern void T61f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T61f13(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T61f12(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T61f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T61f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T50f10(T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T226f36(T0* C);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T226f23(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T224f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f15(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge147os3725;
extern T0* ge147ov3725;
extern T0* T226f24(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T224c36(void);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T228f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge83os2609;
extern T0* ge83ov2609;
extern T0* T226f22(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T228c4(void);
/* INTEGER_32.infix "<=" */
extern T1 T6f6(T6* C, T6 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge213os8513;
extern T6 ge213ov8513;
extern T6 T229f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T6 T229f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge137os2606;
extern T0* ge137ov2606;
extern T0* T226f21(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T229c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T226f20(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T224f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T224f4(T0* C, T2 a1);
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
extern T2 T226f19(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T226f32(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T226f64(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T226f72(T0* C);
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
extern T0* T226f35(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T226f17(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T70f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge78os1677;
extern T0* ge78ov1677;
extern T0* T50f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T70c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge86os1585;
extern T0* ge86ov1585;
extern T0* T61f6(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T50c14(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T28f6(T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge54os1572;
extern T0* ge54ov1572;
extern T0* T21f15(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T34c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T66f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T66c6(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T66f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T53c4(T6 a1);
/* GEXACE.process_validate */
extern void T21f33(T0* C);
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
extern void T58f4(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T58c3(T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].is_empty */
extern T1 T27f5(T0* C);
/* GEXACE_VALIDATE_COMMAND.set_shallow */
extern void T41f7(T0* C, T1 a1);
/* GEXACE_VALIDATE_COMMAND.make */
extern T0* T41c6(T0* a1, T0* a2);
/* GEXACE.process_library */
extern void T21f32(T0* C);
/* GEXACE.process_output */
extern void T21f35(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_output_filename */
extern void T40f12(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T36f12(T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T21f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T1 T45f5(T0* C);
/* ET_XACE_XML_GENERATOR.set_shallow */
extern void T43f17(T0* C, T1 a1);
/* ET_XACE_XML_GENERATOR.make */
extern T0* T43c16(T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.make */
extern T0* T49c9(T0* a1, T0* a2);
/* GEXACE_LIBRARY_COMMAND.set_ve */
extern void T40f11(T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.set_ve */
extern void T36f11(T0* C, T1 a1);
/* ET_XACE_VE_GENERATOR.make */
extern T0* T48c16(T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.make */
extern T0* T47c15(T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.make */
extern T0* T46c10(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T45f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T68f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T68c3(T0* a1);
/* ET_XACE_GE_GENERATOR.make */
extern T0* T44c15(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T24f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T24f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T24f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T24f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T24f22(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T24f28(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T226f14(T0* C);
/* UC_UTF8_STRING.hash_code */
extern T6 T226f14p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f10(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f10(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T24f44(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T24f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T56f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].resized_area */
extern T0* T54f3(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].copy_data */
extern void T54f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T54f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T54f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T54f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern T0* T54c4(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge84os2123;
extern T0* ge84ov2123;
extern T0* T24f27(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T56c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T24f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T57f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].resized_area */
extern T0* T53f3(T0* C, T6 a1);
/* SPECIAL [STRING_8].copy_data */
extern void T53f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING_8].move_data */
extern void T53f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T53f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T53f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T24f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T24f24(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T24f25(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T24f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T24f29(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T24f23(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T24f43(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T24f42(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T25f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.same_string */
extern T1 T50f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.item_code */
extern T6 T226f13(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T226f29(T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f11(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T50f7(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T226f11(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T226f28(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.item */
extern T2 T226f12(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T226f30(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f9(T0* C, T6 a1);
/* STRING_8.same_string */
extern T1 T17f14(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T226f10(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T226f27(T0* C, T0* a1, T6 a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern T0* T25f2(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T24f41(T0* C);
/* STRING_8.is_equal */
extern T1 T17f7(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f8(T0* C, T0* a1, T0* a2, T6 a3);
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
extern void T40f10(T0* C, T1 a1);
/* GEXACE_LIBRARY_COMMAND.make */
extern T0* T40c9(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].make */
extern T0* T45c8(void);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T45f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T67c7(T0* a1);
/* GEXACE.process_cluster */
extern void T21f31(T0* C);
/* GEXACE.process_system */
extern void T21f30(T0* C);
/* GEXACE_SYSTEM_COMMAND.set_shallow */
extern void T36f10(T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.make */
extern T0* T36c9(T0* a1, T0* a2);
/* GEXACE.match_long_option */
extern T1 T21f8(T0* C, T0* a1);
/* GEXACE.process_options */
extern void T21f25(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.enable_verbose */
extern void T28f10(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge118os2720;
extern T0* ge118ov2720;
extern T0* T60f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T62c7(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T62f8(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T62f10(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T62f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T62f9(T0* C, T0* a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge118os2721;
extern T0* ge118ov2721;
extern T0* T60f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T61c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T61f11(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T61f15(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T61f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T61f14(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge116os2221;
extern T0* ge116ov2221;
extern T0* T28f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T60c3(void);
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
extern T0* T50f2(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T226f59(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T226f74(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T226f59p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f37(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T50f8(T0* C, T0* a1);
/* UC_UTF8_STRING.twin */
extern T0* T226f16(T0* C);
/* UC_UTF8_STRING.copy */
extern void T226f63(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T226f63p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f3(T0* C);
/* STRING_8.twin */
extern T0* T17f15(T0* C);
/* STRING_8.copy */
extern void T17f39(T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T226f9(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T226f58(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T226c58(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T226f66(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T226f40(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T226f40p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T226f58p1(T0* C, T6 a1);
/* UC_UTF8_STRING.make_area */
extern void T226f73(T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T226f15(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T226c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T226f71(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T226f80(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T224f24(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T226f70(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T224f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T226f78(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T226f69(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T226f38(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T224f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T226f44(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge159os8418;
extern T0* ge159ov8418;
extern T0* T224f27(T0* C);
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
/* UC_STRING.make_area */
extern void T69f13(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T69f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T224f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T226f42(T0* C);
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
extern void T65f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T65c3(T0* a1);
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
extern unsigned char ge117os2222;
extern T0* ge117ov2222;
extern T0* T28f8(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T63c3(T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T28f13(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T28f12(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T27c8(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T24f38(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T51f6(T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge149os1591;
extern T0* ge149ov1591;
extern T0* T21f12(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T25c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T24f37(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T24c37(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T24f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T51c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T51f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T71c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T24f26(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T55c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T24f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T24f56(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T56f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T72c2(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T24f55(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T24f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T57f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T73c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T57c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T24f53(T0* C, T6 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T23f5(T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge132os1584;
extern T0* ge132ov1584;
extern T0* T21f7(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T23c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T204f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T204f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T258f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T227f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge119os4501;
extern T0* ge119ov4501;
extern T0* T339f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T204f241p1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T204f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T204f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T204f70(T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T6 T318f4(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T258f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T257f14(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T258f18(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T257f13(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T204f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T258c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T258f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T258f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T258f25(T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T318f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f46(T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T227f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T80f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T258f16(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T318c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge210os2747;
extern T1 ge210ov2747;
extern T1 T218f6(T0* C);
/* PLATFORM.default_create */
extern T0* T347c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge136os1599;
extern T0* ge136ov1599;
extern T0* T318f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T218c7(void);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge306os8706;
extern T6 ge306ov8706;
extern T6 T258f13(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T227c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T295c6(void);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T202f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T202f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T202f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T202f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T202f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T202f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T202f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T198f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T198f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T198f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T198f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T198f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T198f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T198f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T161f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T161f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T161f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T161f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T161f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T161f182(T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T161f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T204f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T204f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T204f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T204f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T204f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T256f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T50f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T256f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T256f3(T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T224f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T224f29(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T256f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T256f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T256f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T290f2(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge144os2610;
extern T0* ge144ov2610;
extern T0* T256f4(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T290c27(void);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T256f9(T0* C, T0* a1);
/* STRING_8.to_integer */
extern T6 T17f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T76f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T76f17(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T226f37(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f24(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f16(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T76f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T76f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T89f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2121os3959;
extern T0* ge2121ov3959;
extern T0* T76f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T89c13(void);
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
extern T0* T148c2(T6 a1);
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
extern T0* T107c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T76f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge2118os1258;
extern T0* ge2118ov1258;
extern T0* T17f18(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T76f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T76f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T76f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c43(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T76f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T76c16(void);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T204f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T204f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T204f181(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T318f3(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T204f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T204f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T204f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T204f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1315os7560;
extern T0* ge1315ov7560;
extern T0* T204f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T204f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T204f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T204f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T261f7(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T204f233(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T261f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T261f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T204f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T261f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T306f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T306c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T204f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T204f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T204f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T204f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T258f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T318f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T227f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T227f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T339f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T339f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T80f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge204os4523;
extern T0* ge204ov4523;
extern T0* T80f34(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T80f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T80f35(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f5(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T80f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T80f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T80f29(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T227f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T295f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T227f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T295f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T295f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T227f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T227f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T227f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T295f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T321f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T295f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T321c3(T2 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T227f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T50f16(T0* C, T0* a1);
/* STRING_8.clear_all */
extern void T17f48(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T227f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1306os8454;
extern T0* ge1306ov8454;
extern T0* T227f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T296f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T296f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T296f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T296f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T296f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge145os2611;
extern T0* ge145ov2611;
extern T0* T227f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T296c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T227f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T227f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T227f34(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T80f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T80f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T80f28(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T227f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T224f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T224f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T296f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T296f1(T0* C, T6 a1, T6 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T258f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T318f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f51(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T258f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T318f12(T0* C, T6 a1);
/* YY_BUFFER.fill */
extern void T257f15(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T204f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T204f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T204f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T318f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T204f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T202f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T202f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T202f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T202f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T202f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T202f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T202f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T202f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T202f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T202f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T202f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T202f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T202f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T202f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T202f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T202f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T202f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T202f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T202f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T202f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T202f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T202f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T198f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T198f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T198f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T198f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T198f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T198f62(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T198f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T198f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T198f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T198f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T198f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T198f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T198f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T198f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T198f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T198f229(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T198f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T198f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T198f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T198f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T198f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T198f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T198f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T198f94(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T198f236(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T161f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T161f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T161f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T161f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T161f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T161f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T161f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T161f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T161f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T161f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T161f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T161f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T161f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T161f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T161f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T161f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T161f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T161f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T161f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T161f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T161f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T204f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T202f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T198f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T161f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T204f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T227f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T50f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f16(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f19(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T290f1(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T223f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge162os8778;
extern T0* ge162ov8778;
extern T0* T290f3(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge162os8777;
extern T0* ge162ov8777;
extern T0* T290f10(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge162os8766;
extern T0* ge162ov8766;
extern T0* T290f17(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T228f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T290f26(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern T0* T319c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge162os8776;
extern T0* ge162ov8776;
extern T0* T290f9(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge162os8775;
extern T0* ge162ov8775;
extern T0* T290f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge162os8774;
extern T0* ge162ov8774;
extern T0* T290f8(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge162os8773;
extern T0* ge162ov8773;
extern T0* T290f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge162os8772;
extern T0* ge162ov8772;
extern T0* T290f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge162os8771;
extern T0* ge162ov8771;
extern T0* T290f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge162os8770;
extern T0* ge162ov8770;
extern T0* T290f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge162os8769;
extern T0* ge162ov8769;
extern T0* T290f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge162os8768;
extern T0* ge162ov8768;
extern T0* T290f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge162os8767;
extern T0* ge162ov8767;
extern T0* T290f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge162os8765;
extern T0* ge162ov8765;
extern T0* T290f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge162os8764;
extern T0* ge162ov8764;
extern T0* T290f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge162os8763;
extern T0* ge162ov8763;
extern T0* T290f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge162os8762;
extern T0* ge162ov8762;
extern T0* T290f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge162os8761;
extern T0* ge162ov8761;
extern T0* T290f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge162os8760;
extern T0* ge162ov8760;
extern T0* T290f11(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern T0* T320c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T50f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T202f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T198f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T161f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T204f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T168f3(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T202f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T198f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T161f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T204f236(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T168f7(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T339f10(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T80f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T80f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T80f42(T0* C, T14 a1);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T339f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T80f24(T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T80f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T80f19(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T202f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T198f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T161f199(T0* C);
/* XM_CHARACTER_DATA.process */
extern void T314f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T330f17(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T330f13(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T313f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T330f16(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T312f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T330f15(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T141f8(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T330f14(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T92f39(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T330f11(T0* C, T0* a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T314f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T313f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T312f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T141f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T92f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T152f2(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T149f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T149f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T149f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T253c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T251c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T303c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T303f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T304c7(T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T97f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T311c31(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T341c3(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T311f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T311f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T342c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T311f35(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T311f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T311f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T311f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T311f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T311f41(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T311f40(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T343f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T346c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T340c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T343c3(void);
/* XM_DOCUMENT.make */
extern T0* T91c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T91f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T91f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T91f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T328f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T328c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T91f13(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T91f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T92f38(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T142f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T91f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T91f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T142f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T91f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T142f17(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T92f45(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T92f47(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T92f48(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T142f14(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T91f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T91f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T142f13(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T328f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T91f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T328f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T91f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T91f36(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T142f15(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T91f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T91f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T142f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T91f11(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T92f23(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T91f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T91f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T142f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T91f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T92f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T92f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T92f37(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T92f36(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T92f35(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T92f42(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T92f40(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T92f43(T0* C);
/* XM_ELEMENT.remove_first */
extern void T92f34(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T92f41(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T142f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T142f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T91f23(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T91f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T92f44(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T92f25(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T92f21(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T142c9(T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T91f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T91f9(T0* C);
/* XM_DOCUMENT.list_make */
extern void T91f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T92c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T92f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1266os5183;
extern T0* ge1266ov5183;
extern T0* T91f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T315c9(void);
/* XM_NAMESPACE.make */
extern void T315f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T315c8(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T96f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T96f6p1(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T152c1(void);
/* XM_CALLBACKS_NULL.on_comment */
extern void T152f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T149f28(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T97f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T97f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T93f4(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T221f14(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T317f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T317c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T221f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T222c3(T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T102f128(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T164f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T102f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T102f125(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T165f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T165f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T165f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T164f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T262f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T262f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T262c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T164f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T164c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T164f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T263c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T165f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T264f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T264c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T165c5(void);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T102f121(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T97f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T312c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T92f28(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T92f28p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T92f28p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T92f33(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T92f17(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T92f16(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T312c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T96f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T96f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T152f5(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T149f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T97f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T313c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T313c4(T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T96f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T96f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T152f6(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T149f30(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T97f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T314c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T96f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T96f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T152f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T149f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T251f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T303f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T324f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T324f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T324c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T303f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T251f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T24f58(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T251f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T24c57(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T24f35(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T97f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T92c27(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T92c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T91f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T91f27(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T142f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T91f25(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T92f46(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T97f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T311f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T311f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T311f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T311f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T311f22(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T315f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T311f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T311f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T311f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T311f45(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T343f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T340f3(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].copy_data */
extern void T340f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_NAMESPACE].move_data */
extern void T340f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].overlapping_move */
extern void T340f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].non_overlapping_move */
extern void T340f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T311f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T311f16(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T311f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T311f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T311f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T311f36(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T311f33(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T341f1(T0* C, T0* a1, T0* a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T70f2(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T1 T315f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T315f3(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T171f10(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T277f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T178f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T178f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T277f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T178f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T277f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T277f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T277f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T178f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T178f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T178f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T277c7(T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T171f15(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T171f8(T0* C);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
extern T0* T341f2(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T311f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T315f7(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T311f24(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T311f27(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T96f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T96f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T152f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T149f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T251f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T303f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T303f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T324f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T303f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T304f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T304f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T303f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T303f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T251f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1240os8623;
extern T0* ge1240ov8623;
extern T0* T251f7(T0* C);
/* STRING_8.make_empty */
extern T0* T17c44(void);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T149f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T251f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T304f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T303f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T303f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T303f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T304f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T304f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T303f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T304f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T303f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T24f33(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T24f34(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T24f32(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T304f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T304f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T303f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1240os8624;
extern T0* ge1240ov8624;
extern T0* T251f6(T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T149f9(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T97f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T92f8(T0* C);
/* XM_DOCUMENT.process */
extern void T91f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T330f12(T0* C, T0* a1);
/* XM_NODE_TYPER.default_create */
extern T0* T330c10(void);
/* XM_ELEMENT.is_root_node */
extern T1 T92f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T91f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T96f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T96f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T152f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T149f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T251f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T24f59(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T303f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T251f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T149f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T253f7(T0* C, T0* a1);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T253f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T251f13(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T149f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T149f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T149f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1207os2424;
extern T0* ge1207ov2424;
extern T0* T149f20(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T97f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T141c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T96f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T96f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T152f3(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T149f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T97f13(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T96f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T96f7p1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T152f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T149f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T149f31p1(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T50f4(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f38(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T50f9(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f16(T0* C, T0* a1);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T226f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T226f7(T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T226f54(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge226os3663;
extern T0* ge226ov3663;
extern T0* T226f41(T0* C);
/* UC_UTF8_STRING.append_substring */
extern void T226f56(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T226f68(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T226f79(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T226f54p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T226f67(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T226f43(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T294s1(T1 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T149f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T149f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T149f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T253f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T253f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T149f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1207os2423;
extern T0* ge1207ov2423;
extern T0* T149f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1207os2431;
extern T0* ge1207ov2431;
extern T0* T149f18(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1207os2430;
extern T0* ge1207ov2430;
extern T0* T149f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T149f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1207os2425;
extern T0* ge1207ov2425;
extern T0* T149f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T253f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T149f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T251f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T97f18(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T96f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T96f12p1(T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T152f11(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T149f35(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T97f20(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T96f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T96f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T152f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T149f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T97f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T96f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T149f40(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T97f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T96f5(T0* C, T0* a1);
/* ET_XACE_VE41_GENERATOR.generate_system */
extern void T49f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_esd_file */
extern void T49f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_options */
extern void T49f20(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.console_application */
extern T1 T112f212(T0* C);
/* UT_TRISTATE.is_true */
extern T1 T230f2(T0* C);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T1 T112f84(T0* C);
/* UT_TRISTATE.is_undefined */
extern T1 T230f4(T0* C);
/* UT_TRISTATE.is_false */
extern T1 T230f3(T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T112f272(T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1109os6906;
extern T0* ge1109ov6906;
extern T0* T112f233(T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge1097os2374;
extern T0* ge1097ov2374;
extern T0* T112f169(T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T128c192(void);
/* ET_XACE_OPTIONS.is_target_declared */
extern T1 T112f159(T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T6 T112f155(T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T1 T112f154(T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T1 T112f152(T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T1 T112f151(T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T1 T112f143(T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T1 T112f142(T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T1 T112f256(T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T1 T112f141(T0* C);
/* ET_XACE_OPTIONS.map */
extern T1 T112f139(T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T1 T112f138(T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T112f134(T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1109os6879;
extern T0* ge1109ov6879;
extern T0* T112f305(T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T1 T112f133(T0* C);
/* ET_XACE_VE41_GENERATOR.string_ */
extern T0* T49f8(T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T1 T112f129(T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T1 T112f128(T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T1 T112f127(T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T1 T112f126(T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T1 T112f123(T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T1 T112f122(T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T112f232(T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1109os6871;
extern T0* ge1109ov6871;
extern T0* T112f207(T0* C);
/* DS_HASH_SET [STRING_8].put_new */
extern void T115f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T115f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T115f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T115f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T115f17(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T115f24(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T115f16(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T115f45(T0* C);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T115f38(T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T112f168(T0* C);
/* DS_HASH_SET [STRING_8].make */
extern void T115f40(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T115c40(T6 a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T115f25(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T113c6(T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T115f53(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T115f30(T0* C);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T115f19(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T115f52(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T115f51(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T115f50(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T1 T112f120(T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T115f20(T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T6 T112f117(T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T1 T112f116(T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T1 T112f111(T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T1 T112f110(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T82f31(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T82f30(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T82f33(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T82f35(T0* C, T14 a1, T2 a2);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T6 T112f109(T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T1 T112f108(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T82f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T82f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T82f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T82f9(T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T1 T112f107(T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T1 T112f106(T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T1 T112f284(T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T1 T112f105(T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T1 T112f226(T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T1 T112f97(T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T1 T112f95(T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T1 T112f94(T0* C);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T1 T112f93(T0* C);
/* ET_XACE_OPTIONS.debug_option */
extern T1 T112f216(T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T1 T112f92(T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T112f214(T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1109os6850;
extern T0* ge1109ov6850;
extern T0* T112f191(T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T1 T112f91(T0* C);
/* DS_HASH_SET [STRING_8].has */
extern T1 T115f18(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].search_position */
extern void T115f44(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T115f23(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T115f31(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T115f22(T0* C);
/* ET_XACE_VE41_GENERATOR.options */
extern T0* T49f7(T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T112f206(T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1109os6839;
extern T0* ge1109ov6839;
extern T0* T112f183(T0* C);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T1 T112f318(T0* C);
/* ET_XACE_VE41_GENERATOR.print_link_libraries */
extern void T49f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.remove_all_characters */
extern T0* T49f6(T0* C, T0* a1, T2 a2);
/* UC_UTF8_STRING.remove */
extern void T226f62(T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T226f75(T0* C, T6 a1, T6 a2);
/* STRING_8.remove */
extern void T17f47(T0* C, T6 a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T1 T127f5(T0* C);
/* ET_XACE_SYSTEM.merge_externals */
extern void T79f8(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T111f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T119f7(T0* C, T6 a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T110f7(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T118f41(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T117f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T114f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T116f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T114f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T116f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T114f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T116f24(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T127f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T33f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T114f4(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T116f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T116f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T114f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T116f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T114f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T116f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T116f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T114f5(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T116f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T116f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T116f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T114c7(T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T112f132(T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1109os6878;
extern T0* ge1109ov6878;
extern T0* T112f303(T0* C);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T116f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T116c17(T6 a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T1 T112f131(T0* C);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T127f10(T0* C, T0* a1);
/* ET_XACE_OPTIONS.header */
extern T0* T112f115(T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1109os6867;
extern T0* ge1109ov6867;
extern T0* T112f291(T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T1 T112f114(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T113f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T115f64(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T115f66(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T113f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T115f65(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T113f9(T0* C, T6 a1);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T127f9(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T113f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T115f33(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T113f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T115f32(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T113f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T115f63(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T115f36(T0* C, T0* a1);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T112f90(T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1109os6849;
extern T0* ge1109ov6849;
extern T0* T112f275(T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T1 T112f89(T0* C);
/* ET_XACE_EXTERNALS.make */
extern T0* T127c8(void);
/* ET_XACE_VE41_GENERATOR.print_callbacks */
extern void T49f18(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].forth */
extern void T139f9(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_forth */
extern void T138f62(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].add_traversing_cursor */
extern void T138f64(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].set_next_cursor */
extern void T139f11(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].remove_traversing_cursor */
extern void T138f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].set_position */
extern void T139f10(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_item */
extern T6 T138f32(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].item */
extern T0* T139f6(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_item */
extern T0* T138f36(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_item */
extern T0* T138f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].key */
extern T0* T139f5(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_key */
extern T0* T138f35(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_item */
extern T0* T138f22(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].after */
extern T1 T139f4(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_after */
extern T1 T138f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].start */
extern void T139f8(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_start */
extern void T138f61(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_off */
extern T1 T138f40(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].is_empty */
extern T1 T138f39(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_cursor */
extern T0* T138f20(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T139c7(T0* a1);
/* ET_XACE_VE41_GENERATOR.merge_callbacks */
extern void T49f23(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T122f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T121f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T121f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T122f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T121f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T122f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T125f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T124f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T124f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T125f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T124f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T125f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].force */
extern void T138f43(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_put */
extern void T138f51(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_put */
extern void T138f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_put */
extern void T138f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_item */
extern T6 T138f33(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].hash_position */
extern T6 T138f24(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].resize */
extern void T138f48(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_resize */
extern void T138f56(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].special_integer_ */
extern T0* T138f31(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_resize */
extern void T138f55(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_resize */
extern void T138f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].resize */
extern T0* T245f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [STRING_8]].resized_area */
extern T0* T241f3(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [STRING_8]].copy_data */
extern void T241f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [STRING_8]].move_data */
extern void T241f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].overlapping_move */
extern void T241f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].non_overlapping_move */
extern void T241f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].make */
extern T0* T241c4(T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_resize */
extern void T138f53(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_modulus */
extern T6 T138f25(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_capacity */
extern T6 T138f23(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_put */
extern void T138f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].search_position */
extern void T138f44(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].unset_found_item */
extern void T138f46(T0* C);
/* DS_HASH_SET [STRING_8].force */
extern void T115f39(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T115f47(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T115f58(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T115f57(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T115f56(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T115f55(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T115f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_default */
extern T0* T115c37(void);
/* DS_HASH_SET [STRING_8].default_capacity */
extern T6 T115f28(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item */
extern T0* T138f29(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].has */
extern T1 T138f28(T0* C, T0* a1);
/* ET_XACE_OPTIONS.callback */
extern T0* T112f322(T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1109os6840;
extern T0* ge1109ov6840;
extern T0* T112f267(T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T1 T112f320(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T125f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T125f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T124f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T1 T124f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T124f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T125c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T122f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T122f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T121f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T1 T121f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T121f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T122c7(T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].set_key_equality_tester */
extern void T138f42(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].internal_set_equality_tester */
extern void T243f6(T0* C, T0* a1);
/* ET_XACE_VE41_GENERATOR.string_equality_tester */
extern T0* T49f5(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_map */
extern T0* T138c41(T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_with_equality_testers */
extern void T138f45(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T243c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].new_cursor */
extern T0* T243f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T299c3(T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_sparse_container */
extern void T138f52(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_slots */
extern void T138f60(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_clashes */
extern void T138f59(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_key_storage */
extern void T138f58(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_item_storage */
extern void T138f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].make */
extern T0* T245f2(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [STRING_8]].make_area */
extern T0* T300c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].default_create */
extern T0* T245c3(void);
/* ET_XACE_VE41_GENERATOR.print_interface_classes */
extern void T49f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.merge_interface_classes */
extern void T49f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.layout */
extern T0* T112f125(T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1109os6874;
extern T0* ge1109ov6874;
extern T0* T112f297(T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T1 T112f124(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T226f49(T0* C);
/* STRING_8.is_empty */
extern T1 T17f27(T0* C);
/* ET_XACE_VE41_GENERATOR.print_clusters */
extern void T49f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_cluster */
extern void T49f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T118f19(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T337f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T226f55(T0* C, T2 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T337f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T336f5(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T336f3(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T336f2(T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge115os1595;
extern T0* ge115ov1595;
extern T0* T118f22(T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge115os1598;
extern T0* ge115ov1598;
extern T0* T118f25(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T337c4(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge210os2746;
extern T1 ge210ov2746;
extern T1 T218f5(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T218f3(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T293f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge210os2750;
extern T0* ge210ov2750;
extern T0* T218f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T293c4(void);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T218f2(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T293f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c49(T14 a1);
/* STRING_8.from_c */
extern void T17f50(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T326f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T326f8(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f52(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f12(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T345f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T348f2(T348* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T348f3(T348* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T326f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T326f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T345f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T345c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T326f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2118os1257;
extern T0* ge2118ov1257;
extern T0* T17f28(T0* C);
/* C_STRING.make_empty */
extern T0* T326c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T345c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T349f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T349f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T349c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T345f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T293f3(T0* C, T14 a1);
/* UC_UTF8_STRING.to_c */
extern T0* T226f31(T0* C);
/* STRING_8.to_c */
extern T0* T17f26(T0* C);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge115os1596;
extern T0* ge115ov1596;
extern T0* T118f24(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T336c6(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge210os2745;
extern T1 ge210ov2745;
extern T1 T218f1(T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern T0* T118f23(T0* C);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T118f26(T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T118f21(T0* C);
/* ET_XACE_VE41_GENERATOR.print_escaped_name */
extern void T49f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_indentation */
extern void T49f14(T0* C, T6 a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T82f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T82f27(T0* C, T0* a1);
/* ET_XACE_VE_GENERATOR.generate_system */
extern void T48f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_xml_system_file */
extern void T48f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_mounted_libraries */
extern void T48f26(T0* C, T0* a1, T6 a2, T0* a3);
/* UC_UTF8_STRING.has_substring */
extern T1 T226f50(T0* C, T0* a1);
/* STRING_8.has_substring */
extern T1 T17f29(T0* C, T0* a1);
/* STRING_8.substring_index */
extern T6 T17f31(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T350f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T350f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* NATURAL_32.to_integer_32 */
extern T6 T10f7(T10* C);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T350f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T54f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2118os1256;
extern T0* ge2118ov1256;
extern T0* T17f32(T0* C);
/* STRING_SEARCHER.make */
extern T0* T350c5(void);
/* ET_XACE_VE_GENERATOR.print_clusters */
extern void T48f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_cluster */
extern void T48f28(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_class_options */
extern void T48f30(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_feature_options */
extern void T48f31(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.string_ */
extern T0* T48f9(T0* C);
/* ET_XACE_VE_GENERATOR.print_console_application_option */
extern void T48f24(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_options */
extern void T48f23(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T1 T112f306(T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T1 T112f167(T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T112f296(T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1109os6916;
extern T0* ge1109ov6916;
extern T0* T112f253(T0* C);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T1 T112f166(T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T112f165(T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1109os6915;
extern T0* ge1109ov6915;
extern T0* T112f327(T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T1 T112f164(T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T112f163(T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1109os6914;
extern T0* ge1109ov6914;
extern T0* T112f325(T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T1 T112f162(T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T1 T112f294(T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T1 T112f161(T0* C);
/* ET_XACE_OPTIONS.trace */
extern T1 T112f274(T0* C);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T1 T112f160(T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T1 T112f304(T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T1 T112f158(T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T112f157(T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1109os6904;
extern T0* ge1109ov6904;
extern T0* T112f323(T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T1 T112f156(T0* C);
/* ET_XACE_OPTIONS.split */
extern T1 T112f302(T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T1 T112f153(T0* C);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T112f270(T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1109os6900;
extern T0* ge1109ov6900;
extern T0* T112f231(T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T1 T112f268(T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T1 T112f194(T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T1 T112f192(T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T1 T112f198(T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T1 T112f196(T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T112f150(T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1109os6896;
extern T0* ge1109ov6896;
extern T0* T112f317(T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T1 T112f149(T0* C);
/* ET_XACE_OPTIONS.profile */
extern T1 T112f266(T0* C);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T1 T112f148(T0* C);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T112f147(T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1109os6894;
extern T0* ge1109ov6894;
extern T0* T112f315(T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T1 T112f146(T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T112f264(T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1109os6893;
extern T0* ge1109ov6893;
extern T0* T112f227(T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T1 T112f262(T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T1 T112f145(T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T1 T112f144(T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T112f260(T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1109os6891;
extern T0* ge1109ov6891;
extern T0* T112f225(T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T1 T112f258(T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T1 T112f250(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T1 T112f140(T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T1 T112f292(T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T1 T112f137(T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T1 T112f136(T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T1 T112f135(T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T1 T112f236(T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T1 T112f130(T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T6 T112f234(T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T1 T112f121(T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T1 T112f230(T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T1 T112f119(T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T1 T112f290(T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T1 T112f118(T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T1 T112f300(T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T1 T112f113(T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T112f288(T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1109os6864;
extern T0* ge1109ov6864;
extern T0* T112f245(T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T1 T112f112(T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T112f104(T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1109os6859;
extern T0* ge1109ov6859;
extern T0* T112f283(T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T1 T112f103(T0* C);
/* ET_XACE_OPTIONS.include */
extern T0* T112f102(T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1109os6870;
extern T0* ge1109ov6870;
extern T0* T112f281(T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T1 T112f101(T0* C);
/* ET_XACE_OPTIONS.exclude */
extern T0* T112f100(T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1109os6858;
extern T0* ge1109ov6858;
extern T0* T112f279(T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T1 T112f99(T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T1 T112f228(T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T1 T112f98(T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T1 T112f224(T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T1 T112f96(T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T112f222(T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1109os6854;
extern T0* ge1109ov6854;
extern T0* T112f197(T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T1 T112f220(T0* C);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T112f218(T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1109os6852;
extern T0* ge1109ov6852;
extern T0* T112f195(T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T112f88(T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1109os6848;
extern T0* ge1109ov6848;
extern T0* T112f273(T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T1 T112f87(T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T1 T112f86(T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T1 T112f85(T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T112f83(T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1109os6845;
extern T0* ge1109ov6845;
extern T0* T112f269(T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T1 T112f82(T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T1 T112f210(T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T1 T112f81(T0* C);
/* ET_XACE_OPTIONS.clean */
extern T1 T112f298(T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T1 T112f328(T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T1 T112f208(T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T1 T112f326(T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T1 T112f286(T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T1 T112f324(T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T112f316(T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1109os6838;
extern T0* ge1109ov6838;
extern T0* T112f265(T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T1 T112f314(T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T1 T112f204(T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T1 T112f312(T0* C);
/* ET_XACE_OPTIONS.arguments */
extern T0* T112f202(T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1109os6836;
extern T0* ge1109ov6836;
extern T0* T112f179(T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T1 T112f310(T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T1 T112f200(T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T1 T112f308(T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T1 T112f190(T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T1 T112f188(T0* C);
/* ET_XACE_VE_GENERATOR.print_indentation */
extern void T48f22(T0* C, T6 a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_quote_escaped_string */
extern void T48f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.quot_entity */
extern unsigned char ge1207os2418;
extern T0* ge1207ov2418;
extern T0* T48f7(T0* C);
/* ET_XACE_VE_GENERATOR.print_escaped_string */
extern void T48f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_escaped_character */
extern void T48f29(T0* C, T6 a1, T0* a2);
/* ET_XACE_VE_GENERATOR.amp_entity */
extern unsigned char ge1207os2417;
extern T0* ge1207ov2417;
extern T0* T48f15(T0* C);
/* ET_XACE_VE_GENERATOR.gt_entity */
extern unsigned char ge1207os2416;
extern T0* ge1207ov2416;
extern T0* T48f13(T0* C);
/* ET_XACE_VE_GENERATOR.lt_entity */
extern unsigned char ge1207os2415;
extern T0* ge1207ov2415;
extern T0* T48f11(T0* C);
/* ET_XACE_VE_GENERATOR.is_escaped */
extern T1 T48f8(T0* C, T6 a1);
/* ET_XACE_ISE_GENERATOR.generate_system */
extern void T47f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_ace_file */
extern void T47f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_link_libraries */
extern void T47f26(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING_8].is_last */
extern T1 T31f7(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T33f8(T0* C, T0* a1);
/* ET_XACE_ISE_GENERATOR.replace_all_characters */
extern T0* T47f9(T0* C, T0* a1, T2 a2, T2 a3);
/* UC_UTF8_STRING.put */
extern void T226f61(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T226f76(T0* C, T6 a1, T6 a2);
/* ET_XACE_ISE_GENERATOR.string_ */
extern T0* T47f7(T0* C);
/* ET_XACE_ISE_GENERATOR.is_windows */
extern T1 T47f8(T0* C);
/* ET_XACE_ISE_GENERATOR.operating_system */
extern T0* T47f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T217f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T217f4(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge192os8247;
extern T0* ge192ov8247;
extern T0* T217f3(T0* C);
/* ET_XACE_ISE_GENERATOR.execution_environment */
extern unsigned char ge135os1594;
extern T0* ge135ov1594;
extern T0* T47f13(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T217c5(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].value */
extern T0* T24f31(T0* C, T0* a1);
/* ET_XACE_ISE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T47f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T1 T127f6(T0* C);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T1 T127f4(T0* C);
/* ET_XACE_ISE_GENERATOR.print_assemblies */
extern void T47f24(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T130f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T129f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T129f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T130f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T129f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T130f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T130f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T130f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T129f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T1 T129f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T129f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T130c7(T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T1 T129f6(T0* C);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T110f6(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T118f40(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T129f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T239f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T239c3(T0* a1);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T131f9(T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T131c8(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T129c8(void);
/* ET_XACE_ISE_GENERATOR.print_clusters */
extern void T47f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_cluster */
extern void T47f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_class_options */
extern T1 T47f11(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ISE_GENERATOR.options */
extern T0* T47f6(T0* C);
/* ET_XACE_ISE_GENERATOR.print_cluster_options */
extern T1 T47f10(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.namespace */
extern T0* T112f330(T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1109os6889;
extern T0* ge1109ov6889;
extern T0* T112f331(T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T1 T112f329(T0* C);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T1 T118f20(T0* C);
/* ET_XACE_ISE_GENERATOR.print_options */
extern void T47f22(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T1 T112f282(T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T1 T112f280(T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T1 T112f278(T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T1 T112f276(T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T112f254(T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1109os6887;
extern T0* ge1109ov6887;
extern T0* T112f221(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T1 T112f252(T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T112f248(T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1109os6885;
extern T0* ge1109ov6885;
extern T0* T112f217(T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T1 T112f246(T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T112f244(T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1109os6884;
extern T0* ge1109ov6884;
extern T0* T112f215(T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T1 T112f242(T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T112f240(T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1109os6883;
extern T0* ge1109ov6883;
extern T0* T112f213(T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T1 T112f238(T0* C);
/* ET_XACE_ISE_GENERATOR.print_escaped_name */
extern void T47f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.is_lace_keyword */
extern T1 T47f5(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T66f5(T0* C, T6 a1);
/* ET_XACE_ISE_GENERATOR.lace_keywords */
extern unsigned char ge1134os2500;
extern T0* ge1134ov2500;
extern T0* T47f12(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T226f46(T0* C, T2 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T226f47(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T226f48(T0* C, T6 a1, T6 a2);
/* ET_XACE_ISE_GENERATOR.print_indentation */
extern void T47f20(T0* C, T6 a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_system */
extern void T46f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_ace_file */
extern void T46f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_c_compiler_options */
extern void T46f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_generate */
extern void T46f22(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.options */
extern T0* T46f6(T0* C);
/* ET_XACE_SE_GENERATOR.string_ */
extern T0* T46f7(T0* C);
/* ET_XACE_SE_GENERATOR.print_link_libraries */
extern void T46f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_include_directories */
extern void T46f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_cecil_file */
extern void T46f19(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T28f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T88c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T82f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T82f25(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T82f26(T0* C, T14 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].forth */
extern void T136f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_forth */
extern void T132f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].add_traversing_cursor */
extern void T132f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set_next_cursor */
extern void T136f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].remove_traversing_cursor */
extern void T132f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set */
extern void T136f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].item */
extern T0* T136f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].start */
extern void T136f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_start */
extern void T132f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_off */
extern T1 T132f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].new_cursor */
extern T0* T132f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T136c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T82f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T82f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T82f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T82f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T82f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T82f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T82f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T82f24p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T82f17(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T82c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T82f23(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].is_empty */
extern T1 T132f6(T0* C);
/* ET_XACE_EXTERNALS.is_empty */
extern T1 T127f7(T0* C);
/* ET_XACE_SYSTEM.merge_exported_features */
extern void T79f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_exported_features */
extern void T110f8(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_exported_features */
extern void T118f42(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].force_last */
extern void T132f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].put_right */
extern void T240f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T240c3(T0* a1);
/* ET_XACE_EXPORTED_FEATURE.make */
extern T0* T135c4(T0* a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T132c8(void);
/* ET_XACE_SE_GENERATOR.print_clusters */
extern void T46f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_cluster */
extern void T46f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_class_options */
extern T1 T46f9(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_cluster_options */
extern T1 T46f8(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_options */
extern void T46f17(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_escaped_name */
extern void T46f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_indentation */
extern void T46f15(T0* C, T6 a1, T0* a2);
/* ET_XACE_GE_GENERATOR.generate_system */
extern void T44f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_ace_file */
extern void T44f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_link_libraries */
extern void T44f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.replace_all_characters */
extern T0* T44f9(T0* C, T0* a1, T2 a2, T2 a3);
/* ET_XACE_GE_GENERATOR.string_ */
extern T0* T44f7(T0* C);
/* ET_XACE_GE_GENERATOR.is_windows */
extern T1 T44f8(T0* C);
/* ET_XACE_GE_GENERATOR.operating_system */
extern T0* T44f14(T0* C);
/* ET_XACE_GE_GENERATOR.execution_environment */
extern T0* T44f13(T0* C);
/* ET_XACE_GE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T44f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_assemblies */
extern void T44f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_clusters */
extern void T44f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_cluster */
extern void T44f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_class_options */
extern T1 T44f11(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.options */
extern T0* T44f6(T0* C);
/* ET_XACE_GE_GENERATOR.print_cluster_options */
extern T1 T44f10(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_options */
extern void T44f22(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_escaped_name */
extern void T44f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.is_lace_keyword */
extern T1 T44f5(T0* C, T0* a1);
/* ET_XACE_GE_GENERATOR.lace_keywords */
extern T0* T44f12(T0* C);
/* ET_XACE_GE_GENERATOR.print_indentation */
extern void T44f20(T0* C, T6 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.generate_system */
extern void T43f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_xml_system_file */
extern void T43f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_mounted_libraries */
extern void T43f27(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_clusters */
extern void T43f26(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_cluster */
extern void T43f29(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_class_options */
extern void T43f31(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_feature_options */
extern void T43f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.string_ */
extern T0* T43f9(T0* C);
/* ET_XACE_XML_GENERATOR.print_console_application_option */
extern void T43f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_options */
extern void T43f24(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_indentation */
extern void T43f23(T0* C, T6 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_quote_escaped_string */
extern void T43f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.quot_entity */
extern T0* T43f7(T0* C);
/* ET_XACE_XML_GENERATOR.print_escaped_string */
extern void T43f28(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_escaped_character */
extern void T43f30(T0* C, T6 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.amp_entity */
extern T0* T43f15(T0* C);
/* ET_XACE_XML_GENERATOR.gt_entity */
extern T0* T43f13(T0* C);
/* ET_XACE_XML_GENERATOR.lt_entity */
extern T0* T43f11(T0* C);
/* ET_XACE_XML_GENERATOR.is_escaped */
extern T1 T43f8(T0* C, T6 a1);
/* ET_XACE_VE41_GENERATOR.generate_library */
extern void T49f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_eld_file */
extern void T49f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.merge_externals */
extern void T84f8(T0* C, T0* a1);
/* ET_XACE_VE_GENERATOR.generate_library */
extern void T48f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_xml_library_file */
extern void T48f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.generate_library */
extern void T47f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_precompile_ace_file */
extern void T47f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_library */
extern void T46f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_loadpath_clusters */
extern void T46f14(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_loadpath_cluster */
extern void T46f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.generate_library */
extern void T44f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_precompile_ace_file */
extern void T44f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.generate_library */
extern void T43f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_xml_library_file */
extern void T43f21(T0* C, T0* a1, T0* a2);
/* GEXACE_VALIDATE_COMMAND.execute */
extern void T41f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_read_file_error */
extern void T28f16(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T87c7(T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T85f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T102f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T102f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T102f177(T0* C);
/* INTEGER_32.out */
extern T0* T6f19(T6* C);
/* STRING_8.append_integer */
extern void T17f45(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T102f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T102f109(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f14(T2* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T28f18(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T108c7(T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T95f8(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T28f19(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T109c7(T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T85f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.mount_libraries */
extern void T84f14(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T111f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T110f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T110f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T117f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T117f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].resize */
extern T0* T232f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].resized_area */
extern T0* T231f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_CLUSTER].copy_data */
extern void T231f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_CLUSTER].move_data */
extern void T231f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].overlapping_move */
extern void T231f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].non_overlapping_move */
extern void T231f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].make */
extern T0* T231c4(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T6 T117f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T1 T117f8(T0* C, T6 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T118f43(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T110f10(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T118f45(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T110f14(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T110c9(void);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T117c10(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T117f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T233c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T232f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_CLUSTER].make_area */
extern T0* T297c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T232c3(void);
/* ET_XACE_PARSER.fill_library */
extern void T85f228(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY.set_libraries */
extern void T84f13(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_clusters */
extern void T84f12(T0* C, T0* a1);
/* ET_XACE_LIBRARY.merge_libraries */
extern void T84f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T111f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T120f10(T0* C, T1 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T120f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T120f7(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T120f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T28f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T344c7(T0* a1, T0* a2);
/* XM_DEFAULT_POSITION.out */
extern T0* T162f5(T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T162f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T111f4(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T111f3(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T111f7(T0* C, T1 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T1 T119f6(T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T110f5(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T118f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_externals */
extern void T85f231(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.put_class_option */
extern void T118f31(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T121f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T237f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T237c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].is_empty */
extern T1 T121f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T121c8(void);
/* ET_XACE_PARSER.new_export */
extern T0* T85f130(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T112f358(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T1 T124f5(T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T123f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T124f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T238f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T238c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T124c8(void);
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T85f222(T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T90f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T126c3(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1140os2268;
extern T0* ge1140ov2268;
extern T0* T85f224(T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1140os2269;
extern T0* ge1140ov2269;
extern T0* T85f221(T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T90f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T123c4(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1140os2244;
extern T0* ge1140ov2244;
extern T0* T85f26(T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1140os2267;
extern T0* ge1140ov2267;
extern T0* T85f129(T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T112f366(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T115f43(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1140os2266;
extern T0* ge1140ov2266;
extern T0* T85f128(T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T112f377(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T116f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T116f20(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T116f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T116f9(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1140os2253;
extern T0* ge1140ov2253;
extern T0* T85f127(T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1140os2270;
extern T0* ge1140ov2270;
extern T0* T85f126(T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T90f4(T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T112c332(void);
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1140os2257;
extern T0* ge1140ov2257;
extern T0* T85f24(T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T85f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T85f230(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1140os2264;
extern T0* ge1140ov2264;
extern T0* T85f125(T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1140os2265;
extern T0* ge1140ov2265;
extern T0* T85f124(T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1140os2263;
extern T0* ge1140ov2263;
extern T0* T85f122(T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1140os2262;
extern T0* ge1140ov2262;
extern T0* T85f119(T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1140os2261;
extern T0* ge1140ov2261;
extern T0* T85f117(T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1140os2260;
extern T0* ge1140ov2260;
extern T0* T85f115(T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1140os2258;
extern T0* ge1140ov2258;
extern T0* T85f113(T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1140os2259;
extern T0* ge1140ov2259;
extern T0* T85f112(T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T112f412(T0* C, T1 a1);
/* UT_TRISTATE.set_false */
extern void T230f7(T0* C);
/* UT_TRISTATE.set_true */
extern void T230f6(T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T230c5(void);
/* UT_TRISTATE.set_undefined */
extern void T230f8(T0* C);
/* ET_XACE_OPTIONS.set_warning */
extern void T112f411(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1109os6752;
extern T0* ge1109ov6752;
extern T0* T112f186(T0* C);
/* DS_HASH_SET [STRING_8].put_last */
extern void T115f41(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].compress */
extern void T115f54(T0* C);
/* DS_HASH_SET [STRING_8].slots_wipe_out */
extern void T115f62(T0* C);
/* DS_HASH_SET [STRING_8].clashes_wipe_out */
extern void T115f61(T0* C);
/* DS_HASH_SET [STRING_8].move_all_cursors */
extern void T115f60(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].key_storage_put */
extern void T115f59(T0* C, T0* a1, T6 a2);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T112f410(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T112f409(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T112f408(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T112f407(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T112f406(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_trace */
extern void T112f405(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_target */
extern void T112f404(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1109os6750;
extern T0* ge1109ov6750;
extern T0* T112f184(T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T112f403(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T112f402(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T112f401(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T112f400(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T112f399(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T112f398(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T112f397(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T112f396(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T112f395(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_profile */
extern void T112f394(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T112f393(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T112f392(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T112f391(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T112f390(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T112f389(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T112f388(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T112f387(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T112f386(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T112f385(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T112f384(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T112f383(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T112f382(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T112f381(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T112f380(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T112f379(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T112f378(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1109os6749;
extern T0* ge1109ov6749;
extern T0* T112f182(T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T112f376(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T112f375(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T112f374(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T112f373(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1109os6748;
extern T0* ge1109ov6748;
extern T0* T112f180(T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T112f372(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T112f371(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T112f370(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1109os6747;
extern T0* ge1109ov6747;
extern T0* T112f178(T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T112f369(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T112f368(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T112f367(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T112f365(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T112f364(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T112f363(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1109os6746;
extern T0* ge1109ov6746;
extern T0* T112f176(T0* C);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T112f362(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T28f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T208c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T112f361(T0* C, T6 a1);
/* UC_UTF8_STRING.to_integer */
extern T6 T226f26(T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T226f34(T0* C);
/* UC_UTF8_STRING.is_integer */
extern T1 T226f25(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T226f33(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T76f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f12(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f17(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T112f360(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T112f359(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T112f357(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T112f356(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T112f355(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T112f354(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T112f353(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T112f352(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T112f351(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T112f350(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T112f349(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1109os6745;
extern T0* ge1109ov6745;
extern T0* T112f174(T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T112f348(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T112f347(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T112f346(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T112f345(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T112f344(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T112f343(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T112f342(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T112f341(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T112f340(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T112f339(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1109os6744;
extern T0* ge1109ov6744;
extern T0* T112f172(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T28f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T207c7(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T207f4(T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T112f338(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1109os6743;
extern T0* ge1109ov6743;
extern T0* T112f170(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T28f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T206c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T112f337(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T112f336(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T112f335(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T112f334(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T28f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T205c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T1 T85f111(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T112f333(T0* C, T1 a1);
/* ET_XACE_PARSER.is_true */
extern T1 T85f110(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found_item */
extern T6 T144f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_item */
extern T6 T144f20(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found */
extern T1 T144f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search */
extern void T144f35(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search_position */
extern void T144f38(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_item */
extern T6 T144f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].hash_position */
extern T6 T144f25(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_item */
extern T0* T144f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_item */
extern T6 T144f26(T0* C, T6 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1110os4187;
extern T0* ge1110ov4187;
extern T0* T85f29(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].put_new */
extern void T144f37(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_put */
extern void T144f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_put */
extern void T144f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_put */
extern void T144f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_put */
extern void T144f41(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].unset_found_item */
extern void T144f40(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_key_equality_tester */
extern void T144f36(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].internal_set_equality_tester */
extern void T247f6(T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T85f14(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_map */
extern T0* T144c34(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_with_equality_testers */
extern void T144f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].make */
extern T0* T247c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].new_cursor */
extern T0* T247f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T301c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_cursor */
extern T0* T144f29(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T249c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_sparse_container */
extern void T144f45(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_slots */
extern void T144f49(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].special_integer_ */
extern T0* T144f32(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_modulus */
extern T6 T144f27(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_clashes */
extern void T144f48(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_key_storage */
extern void T144f47(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_item_storage */
extern void T144f46(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1140os2249;
extern T0* ge1140ov2249;
extern T0* T85f28(T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1140os2256;
extern T0* ge1140ov2256;
extern T0* T85f22(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T111f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T119f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T119f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].resize */
extern T0* T235f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].resized_area */
extern T0* T234f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].copy_data */
extern void T234f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].move_data */
extern void T234f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].overlapping_move */
extern void T234f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].non_overlapping_move */
extern void T234f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T234c4(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T6 T119f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T1 T119f9(T0* C, T6 a1);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T90f3(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T111c5(void);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T119c11(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T119f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T236c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T235f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_area */
extern T0* T298c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T235c3(void);
/* ET_XACE_PARSER.new_mount */
extern T0* T85f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T120f9(T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T90f7(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T120c8(T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.parse_library */
extern void T83f230(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_library */
extern void T83f227(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.fill_externals */
extern void T83f229(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.new_export */
extern T0* T83f127(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_exported_feature */
extern T0* T83f218(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.uc_alias */
extern T0* T83f220(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_feature */
extern T0* T83f217(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_class */
extern T0* T83f130(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_export */
extern T0* T83f126(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_include_dir */
extern T0* T83f125(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_location */
extern T0* T83f124(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_link_library */
extern T0* T83f123(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_external */
extern T0* T83f24(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_options */
extern T0* T83f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_options */
extern void T83f228(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.uc_debug */
extern T0* T83f122(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_optimize */
extern T0* T83f121(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_check */
extern T0* T83f119(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_loop */
extern T0* T83f116(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_invariant */
extern T0* T83f114(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_ensure */
extern T0* T83f112(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_enable */
extern T0* T83f110(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_require */
extern T0* T83f109(T0* C);
/* ET_XACE_LIBRARY_PARSER.is_false */
extern T1 T83f108(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.is_true */
extern T1 T83f107(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.option_codes */
extern T0* T83f26(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_equality_tester */
extern T0* T83f13(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_value */
extern T0* T83f25(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_option */
extern T0* T83f22(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_mount */
extern T0* T83f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.execution_environment */
extern T0* T83f132(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_mount */
extern unsigned char ge1140os2252;
extern T0* ge1140ov2252;
extern T0* T83f20(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_prefix */
extern unsigned char ge1140os2254;
extern T0* ge1140ov2254;
extern T0* T83f19(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_cluster */
extern T0* T83f18(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_libraries */
extern void T118f37(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T118f36(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T110f11(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T118f44(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T118f47(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T110f16(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T118f46(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T110f15(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T118f35(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T118f34(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T118f33(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T118f32(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.new_class */
extern T0* T83f131(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_feature */
extern T0* T83f219(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T118f30(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T118f29(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.uc_relative */
extern unsigned char ge1140os2251;
extern T0* ge1140ov2251;
extern T0* T83f129(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T28f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T28f32(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T28f33(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T63f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T63f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T63f5(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T288c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.uc_abstract */
extern unsigned char ge1140os2250;
extern T0* ge1140ov2250;
extern T0* T83f128(T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T90f6(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.make */
extern T0* T118c28(T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_overridden_constraint_enabled */
extern void T118f38(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_overridden_constraint_enabled */
extern void T110f12(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.uc_cluster */
extern unsigned char ge1140os2247;
extern T0* ge1140ov2247;
extern T0* T83f16(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_ */
extern T0* T83f15(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_name */
extern unsigned char ge1140os2248;
extern T0* ge1140ov2248;
extern T0* T83f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T217f2(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T50f15(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T50f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ET_XACE_PARSER.execution_environment */
extern T0* T85f136(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].force_new */
extern void T100f52(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_put */
extern void T100f58(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_put */
extern void T100f57(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_put */
extern void T100f56(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_put */
extern void T100f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_item */
extern T6 T100f30(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].hash_position */
extern T6 T100f29(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_item */
extern T6 T100f28(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].resize */
extern void T100f54(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_resize */
extern void T100f62(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].special_integer_ */
extern T0* T100f22(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_resize */
extern void T100f61(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_resize */
extern void T100f60(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].resize */
extern T0* T160f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY].resized_area */
extern T0* T159f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_LIBRARY].copy_data */
extern void T159f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_LIBRARY].move_data */
extern void T159f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].overlapping_move */
extern void T159f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].non_overlapping_move */
extern void T159f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].make */
extern T0* T159c4(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_item */
extern T0* T100f33(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_resize */
extern void T100f59(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_modulus */
extern T6 T100f31(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_capacity */
extern T6 T100f26(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].unset_found_item */
extern void T100f41(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].found_item */
extern T0* T100f24(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_item */
extern T0* T100f25(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].found */
extern T1 T100f23(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].search */
extern void T100f51(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].search_position */
extern void T100f53(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T85f20(T0* C);
/* ET_XACE_LIBRARY.set_library_prefix */
extern void T84f11(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T85f19(T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T90f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T110c3(T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T117f11(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_options */
extern void T84f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T85f18(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.new_class */
extern T0* T85f133(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T85f223(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T85f132(T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T85f131(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T28f24(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T209c7(T0* a1, T0* a2, T0* a3);
/* XM_POSITION_TABLE.item */
extern T0* T93f2(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T220f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T221f11(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T221f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T220f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T221f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T220f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T220f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T221f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T220f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T221f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T220f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T220f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T221f9(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T221f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T220c7(T0* a1);
/* ET_XACE_LIBRARY.set_name */
extern void T84f9(T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T92f18(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T92f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T1 T92f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T92f13(T0* C);
/* XM_NODE_TYPER.is_attribute */
extern T1 T330f8(T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T92f15(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_name */
extern T0* T85f16(T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T90f5(T0* C);
/* ET_XACE_LIBRARY.make */
extern T0* T84c7(void);
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T98f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T28f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T210c7(T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T98f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T98f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T28f29(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T214c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T98f40(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T98f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T98f29(T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T98f28(T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T98f27(T0* C);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T98f15(T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T98f26(T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T98f12(T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T98f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T98f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T98f13(T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T98f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T98f25(T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T98f24(T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T98f23(T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T98f22(T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T98f21(T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T98f20(T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T98f19(T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T98f18(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T28f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T216c8(T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T216f7(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].has */
extern T1 T144f28(T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T128f25(T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T128f29(T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T98f17(T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T98f11(T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T98f38(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T98f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T28f30(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T215c7(T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1140os2271;
extern T0* ge1140ov2271;
extern T0* T98f16(T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T98f10(T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1140os2255;
extern T0* ge1140ov2255;
extern T0* T98f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T28f26(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T211c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T98f7(T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T98f6(T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T98f34(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1140os2246;
extern T0* ge1140ov2246;
extern T0* T98f5(T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T98f3(T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T85f11(T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T85f135(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].wipe_out */
extern void T100f37(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_wipe_out */
extern void T100f45(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_wipe_out */
extern void T100f44(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_wipe_out */
extern void T100f43(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_wipe_out */
extern void T100f42(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].move_all_cursors_after */
extern void T100f40(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].set_next_cursor */
extern void T158f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].set_position */
extern void T158f5(T0* C, T6 a1);
/* ET_XACE_PARSER.new_system */
extern T0* T85f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM.mount_libraries */
extern void T79f16(T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T85f229(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM.set_libraries */
extern void T79f15(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_options */
extern void T79f14(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_creation_procedure_name */
extern void T79f13(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_root_class_name */
extern void T79f12(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_system_name */
extern void T79f11(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_clusters */
extern void T79f10(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1140os2245;
extern T0* ge1140ov2245;
extern T0* T85f27(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T92f20(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T92f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T92f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T92f14(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T330f9(T0* C);
/* XM_ELEMENT.has_element_by_name */
extern T1 T92f19(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1140os2243;
extern T0* ge1140ov2243;
extern T0* T85f25(T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T90f1(T0* C, T0* a1);
/* ET_XACE_SYSTEM.make */
extern T0* T79c7(T0* a1);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T99f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T1 T99f3(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T28f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T289c7(T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T1 T99f8(T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T154f1(T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T154f2(T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1147os5635;
extern T0* ge1147ov5635;
extern T0* T99f4(T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T154c3(void);
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T99f9(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T226f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T226f52(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f30(T0* C, T2 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T1 T99f7(T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1140os2273;
extern T0* ge1140ov2273;
extern T0* T99f6(T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1140os2272;
extern T0* ge1140ov2272;
extern T0* T99f5(T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T99f12(T0* C, T0* a1);
/* XM_ATTRIBUTE.set_value */
extern void T141f7(T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T98f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T98f33(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T28f28(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T213c7(T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T98f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T98f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T28f27(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T212c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T98f8(T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1140os2242;
extern T0* ge1140ov2242;
extern T0* T98f4(T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T85f13(T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T85f134(T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T95f5(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T102f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T102f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T102f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T102f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T102f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T102f223(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T170f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T169f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T169f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T169f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T169f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T169f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T169c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T170f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T271c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T170c3(void);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T102f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T102f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T201f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T173f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T199f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T184f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].copy_data */
extern void T184f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_EXTERNAL_ID].move_data */
extern void T184f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].overlapping_move */
extern void T184f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].non_overlapping_move */
extern void T184f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T184c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T199f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T287c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T199c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T173f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T102f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T173c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T102f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force */
extern void T166f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T166f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T166f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T166f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T166f31(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T166f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T166f25(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T166f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T166f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T166f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T166f57(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T166f56(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T270f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T265f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].copy_data */
extern void T265f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].move_data */
extern void T265f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].overlapping_move */
extern void T265f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].non_overlapping_move */
extern void T265f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T265c4(T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T166f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T166f55(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T166f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T166f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T166f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T166f41(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T166f44(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T166f33(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T204c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T204f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T168c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T204f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T204f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T204f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T204f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T204f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T261c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T204f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T204f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T204f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T204f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1313os7501;
extern T0* ge1313ov7501;
extern T0* T204f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T204f54(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T56f3(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1313os7500;
extern T0* ge1313ov7500;
extern T0* T204f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1313os7499;
extern T0* ge1313ov7499;
extern T0* T204f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1313os7498;
extern T0* ge1313ov7498;
extern T0* T204f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1313os7497;
extern T0* ge1313ov7497;
extern T0* T204f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1313os7490;
extern T0* ge1313ov7490;
extern T0* T204f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T204f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T204f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T291f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T223f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge79os2349;
extern T0* ge79ov2349;
extern T0* T204f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T291c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T204f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T204f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T204f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T204f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T204f225(T0* C, T0* a1);
/* ARRAY [INTEGER_32].make */
extern T0* T223c5(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T223f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1313os7483;
extern T0* ge1313ov7483;
extern T0* T204f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T204f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T204f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T204f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T204f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T204f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T204f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge311os7693;
extern T0* ge311ov7693;
extern T0* T204f58(T0* C);
/* YY_BUFFER.make */
extern T0* T257c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T257f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T318f9(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T257f11(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T256c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T204f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T102f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T198c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T198f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T198f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T198f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T198f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T198f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T198f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T198f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T198f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T198f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T198f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T198f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T198f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T198f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T198f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T198f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T198f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T198f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T198f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T198f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T198f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T198f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T198f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T198f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T198f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T198f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T198f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T198f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T198f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T198f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T198f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T102f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T201f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T102f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T102f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T198c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T177f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T177f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T177f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T177f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T197f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].resized_area */
extern T0* T196f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].copy_data */
extern void T196f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].move_data */
extern void T196f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].overlapping_move */
extern void T196f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].non_overlapping_move */
extern void T196f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T196c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T197f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]].make_area */
extern T0* T286c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T197c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T178f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T278f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T278f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T278c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T178f7(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T102f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T178f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T102f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T178c11(void);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T177f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T177f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1224os8125;
extern T0* ge1224ov8125;
extern T0* T177f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T177f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T177f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T177f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T177f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T177f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T177f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T177f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T102f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T177c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T195f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T193f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].copy_data */
extern void T193f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].move_data */
extern void T193f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].overlapping_move */
extern void T193f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].non_overlapping_move */
extern void T193f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T193c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T195f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T285c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T195c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T177f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T177f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T177f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T177f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T177f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T177f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T194f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T191f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].copy_data */
extern void T191f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].move_data */
extern void T191f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].overlapping_move */
extern void T191f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].non_overlapping_move */
extern void T191f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T191c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T194f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T284c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T194c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T176f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T276f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T276f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T276c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T176f5(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T102f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T176c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T176f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T275c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T102f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T275f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T176f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T176f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T275f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T176f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T275f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T102f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T201f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T275f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T275f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T176f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T176f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T175f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T175c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T175f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T175f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T175f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T175f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T175f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T175f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T274c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T274f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T309c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T175c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T274f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T310f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T310f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T310c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T274f5(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T175c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T274f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T102f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T175c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T102f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T175f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T175f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T175c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T175f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T189f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T188f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].copy_data */
extern void T188f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].move_data */
extern void T188f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].overlapping_move */
extern void T188f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].non_overlapping_move */
extern void T188f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T188c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T189f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T283c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T189c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T175c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T175f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T102f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T201f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T102f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T174f16(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T174f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T174f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T174f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T171f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T171f14(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T178f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T272f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].any_ */
extern T0* T272f2(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T174f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T174f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T174f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T174f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T187f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T186f2(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].copy_data */
extern void T186f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].move_data */
extern void T186f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].overlapping_move */
extern void T186f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].non_overlapping_move */
extern void T186f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T186c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T187f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T282c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T187c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T174f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T174f39(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T174f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T174f37(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T174f36(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T174f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T174f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T174f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T174f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T174f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T174f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T174f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T174f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T102f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T174c31(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T272c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T174f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T174f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T273c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T174f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T174f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T174f41(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T174f40(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T102f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T102f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T171f12(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T171f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T171f17(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T178f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T171f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T171f16(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T102f242(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T185f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T183f3(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].copy_data */
extern void T183f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [BOOLEAN].move_data */
extern void T183f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].overlapping_move */
extern void T183f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].non_overlapping_move */
extern void T183f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].make */
extern T0* T183c4(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T185f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T281c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T185c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T102f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T168f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1311os5745;
extern T0* ge1311ov5745;
extern T0* T102f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T202c198(void);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T202f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T202f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T202f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T202f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T202f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T202f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T202f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T202f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T202f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T202f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T202f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T202f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T202f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T202f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T202f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T202f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T202f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T202f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T202f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T202f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T202f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T202f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T202f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T202f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T202f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T202f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T202f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T202f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T202f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T165f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T168f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T102f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T168f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T168f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T173f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T102f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T201f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T102f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T201f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T201c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T172f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T172f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T172f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T182f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T181f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].copy_data */
extern void T181f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_DECLARATION].move_data */
extern void T181f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].overlapping_move */
extern void T181f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].non_overlapping_move */
extern void T181f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T181c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T182f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T280c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T182c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T172c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T172f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T102f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T102f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T102f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T102f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T201f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T102f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T102f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T201f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T102f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T102f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T102f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T102f200(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T227f29(T0* C, T6 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge213os8515;
extern T6 ge213ov8515;
extern T6 T229f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T6 T229f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T228f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T102f201(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T166f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T166f20(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T102f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T102f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T102f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T102f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T102f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T102f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T102f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T102f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T226c53(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T226f65(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T224f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T224f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T224f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T224f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T102f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T102f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T102f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T102f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T102f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1311os5813;
extern T0* ge1311ov5813;
extern T0* T102f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1311os5814;
extern T0* ge1311ov5814;
extern T0* T102f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T102f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T226c57(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T180f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T179f2(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].copy_data */
extern void T179f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].move_data */
extern void T179f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].overlapping_move */
extern void T179f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].non_overlapping_move */
extern void T179f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T179c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T180f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T279c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T180c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T102f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T171f20(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T171f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T171f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T102f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T171f21(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T171c21(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T171c19(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T102f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T102f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T102f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T102f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T102f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T102f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T102f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T198f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T204f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T198f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T339c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T224f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T198f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T204f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T204f68(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T102f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T102f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T102f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T102f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T102f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T102f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T102f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T102f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T181f6(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T183f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].clear_all */
extern void T196f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T191f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T193f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T188f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T184f6(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T53f10(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T186f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T179f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T169f6(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T102f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T102f213(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T102f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T102f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T166f38(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T166f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T166f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T166f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T166f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T166f43(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T268f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T268f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T102f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T161c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T161f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T161f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T161f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T161f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T161f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T161f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T161f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T161f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T161f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T161f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T161f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T161f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T161f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T161f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T161f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T161f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T161f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T161f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T161f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T161f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T161f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T161f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T161f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T161f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T161f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T161f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T161f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T161f42(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T80f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T80f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T80f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T80f40(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T80f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T80f40p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T80f20(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T80f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T147f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T147f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2101os3000;
extern T0* ge2101ov3000;
extern T0* T80f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T147c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T147f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T147f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T80f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T147f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T147f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T80f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T80f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T80c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T80f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T80f26(T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T85c225(T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T85f227(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T97f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T93c3(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T221c8(void);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T102f205(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T95c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T95f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T151f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T97c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T95f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T96c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T95f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T149c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T102f204(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T102c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T102f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T166f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T266f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T166c37(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T166f42(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T166f54(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T266c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T266f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T307c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T166f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T268c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T166f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T166f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T166f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T166f61(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T166f60(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T270f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T308c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T270c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T166f26(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T102f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T102f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1307os5692;
extern T0* ge1307ov5692;
extern T0* T102f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T102f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1307os5691;
extern T0* ge1307ov5691;
extern T0* T102f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1307os5690;
extern T0* ge1307ov5690;
extern T0* T102f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1307os5689;
extern T0* ge1307ov5689;
extern T0* T102f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1307os5688;
extern T0* ge1307ov5688;
extern T0* T102f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1307os5687;
extern T0* ge1307ov5687;
extern T0* T102f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1307os5686;
extern T0* ge1307ov5686;
extern T0* T102f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1307os5685;
extern T0* ge1307ov5685;
extern T0* T102f151(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1307os5684;
extern T0* ge1307ov5684;
extern T0* T102f126(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1307os5683;
extern T0* ge1307ov5683;
extern T0* T102f123(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T102f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T101f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T101f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T101c3(void);
/* ET_XACE_VALIDATOR.make */
extern T0* T98c30(T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T99c10(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_parsed_libraries */
extern void T83f226(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern void T83f225(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern T0* T83c225(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].set_key_equality_tester */
extern void T100f38(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].internal_set_equality_tester */
extern void T156f6(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_map */
extern T0* T100c36(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_with_equality_testers */
extern void T100f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T156c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].new_cursor */
extern T0* T156f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T254c3(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_cursor */
extern T0* T100f32(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T158c4(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_sparse_container */
extern void T100f46(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_slots */
extern void T100f50(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_clashes */
extern void T100f49(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_key_storage */
extern void T100f48(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_item_storage */
extern void T100f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].make */
extern T0* T160f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_LIBRARY].make_area */
extern T0* T255c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].default_create */
extern T0* T160c3(void);
/* ET_XACE_AST_FACTORY.make */
extern T0* T90c10(void);
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T40f14(T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T40f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T67f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T45f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T45f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T67f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T45f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T67f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T67f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T67f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T45f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T1 T45f7(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.parse_file */
extern void T83f224(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.new_library */
extern T0* T83f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_ve */
extern void T83f223(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.set_shallow */
extern void T83f222(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables */
extern T0* T83c221(T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T36f14(T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T36f15(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.parse_file */
extern void T78f226(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.new_system */
extern T0* T78f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_system */
extern void T78f228(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.fill_externals */
extern void T78f230(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_PARSER.new_export */
extern T0* T78f129(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_exported_feature */
extern T0* T78f220(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_alias */
extern T0* T78f222(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_feature */
extern T0* T78f219(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_export */
extern T0* T78f128(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_include_dir */
extern T0* T78f127(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_location */
extern T0* T78f126(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_link_library */
extern T0* T78f125(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_external */
extern T0* T78f26(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_options */
extern T0* T78f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_options */
extern void T78f229(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.uc_debug */
extern T0* T78f124(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_optimize */
extern T0* T78f123(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_check */
extern T0* T78f121(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_loop */
extern T0* T78f118(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_invariant */
extern T0* T78f116(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_ensure */
extern T0* T78f114(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_enable */
extern T0* T78f112(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_require */
extern T0* T78f111(T0* C);
/* ET_XACE_SYSTEM_PARSER.is_false */
extern T1 T78f110(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.is_true */
extern T1 T78f109(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.option_codes */
extern T0* T78f28(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_equality_tester */
extern T0* T78f13(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_value */
extern T0* T78f27(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_option */
extern T0* T78f24(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_mount */
extern T0* T78f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.execution_environment */
extern T0* T78f134(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_prefix */
extern T0* T78f132(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_mount */
extern T0* T78f22(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_cluster */
extern T0* T78f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.new_class */
extern T0* T78f133(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_feature */
extern T0* T78f221(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_relative */
extern T0* T78f131(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_abstract */
extern T0* T78f130(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_cluster */
extern T0* T78f19(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_ */
extern T0* T78f18(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_creation */
extern T0* T78f17(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_class */
extern T0* T78f16(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_root */
extern T0* T78f15(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_name */
extern T0* T78f14(T0* C);
/* ET_XACE_SYSTEM_PARSER.set_ve */
extern void T78f225(T0* C, T1 a1);
/* ET_XACE_SYSTEM_PARSER.set_shallow */
extern void T78f224(T0* C, T1 a1);
/* ET_XACE_SYSTEM_PARSER.make_with_variables */
extern T0* T78c223(T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.make_with_variables_and_factory */
extern void T78f227(T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T41f8(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T40f13(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T36f13(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T204f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T162c7(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T202f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T198f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T161f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T204f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T202f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T198f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T161f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T204f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T227f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T227f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T202f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T198f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T161f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T204f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T202f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T198f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T161f43(T0* C);
/* ET_XACE_ISE_GENERATOR.default_system_output_filename */
extern unsigned char ge1134os2365;
extern T0* ge1134ov2365;
extern T0* T47f3(T0* C);
/* ET_XACE_SE_GENERATOR.default_system_output_filename */
extern unsigned char ge1135os2365;
extern T0* ge1135ov2365;
extern T0* T46f3(T0* C);
/* ET_XACE_GE_GENERATOR.default_system_output_filename */
extern unsigned char ge1133os2365;
extern T0* ge1133ov2365;
extern T0* T44f3(T0* C);
/* ET_XACE_XML_GENERATOR.default_system_output_filename */
extern unsigned char ge1138os2365;
extern T0* ge1138ov2365;
extern T0* T43f4(T0* C);
/* ET_XACE_ISE_GENERATOR.default_library_output_filename */
extern unsigned char ge1134os2366;
extern T0* ge1134ov2366;
extern T0* T47f4(T0* C);
/* ET_XACE_GE_GENERATOR.default_library_output_filename */
extern unsigned char ge1133os2366;
extern T0* ge1133ov2366;
extern T0* T44f4(T0* C);
/* ET_XACE_XML_GENERATOR.default_library_output_filename */
extern unsigned char ge1138os2366;
extern T0* ge1138ov2366;
extern T0* T43f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T344f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T344f3(T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T344f6(T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T66f4(T0* C, T6 a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T344f4(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T289f5(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T289f3(T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T289f6(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T289f4(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T288f5(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T288f3(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T288f6(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T288f4(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T216f5(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T216f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T216f6(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T216f4(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T215f5(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T215f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T215f6(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T215f4(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T214f5(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T214f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T214f6(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T214f4(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T213f5(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T213f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T213f6(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T213f4(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T212f5(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T212f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T212f6(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T212f4(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T211f5(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T211f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T211f6(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T211f4(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T210f5(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T210f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T210f6(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T210f4(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T209f5(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T209f3(T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T209f6(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T209f4(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T208f5(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T208f3(T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T208f6(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T208f4(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T207f5(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T207f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T207f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T206f5(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T206f3(T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T206f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T206f4(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T205f5(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T205f3(T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T205f6(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T205f4(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T109f5(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T109f3(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T109f6(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T109f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T108f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T108f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T108f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T108f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T88f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T88f3(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T88f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T88f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T87f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T87f3(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T87f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T87f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T34f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T34f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T34f5(T0* C);
extern T0* GE_ma223(T6 c, ...);
extern T0* GE_ma66(T6 c, ...);
extern T0* GE_ma151(T6 c, ...);
extern T0* ge1135ov2366;
extern T0* ge1137ov2366;
extern T0* ge1136ov2366;
extern T0* ge1137ov2365;
extern T0* ge1136ov2365;
extern T0* ge216ov2730;
extern T0* ge220ov2602;
extern T0* ge56ov1919;
extern T0* ge56ov1920;
extern T0* ge226ov3662;
extern T0* ge159ov8417;
extern T0* ge1315ov7562;
extern T0* ge1315ov7563;
extern T0* ge204ov4522;
extern T0* ge1306ov8425;
extern T0* ge1306ov8427;
extern T0* ge1258ov5149;
extern T0* ge1239ov7407;
extern T0* ge1239ov7406;
extern T0* ge1110ov4209;
extern T0* ge1110ov4201;
extern T0* ge1110ov4211;
extern T0* ge1110ov4198;
extern T0* ge1110ov4203;
extern T0* ge1110ov4204;
extern T0* ge1110ov4205;
extern T0* ge1110ov4192;
extern T0* ge1110ov4188;
extern T0* ge1110ov4206;
extern T0* ge1110ov4200;
extern T0* ge1110ov4193;
extern T0* ge1110ov4189;
extern T0* ge1110ov4195;
extern T0* ge1110ov4210;
extern T0* ge1110ov4207;
extern T0* ge1110ov4199;
extern T0* ge1110ov4197;
extern T0* ge1110ov4194;
extern T0* ge1110ov4196;
extern T0* ge1110ov4215;
extern T0* ge1110ov4212;
extern T0* ge1110ov4190;
extern T0* ge223ov2730;
extern T0* ge1110ov4202;
extern T0* ge1135ov2508;
extern T0* ge193ov4542;
extern T0* ge1110ov4213;
extern T0* ge1301ov5439;
extern T0* ge1301ov5438;
extern T0* ge1143ov4024;
extern T0* ge1110ov4208;
extern T0* ge1110ov4191;
extern T0* ge1143ov4023;
extern T0* ge1143ov4022;
extern T0* ge1110ov4025;
extern T0* ge1110ov4026;
extern T0* ge1110ov4027;
extern T0* ge1110ov4028;
extern T0* ge1110ov4029;
extern T0* ge1110ov4030;
extern T0* ge1110ov4031;
extern T0* ge1110ov4032;
extern T0* ge1110ov4033;
extern T0* ge1110ov4034;
extern T0* ge1110ov4035;
extern T0* ge1110ov4036;
extern T0* ge1110ov4037;
extern T0* ge1110ov4038;
extern T0* ge1110ov4039;
extern T0* ge1110ov4040;
extern T0* ge1110ov4041;
extern T0* ge1110ov4042;
extern T0* ge1110ov4043;
extern T0* ge1110ov4044;
extern T0* ge1110ov4045;
extern T0* ge1110ov4046;
extern T0* ge1110ov4047;
extern T0* ge1110ov4048;
extern T0* ge1110ov4049;
extern T0* ge1110ov4050;
extern T0* ge1110ov4051;
extern T0* ge1110ov4052;
extern T0* ge1110ov4053;
extern T0* ge1110ov4054;
extern T0* ge1110ov4055;
extern T0* ge1110ov4056;
extern T0* ge1110ov4057;
extern T0* ge1110ov4058;
extern T0* ge1110ov4059;
extern T0* ge1110ov4060;
extern T0* ge1110ov4061;
extern T0* ge1110ov4062;
extern T0* ge1110ov4063;
extern T0* ge1110ov4064;
extern T0* ge1110ov4065;
extern T0* ge1110ov4066;
extern T0* ge1110ov4067;
extern T0* ge1110ov4068;
extern T0* ge1110ov4069;
extern T0* ge1110ov4070;
extern T0* ge1110ov4071;
extern T0* ge1110ov4072;
extern T0* ge1110ov4073;
extern T0* ge1110ov4074;
extern T0* ge1110ov4075;
extern T0* ge1110ov4076;
extern T0* ge1110ov4077;
extern T0* ge1110ov4078;
extern T0* ge1110ov4079;
extern T0* ge1110ov4080;
extern T0* ge1110ov4081;
extern T0* ge1110ov4082;
extern T0* ge1110ov4083;
extern T0* ge1110ov4084;
extern T0* ge1110ov4085;
extern T0* ge1110ov4086;
extern T0* ge1110ov4087;
extern T0* ge1110ov4088;
extern T0* ge1110ov4089;
extern T0* ge1110ov4090;
extern T0* ge1110ov4091;
extern T0* ge1110ov4092;
extern T0* ge1110ov4093;
extern T0* ge1110ov4094;
extern T0* ge1110ov4095;
extern T0* ge1110ov4096;
extern T0* ge1110ov4097;
extern T0* ge1110ov4098;
extern T0* ge1110ov4099;
extern T0* ge1110ov4100;
extern T0* ge1110ov4101;
extern T0* ge1110ov4102;
extern T0* ge1110ov4103;
extern T0* ge1110ov4104;
extern T0* ge1110ov4105;
extern T0* ge111ov2730;
extern T0* ge1100ov6343;
extern T0* ge1106ov5124;
extern T0* ge1308ov6064;
extern T0* ge1308ov6026;
extern T0* ge1308ov6024;
extern T0* ge1308ov6065;
extern T0* ge1308ov6037;
extern T0* ge1308ov6036;
extern T0* ge1308ov6047;
extern T0* ge1308ov6041;
extern T0* ge1308ov6040;
extern T0* ge1308ov6039;
extern T0* ge1308ov6045;
extern T0* ge1308ov6044;
extern T0* ge1308ov6046;
extern T0* ge1308ov6023;
extern T0* ge1308ov6049;
extern T0* ge1308ov6058;
extern T0* ge1311ov5788;
extern T0* ge1311ov5786;
extern T0* ge1311ov5787;
extern T0* ge1308ov6059;
extern T0* ge1308ov6060;
extern T0* ge1308ov6063;
extern T0* ge1308ov6061;
extern T0* ge1308ov6062;
extern T0* ge1308ov6056;
extern T0* ge1304ov8005;
extern T0* ge1304ov8006;
extern T0* ge1308ov6029;
extern T0* ge1308ov6052;
extern T0* ge1308ov6072;
extern T0* ge1308ov6073;
extern T0* ge1308ov6074;
extern T0* ge1308ov6067;
extern T0* ge1308ov6050;
extern T0* ge1308ov6051;
extern T0* ge1308ov6053;
extern T0* ge1308ov6057;
extern T0* ge1306ov8424;
extern T0* ge1306ov8426;
extern T0* ge1121ov2346;
extern T0* ge1118ov2346;
extern T0* ge1112ov2346;
extern T0* ge1128ov2346;
extern T0* ge1125ov2346;
extern T0* ge1127ov2346;
extern T0* ge1124ov2346;
extern T0* ge1120ov2346;
extern T0* ge1119ov2346;
extern T0* ge1131ov2346;
extern T0* ge1115ov2346;
extern T0* ge1126ov2346;
extern T0* ge1130ov2346;
extern T0* ge1122ov2346;
extern T0* ge1113ov2346;
extern T0* ge1123ov2346;
extern T0* ge1156ov2346;
extern T0* ge1153ov2346;
extern T0* ge1152ov2346;
extern T0* ge1162ov2346;
extern void GE_const_init(void);
extern EIF_TYPE GE_types[];

#ifdef __cplusplus
}
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
