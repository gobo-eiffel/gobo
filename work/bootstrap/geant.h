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
#define EIF_WINDOWS 1
#endif
#ifdef WIN32
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
#define geint8(x) x
#define genat8(x) x
#define geint16(x) x
#define genat16(x) x
#define geint32(x) x##L
#define genat32(x) x##U
#if defined (_MSC_VER) && (_MSC_VER < 1400) /* MSC older than v8 */
#define geint64(x) x##i64
#define genat64(x) x##ui64
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#define geint64(x) x##i64
#define genat64(x) x##ui64
#else /* ISO C 99 */
#define geint64(x) x##LL
#define genat64(x) x##ULL
#endif 
#endif 

/* Memory allocation, GC */
#define gealloc(x) calloc((x),1)

#ifdef _MSC_VER /* MSVC */
/* MSVC does not support ISO C 99's 'snprintf' from stdio.h */
#define snprintf(a,b,c,d) sprintf(a,c,d)
#endif

/*
 * Interoperability with ISE.
 */

#define RTI64C(x) geint64(x)
#define EIF_PROCEDURE EIF_POINTER
#define INTEGER EIF_INTEGER_32
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

extern int geargc;
extern char** geargv;

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
#define gejmp_buf sigjmp_buf
#define gesetjmp(x) sigsetjmp((x),1)
#define gelongjmp(x,y) siglongjmp((x),(y))
#else
#define gejmp_buf jmp_buf
#define gesetjmp(x) setjmp((x))
#define gelongjmp(x,y) longjmp((x),(y))
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
	Context of features containing a rescue clause.
*/
struct gerescue {
	gejmp_buf jb;
	struct gerescue *previous; /* previous context in the call chain */
};

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
extern struct gerescue *gerescue;

extern void geraise(int code);

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used when there is no garbage collector"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_NO_GC_H
#define GE_NO_GC_H

/* GC initialization */
#define geinit_gc() /* do nothing */

/* Memory allocation */
#define gealloc(x) calloc((x),1)
#define gealloc_atomic(x) calloc((x),1)

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
extern T0* geboxed1(T1 a1);
typedef struct Sb1 Tb1;

/* CHARACTER_8 */
#define T2 EIF_CHARACTER_8
extern T0* geboxed2(T2 a1);
typedef struct Sb2 Tb2;

/* CHARACTER_32 */
#define T3 EIF_CHARACTER_32
extern T0* geboxed3(T3 a1);
typedef struct Sb3 Tb3;

/* INTEGER_8 */
#define T4 EIF_INTEGER_8
extern T0* geboxed4(T4 a1);
typedef struct Sb4 Tb4;

/* INTEGER_16 */
#define T5 EIF_INTEGER_16
extern T0* geboxed5(T5 a1);
typedef struct Sb5 Tb5;

/* INTEGER_32 */
#define T6 EIF_INTEGER_32
extern T0* geboxed6(T6 a1);
typedef struct Sb6 Tb6;

/* INTEGER_64 */
#define T7 EIF_INTEGER_64
extern T0* geboxed7(T7 a1);
typedef struct Sb7 Tb7;

/* NATURAL_8 */
#define T8 EIF_NATURAL_8
extern T0* geboxed8(T8 a1);
typedef struct Sb8 Tb8;

/* NATURAL_16 */
#define T9 EIF_NATURAL_16
extern T0* geboxed9(T9 a1);
typedef struct Sb9 Tb9;

/* NATURAL_32 */
#define T10 EIF_NATURAL_32
extern T0* geboxed10(T10 a1);
typedef struct Sb10 Tb10;

/* NATURAL_64 */
#define T11 EIF_NATURAL_64
extern T0* geboxed11(T11 a1);
typedef struct Sb11 Tb11;

/* REAL_32 */
#define T12 EIF_REAL_32
extern T0* geboxed12(T12 a1);
typedef struct Sb12 Tb12;

/* REAL_64 */
#define T13 EIF_REAL_64
extern T0* geboxed13(T13 a1);
typedef struct Sb13 Tb13;

/* POINTER */
#define T14 EIF_POINTER
extern T0* geboxed14(T14 a1);
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

/* DS_HASH_TABLE [GEANT_TARGET, STRING] */
typedef struct S31 T31;

/* SPECIAL [STRING] */
typedef struct S32 T32;

/* ARRAY [STRING] */
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

/* DS_SPARSE_TABLE_KEYS [STRING, STRING] */
typedef struct S61 T61;

/* SPECIAL [INTEGER] */
typedef struct S63 T63;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct S64 T64;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct S65 T65;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct S66 T66;

/* KL_STDOUT_FILE */
typedef struct S68 T68;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S69 T69;

/* DS_ARRAYED_LIST [STRING] */
typedef struct S70 T70;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct S71 T71;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S72 T72;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S73 T73;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S74 T74;

/* KL_STRING_ROUTINES */
typedef struct S75 T75;

/* TYPED_POINTER [ANY] */
typedef struct S76 T76;

/* DS_HASH_TABLE [STRING, STRING] */
typedef struct S78 T78;

/* EXECUTION_ENVIRONMENT */
typedef struct S80 T80;

/* KL_ANY_ROUTINES */
typedef struct S81 T81;

/* KL_PATHNAME */
typedef struct S83 T83;

/* UNIX_FILE_INFO */
typedef struct S84 T84;

/* KL_LINKABLE [CHARACTER] */
typedef struct S85 T85;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S87 T87;

/* XM_EIFFEL_PARSER */
typedef struct S89 T89;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S90 T90;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S93 T93;

/* XM_DOCUMENT */
typedef struct S94 T94;

/* XM_ELEMENT */
typedef struct S95 T95;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S96 T96;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S98 T98;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S99 T99;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING, STRING] */
typedef struct S100 T100;

/* TO_SPECIAL [INTEGER] */
typedef struct S101 T101;

/* TO_SPECIAL [STRING] */
typedef struct S102 T102;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S103 T103;

/* SPECIAL [AP_OPTION] */
typedef struct S105 T105;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S106 T106;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S107 T107;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S108 T108;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S109 T109;

/* UC_STRING */
typedef struct S110 T110;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S112 T112;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S114 T114;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S115 T115;

/* GEANT_INHERIT_ELEMENT */
typedef struct S116 T116;

/* GEANT_INHERIT */
typedef struct S117 T117;

/* SPECIAL [GEANT_TARGET] */
typedef struct S118 T118;

/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING] */
typedef struct S120 T120;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING] */
typedef struct S122 T122;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S123 T123;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct S124 T124;

/* XM_EIFFEL_SCANNER */
typedef struct S126 T126;

/* XM_DEFAULT_POSITION */
typedef struct S127 T127;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S129 T129;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S130 T130;

/* XM_CALLBACKS_NULL */
typedef struct S131 T131;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct S132 T132;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S134 T134;

/* SPECIAL [ANY] */
typedef struct S135 T135;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S136 T136;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S137 T137;

/* XM_EIFFEL_DECLARATION */
typedef struct S138 T138;

/* XM_DTD_EXTERNAL_ID */
typedef struct S139 T139;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S140 T140;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S141 T141;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S142 T142;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S143 T143;

/* DS_BILINKED_LIST [STRING] */
typedef struct S144 T144;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S145 T145;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S146 T146;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S147 T147;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S148 T148;

/* SPECIAL [BOOLEAN] */
typedef struct S149 T149;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S150 T150;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S151 T151;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S152 T152;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S153 T153;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S154 T154;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S155 T155;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S157 T157;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S159 T159;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S160 T160;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S161 T161;

/* SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct S162 T162;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]] */
typedef struct S163 T163;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S164 T164;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S165 T165;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S167 T167;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S168 T168;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S170 T170;

/* XM_NAMESPACE_RESOLVER */
typedef struct S171 T171;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S172 T172;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S173 T173;

/* XM_POSITION_TABLE */
typedef struct S174 T174;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S175 T175;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S176 T176;

/* TO_SPECIAL [AP_OPTION] */
typedef struct S178 T178;

/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S179 T179;

/* C_STRING */
typedef struct S180 T180;

/* GEANT_PARENT */
typedef struct S181 T181;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S183 T183;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S184 T184;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S185 T185;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S186 T186;

/* XM_ATTRIBUTE */
typedef struct S188 T188;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S189 T189;

/* ARRAY [INTEGER] */
typedef struct S191 T191;

/* UC_UTF8_ROUTINES */
typedef struct S192 T192;

/* UC_UTF8_STRING */
typedef struct S193 T193;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S194 T194;

/* KL_INTEGER_ROUTINES */
typedef struct S195 T195;

/* KL_PLATFORM */
typedef struct S196 T196;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S197 T197;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct S198 T198;

/* GEANT_PARENT_ELEMENT */
typedef struct S199 T199;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING] */
typedef struct S201 T201;

/* TO_SPECIAL [GEANT_TARGET] */
typedef struct S202 T202;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S203 T203;

/* YY_BUFFER */
typedef struct S204 T204;

/* YY_FILE_BUFFER */
typedef struct S205 T205;

/* DS_LINKED_STACK [INTEGER] */
typedef struct S208 T208;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S209 T209;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S210 T210;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S211 T211;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S212 T212;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct S213 T213;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct S215 T215;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S217 T217;

/* TO_SPECIAL [ANY] */
typedef struct S218 T218;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S219 T219;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S220 T220;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S221 T221;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S222 T222;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S223 T223;

/* DS_LINKED_LIST [STRING] */
typedef struct S224 T224;

/* DS_BILINKED_LIST_CURSOR [STRING] */
typedef struct S225 T225;

/* DS_BILINKABLE [STRING] */
typedef struct S226 T226;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S227 T227;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S228 T228;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S229 T229;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S230 T230;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S231 T231;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S232 T232;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S233 T233;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct S234 T234;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S235 T235;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S236 T236;

/* DS_LINKED_QUEUE [STRING] */
typedef struct S238 T238;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S239 T239;

/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S240 T240;

/* SPECIAL [NATURAL_8] */
typedef struct S241 T241;

/* GEANT_STRING_INTERPRETER */
typedef struct S242 T242;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S243 T243;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct S246 T246;

/* MANAGED_POINTER */
typedef struct S247 T247;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S248 T248;

/* SPECIAL [GEANT_PARENT] */
typedef struct S249 T249;

/* UC_UNICODE_ROUTINES */
typedef struct S250 T250;

/* DS_LINKED_QUEUE [CHARACTER] */
typedef struct S252 T252;

/* UC_UTF16_ROUTINES */
typedef struct S253 T253;

/* SPECIAL [NATURAL_64] */
typedef struct S254 T254;

/* ARRAY [NATURAL_64] */
typedef struct S255 T255;

/* GEANT_RENAME_ELEMENT */
typedef struct S256 T256;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S257 T257;

/* GEANT_SELECT_ELEMENT */
typedef struct S258 T258;

/* GEANT_RENAME */
typedef struct S259 T259;

/* DS_HASH_TABLE [GEANT_RENAME, STRING] */
typedef struct S260 T260;

/* GEANT_REDEFINE */
typedef struct S261 T261;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING] */
typedef struct S262 T262;

/* GEANT_SELECT */
typedef struct S263 T263;

/* DS_HASH_TABLE [GEANT_SELECT, STRING] */
typedef struct S264 T264;

/* DS_LINKABLE [INTEGER] */
typedef struct S266 T266;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct S267 T267;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S268 T268;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S269 T269;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S270 T270;

/* DS_LINKED_LIST_CURSOR [STRING] */
typedef struct S271 T271;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]] */
typedef struct S273 T273;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]] */
typedef struct S274 T274;

/* DS_LINKABLE [STRING] */
typedef struct S275 T275;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S276 T276;

/* GEANT_GEC_TASK */
typedef struct S278 T278;

/* GEANT_SE_TASK */
typedef struct S279 T279;

/* GEANT_ISE_TASK */
typedef struct S280 T280;

/* GEANT_VE_TASK */
typedef struct S281 T281;

/* GEANT_EXEC_TASK */
typedef struct S282 T282;

/* GEANT_LCC_TASK */
typedef struct S283 T283;

/* GEANT_SET_TASK */
typedef struct S284 T284;

/* GEANT_UNSET_TASK */
typedef struct S285 T285;

/* GEANT_GEXACE_TASK */
typedef struct S286 T286;

/* GEANT_GELEX_TASK */
typedef struct S287 T287;

/* GEANT_GEYACC_TASK */
typedef struct S288 T288;

/* GEANT_GEPP_TASK */
typedef struct S289 T289;

/* GEANT_GETEST_TASK */
typedef struct S290 T290;

/* GEANT_GEANT_TASK */
typedef struct S291 T291;

/* GEANT_ECHO_TASK */
typedef struct S292 T292;

/* GEANT_MKDIR_TASK */
typedef struct S293 T293;

/* GEANT_DELETE_TASK */
typedef struct S294 T294;

/* GEANT_COPY_TASK */
typedef struct S295 T295;

/* GEANT_MOVE_TASK */
typedef struct S296 T296;

/* GEANT_SETENV_TASK */
typedef struct S297 T297;

/* GEANT_XSLT_TASK */
typedef struct S298 T298;

/* GEANT_OUTOFDATE_TASK */
typedef struct S299 T299;

/* GEANT_EXIT_TASK */
typedef struct S300 T300;

/* GEANT_PRECURSOR_TASK */
typedef struct S301 T301;

/* GEANT_AVAILABLE_TASK */
typedef struct S302 T302;

/* GEANT_INPUT_TASK */
typedef struct S303 T303;

/* GEANT_REPLACE_TASK */
typedef struct S304 T304;

/* AP_OPTION_COMPARATOR */
typedef struct S305 T305;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S306 T306;

/* ST_WORD_WRAPPER */
typedef struct S308 T308;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S310 T310;

/* XM_COMMENT */
typedef struct S311 T311;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S312 T312;

/* XM_CHARACTER_DATA */
typedef struct S313 T313;

/* XM_NAMESPACE */
typedef struct S314 T314;

/* DS_LINKABLE [XM_NODE] */
typedef struct S317 T317;

/* XM_NODE_TYPER */
typedef struct S318 T318;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S323 T323;

/* KL_CHARACTER_BUFFER */
typedef struct S324 T324;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S325 T325;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S326 T326;

/* EXCEPTIONS */
typedef struct S327 T327;

/* TO_SPECIAL [GEANT_PARENT] */
typedef struct S328 T328;

/* SPECIAL [ARRAY [INTEGER]] */
typedef struct S329 T329;

/* SPECIAL [SPECIAL [ARRAY [INTEGER]]] */
typedef struct S330 T330;

/* DS_LINKABLE [CHARACTER] */
typedef struct S331 T331;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S332 T332;

/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING] */
typedef struct S333 T333;

/* SPECIAL [GEANT_RENAME] */
typedef struct S335 T335;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING] */
typedef struct S336 T336;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S337 T337;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S338 T338;

/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING] */
typedef struct S339 T339;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S341 T341;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING] */
typedef struct S342 T342;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S343 T343;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S344 T344;

/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING] */
typedef struct S345 T345;

/* SPECIAL [GEANT_SELECT] */
typedef struct S347 T347;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING] */
typedef struct S348 T348;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S349 T349;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]] */
typedef struct S351 T351;

/* KL_DIRECTORY */
typedef struct S352 T352;

/* KL_STRING_INPUT_STREAM */
typedef struct S353 T353;

/* GEANT_GEC_COMMAND */
typedef struct S354 T354;

/* GEANT_SE_COMMAND */
typedef struct S355 T355;

/* GEANT_ISE_COMMAND */
typedef struct S356 T356;

/* GEANT_VE_COMMAND */
typedef struct S357 T357;

/* GEANT_EXEC_COMMAND */
typedef struct S358 T358;

/* GEANT_FILESET_ELEMENT */
typedef struct S359 T359;

/* GEANT_FILESET */
typedef struct S360 T360;

/* GEANT_LCC_COMMAND */
typedef struct S361 T361;

/* GEANT_SET_COMMAND */
typedef struct S362 T362;

/* GEANT_UNSET_COMMAND */
typedef struct S363 T363;

/* GEANT_GEXACE_COMMAND */
typedef struct S364 T364;

/* GEANT_DEFINE_ELEMENT */
typedef struct S365 T365;

/* GEANT_GELEX_COMMAND */
typedef struct S366 T366;

/* GEANT_GEYACC_COMMAND */
typedef struct S367 T367;

/* GEANT_GEPP_COMMAND */
typedef struct S368 T368;

/* GEANT_GETEST_COMMAND */
typedef struct S369 T369;

/* GEANT_GEANT_COMMAND */
typedef struct S370 T370;

/* ST_SPLITTER */
typedef struct S371 T371;

/* GEANT_ECHO_COMMAND */
typedef struct S372 T372;

/* GEANT_MKDIR_COMMAND */
typedef struct S373 T373;

/* GEANT_DELETE_COMMAND */
typedef struct S374 T374;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S375 T375;

/* GEANT_DIRECTORYSET */
typedef struct S376 T376;

/* GEANT_COPY_COMMAND */
typedef struct S377 T377;

/* GEANT_MOVE_COMMAND */
typedef struct S378 T378;

/* GEANT_SETENV_COMMAND */
typedef struct S379 T379;

/* GEANT_XSLT_COMMAND */
typedef struct S380 T380;

/* DS_PAIR [STRING, STRING] */
typedef struct S381 T381;

/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]] */
typedef struct S382 T382;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S383 T383;

/* GEANT_EXIT_COMMAND */
typedef struct S384 T384;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S385 T385;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S386 T386;

/* GEANT_INPUT_COMMAND */
typedef struct S387 T387;

/* GEANT_REPLACE_COMMAND */
typedef struct S388 T388;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S389 T389;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S390 T390;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S391 T391;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S392 T392;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING] */
typedef struct S393 T393;

/* TO_SPECIAL [GEANT_RENAME] */
typedef struct S394 T394;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING] */
typedef struct S395 T395;

/* TO_SPECIAL [GEANT_REDEFINE] */
typedef struct S396 T396;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING] */
typedef struct S397 T397;

/* TO_SPECIAL [GEANT_SELECT] */
typedef struct S398 T398;

/* DP_SHELL_COMMAND */
typedef struct S402 T402;

/* GEANT_MAP_ELEMENT */
typedef struct S403 T403;

/* GEANT_MAP */
typedef struct S404 T404;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S407 T407;

/* DS_HASH_SET [STRING] */
typedef struct S409 T409;

/* DS_HASH_SET_CURSOR [STRING] */
typedef struct S411 T411;

/* LX_DFA_WILDCARD */
typedef struct S412 T412;

/* GEANT_FILESET_ENTRY */
typedef struct S413 T413;

/* KL_BOOLEAN_ROUTINES */
typedef struct S414 T414;

/* ARRAY [BOOLEAN] */
typedef struct S415 T415;

/* DS_HASH_SET [INTEGER] */
typedef struct S417 T417;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S418 T418;

/* SPECIAL [DS_PAIR [STRING, STRING]] */
typedef struct S419 T419;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]] */
typedef struct S420 T420;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]] */
typedef struct S421 T421;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S422 T422;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S423 T423;

/* KL_STDIN_FILE */
typedef struct S424 T424;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S425 T425;

/* PLATFORM */
typedef struct S429 T429;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S431 T431;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S432 T432;

/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S433 T433;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S434 T434;

/* LX_WILDCARD_PARSER */
typedef struct S435 T435;

/* LX_DESCRIPTION */
typedef struct S436 T436;

/* LX_FULL_DFA */
typedef struct S437 T437;

/* DS_HASH_SET_CURSOR [INTEGER] */
typedef struct S439 T439;

/* KL_EQUALITY_TESTER [INTEGER] */
typedef struct S440 T440;

/* TO_SPECIAL [DS_PAIR [STRING, STRING]] */
typedef struct S441 T441;

/* RX_BYTE_CODE */
typedef struct S443 T443;

/* RX_CASE_MAPPING */
typedef struct S444 T444;

/* RX_CHARACTER_SET */
typedef struct S445 T445;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S447 T447;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S448 T448;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S449 T449;

/* KL_BINARY_INPUT_FILE */
typedef struct S450 T450;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S451 T451;

/* GE_HASH_TABLE [C_STRING, STRING] */
typedef struct S452 T452;

/* FILE_NAME */
typedef struct S454 T454;

/* RAW_FILE */
typedef struct S455 T455;

/* DIRECTORY */
typedef struct S456 T456;

/* ARRAYED_LIST [STRING] */
typedef struct S457 T457;

/* TO_SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S458 T458;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S459 T459;

/* LX_START_CONDITIONS */
typedef struct S460 T460;

/* LX_ACTION_FACTORY */
typedef struct S461 T461;

/* DS_ARRAYED_STACK [INTEGER] */
typedef struct S462 T462;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING] */
typedef struct S463 T463;

/* LX_SYMBOL_CLASS */
typedef struct S464 T464;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S465 T465;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S466 T466;

/* LX_NFA */
typedef struct S467 T467;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S468 T468;

/* LX_RULE */
typedef struct S469 T469;

/* SPECIAL [LX_NFA] */
typedef struct S470 T470;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S471 T471;

/* UT_SYNTAX_ERROR */
typedef struct S472 T472;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING] */
typedef struct S473 T473;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S474 T474;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S475 T475;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S476 T476;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S477 T477;

/* LX_FULL_AND_META_ERROR */
typedef struct S478 T478;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S479 T479;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S480 T480;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S481 T481;

/* SPECIAL [LX_RULE] */
typedef struct S482 T482;

/* ARRAY [LX_RULE] */
typedef struct S483 T483;

/* LX_DFA_STATE */
typedef struct S484 T484;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S485 T485;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S486 T486;

/* LX_SYMBOL_PARTITIONS */
typedef struct S487 T487;

/* LX_START_CONDITION */
typedef struct S488 T488;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S489 T489;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S490 T490;

/* DS_HASH_TABLE [LX_NFA, INTEGER] */
typedef struct S491 T491;

/* LX_NFA_STATE */
typedef struct S492 T492;

/* STRING_SEARCHER */
typedef struct S493 T493;

/* GE_STRING_EQUALITY_TESTER */
typedef struct S494 T494;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S496 T496;

/* PRIMES */
typedef struct S498 T498;

/* SPECIAL [C_STRING] */
typedef struct S499 T499;

/* TYPED_POINTER [FILE_NAME] */
typedef struct S500 T500;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S501 T501;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S502 T502;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S503 T503;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S504 T504;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S505 T505;

/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING] */
typedef struct S507 T507;

/* DS_ARRAYED_LIST_CURSOR [INTEGER] */
typedef struct S509 T509;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S510 T510;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S511 T511;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S513 T513;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S515 T515;

/* DS_BILINKABLE [INTEGER] */
typedef struct S516 T516;

/* SPECIAL [DS_BILINKABLE [INTEGER]] */
typedef struct S517 T517;

/* ARRAY [DS_BILINKABLE [INTEGER]] */
typedef struct S518 T518;

/* LX_ACTION */
typedef struct S520 T520;

/* TO_SPECIAL [LX_NFA] */
typedef struct S521 T521;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S522 T522;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S524 T524;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S526 T526;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S528 T528;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S529 T529;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S531 T531;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S532 T532;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S533 T533;

/* ARRAY [LX_DFA_STATE] */
typedef struct S534 T534;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct S535 T535;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S536 T536;

/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER] */
typedef struct S538 T538;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER] */
typedef struct S540 T540;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S543 T543;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S546 T546;

/* TO_SPECIAL [LX_RULE] */
typedef struct S549 T549;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct S550 T550;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING] */
typedef struct S551 T551;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct S552 T552;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct S553 T553;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER] */
typedef struct S554 T554;

/* DS_SHELL_SORTER [INTEGER] */
typedef struct S555 T555;

/* KL_COMPARABLE_COMPARATOR [INTEGER] */
typedef struct S559 T559;

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

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER]] */
struct S124 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S326 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [FILE_NAME] */
struct S500 {
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
	T6 a4; /* internal_hash_code */
};

/* Struct for type GEANT */
struct S21 {
	int id;
	T0* a2; /* error_handler */
	T1 a3; /* verbose */
	T1 a5; /* debug_mode */
	T1 a6; /* no_exec */
	T0* a7; /* build_filename */
	T0* a9; /* start_target_name */
	T1 a10; /* show_target_info */
};

/* Struct for type GEANT_PROJECT */
struct S22 {
	int id;
	T0* a1; /* targets */
	T0* a2; /* name */
	T1 a4; /* build_successful */
	T0* a6; /* start_target_name */
	T0* a8; /* default_target_name */
	T0* a9; /* output_file */
	T0* a11; /* variables */
	T0* a12; /* selected_targets */
	T0* a13; /* options */
	T0* a14; /* inherit_clause */
	T0* a15; /* description */
	T1 a16; /* old_inherit */
	T0* a19; /* current_target */
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
	T0* a9; /* key_equality_tester */
	T0* a10; /* internal_keys */
	T6 a11; /* position */
	T6 a13; /* count */
	T6 a14; /* capacity */
	T6 a17; /* slots_position */
	T6 a18; /* free_slot */
	T6 a19; /* last_position */
	T0* a23; /* equality_tester */
	T6 a24; /* found_position */
	T6 a25; /* modulus */
	T6 a26; /* clashes_previous_position */
	T0* a28; /* item_storage */
	T0* a31; /* clashes */
	T0* a32; /* slots */
	T0* a33; /* key_storage */
	T0* a34; /* internal_cursor */
	T0* a37; /* special_item_routines */
	T0* a38; /* special_key_routines */
};

/* Struct for type GEANT_TARGET */
struct S26 {
	int id;
	T0* a1; /* name */
	T0* a3; /* xml_element */
	T0* a12; /* formal_arguments */
	T0* a16; /* project */
	T0* a19; /* obsolete_message */
	T0* a20; /* description */
	T0* a21; /* exports */
	T1 a22; /* execute_once */
	T1 a31; /* is_executed */
	T0* a35; /* precursor_target */
	T0* a37; /* redefining_target */
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
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type GEANT_VARIABLES */
struct S29 {
	int id;
	T6 a1; /* position */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T0* a13; /* key_equality_tester */
	T0* a14; /* internal_keys */
	T6 a15; /* found_position */
	T6 a16; /* modulus */
	T6 a17; /* clashes_previous_position */
	T0* a19; /* item_storage */
	T0* a22; /* clashes */
	T0* a23; /* slots */
	T0* a24; /* key_storage */
	T0* a25; /* equality_tester */
	T0* a27; /* special_item_routines */
	T0* a28; /* special_key_routines */
	T0* a29; /* internal_cursor */
};

/* Struct for type GEANT_PROJECT_ELEMENT */
struct S30 {
	int id;
	T0* a1; /* project */
	T0* a5; /* xml_element */
};

/* Struct for type DS_HASH_TABLE [GEANT_TARGET, STRING] */
struct S31 {
	int id;
	T6 a3; /* position */
	T0* a6; /* item_storage */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* last_position */
	T6 a10; /* capacity */
	T6 a13; /* slots_position */
	T6 a15; /* count */
	T6 a16; /* modulus */
	T6 a17; /* clashes_previous_position */
	T0* a20; /* equality_tester */
	T6 a21; /* found_position */
	T0* a24; /* clashes */
	T0* a25; /* slots */
	T0* a26; /* key_storage */
	T6 a27; /* free_slot */
	T0* a28; /* internal_cursor */
	T0* a31; /* special_item_routines */
	T0* a32; /* special_key_routines */
};

/* Struct for type SPECIAL [STRING] */
struct S32 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING] */
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
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T0* a13; /* key_equality_tester */
	T0* a14; /* internal_keys */
	T6 a15; /* found_position */
	T6 a16; /* modulus */
	T6 a17; /* clashes_previous_position */
	T0* a19; /* item_storage */
	T0* a22; /* clashes */
	T0* a23; /* slots */
	T0* a24; /* key_storage */
	T0* a25; /* equality_tester */
	T0* a27; /* special_item_routines */
	T0* a28; /* special_key_routines */
	T0* a29; /* internal_cursor */
};

/* Struct for type AP_FLAG */
struct S35 {
	int id;
	T6 a2; /* occurrences */
	T0* a3; /* description */
	T0* a4; /* long_form */
	T2 a5; /* short_form */
	T1 a6; /* has_short_form */
	T1 a7; /* is_mandatory */
	T1 a13; /* is_hidden */
};

/* Struct for type AP_ALTERNATIVE_OPTIONS_LIST */
struct S36 {
	int id;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a10; /* first_cell */
};

/* Struct for type AP_STRING_OPTION */
struct S37 {
	int id;
	T0* a3; /* parameters */
	T0* a5; /* description */
	T0* a6; /* parameter_description */
	T2 a7; /* short_form */
	T1 a8; /* has_short_form */
	T0* a9; /* long_form */
	T1 a14; /* is_mandatory */
	T1 a16; /* is_hidden */
};

/* Struct for type AP_PARSER */
struct S38 {
	int id;
	T0* a1; /* options */
	T0* a2; /* alternative_options_lists */
	T0* a3; /* error_handler */
	T0* a4; /* parameters */
	T0* a5; /* help_option */
	T0* a9; /* application_description */
	T0* a10; /* parameters_description */
	T0* a16; /* argument_list */
	T0* a18; /* current_options */
	T1 a19; /* is_first_option */
	T0* a24; /* last_option_parameter */
};

/* Struct for type AP_ERROR */
struct S40 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* default_template */
	T0* a4; /* code */
};

/* Struct for type AP_ERROR_HANDLER */
struct S45 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a4; /* warning_file */
	T0* a5; /* info_file */
};

/* Struct for type KL_STANDARD_FILES */
struct S46 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S47 {
	int id;
	T14 a3; /* file_pointer */
	T0* a5; /* name */
	T6 a6; /* mode */
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
	T2 a21; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S54 {
	int id;
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S55 {
	int id;
	T0* a4; /* string_name */
	T6 a9; /* mode */
	T0* a15; /* name */
	T0* a17; /* character_buffer */
	T1 a18; /* end_of_file */
	T14 a21; /* file_pointer */
	T1 a23; /* descriptor_available */
	T2 a28; /* last_character */
	T0* a38; /* last_string */
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
	T0* a5; /* variables */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S59 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING, STRING] */
struct S61 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [INTEGER] */
struct S63 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING, STRING] */
struct S64 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER] */
struct S65 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING] */
struct S66 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S68 {
	int id;
	T14 a1; /* file_pointer */
	T0* a5; /* name */
	T6 a6; /* mode */
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

/* Struct for type DS_ARRAYED_LIST [STRING] */
struct S70 {
	int id;
	T6 a3; /* count */
	T0* a8; /* storage */
	T0* a9; /* internal_cursor */
	T0* a16; /* special_routines */
	T6 a17; /* capacity */
	T0* a21; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING] */
struct S71 {
	int id;
	T6 a3; /* position */
	T0* a5; /* next_cursor */
	T0* a6; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S72 {
	int id;
	T0* a1; /* description */
	T2 a2; /* short_form */
	T1 a3; /* has_short_form */
	T0* a4; /* long_form */
	T6 a5; /* occurrences */
	T1 a9; /* is_mandatory */
	T1 a20; /* is_hidden */
};

/* Struct for type DS_ARRAYED_LIST [AP_OPTION] */
struct S73 {
	int id;
	T0* a4; /* internal_cursor */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
	T0* a9; /* storage */
	T0* a12; /* special_routines */
	T6 a13; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S74 {
	int id;
	T0* a3; /* internal_cursor */
	T0* a8; /* storage */
	T0* a9; /* special_routines */
	T6 a10; /* capacity */
	T6 a13; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S75 {
	int id;
};

/* Struct for type DS_HASH_TABLE [STRING, STRING] */
struct S78 {
	int id;
	T0* a2; /* key_equality_tester */
	T0* a3; /* internal_keys */
	T0* a4; /* equality_tester */
	T6 a6; /* capacity */
	T6 a7; /* modulus */
	T6 a9; /* last_position */
	T6 a10; /* free_slot */
	T6 a12; /* position */
	T0* a13; /* internal_cursor */
	T0* a14; /* special_item_routines */
	T0* a15; /* item_storage */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* clashes */
	T0* a20; /* slots */
	T6 a21; /* found_position */
	T6 a31; /* count */
	T6 a40; /* slots_position */
	T6 a41; /* clashes_previous_position */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S80 {
	int id;
	T6 a4; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S81 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S83 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a11; /* components */
};

/* Struct for type UNIX_FILE_INFO */
struct S84 {
	int id;
	T0* a3; /* buffered_file_info */
	T0* a7; /* file_name */
};

/* Struct for type KL_LINKABLE [CHARACTER] */
struct S85 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S87 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S89 {
	int id;
	T0* a3; /* internal_last_error_description */
	T0* a8; /* scanner */
	T0* a14; /* error_positions */
	T0* a16; /* scanners */
	T1 a17; /* in_external_dtd */
	T0* a18; /* callbacks */
	T0* a19; /* entities */
	T0* a21; /* pe_entities */
	T0* a22; /* dtd_resolver */
	T0* a24; /* entity_resolver */
	T1 a25; /* use_namespaces */
	T6 a26; /* string_mode */
	T0* a28; /* yyss */
	T0* a31; /* yytranslate */
	T0* a33; /* yyr1 */
	T0* a35; /* yytypes1 */
	T0* a37; /* yytypes2 */
	T0* a39; /* yydefact */
	T0* a41; /* yydefgoto */
	T0* a43; /* yypact */
	T0* a45; /* yypgoto */
	T0* a47; /* yytable */
	T0* a49; /* yycheck */
	T6 a51; /* yy_parsing_status */
	T6 a53; /* yy_suspended_yystacksize */
	T6 a54; /* yy_suspended_yystate */
	T6 a55; /* yy_suspended_yyn */
	T6 a56; /* yy_suspended_yychar1 */
	T6 a57; /* yy_suspended_index */
	T6 a58; /* yy_suspended_yyss_top */
	T6 a59; /* yy_suspended_yy_goto */
	T6 a61; /* error_count */
	T1 a62; /* yy_lookahead_needed */
	T6 a63; /* yyerrstatus */
	T6 a64; /* yyssp */
	T6 a72; /* last_token */
	T6 a81; /* yyvsp1 */
	T6 a82; /* yyvsp2 */
	T6 a83; /* yyvsp3 */
	T6 a84; /* yyvsp4 */
	T6 a85; /* yyvsp5 */
	T6 a86; /* yyvsp6 */
	T6 a87; /* yyvsp7 */
	T6 a88; /* yyvsp8 */
	T6 a89; /* yyvsp9 */
	T6 a90; /* yyvsp10 */
	T6 a91; /* yyvsp11 */
	T0* a92; /* last_string_value */
	T6 a103; /* yyvsc1 */
	T0* a104; /* yyvs1 */
	T0* a105; /* yyspecial_routines1 */
	T0* a107; /* last_any_value */
	T6 a108; /* yyvsc4 */
	T0* a109; /* yyvs4 */
	T0* a110; /* yyspecial_routines4 */
	T6 a112; /* yyvsc2 */
	T0* a113; /* yyvs2 */
	T0* a114; /* yyspecial_routines2 */
	T0* a121; /* yyvs11 */
	T6 a122; /* yyvsc11 */
	T0* a123; /* yyspecial_routines11 */
	T0* a125; /* yyvs10 */
	T0* a126; /* yyvs5 */
	T6 a128; /* yyvsc10 */
	T0* a129; /* yyspecial_routines10 */
	T6 a135; /* yyvsc3 */
	T0* a136; /* yyvs3 */
	T0* a137; /* yyspecial_routines3 */
	T0* a143; /* yyvs6 */
	T6 a145; /* yyvsc6 */
	T0* a146; /* yyspecial_routines6 */
	T0* a151; /* yyvs8 */
	T0* a154; /* yyvs7 */
	T6 a155; /* yyvsc8 */
	T0* a156; /* yyspecial_routines8 */
	T6 a158; /* yyvsc7 */
	T0* a159; /* yyspecial_routines7 */
	T0* a161; /* yyvs9 */
	T6 a163; /* yyvsc9 */
	T0* a164; /* yyspecial_routines9 */
	T6 a170; /* yyvsc5 */
	T0* a171; /* yyspecial_routines5 */
	T0* a177; /* dtd_callbacks */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S90 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a8; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S93 {
	int id;
	T0* a1; /* document */
	T0* a2; /* next */
	T0* a3; /* source_parser */
	T0* a4; /* last_position_table */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type XM_DOCUMENT */
struct S94 {
	int id;
	T0* a1; /* root_element */
	T0* a4; /* internal_cursor */
	T0* a7; /* first_cell */
	T0* a8; /* last_cell */
	T6 a9; /* count */
	T0* a11; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S95 {
	int id;
	T0* a1; /* parent */
	T0* a14; /* namespace */
	T0* a15; /* name */
	T0* a16; /* internal_cursor */
	T0* a19; /* first_cell */
	T0* a20; /* last_cell */
	T6 a21; /* count */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S96 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S98 {
	int id;
	T6 a5; /* return_code */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S99 {
	int id;
	T6 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING, STRING] */
struct S100 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER] */
struct S101 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING] */
struct S102 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S103 {
	int id;
	T6 a1; /* position */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S105 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S106 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S107 {
	int id;
	T6 a1; /* position */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S108 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S109 {
	int id;
};

/* Struct for type UC_STRING */
struct S110 {
	int id;
	T6 a1; /* count */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
	T0* a7; /* area */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S112 {
	int id;
	T11 a3; /* part1 */
	T6 a4; /* sign */
	T11 a5; /* part2 */
	T6 a6; /* last_state */
	T1 a7; /* internal_overflowed */
	T6 a9; /* conversion_type */
	T0* a10; /* leading_separators */
	T0* a11; /* trailing_separators */
	T1 a12; /* leading_separators_acceptable */
	T1 a13; /* trailing_separators_acceptable */
};

/* Struct for type DS_LINKED_LIST [XM_ELEMENT] */
struct S114 {
	int id;
	T6 a1; /* count */
	T0* a3; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S115 {
	int id;
	T1 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T1 a5; /* before */
	T0* a6; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S116 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a7; /* xml_element */
};

/* Struct for type GEANT_INHERIT */
struct S117 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S118 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING] */
struct S120 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING] */
struct S122 {
	int id;
	T0* a5; /* container */
	T6 a6; /* position */
	T0* a7; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S123 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S126 {
	int id;
	T6 a2; /* last_token */
	T0* a3; /* last_value */
	T0* a7; /* input_name */
	T6 a8; /* position */
	T6 a9; /* column */
	T6 a10; /* line */
	T0* a12; /* input_filter */
	T6 a13; /* yy_start_state */
	T0* a14; /* character_entity */
	T0* a16; /* input_stream */
	T0* a17; /* input_resolver */
	T1 a25; /* yy_more_flag */
	T6 a26; /* yy_more_len */
	T6 a27; /* yy_end */
	T6 a28; /* yy_start */
	T6 a29; /* yy_line */
	T6 a30; /* yy_column */
	T6 a31; /* yy_position */
	T0* a32; /* input_buffer */
	T0* a34; /* yy_state_stack */
	T6 a35; /* yy_state_count */
	T0* a36; /* yy_ec */
	T0* a37; /* yy_content_area */
	T0* a38; /* yy_content */
	T0* a39; /* yy_accept */
	T6 a40; /* yy_last_accepting_state */
	T6 a41; /* yy_last_accepting_cpos */
	T0* a42; /* yy_chk */
	T0* a43; /* yy_base */
	T0* a44; /* yy_def */
	T0* a45; /* yy_meta */
	T0* a47; /* yy_nxt */
	T6 a49; /* yy_lp */
	T0* a50; /* yy_acclist */
	T6 a53; /* yy_looking_for_trail_begin */
	T6 a55; /* yy_full_match */
	T6 a56; /* yy_full_state */
	T6 a57; /* yy_full_lp */
	T1 a63; /* yy_rejected */
	T0* a65; /* last_error */
	T0* a66; /* start_conditions */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S127 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S129 {
	int id;
	T0* a2; /* first_cell */
	T0* a3; /* internal_cursor */
	T0* a6; /* last_cell */
	T6 a7; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S130 {
	int id;
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S131 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING] */
struct S132 {
	int id;
	T6 a3; /* position */
	T0* a6; /* item_storage */
	T6 a8; /* count */
	T6 a9; /* last_position */
	T6 a10; /* free_slot */
	T6 a11; /* capacity */
	T6 a14; /* slots_position */
	T0* a18; /* key_equality_tester */
	T0* a19; /* internal_keys */
	T6 a20; /* modulus */
	T6 a21; /* clashes_previous_position */
	T0* a23; /* internal_cursor */
	T6 a25; /* found_position */
	T0* a26; /* key_storage */
	T0* a27; /* clashes */
	T0* a28; /* slots */
	T0* a31; /* equality_tester */
	T0* a33; /* special_item_routines */
	T0* a34; /* special_key_routines */
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S134 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S135 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S136 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S137 {
	int id;
	T1 a2; /* use_namespaces */
	T6 a3; /* count */
	T0* a4; /* first */
	T0* a5; /* second */
	T0* a6; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S138 {
	int id;
	T0* a1; /* version */
	T0* a3; /* encoding */
	T1 a5; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S139 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S140 {
	int id;
	T6 a2; /* position */
	T0* a4; /* equality_tester */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a14; /* modulus */
	T6 a15; /* slots_position */
	T6 a16; /* clashes_previous_position */
	T0* a20; /* internal_cursor */
	T6 a22; /* found_position */
	T0* a24; /* clashes */
	T0* a25; /* slots */
	T0* a26; /* item_storage */
	T0* a27; /* special_item_routines */
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S141 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S142 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S143 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING] */
struct S144 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
	T0* a7; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S145 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S146 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S147 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S148 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S149 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S150 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S151 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S152 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S153 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S154 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S155 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S157 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S159 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S160 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S161 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING]] */
struct S162 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]] */
struct S163 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S164 {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_error */
	T0* a11; /* start_conditions */
	T6 a12; /* yy_start_state */
	T6 a13; /* yy_line */
	T6 a14; /* yy_column */
	T6 a15; /* yy_position */
	T6 a16; /* line */
	T6 a17; /* column */
	T6 a18; /* position */
	T1 a19; /* yy_more_flag */
	T6 a20; /* yy_more_len */
	T6 a21; /* yy_last_accepting_state */
	T6 a22; /* yy_last_accepting_cpos */
	T1 a23; /* yy_rejected */
	T6 a24; /* yy_state_count */
	T6 a25; /* yy_full_match */
	T6 a26; /* yy_lp */
	T6 a27; /* yy_looking_for_trail_begin */
	T6 a28; /* yy_full_lp */
	T6 a29; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T6 a33; /* yy_end */
	T6 a34; /* yy_start */
	T0* a35; /* yy_nxt */
	T0* a37; /* yy_chk */
	T0* a39; /* yy_base */
	T0* a41; /* yy_def */
	T0* a43; /* yy_ec */
	T0* a45; /* yy_meta */
	T0* a47; /* yy_accept */
	T0* a49; /* yy_content */
	T0* a50; /* yy_content_area */
	T6 a57; /* last_token */
	T0* a58; /* last_value */
	T0* a64; /* input_filter */
	T0* a67; /* input_stream */
	T0* a68; /* input_resolver */
	T0* a88; /* yy_acclist */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S165 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S167 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S168 {
	int id;
	T6 a2; /* last_token */
	T0* a3; /* last_value */
	T0* a7; /* input_name */
	T6 a8; /* position */
	T6 a9; /* column */
	T6 a10; /* line */
	T0* a12; /* input_filter */
	T6 a13; /* yy_start_state */
	T0* a15; /* character_entity */
	T0* a17; /* input_stream */
	T0* a18; /* input_resolver */
	T1 a20; /* decl_start_sent */
	T1 a22; /* decl_end_sent */
	T1 a30; /* yy_more_flag */
	T6 a31; /* yy_more_len */
	T6 a32; /* yy_end */
	T6 a33; /* yy_start */
	T6 a34; /* yy_line */
	T6 a35; /* yy_column */
	T6 a36; /* yy_position */
	T0* a37; /* input_buffer */
	T0* a39; /* yy_state_stack */
	T6 a40; /* yy_state_count */
	T0* a41; /* yy_ec */
	T0* a42; /* yy_content_area */
	T0* a43; /* yy_content */
	T0* a44; /* yy_accept */
	T6 a45; /* yy_last_accepting_state */
	T6 a46; /* yy_last_accepting_cpos */
	T0* a47; /* yy_chk */
	T0* a48; /* yy_base */
	T0* a49; /* yy_def */
	T0* a50; /* yy_meta */
	T0* a52; /* yy_nxt */
	T6 a54; /* yy_lp */
	T0* a55; /* yy_acclist */
	T6 a58; /* yy_looking_for_trail_begin */
	T6 a60; /* yy_full_match */
	T6 a61; /* yy_full_state */
	T6 a62; /* yy_full_lp */
	T1 a68; /* yy_rejected */
	T0* a70; /* last_error */
	T0* a71; /* start_conditions */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S170 {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_error */
	T0* a11; /* start_conditions */
	T6 a12; /* yy_start_state */
	T6 a13; /* yy_line */
	T6 a14; /* yy_column */
	T6 a15; /* yy_position */
	T6 a16; /* line */
	T6 a17; /* column */
	T6 a18; /* position */
	T1 a19; /* yy_more_flag */
	T6 a20; /* yy_more_len */
	T6 a21; /* yy_last_accepting_state */
	T6 a22; /* yy_last_accepting_cpos */
	T1 a23; /* yy_rejected */
	T6 a24; /* yy_state_count */
	T6 a25; /* yy_full_match */
	T6 a26; /* yy_lp */
	T6 a27; /* yy_looking_for_trail_begin */
	T6 a28; /* yy_full_lp */
	T6 a29; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T6 a33; /* yy_end */
	T6 a34; /* yy_start */
	T1 a35; /* pre_sent */
	T1 a36; /* post_sent */
	T0* a37; /* yy_nxt */
	T0* a39; /* yy_chk */
	T0* a41; /* yy_base */
	T0* a43; /* yy_def */
	T0* a45; /* yy_ec */
	T0* a47; /* yy_meta */
	T0* a49; /* yy_accept */
	T0* a51; /* yy_content */
	T0* a52; /* yy_content_area */
	T6 a58; /* last_token */
	T0* a59; /* last_value */
	T0* a65; /* input_filter */
	T0* a69; /* input_stream */
	T0* a70; /* input_resolver */
	T0* a91; /* yy_acclist */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S171 {
	int id;
	T0* a1; /* next */
	T0* a2; /* context */
	T0* a3; /* element_prefix */
	T0* a5; /* element_local_part */
	T1 a9; /* forward_xmlns */
	T0* a11; /* attributes_prefix */
	T0* a13; /* attributes_local_part */
	T0* a14; /* attributes_value */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S172 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S173 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_POSITION_TABLE */
struct S174 {
	int id;
	T0* a1; /* table */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S175 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S176 {
	int id;
};

/* Struct for type TO_SPECIAL [AP_OPTION] */
struct S178 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S179 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S180 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type GEANT_PARENT */
struct S181 {
	int id;
	T0* a2; /* renames */
	T0* a3; /* parent_project */
	T0* a4; /* redefines */
	T0* a5; /* selects */
	T0* a6; /* project */
	T0* a7; /* unchanged_targets */
	T0* a8; /* renamed_targets */
	T0* a9; /* redefined_targets */
};

/* Struct for type DS_ARRAYED_LIST [GEANT_PARENT] */
struct S183 {
	int id;
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T6 a7; /* count */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S184 {
	int id;
	T0* a3; /* container */
	T6 a4; /* position */
	T0* a6; /* next_cursor */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S185 {
	int id;
	T6 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S186 {
	int id;
	T0* a6; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S188 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S189 {
	int id;
	T1 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T1 a5; /* before */
	T0* a8; /* next_cursor */
};

/* Struct for type ARRAY [INTEGER] */
struct S191 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S192 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S193 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a19; /* byte_count */
	T6 a30; /* internal_hash_code */
	T6 a34; /* last_byte_index_input */
	T6 a35; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S194 {
	int id;
	T0* a1; /* last_string */
	T6 a9; /* encoding */
	T0* a16; /* impl */
	T0* a17; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S195 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S196 {
	int id;
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S197 {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
};

/* Struct for type DS_LINKABLE [XM_ELEMENT] */
struct S198 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S199 {
	int id;
	T0* a1; /* parent */
	T0* a4; /* project */
	T0* a13; /* xml_element */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING] */
struct S201 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_TARGET] */
struct S202 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S203 {
	int id;
	T6 a5; /* code */
};

/* Struct for type YY_BUFFER */
struct S204 {
	int id;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T6 a11; /* capacity */
};

/* Struct for type YY_FILE_BUFFER */
struct S205 {
	int id;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T0* a10; /* file */
	T1 a12; /* end_of_file */
	T6 a13; /* capacity */
	T1 a14; /* interactive */
};

/* Struct for type DS_LINKED_STACK [INTEGER] */
struct S208 {
	int id;
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S209 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S210 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S211 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S212 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING] */
struct S213 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
struct S215 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S217 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S218 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S219 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S220 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S221 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S222 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S223 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING] */
struct S224 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* equality_tester */
	T0* a7; /* last_cell */
	T6 a8; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING] */
struct S225 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING] */
struct S226 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S227 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S228 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S229 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S230 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S231 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S232 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S233 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING]] */
struct S234 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S235 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S236 {
	int id;
	T0* a5; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING] */
struct S238 {
	int id;
	T0* a3; /* first_cell */
	T6 a4; /* count */
	T0* a5; /* last_cell */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S239 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
};

/* Struct for type TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S240 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S241 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S242 {
	int id;
	T0* a5; /* variable_resolver */
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S243 {
	int id;
	T0* a3; /* variables */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER] */
struct S246 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S247 {
	int id;
	T1 a1; /* is_shared */
	T14 a3; /* item */
	T6 a6; /* count */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S248 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S249 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S250 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER] */
struct S252 {
	int id;
	T6 a1; /* count */
	T0* a3; /* first_cell */
	T0* a5; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S253 {
	int id;
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S254 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type ARRAY [NATURAL_64] */
struct S255 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S256 {
	int id;
	T0* a1; /* rename_clause */
	T0* a6; /* project */
	T0* a7; /* xml_element */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S257 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S258 {
	int id;
	T0* a1; /* select_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
};

/* Struct for type GEANT_RENAME */
struct S259 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING] */
struct S260 {
	int id;
	T6 a2; /* position */
	T0* a4; /* equality_tester */
	T6 a5; /* last_position */
	T6 a6; /* capacity */
	T6 a9; /* slots_position */
	T6 a11; /* count */
	T0* a12; /* key_equality_tester */
	T0* a13; /* internal_keys */
	T6 a14; /* modulus */
	T6 a15; /* clashes_previous_position */
	T6 a18; /* found_position */
	T0* a19; /* item_storage */
	T0* a22; /* clashes */
	T0* a23; /* slots */
	T0* a24; /* key_storage */
	T6 a25; /* free_slot */
	T0* a26; /* internal_cursor */
	T0* a29; /* special_item_routines */
	T0* a30; /* special_key_routines */
};

/* Struct for type GEANT_REDEFINE */
struct S261 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING] */
struct S262 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a8; /* slots_position */
	T6 a10; /* count */
	T0* a11; /* key_equality_tester */
	T0* a12; /* internal_keys */
	T6 a13; /* found_position */
	T6 a14; /* modulus */
	T6 a15; /* clashes_previous_position */
	T0* a18; /* item_storage */
	T0* a21; /* clashes */
	T0* a22; /* slots */
	T0* a23; /* key_storage */
	T6 a24; /* free_slot */
	T0* a25; /* internal_cursor */
	T0* a28; /* special_item_routines */
	T0* a29; /* special_key_routines */
};

/* Struct for type GEANT_SELECT */
struct S263 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING] */
struct S264 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a8; /* slots_position */
	T6 a10; /* count */
	T0* a11; /* key_equality_tester */
	T0* a12; /* internal_keys */
	T6 a13; /* found_position */
	T6 a14; /* modulus */
	T6 a15; /* clashes_previous_position */
	T0* a18; /* item_storage */
	T0* a21; /* clashes */
	T0* a22; /* slots */
	T0* a23; /* key_storage */
	T6 a24; /* free_slot */
	T0* a25; /* internal_cursor */
	T0* a28; /* special_item_routines */
	T0* a29; /* special_key_routines */
};

/* Struct for type DS_LINKABLE [INTEGER] */
struct S266 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
struct S267 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S268 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S269 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S270 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING] */
struct S271 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]] */
struct S273 {
	int id;
	T6 a2; /* count */
	T0* a4; /* last_cell */
	T0* a5; /* internal_cursor */
	T0* a7; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]] */
struct S274 {
	int id;
	T1 a1; /* before */
	T0* a3; /* current_cell */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
	T1 a6; /* after */
};

/* Struct for type DS_LINKABLE [STRING] */
struct S275 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S276 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type GEANT_GEC_TASK */
struct S278 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_SE_TASK */
struct S279 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_ISE_TASK */
struct S280 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_VE_TASK */
struct S281 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_EXEC_TASK */
struct S282 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_LCC_TASK */
struct S283 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_SET_TASK */
struct S284 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_UNSET_TASK */
struct S285 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GEXACE_TASK */
struct S286 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GELEX_TASK */
struct S287 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GEYACC_TASK */
struct S288 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GEPP_TASK */
struct S289 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GETEST_TASK */
struct S290 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_GEANT_TASK */
struct S291 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_ECHO_TASK */
struct S292 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_MKDIR_TASK */
struct S293 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_DELETE_TASK */
struct S294 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_COPY_TASK */
struct S295 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_MOVE_TASK */
struct S296 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_SETENV_TASK */
struct S297 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_XSLT_TASK */
struct S298 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S299 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_EXIT_TASK */
struct S300 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S301 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S302 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_INPUT_TASK */
struct S303 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type GEANT_REPLACE_TASK */
struct S304 {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S305 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S306 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S308 {
	int id;
	T6 a3; /* new_line_indentation */
	T6 a4; /* broken_words */
	T6 a5; /* maximum_text_width */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S310 {
	int id;
	T6 a3; /* position */
	T0* a6; /* item_storage */
	T0* a7; /* equality_tester */
	T6 a8; /* last_position */
	T6 a9; /* capacity */
	T6 a12; /* slots_position */
	T6 a14; /* count */
	T6 a15; /* modulus */
	T6 a16; /* clashes_previous_position */
	T6 a21; /* free_slot */
	T0* a22; /* internal_cursor */
	T6 a24; /* found_position */
	T0* a26; /* clashes */
	T0* a27; /* slots */
	T0* a28; /* special_item_routines */
};

/* Struct for type XM_COMMENT */
struct S311 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S312 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S313 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S314 {
	int id;
	T0* a2; /* uri */
	T0* a4; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S317 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S318 {
	int id;
	T0* a1; /* element */
	T0* a4; /* xml_attribute */
	T0* a5; /* composite */
	T0* a6; /* document */
	T0* a7; /* character_data */
	T0* a8; /* processing_instruction */
	T0* a9; /* comment */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S323 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S324 {
	int id;
	T0* a4; /* as_special */
	T0* a6; /* area */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S325 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXCEPTIONS */
struct S327 {
	int id;
};

/* Struct for type TO_SPECIAL [GEANT_PARENT] */
struct S328 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER]] */
struct S329 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER]]] */
struct S330 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER] */
struct S331 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S332 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING] */
struct S333 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S335 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING] */
struct S336 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S337 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S338 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING] */
struct S339 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S341 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING] */
struct S342 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S343 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S344 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING] */
struct S345 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S347 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING] */
struct S348 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S349 {
	int id;
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]] */
struct S351 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S352 {
	int id;
	T0* a2; /* string_name */
	T0* a5; /* name */
	T6 a7; /* mode */
	T1 a10; /* end_of_input */
	T0* a11; /* last_entry */
	T0* a13; /* entry_buffer */
	T0* a15; /* lastentry */
	T14 a18; /* directory_pointer */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S353 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a6; /* string */
	T6 a7; /* location */
};

/* Struct for type GEANT_GEC_COMMAND */
struct S354 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* exit_code_variable_name */
	T0* a7; /* ace_filename */
	T0* a8; /* clean */
	T1 a9; /* c_compile */
	T1 a10; /* split_mode */
	T1 a11; /* finalize */
	T1 a12; /* cat_mode */
	T6 a13; /* split_size */
	T0* a14; /* garbage_collector */
};

/* Struct for type GEANT_SE_COMMAND */
struct S355 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* exit_code_variable_name */
	T0* a8; /* ace_filename */
	T0* a9; /* root_class */
	T0* a10; /* executable */
	T0* a11; /* clean */
	T0* a12; /* creation_procedure */
	T1 a13; /* case_insensitive */
	T1 a14; /* no_style_warning */
};

/* Struct for type GEANT_ISE_COMMAND */
struct S356 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* exit_code_variable_name */
	T0* a7; /* system_name */
	T0* a8; /* clean */
	T0* a9; /* ace_filename */
	T1 a10; /* finalize_mode */
	T1 a11; /* finish_freezing */
};

/* Struct for type GEANT_VE_COMMAND */
struct S357 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* exit_code_variable_name */
	T0* a8; /* esd_filename */
	T0* a9; /* xace_filename */
	T0* a10; /* clean */
	T0* a11; /* tuned_system */
	T1 a12; /* recursive_clean */
	T0* a13; /* tuning_level */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S358 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* command_line */
	T0* a7; /* fileset */
	T0* a8; /* exit_code_variable_name */
	T1 a9; /* accept_errors */
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S359 {
	int id;
	T0* a1; /* fileset */
	T0* a7; /* project */
	T0* a20; /* xml_element */
};

/* Struct for type GEANT_FILESET */
struct S360 {
	int id;
	T0* a5; /* directory_name */
	T0* a6; /* project */
	T0* a7; /* include_wildcard */
	T0* a8; /* exclude_wildcard */
	T0* a9; /* map */
	T0* a10; /* filenames */
	T0* a11; /* filename_directory_name */
	T0* a12; /* mapped_filename_directory_name */
	T0* a13; /* dir_name */
	T1 a14; /* concat */
	T0* a15; /* single_includes */
	T0* a16; /* single_excludes */
	T1 a17; /* force */
	T1 a18; /* convert_to_filesystem */
	T0* a20; /* include_wc_string */
	T0* a25; /* exclude_wc_string */
	T0* a26; /* filename_variable_name */
	T0* a27; /* mapped_filename_variable_name */
};

/* Struct for type GEANT_LCC_COMMAND */
struct S361 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* executable */
	T0* a5; /* source_filename */
};

/* Struct for type GEANT_SET_COMMAND */
struct S362 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S363 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S364 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T1 a9; /* validate_command */
	T0* a10; /* output_filename */
	T0* a11; /* system_command */
	T0* a12; /* library_command */
	T1 a13; /* verbose */
	T0* a14; /* xace_filename */
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S365 {
	int id;
	T0* a7; /* project */
	T0* a10; /* xml_element */
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S366 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T1 a5; /* full */
	T1 a6; /* meta_ecs */
	T0* a7; /* output_filename */
	T0* a8; /* size */
	T1 a9; /* ecs */
	T1 a10; /* backup */
	T1 a11; /* case_insensitive */
	T1 a12; /* no_default */
	T1 a13; /* no_warn */
	T1 a14; /* separate_actions */
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S367 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T1 a6; /* separate_actions */
	T0* a7; /* verbose_filename */
	T1 a8; /* old_typing */
	T1 a9; /* new_typing */
	T0* a10; /* tokens_classname */
	T0* a11; /* tokens_filename */
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S368 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T0* a7; /* input_filename */
	T0* a8; /* output_filename */
	T0* a9; /* fileset */
	T1 a10; /* empty_lines */
	T0* a11; /* to_directory */
	T1 a12; /* force */
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S369 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T0* a5; /* config_filename */
	T1 a6; /* generation */
	T1 a7; /* compilation */
	T1 a8; /* execution */
	T1 a9; /* verbose */
	T0* a10; /* compile */
	T0* a11; /* class_regexp */
	T0* a12; /* feature_regexp */
	T1 a13; /* default_test_included */
	T1 a14; /* abort */
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S370 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* arguments */
	T0* a4; /* project */
	T0* a7; /* filename */
	T0* a8; /* start_target_name */
	T1 a9; /* reuse_variables */
	T1 a10; /* fork */
	T1 a11; /* has_fork_been_set */
	T0* a12; /* fileset */
};

/* Struct for type ST_SPLITTER */
struct S371 {
	int id;
	T1 a3; /* has_escape_character */
	T2 a4; /* escape_character */
	T0* a6; /* separator_codes */
	T0* a8; /* separators */
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S372 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* message */
	T0* a5; /* to_file */
	T1 a6; /* append */
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S373 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* directory */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S374 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a9; /* file */
	T0* a10; /* directory */
	T0* a11; /* fileset */
	T0* a12; /* directoryset */
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S375 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a13; /* xml_element */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S376 {
	int id;
	T0* a4; /* directory_name */
	T0* a5; /* project */
	T0* a6; /* include_wildcard */
	T0* a7; /* exclude_wildcard */
	T0* a8; /* directory_names */
	T1 a9; /* convert_to_filesystem */
	T0* a10; /* single_includes */
	T0* a11; /* single_excludes */
	T0* a12; /* include_wc_string */
	T0* a14; /* exclude_wc_string */
	T1 a15; /* concat */
	T0* a16; /* directory_name_variable_name */
};

/* Struct for type GEANT_COPY_COMMAND */
struct S377 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a8; /* file */
	T0* a9; /* to_file */
	T0* a10; /* to_directory */
	T0* a11; /* fileset */
	T1 a12; /* force */
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S378 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* file */
	T0* a8; /* to_file */
	T0* a9; /* to_directory */
	T0* a10; /* fileset */
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S379 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S380 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* parameters */
	T0* a4; /* project */
	T0* a5; /* input_filename */
	T0* a6; /* output_filename */
	T0* a7; /* stylesheet_filename */
	T6 a8; /* processor */
	T1 a13; /* force */
	T0* a14; /* indent */
	T0* a15; /* format */
	T0* a16; /* extdirs */
	T0* a17; /* classpath */
};

/* Struct for type DS_PAIR [STRING, STRING] */
struct S381 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]] */
struct S382 {
	int id;
	T6 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S383 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* source_filename */
	T0* a7; /* target_filename */
	T0* a8; /* fileset */
	T0* a9; /* true_value */
	T0* a10; /* false_value */
	T0* a11; /* variable_name */
	T1 a14; /* is_out_of_date */
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S384 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T6 a4; /* code */
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S385 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* arguments */
	T0* a4; /* project */
	T0* a5; /* parent */
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S386 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a5; /* resource_name */
	T0* a6; /* true_value */
	T0* a7; /* false_value */
	T0* a8; /* variable_name */
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S387 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* variable */
	T0* a5; /* message */
	T0* a6; /* default_value */
	T0* a7; /* validargs */
	T0* a8; /* validregexp */
	T1 a9; /* answer_required */
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S388 {
	int id;
	T6 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* file */
	T0* a8; /* to_file */
	T0* a10; /* fileset */
	T0* a11; /* match */
	T0* a12; /* token */
	T0* a13; /* variable_pattern */
	T0* a14; /* to_directory */
	T0* a15; /* replace */
	T0* a16; /* flags */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S389 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S390 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S391 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S392 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING] */
struct S393 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_RENAME] */
struct S394 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING] */
struct S395 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_REDEFINE] */
struct S396 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING] */
struct S397 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_SELECT] */
struct S398 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DP_SHELL_COMMAND */
struct S402 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a4; /* command */
	T6 a5; /* return_code */
	T1 a7; /* is_system_code */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S403 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a8; /* xml_element */
};

/* Struct for type GEANT_MAP */
struct S404 {
	int id;
	T0* a3; /* type */
	T0* a10; /* project */
	T0* a11; /* source_pattern */
	T0* a12; /* target_pattern */
	T0* a13; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S407 {
	int id;
	T0* a4; /* internal_cursor */
	T0* a10; /* item_storage */
	T0* a11; /* equality_tester */
	T6 a12; /* position */
	T6 a14; /* last_position */
	T6 a15; /* capacity */
	T6 a18; /* slots_position */
	T6 a20; /* count */
	T6 a21; /* modulus */
	T6 a23; /* free_slot */
	T6 a29; /* found_position */
	T6 a30; /* clashes_previous_position */
	T0* a33; /* clashes */
	T0* a34; /* slots */
	T0* a36; /* special_item_routines */
};

/* Struct for type DS_HASH_SET [STRING] */
struct S409 {
	int id;
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a5; /* last_position */
	T6 a6; /* free_slot */
	T6 a8; /* position */
	T0* a9; /* internal_cursor */
	T0* a10; /* equality_tester */
	T6 a13; /* slots_position */
	T6 a15; /* count */
	T0* a16; /* special_item_routines */
	T0* a17; /* item_storage */
	T0* a18; /* clashes */
	T0* a20; /* slots */
	T6 a21; /* found_position */
	T6 a22; /* clashes_previous_position */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING] */
struct S411 {
	int id;
	T0* a3; /* container */
	T6 a4; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type LX_DFA_WILDCARD */
struct S412 {
	int id;
	T0* a3; /* yy_nxt */
	T0* a4; /* subject */
	T6 a5; /* subject_start */
	T6 a6; /* subject_end */
	T6 a8; /* match_count */
	T6 a9; /* matched_start */
	T6 a10; /* matched_end */
	T0* a11; /* yy_accept */
	T6 a12; /* yyNb_rows */
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S413 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S414 {
	int id;
};

/* Struct for type ARRAY [BOOLEAN] */
struct S415 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET [INTEGER] */
struct S417 {
	int id;
	T6 a2; /* position */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a7; /* last_position */
	T6 a8; /* free_slot */
	T0* a9; /* internal_cursor */
	T6 a13; /* slots_position */
	T6 a15; /* count */
	T6 a16; /* clashes_previous_position */
	T0* a20; /* special_item_routines */
	T0* a21; /* item_storage */
	T0* a22; /* clashes */
	T0* a24; /* slots */
	T6 a25; /* found_position */
	T0* a26; /* equality_tester */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S418 {
	int id;
	T0* a2; /* name */
	T6 a4; /* mode */
	T0* a11; /* string_name */
	T14 a14; /* file_pointer */
	T1 a16; /* descriptor_available */
};

/* Struct for type SPECIAL [DS_PAIR [STRING, STRING]] */
struct S419 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]] */
struct S420 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]] */
struct S421 {
	int id;
	T0* a1; /* container */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S422 {
	int id;
	T6 a4; /* match_count */
	T0* a8; /* error_message */
	T0* a10; /* subject */
	T6 a11; /* subject_end */
	T6 a12; /* subject_start */
	T0* a13; /* offset_vector */
	T6 a15; /* offset_vector_count */
	T6 a16; /* brastart_capacity */
	T0* a17; /* brastart_vector */
	T6 a18; /* brastart_lower */
	T6 a19; /* brastart_count */
	T6 a20; /* eptr_capacity */
	T0* a21; /* eptr_vector */
	T6 a22; /* eptr_lower */
	T6 a23; /* eptr_upper */
	T0* a24; /* byte_code */
	T0* a25; /* pattern */
	T6 a29; /* subexpression_count */
	T6 a30; /* pattern_count */
	T6 a31; /* pattern_position */
	T6 a32; /* code_index */
	T6 a33; /* maxbackrefs */
	T6 a34; /* optchanged */
	T6 a36; /* first_character */
	T6 a37; /* required_character */
	T6 a38; /* regexp_countlits */
	T0* a39; /* start_bits */
	T1 a46; /* is_anchored */
	T1 a50; /* is_caseless */
	T1 a51; /* is_multiline */
	T0* a54; /* character_case_mapping */
	T0* a55; /* word_set */
	T6 a56; /* subject_next_start */
	T6 a58; /* error_code */
	T6 a59; /* error_position */
	T1 a70; /* is_startline */
	T1 a73; /* is_dotall */
	T1 a74; /* is_extended */
	T1 a75; /* is_empty_allowed */
	T1 a76; /* is_dollar_endonly */
	T1 a77; /* is_bol */
	T1 a78; /* is_eol */
	T1 a79; /* is_greedy */
	T1 a80; /* is_strict */
	T1 a81; /* is_ichanged */
	T6 a147; /* first_matched_index */
	T6 a226; /* eptr */
	T6 a227; /* offset_top */
	T1 a228; /* is_matching_caseless */
	T1 a229; /* is_matching_multiline */
	T1 a230; /* is_matching_dotall */
};

/* Struct for type KL_STRING_EQUALITY_TESTER */
struct S423 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S424 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T14 a4; /* file_pointer */
	T0* a6; /* character_buffer */
	T0* a8; /* name */
	T6 a9; /* mode */
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S425 {
	int id;
	T0* a1; /* area */
};

/* Struct for type PLATFORM */
struct S429 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S431 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S432 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S433 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S434 {
	int id;
};

/* Struct for type LX_WILDCARD_PARSER */
struct S435 {
	int id;
	T1 a1; /* successful */
	T0* a2; /* pending_rules */
	T0* a4; /* start_condition_stack */
	T0* a6; /* action_factory */
	T0* a7; /* old_singleton_lines */
	T0* a9; /* old_singleton_columns */
	T0* a10; /* old_singleton_counts */
	T0* a11; /* old_regexp_lines */
	T0* a12; /* old_regexp_columns */
	T0* a13; /* old_regexp_counts */
	T0* a15; /* description */
	T0* a17; /* error_handler */
	T0* a18; /* name_definitions */
	T0* a21; /* character_classes */
	T6 a23; /* line_nb */
	T0* a24; /* yyss */
	T0* a27; /* input_buffer */
	T6 a28; /* yy_end */
	T6 a29; /* yy_position */
	T6 a30; /* yy_line */
	T6 a31; /* yy_column */
	T6 a32; /* yy_parsing_status */
	T6 a34; /* yy_suspended_yystacksize */
	T6 a35; /* yy_suspended_yystate */
	T6 a36; /* yy_suspended_yyn */
	T6 a37; /* yy_suspended_yychar1 */
	T6 a38; /* yy_suspended_index */
	T6 a39; /* yy_suspended_yyss_top */
	T6 a40; /* yy_suspended_yy_goto */
	T6 a42; /* error_count */
	T1 a43; /* yy_lookahead_needed */
	T6 a44; /* yyerrstatus */
	T6 a45; /* yyssp */
	T0* a52; /* yypact */
	T6 a54; /* last_token */
	T0* a57; /* yytranslate */
	T0* a60; /* yycheck */
	T0* a61; /* yytable */
	T0* a63; /* yydefact */
	T0* a65; /* yyr1 */
	T0* a67; /* yypgoto */
	T0* a68; /* yydefgoto */
	T0* a72; /* yytypes1 */
	T0* a74; /* yytypes2 */
	T6 a82; /* yy_start */
	T6 a83; /* yyvsp1 */
	T6 a84; /* yyvsp2 */
	T6 a85; /* yyvsp3 */
	T6 a86; /* yyvsp4 */
	T6 a87; /* yyvsp5 */
	T1 a94; /* yy_more_flag */
	T6 a95; /* yy_more_len */
	T6 a96; /* line */
	T6 a97; /* column */
	T6 a98; /* position */
	T6 a99; /* yy_start_state */
	T0* a101; /* yy_state_stack */
	T6 a102; /* yy_state_count */
	T0* a103; /* yy_ec */
	T0* a104; /* yy_content_area */
	T0* a105; /* yy_content */
	T0* a106; /* yy_accept */
	T6 a107; /* yy_last_accepting_state */
	T6 a108; /* yy_last_accepting_cpos */
	T0* a109; /* yy_chk */
	T0* a110; /* yy_base */
	T0* a111; /* yy_def */
	T0* a112; /* yy_meta */
	T0* a114; /* yy_nxt */
	T6 a116; /* yy_lp */
	T0* a117; /* yy_acclist */
	T6 a120; /* yy_looking_for_trail_begin */
	T6 a122; /* yy_full_match */
	T6 a123; /* yy_full_state */
	T6 a124; /* yy_full_lp */
	T1 a130; /* yy_rejected */
	T6 a133; /* yyvsc1 */
	T0* a134; /* yyvs1 */
	T0* a135; /* yyspecial_routines1 */
	T0* a137; /* last_any_value */
	T6 a138; /* yyvsc2 */
	T0* a139; /* yyvs2 */
	T0* a140; /* yyspecial_routines2 */
	T6 a141; /* last_integer_value */
	T6 a142; /* yyvsc3 */
	T0* a143; /* yyvs3 */
	T0* a144; /* yyspecial_routines3 */
	T0* a145; /* last_lx_symbol_class_value */
	T6 a146; /* yyvsc4 */
	T0* a147; /* yyvs4 */
	T0* a148; /* yyspecial_routines4 */
	T0* a149; /* last_string_value */
	T1 a150; /* in_trail_context */
	T0* a151; /* rule */
	T0* a152; /* yyvs5 */
	T1 a153; /* has_trail_context */
	T6 a154; /* head_count */
	T6 a156; /* head_line */
	T6 a157; /* head_column */
	T6 a158; /* trail_count */
	T6 a160; /* yyvsc5 */
	T0* a161; /* yyspecial_routines5 */
	T0* a174; /* last_string */
	T6 a190; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S436 {
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
	T0* a13; /* eof_rules */
	T0* a15; /* eiffel_header */
	T1 a16; /* case_insensitive */
	T0* a17; /* input_filename */
	T1 a18; /* inspect_used */
	T1 a19; /* actions_separated */
	T0* a20; /* eiffel_code */
	T1 a21; /* bol_needed */
	T1 a22; /* pre_action_used */
	T1 a23; /* post_action_used */
	T1 a24; /* pre_eof_action_used */
	T1 a25; /* post_eof_action_used */
	T1 a26; /* line_used */
	T1 a27; /* position_used */
};

/* Struct for type LX_FULL_DFA */
struct S437 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T6 a3; /* yyNb_rows */
	T0* a4; /* input_filename */
	T6 a6; /* characters_count */
	T6 a7; /* array_size */
	T1 a8; /* inspect_used */
	T1 a9; /* actions_separated */
	T0* a10; /* eiffel_code */
	T0* a11; /* eiffel_header */
	T1 a12; /* bol_needed */
	T1 a13; /* pre_action_used */
	T1 a14; /* post_action_used */
	T1 a15; /* pre_eof_action_used */
	T1 a16; /* post_eof_action_used */
	T1 a17; /* line_pragma */
	T0* a18; /* yy_start_conditions */
	T0* a19; /* yy_ec */
	T6 a20; /* yyNull_equiv_class */
	T6 a21; /* yyNb_rules */
	T0* a22; /* yy_rules */
	T6 a23; /* yyEnd_of_buffer */
	T1 a24; /* yyLine_used */
	T1 a25; /* yyPosition_used */
	T6 a26; /* minimum_symbol */
	T6 a27; /* maximum_symbol */
	T0* a28; /* states */
	T6 a29; /* backing_up_count */
	T0* a30; /* partitions */
	T6 a31; /* start_states_count */
	T1 a32; /* yyBacking_up */
	T0* a33; /* yy_eof_rules */
};

/* Struct for type DS_HASH_SET_CURSOR [INTEGER] */
struct S439 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER] */
struct S440 {
	int id;
};

/* Struct for type TO_SPECIAL [DS_PAIR [STRING, STRING]] */
struct S441 {
	int id;
	T0* a1; /* area */
};

/* Struct for type RX_BYTE_CODE */
struct S443 {
	int id;
	T6 a1; /* count */
	T0* a6; /* byte_code */
	T0* a7; /* character_sets */
	T6 a8; /* capacity */
	T6 a10; /* character_sets_count */
	T6 a11; /* character_sets_capacity */
};

/* Struct for type RX_CASE_MAPPING */
struct S444 {
	int id;
	T0* a3; /* lower_table */
	T0* a4; /* flip_table */
};

/* Struct for type RX_CHARACTER_SET */
struct S445 {
	int id;
	T0* a2; /* set */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S447 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S448 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S449 {
	int id;
	T0* a1; /* name */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S450 {
	int id;
	T1 a2; /* end_of_file */
	T0* a3; /* last_string */
	T6 a5; /* mode */
	T0* a9; /* name */
	T0* a12; /* string_name */
	T0* a13; /* character_buffer */
	T14 a21; /* file_pointer */
	T1 a23; /* descriptor_available */
};

/* Struct for type KL_BINARY_OUTPUT_FILE */
struct S451 {
	int id;
	T6 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a14; /* file_pointer */
	T1 a16; /* descriptor_available */
};

/* Struct for type GE_HASH_TABLE [C_STRING, STRING] */
struct S452 {
	int id;
	T6 a2; /* capacity */
	T0* a3; /* content */
	T0* a4; /* keys */
	T0* a5; /* deleted_marks */
	T6 a6; /* iteration_position */
	T6 a7; /* count */
	T6 a8; /* deleted_position */
	T6 a9; /* control */
	T0* a10; /* found_item */
	T1 a11; /* has_default */
	T6 a12; /* position */
	T6 a13; /* used_slot_count */
	T0* a17; /* key_equality_tester */
};

/* Struct for type FILE_NAME */
struct S454 {
	int id;
	T6 a1; /* count */
	T6 a5; /* internal_hash_code */
	T0* a7; /* area */
};

/* Struct for type RAW_FILE */
struct S455 {
	int id;
	T0* a5; /* name */
	T6 a8; /* mode */
};

/* Struct for type DIRECTORY */
struct S456 {
	int id;
	T0* a1; /* lastentry */
	T0* a2; /* name */
	T6 a3; /* mode */
	T14 a6; /* directory_pointer */
};

/* Struct for type ARRAYED_LIST [STRING] */
struct S457 {
	int id;
	T6 a3; /* index */
	T6 a4; /* count */
	T0* a5; /* area */
	T6 a6; /* lower */
	T6 a7; /* upper */
};

/* Struct for type TO_SPECIAL [GEANT_FILESET_ENTRY] */
struct S458 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S459 {
	int id;
	T6 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S460 {
	int id;
	T6 a3; /* count */
	T0* a5; /* storage */
	T0* a6; /* special_routines */
	T6 a7; /* capacity */
	T0* a8; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S461 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER] */
struct S462 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING] */
struct S463 {
	int id;
	T6 a4; /* position */
	T0* a7; /* item_storage */
	T0* a8; /* key_equality_tester */
	T0* a9; /* internal_keys */
	T6 a10; /* count */
	T6 a11; /* capacity */
	T6 a14; /* slots_position */
	T6 a15; /* free_slot */
	T6 a16; /* last_position */
	T6 a20; /* modulus */
	T6 a21; /* clashes_previous_position */
	T0* a23; /* equality_tester */
	T6 a24; /* found_position */
	T0* a27; /* clashes */
	T0* a28; /* slots */
	T0* a29; /* key_storage */
	T0* a30; /* internal_cursor */
	T0* a32; /* special_item_routines */
	T0* a33; /* special_key_routines */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S464 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T1 a9; /* sort_needed */
	T1 a10; /* negated */
	T6 a12; /* count */
	T0* a16; /* equality_tester */
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S465 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S466 {
	int id;
};

/* Struct for type LX_NFA */
struct S467 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S468 {
	int id;
	T6 a3; /* count */
	T0* a6; /* storage */
};

/* Struct for type LX_RULE */
struct S469 {
	int id;
	T6 a1; /* id */
	T0* a2; /* pattern */
	T0* a4; /* action */
	T6 a6; /* head_count */
	T6 a7; /* trail_count */
	T6 a8; /* line_count */
	T6 a9; /* column_count */
	T6 a10; /* line_nb */
	T1 a11; /* has_trail_context */
	T1 a13; /* is_useful */
};

/* Struct for type SPECIAL [LX_NFA] */
struct S470 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S471 {
	int id;
};

/* Struct for type UT_SYNTAX_ERROR */
struct S472 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING] */
struct S473 {
	int id;
	T0* a3; /* container */
	T6 a4; /* position */
	T0* a5; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S474 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S475 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S476 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S477 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S478 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S479 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S480 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S481 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S482 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S483 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S484 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a8; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S485 {
	int id;
	T6 a1; /* count */
	T0* a6; /* storage */
	T0* a7; /* equality_tester */
	T0* a8; /* special_routines */
	T6 a9; /* capacity */
	T0* a10; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S486 {
	int id;
	T6 a1; /* count */
	T6 a3; /* capacity */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T0* a6; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S487 {
	int id;
	T0* a2; /* symbols */
	T0* a5; /* storage */
	T6 a8; /* count */
};

/* Struct for type LX_START_CONDITION */
struct S488 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S489 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a6; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S490 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a6; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER] */
struct S491 {
	int id;
	T6 a3; /* position */
	T0* a6; /* item_storage */
	T0* a7; /* key_equality_tester */
	T6 a8; /* count */
	T6 a9; /* capacity */
	T6 a12; /* slots_position */
	T6 a13; /* free_slot */
	T6 a14; /* last_position */
	T6 a18; /* modulus */
	T6 a19; /* clashes_previous_position */
	T0* a21; /* equality_tester */
	T0* a22; /* internal_keys */
	T6 a23; /* found_position */
	T0* a26; /* clashes */
	T0* a27; /* slots */
	T0* a28; /* key_storage */
	T0* a29; /* internal_cursor */
	T0* a32; /* special_item_routines */
	T0* a33; /* special_key_routines */
};

/* Struct for type LX_NFA_STATE */
struct S492 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a7; /* accepted_rule */
};

/* Struct for type STRING_SEARCHER */
struct S493 {
	int id;
	T0* a2; /* deltas */
};

/* Struct for type GE_STRING_EQUALITY_TESTER */
struct S494 {
	int id;
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S496 {
	int id;
	T0* a5; /* parameters */
};

/* Struct for type PRIMES */
struct S498 {
	int id;
};

/* Struct for type SPECIAL [C_STRING] */
struct S499 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S501 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S502 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S503 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S504 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S505 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING] */
struct S507 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER] */
struct S509 {
	int id;
	T0* a1; /* container */
};

/* Struct for type TO_SPECIAL [LX_SYMBOL_CLASS] */
struct S510 {
	int id;
	T0* a1; /* area */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S511 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S513 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S515 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER] */
struct S516 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER]] */
struct S517 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER]] */
struct S518 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S520 {
	int id;
	T0* a1; /* text */
};

/* Struct for type TO_SPECIAL [LX_NFA] */
struct S521 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S522 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S524 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S526 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S528 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S529 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a5; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S531 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S532 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S533 {
	int id;
	T0* a1; /* container */
};

/* Struct for type ARRAY [LX_DFA_STATE] */
struct S534 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
struct S535 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S536 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER] */
struct S538 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER] */
struct S540 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S543 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S546 {
	int id;
};

/* Struct for type TO_SPECIAL [LX_RULE] */
struct S549 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_START_CONDITION] */
struct S550 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING] */
struct S551 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [LX_NFA_STATE] */
struct S552 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_DFA_STATE] */
struct S553 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER] */
struct S554 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SHELL_SORTER [INTEGER] */
struct S555 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER] */
struct S559 {
	int id;
};

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern T1 gedefault1;
extern T2 gedefault2;
extern T3 gedefault3;
extern T4 gedefault4;
extern T5 gedefault5;
extern T6 gedefault6;
extern T7 gedefault7;
extern T8 gedefault8;
extern T9 gedefault9;
extern T10 gedefault10;
extern T11 gedefault11;
extern T12 gedefault12;
extern T13 gedefault13;
extern T14 gedefault14;
extern T15 gedefault15;
extern T17 gedefault17;
extern T21 gedefault21;
extern T22 gedefault22;
extern T23 gedefault23;
extern T24 gedefault24;
extern T25 gedefault25;
extern T26 gedefault26;
extern T27 gedefault27;
extern T28 gedefault28;
extern T29 gedefault29;
extern T30 gedefault30;
extern T31 gedefault31;
extern T32 gedefault32;
extern T33 gedefault33;
extern T34 gedefault34;
extern T35 gedefault35;
extern T36 gedefault36;
extern T37 gedefault37;
extern T38 gedefault38;
extern T40 gedefault40;
extern T45 gedefault45;
extern T46 gedefault46;
extern T47 gedefault47;
extern T48 gedefault48;
extern T49 gedefault49;
extern T51 gedefault51;
extern T53 gedefault53;
extern T54 gedefault54;
extern T55 gedefault55;
extern T56 gedefault56;
extern T58 gedefault58;
extern T59 gedefault59;
extern T61 gedefault61;
extern T63 gedefault63;
extern T64 gedefault64;
extern T65 gedefault65;
extern T66 gedefault66;
extern T68 gedefault68;
extern T69 gedefault69;
extern T70 gedefault70;
extern T71 gedefault71;
extern T72 gedefault72;
extern T73 gedefault73;
extern T74 gedefault74;
extern T75 gedefault75;
extern T76 gedefault76;
extern T78 gedefault78;
extern T80 gedefault80;
extern T81 gedefault81;
extern T83 gedefault83;
extern T84 gedefault84;
extern T85 gedefault85;
extern T87 gedefault87;
extern T89 gedefault89;
extern T90 gedefault90;
extern T93 gedefault93;
extern T94 gedefault94;
extern T95 gedefault95;
extern T96 gedefault96;
extern T98 gedefault98;
extern T99 gedefault99;
extern T100 gedefault100;
extern T101 gedefault101;
extern T102 gedefault102;
extern T103 gedefault103;
extern T105 gedefault105;
extern T106 gedefault106;
extern T107 gedefault107;
extern T108 gedefault108;
extern T109 gedefault109;
extern T110 gedefault110;
extern T112 gedefault112;
extern T114 gedefault114;
extern T115 gedefault115;
extern T116 gedefault116;
extern T117 gedefault117;
extern T118 gedefault118;
extern T120 gedefault120;
extern T122 gedefault122;
extern T123 gedefault123;
extern T124 gedefault124;
extern T126 gedefault126;
extern T127 gedefault127;
extern T129 gedefault129;
extern T130 gedefault130;
extern T131 gedefault131;
extern T132 gedefault132;
extern T134 gedefault134;
extern T135 gedefault135;
extern T136 gedefault136;
extern T137 gedefault137;
extern T138 gedefault138;
extern T139 gedefault139;
extern T140 gedefault140;
extern T141 gedefault141;
extern T142 gedefault142;
extern T143 gedefault143;
extern T144 gedefault144;
extern T145 gedefault145;
extern T146 gedefault146;
extern T147 gedefault147;
extern T148 gedefault148;
extern T149 gedefault149;
extern T150 gedefault150;
extern T151 gedefault151;
extern T152 gedefault152;
extern T153 gedefault153;
extern T154 gedefault154;
extern T155 gedefault155;
extern T157 gedefault157;
extern T159 gedefault159;
extern T160 gedefault160;
extern T161 gedefault161;
extern T162 gedefault162;
extern T163 gedefault163;
extern T164 gedefault164;
extern T165 gedefault165;
extern T167 gedefault167;
extern T168 gedefault168;
extern T170 gedefault170;
extern T171 gedefault171;
extern T172 gedefault172;
extern T173 gedefault173;
extern T174 gedefault174;
extern T175 gedefault175;
extern T176 gedefault176;
extern T178 gedefault178;
extern T179 gedefault179;
extern T180 gedefault180;
extern T181 gedefault181;
extern T183 gedefault183;
extern T184 gedefault184;
extern T185 gedefault185;
extern T186 gedefault186;
extern T188 gedefault188;
extern T189 gedefault189;
extern T191 gedefault191;
extern T192 gedefault192;
extern T193 gedefault193;
extern T194 gedefault194;
extern T195 gedefault195;
extern T196 gedefault196;
extern T197 gedefault197;
extern T198 gedefault198;
extern T199 gedefault199;
extern T201 gedefault201;
extern T202 gedefault202;
extern T203 gedefault203;
extern T204 gedefault204;
extern T205 gedefault205;
extern T208 gedefault208;
extern T209 gedefault209;
extern T210 gedefault210;
extern T211 gedefault211;
extern T212 gedefault212;
extern T213 gedefault213;
extern T215 gedefault215;
extern T217 gedefault217;
extern T218 gedefault218;
extern T219 gedefault219;
extern T220 gedefault220;
extern T221 gedefault221;
extern T222 gedefault222;
extern T223 gedefault223;
extern T224 gedefault224;
extern T225 gedefault225;
extern T226 gedefault226;
extern T227 gedefault227;
extern T228 gedefault228;
extern T229 gedefault229;
extern T230 gedefault230;
extern T231 gedefault231;
extern T232 gedefault232;
extern T233 gedefault233;
extern T234 gedefault234;
extern T235 gedefault235;
extern T236 gedefault236;
extern T238 gedefault238;
extern T239 gedefault239;
extern T240 gedefault240;
extern T241 gedefault241;
extern T242 gedefault242;
extern T243 gedefault243;
extern T246 gedefault246;
extern T247 gedefault247;
extern T248 gedefault248;
extern T249 gedefault249;
extern T250 gedefault250;
extern T252 gedefault252;
extern T253 gedefault253;
extern T254 gedefault254;
extern T255 gedefault255;
extern T256 gedefault256;
extern T257 gedefault257;
extern T258 gedefault258;
extern T259 gedefault259;
extern T260 gedefault260;
extern T261 gedefault261;
extern T262 gedefault262;
extern T263 gedefault263;
extern T264 gedefault264;
extern T266 gedefault266;
extern T267 gedefault267;
extern T268 gedefault268;
extern T269 gedefault269;
extern T270 gedefault270;
extern T271 gedefault271;
extern T273 gedefault273;
extern T274 gedefault274;
extern T275 gedefault275;
extern T276 gedefault276;
extern T278 gedefault278;
extern T279 gedefault279;
extern T280 gedefault280;
extern T281 gedefault281;
extern T282 gedefault282;
extern T283 gedefault283;
extern T284 gedefault284;
extern T285 gedefault285;
extern T286 gedefault286;
extern T287 gedefault287;
extern T288 gedefault288;
extern T289 gedefault289;
extern T290 gedefault290;
extern T291 gedefault291;
extern T292 gedefault292;
extern T293 gedefault293;
extern T294 gedefault294;
extern T295 gedefault295;
extern T296 gedefault296;
extern T297 gedefault297;
extern T298 gedefault298;
extern T299 gedefault299;
extern T300 gedefault300;
extern T301 gedefault301;
extern T302 gedefault302;
extern T303 gedefault303;
extern T304 gedefault304;
extern T305 gedefault305;
extern T306 gedefault306;
extern T308 gedefault308;
extern T310 gedefault310;
extern T311 gedefault311;
extern T312 gedefault312;
extern T313 gedefault313;
extern T314 gedefault314;
extern T317 gedefault317;
extern T318 gedefault318;
extern T323 gedefault323;
extern T324 gedefault324;
extern T325 gedefault325;
extern T326 gedefault326;
extern T327 gedefault327;
extern T328 gedefault328;
extern T329 gedefault329;
extern T330 gedefault330;
extern T331 gedefault331;
extern T332 gedefault332;
extern T333 gedefault333;
extern T335 gedefault335;
extern T336 gedefault336;
extern T337 gedefault337;
extern T338 gedefault338;
extern T339 gedefault339;
extern T341 gedefault341;
extern T342 gedefault342;
extern T343 gedefault343;
extern T344 gedefault344;
extern T345 gedefault345;
extern T347 gedefault347;
extern T348 gedefault348;
extern T349 gedefault349;
extern T351 gedefault351;
extern T352 gedefault352;
extern T353 gedefault353;
extern T354 gedefault354;
extern T355 gedefault355;
extern T356 gedefault356;
extern T357 gedefault357;
extern T358 gedefault358;
extern T359 gedefault359;
extern T360 gedefault360;
extern T361 gedefault361;
extern T362 gedefault362;
extern T363 gedefault363;
extern T364 gedefault364;
extern T365 gedefault365;
extern T366 gedefault366;
extern T367 gedefault367;
extern T368 gedefault368;
extern T369 gedefault369;
extern T370 gedefault370;
extern T371 gedefault371;
extern T372 gedefault372;
extern T373 gedefault373;
extern T374 gedefault374;
extern T375 gedefault375;
extern T376 gedefault376;
extern T377 gedefault377;
extern T378 gedefault378;
extern T379 gedefault379;
extern T380 gedefault380;
extern T381 gedefault381;
extern T382 gedefault382;
extern T383 gedefault383;
extern T384 gedefault384;
extern T385 gedefault385;
extern T386 gedefault386;
extern T387 gedefault387;
extern T388 gedefault388;
extern T389 gedefault389;
extern T390 gedefault390;
extern T391 gedefault391;
extern T392 gedefault392;
extern T393 gedefault393;
extern T394 gedefault394;
extern T395 gedefault395;
extern T396 gedefault396;
extern T397 gedefault397;
extern T398 gedefault398;
extern T402 gedefault402;
extern T403 gedefault403;
extern T404 gedefault404;
extern T407 gedefault407;
extern T409 gedefault409;
extern T411 gedefault411;
extern T412 gedefault412;
extern T413 gedefault413;
extern T414 gedefault414;
extern T415 gedefault415;
extern T417 gedefault417;
extern T418 gedefault418;
extern T419 gedefault419;
extern T420 gedefault420;
extern T421 gedefault421;
extern T422 gedefault422;
extern T423 gedefault423;
extern T424 gedefault424;
extern T425 gedefault425;
extern T429 gedefault429;
extern T431 gedefault431;
extern T432 gedefault432;
extern T433 gedefault433;
extern T434 gedefault434;
extern T435 gedefault435;
extern T436 gedefault436;
extern T437 gedefault437;
extern T439 gedefault439;
extern T440 gedefault440;
extern T441 gedefault441;
extern T443 gedefault443;
extern T444 gedefault444;
extern T445 gedefault445;
extern T447 gedefault447;
extern T448 gedefault448;
extern T449 gedefault449;
extern T450 gedefault450;
extern T451 gedefault451;
extern T452 gedefault452;
extern T454 gedefault454;
extern T455 gedefault455;
extern T456 gedefault456;
extern T457 gedefault457;
extern T458 gedefault458;
extern T459 gedefault459;
extern T460 gedefault460;
extern T461 gedefault461;
extern T462 gedefault462;
extern T463 gedefault463;
extern T464 gedefault464;
extern T465 gedefault465;
extern T466 gedefault466;
extern T467 gedefault467;
extern T468 gedefault468;
extern T469 gedefault469;
extern T470 gedefault470;
extern T471 gedefault471;
extern T472 gedefault472;
extern T473 gedefault473;
extern T474 gedefault474;
extern T475 gedefault475;
extern T476 gedefault476;
extern T477 gedefault477;
extern T478 gedefault478;
extern T479 gedefault479;
extern T480 gedefault480;
extern T481 gedefault481;
extern T482 gedefault482;
extern T483 gedefault483;
extern T484 gedefault484;
extern T485 gedefault485;
extern T486 gedefault486;
extern T487 gedefault487;
extern T488 gedefault488;
extern T489 gedefault489;
extern T490 gedefault490;
extern T491 gedefault491;
extern T492 gedefault492;
extern T493 gedefault493;
extern T494 gedefault494;
extern T496 gedefault496;
extern T498 gedefault498;
extern T499 gedefault499;
extern T500 gedefault500;
extern T501 gedefault501;
extern T502 gedefault502;
extern T503 gedefault503;
extern T504 gedefault504;
extern T505 gedefault505;
extern T507 gedefault507;
extern T509 gedefault509;
extern T510 gedefault510;
extern T511 gedefault511;
extern T513 gedefault513;
extern T515 gedefault515;
extern T516 gedefault516;
extern T517 gedefault517;
extern T518 gedefault518;
extern T520 gedefault520;
extern T521 gedefault521;
extern T522 gedefault522;
extern T524 gedefault524;
extern T526 gedefault526;
extern T528 gedefault528;
extern T529 gedefault529;
extern T531 gedefault531;
extern T532 gedefault532;
extern T533 gedefault533;
extern T534 gedefault534;
extern T535 gedefault535;
extern T536 gedefault536;
extern T538 gedefault538;
extern T540 gedefault540;
extern T543 gedefault543;
extern T546 gedefault546;
extern T549 gedefault549;
extern T550 gedefault550;
extern T551 gedefault551;
extern T552 gedefault552;
extern T553 gedefault553;
extern T554 gedefault554;
extern T555 gedefault555;
extern T559 gedefault559;

extern T0* gems(char* s, T6 c);
/* Call to STRING_8.to_c */
extern T0* T17x1214(T0* C);
/* Call to STRING_8.area */
extern T0* T17x1298(T0* C);
/* Call to STRING_8.count */
extern T6 T17x1233(T0* C);
/* Call to ANY.same_type */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to AP_OPTION.short_form */
extern T2 T42x2420(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T42x2416(T0* C);
/* Call to AP_OPTION.has_long_form */
extern T1 T42x2421(T0* C);
/* Call to AP_OPTION.example */
extern T0* T42x2415(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T42x2423(T0* C);
/* Call to AP_OPTION.description */
extern T0* T42x2414(T0* C);
/* Call to AP_OPTION.names */
extern T0* T42x2418(T0* C);
/* Call to AP_OPTION.name */
extern T0* T42x2417(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T42x2425(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T42x2422(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T42x2426(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T42x2424(T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T50x2960(T0* C);
/* Call to DS_SPARSE_TABLE [STRING, STRING].new_cursor */
extern T0* T62x1915(T0* C);
/* Call to DS_SPARSE_TABLE [STRING, STRING].key_equality_tester */
extern T0* T62x1818(T0* C);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T78x1925T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T78x1768T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T1 T78x1909T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].before_position */
extern T6 T78x1873(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T126x6727(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T126x6602T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T126x6732(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T126x6613(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T126x6723(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T126x6611(T0* C);
/* Call to XM_NODE.parent */
extern T0* T190x5701(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T277x8366(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T277x2235(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T277x8365(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T512x13135(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T512x13138T6(T0* C, T6 a1);
/* Call to AP_OPTION.record_occurrence */
extern void T42x2436T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T42x2437(T0* C);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T78x1911T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T78x1910T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T91x5105T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T92x5122T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T92x5127T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T92x5123T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T92x5129T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T92x5128(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T92x5126T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T92x5130T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T92x5124T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T92x5125T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T92x5121(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T92x5120(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T126x6598(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T126x6597T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T126x6603T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T126x6594(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T126x6738(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T126x6596T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T190x5711T0(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T190x5709T0(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T277x8368(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T512x13139T0(T0* C, T0* a1);
/* GEANT.make */
extern T0* T21c20(void);
/* GEANT_PROJECT.build */
extern void T22f28(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T22f38(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T99f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T185f10(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T22f40(T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* GEANT_TARGET.execute */
extern void T26f90(T0* C);
/* GEANT_TARGET.set_executed */
extern void T26f95(T0* C, T1 a1);
/* GEANT_TARGET.has_attribute */
extern T1 T26f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T189f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T94f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T94f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T189f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T94f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T189f14(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T95f38(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T95f41(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T95f42(T0* C, T0* a1);
/* GEANT_TARGET.execute_task */
extern void T26f94(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T304c29(T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T388f36(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T359c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T360f50(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T403c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T404f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge137os9518;
extern T0* ge137ov9518;
extern T0* T403f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T404f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge137os9517;
extern T0* ge137ov9517;
extern T0* T403f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T404f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge137os9516;
extern T0* ge137ov9516;
extern T0* T403f6(T0* C);
/* GEANT_MAP.set_type */
extern void T404f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T403f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern unsigned char ge60os1573;
extern T0* ge60ov1573;
extern T0* T403f11(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T58c16(void);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T243f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T243c4(void);
/* GEANT_MAP_ELEMENT.target_arguments_stack */
extern unsigned char ge60os1574;
extern T0* ge60ov1574;
extern T0* T403f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T99c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T176f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES].make_area */
extern T0* T240c2(T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T175c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T176c3(void);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T403f4(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge137os9515;
extern T0* ge137ov9515;
extern T0* T403f3(T0* C);
/* GEANT_MAP.make */
extern T0* T404c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge136os9531;
extern T0* ge136ov9531;
extern T0* T404f5(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T403f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T403f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T403f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T403f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge131os9356;
extern T0* ge131ov9356;
extern T0* T359f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T360f49(T0* C, T0* a1);
/* DS_HASH_SET [STRING].force_last */
extern void T409f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING].slots_put */
extern void T409f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING].clashes_put */
extern void T409f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING].slots_item */
extern T6 T409f14(T0* C, T6 a1);
/* DS_HASH_SET [STRING].hash_position */
extern T6 T409f12(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T193f15(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T193f5(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T195f2(T0* C, T6 a1);
/* INTEGER_32.to_character */
extern T2 T6f22(T6* C);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge170os4786;
extern T0* ge170ov4786;
extern T0* T193f23(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T195c4(void);
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
extern T2 T193f20(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T193f33(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T193f61(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T193f69(T0* C);
/* STRING_8.make */
extern void T17f33(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c33(T6 a1);
/* STRING_8.make_area */
extern void T17f36(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c9(T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T193f24(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T192f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f5(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge234os5401;
extern T0* ge234ov5401;
extern T0* T193f25(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T192c36(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge301os7807;
extern T6 ge301ov7807;
extern T6 T196f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T6 T196f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge224os3918;
extern T0* ge224ov3918;
extern T0* T193f22(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T196c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T193f21(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T192f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T192f4(T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T193f15p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f11(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f7(T0* C);
/* DS_HASH_SET [STRING].resize */
extern void T409f44(T0* C, T6 a1);
/* DS_HASH_SET [STRING].clashes_resize */
extern void T409f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T65f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T63f3(T0* C, T6 a1);
/* SPECIAL [INTEGER].copy_data */
extern void T63f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER].move_data */
extern void T63f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T63f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T63f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER].make */
extern T0* T63c5(T6 a1);
/* DS_HASH_SET [STRING].special_integer_ */
extern unsigned char ge171os1948;
extern T0* ge171ov1948;
extern T0* T409f19(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T65c4(void);
/* DS_HASH_SET [STRING].key_storage_resize */
extern void T409f49(T0* C, T6 a1);
/* DS_HASH_SET [STRING].item_storage_resize */
extern void T409f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T66f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T32f3(T0* C, T6 a1);
/* SPECIAL [STRING].copy_data */
extern void T32f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING].move_data */
extern void T32f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING].overlapping_move */
extern void T32f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING].non_overlapping_move */
extern void T32f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING].make */
extern T0* T32c6(T6 a1);
/* DS_HASH_SET [STRING].key_storage_item */
extern T0* T409f24(T0* C, T6 a1);
/* DS_HASH_SET [STRING].item_storage_item */
extern T0* T409f30(T0* C, T6 a1);
/* DS_HASH_SET [STRING].clashes_item */
extern T6 T409f25(T0* C, T6 a1);
/* DS_HASH_SET [STRING].slots_resize */
extern void T409f47(T0* C, T6 a1);
/* DS_HASH_SET [STRING].new_modulus */
extern T6 T409f4(T0* C, T6 a1);
/* DS_HASH_SET [STRING].new_capacity */
extern T6 T409f11(T0* C, T6 a1);
/* DS_HASH_SET [STRING].item_storage_put */
extern void T409f43(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING].search_position */
extern void T409f42(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T59f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge173os1579;
extern T0* ge173ov1579;
extern T0* T59f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T75c19(void);
/* DS_HASH_SET [STRING].key_equality_tester */
extern T0* T409f23(T0* C);
/* DS_HASH_SET [STRING].unset_found_item */
extern void T409f41(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge131os9355;
extern T0* ge131ov9355;
extern T0* T359f19(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T115f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T114f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T114f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T115f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T114f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T115f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_FILESET.add_single_include */
extern void T360f48(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T365f4(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T365f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T365f6(T0* C);
/* GEANT_DEFINE_ELEMENT.target_arguments_stack */
extern T0* T365f15(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern unsigned char ge138os7615;
extern T0* ge138ov7615;
extern T0* T365f12(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T365f2(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T365f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T365f1(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern unsigned char ge135os2241;
extern T0* ge135ov2241;
extern T0* T365f11(T0* C);
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
extern unsigned char ge221os1581;
extern T0* ge221ov1581;
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
extern T0* T75f2(T0* C, T0* a1);
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
extern T0* T193f4(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T193f18(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T81f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge165os1785;
extern T0* ge165ov1785;
extern T0* T75f8(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T81c2(void);
/* KL_STDERR_FILE.string_ */
extern T0* T47f1(T0* C);
/* ARRAY [STRING].item */
extern T0* T33f4(T0* C, T6 a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge205os2968;
extern T0* ge205ov2968;
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
extern unsigned char ge203os1583;
extern T0* ge203ov1583;
extern T0* T58f14(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T46c3(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T58f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T98f1(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T80f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c43(T14 a1);
/* STRING_8.from_c */
extern void T17f46(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T180f7(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T180f9(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f50(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f7(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T247f2(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T326f2(T326* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T326f3(T326* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T180f6(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T180f8(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T247f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T247c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T180f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2180os1255;
extern T0* ge2180ov1255;
extern T0* T17f26(T0* C);
/* C_STRING.make_empty */
extern void T180f5(T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T180c5(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T247c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T327f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T327f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T327c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T247f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T80f3(T0* C, T14 a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T98f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge280os5949;
extern T0* ge280ov5949;
extern T0* T98f2(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T80c6(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge222os1580;
extern T0* ge222ov1580;
extern T0* T58f6(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T98c7(void);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T25f43(T0* C);
/* GEANT_PROJECT_VARIABLES.search */
extern void T25f79(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T25f64(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T25f21(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T25f16(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T25f27(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T25f22(T0* C, T6 a1);
/* GEANT_VARIABLES.found */
extern T1 T29f35(T0* C);
/* GEANT_VARIABLES.search */
extern void T29f66(T0* C, T0* a1);
/* GEANT_VARIABLES.search_position */
extern void T29f50(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T29f11(T0* C, T6 a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T29f6(T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T29f18(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T29f12(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge60os1566;
extern T0* ge60ov1566;
extern T0* T58f4(T0* C);
/* GEANT_VARIABLES.make */
extern T0* T29c44(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T29f48(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING, STRING].internal_set_equality_tester */
extern void T61f6(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T59c3(void);
/* GEANT_VARIABLES.make_map */
extern void T29f47(T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T29f56(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING, STRING].make */
extern T0* T61c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING, STRING].new_cursor */
extern T0* T61f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING, STRING].make */
extern T0* T100c3(T0* a1);
/* GEANT_VARIABLES.make_sparse_container */
extern void T29f61(T0* C, T6 a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T29f49(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T29f65(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T65f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T101c2(T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T29f26(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T6 T29f20(T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T29f64(T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T29f63(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T66f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T102c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T66c3(void);
/* GEANT_VARIABLES.make_item_storage */
extern void T29f62(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T34f32(T0* C);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T34f67(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T34f50(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T34f11(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T34f6(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T34f18(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T34f12(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern T0* T58f3(T0* C);
/* UC_UTF8_STRING.substring */
extern T0* T193f11(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T193c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T193f68(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.item_code */
extern T6 T193f14(T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f12(T0* C, T6 a1);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T193f73(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T192f24(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T193f26(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T193f67(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T192f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T193f71(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T193f66(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T193f36(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T192f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T193f43(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge246os7712;
extern T0* ge246ov7712;
extern T0* T192f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T110c8(void);
/* UC_STRING.make */
extern void T110f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T110f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T110f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T110f2(T0* C);
/* UC_STRING.capacity */
extern T6 T110f2p1(T0* C);
/* UC_STRING.make */
extern void T110f9p1(T0* C, T6 a1);
/* UC_STRING.make_area */
extern void T110f13(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T110f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T192f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T193f40(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T193f42(T0* C);
/* UC_UTF8_STRING.copy */
extern void T193f77(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T193f77p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* UC_UTF8_STRING.make */
extern void T193f59(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T193c59(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T193f63(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T193f38(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T193f38p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T193f59p1(T0* C, T6 a1);
/* UC_UTF8_STRING.make_area */
extern void T193f70(T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f10(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f41(T0* C, T6 a1);
/* STRING_8.new_string */
extern T0* T17f19(T0* C, T6 a1);
/* UC_UTF8_STRING.item */
extern T2 T193f10(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T193f27(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T70f14(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_tokens */
extern T0* T58f10(T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T70f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T70f28(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T6 T70f19(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T1 T70f18(T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T193f17(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T193f32(T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f24(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T193f74(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f49(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T193f76(T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T193f79(T0* C, T6 a1, T6 a2);
/* STRING_8.keep_tail */
extern void T17f48(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T70c23(T6 a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T70f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T71c7(T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T75f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f16(T0* C);
/* STRING_8.copy */
extern void T17f40(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern unsigned char ge135os2240;
extern T0* ge135ov2240;
extern T0* T365f8(T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T365c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T365f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T365f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T365f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T115f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T115f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T114f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T114f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T114f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T115c7(T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T359f18(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T114f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T198f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T198c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T1 T114f4(T0* C);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T359f26(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T114c8(void);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge131os9354;
extern T0* ge131ov9354;
extern T0* T359f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T360f34(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge131os9352;
extern T0* ge131ov9352;
extern T0* T359f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T360f47(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T360f46(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T360f45(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge131os9350;
extern T0* ge131ov9350;
extern T0* T359f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T360f44(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge131os9349;
extern T0* ge131ov9349;
extern T0* T359f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T360f43(T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T360f42(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T359f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T359f22(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern unsigned char ge128os2254;
extern T0* ge128ov2254;
extern T0* T359f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern unsigned char ge128os2253;
extern T0* ge128ov2253;
extern T0* T359f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge131os9347;
extern T0* ge131ov9347;
extern T0* T359f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T360f41(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T412f1(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T412c14(T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T437c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T437f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T437f46(T0* C);
/* ARRAY [INTEGER].put */
extern void T191f12(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T459f11(T0* C);
/* ARRAY [INTEGER].make */
extern T0* T191c9(T6 a1, T6 a2);
/* ARRAY [INTEGER].make_area */
extern void T191f10(T0* C, T6 a1);
/* LX_FULL_DFA.build_nxt_table */
extern void T437f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T489f3(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T534f4(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T484f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T459f10(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T437f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T489f8(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T534f7(T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T487f4(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].item */
extern T0* T518f4(T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T437f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T484f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T486f9(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T484f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T485f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T485f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T484f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T484f9(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T484c16(T0* a1, T6 a2, T6 a3);
/* LX_RULE.set_useful */
extern void T469f22(T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T459f16(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T524f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T524f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T524f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T459f21(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T546f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T1 T469f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T459f2(T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge318os11326;
extern T0* ge318ov11326;
extern T0* T484f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T524c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T546c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T485f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T522f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T522f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T522f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T485f26(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T543f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T1 T492f8(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge318os11325;
extern T0* ge318ov11325;
extern T0* T484f6(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T522c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T543c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T485f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T485f4(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T459f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T459f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T501f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].resized_area */
extern T0* T482f3(T0* C, T6 a1);
/* SPECIAL [LX_RULE].copy_data */
extern void T482f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_RULE].move_data */
extern void T482f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].overlapping_move */
extern void T482f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].non_overlapping_move */
extern void T482f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].make */
extern T0* T482c4(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T459f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T459f8(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T492f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T492f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T492f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T485f3(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T485f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T485f31(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T528f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].resized_area */
extern T0* T526f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].copy_data */
extern void T526f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA_STATE].move_data */
extern void T526f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].overlapping_move */
extern void T526f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].non_overlapping_move */
extern void T526f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T526c4(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T485f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T485f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T459c12(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T459f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T502c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T501f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T549c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T501c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T489c7(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T535c1(void);
/* ARRAY [LX_DFA_STATE].make */
extern T0* T534c5(T6 a1, T6 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T534f6(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T531c4(T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T484f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T489f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T484f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T489f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T485f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T485f2(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T485c23(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T485f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T529c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T528f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T552c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T528c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T487f3(T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T415f4(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T484f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T487f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T415f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T149f6(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T487f10p1(T0* C);
/* DS_BILINKABLE [INTEGER].put_left */
extern void T516f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_right */
extern void T516f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].put */
extern void T516f5(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T487f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T487f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T437f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T486f10(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T532f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].resized_area */
extern T0* T531f3(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].copy_data */
extern void T531f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_DFA_STATE].move_data */
extern void T531f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].overlapping_move */
extern void T531f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].non_overlapping_move */
extern void T531f8(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T487f1(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER]].count */
extern T6 T518f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T486f2(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T487c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T487f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].put */
extern void T518f7(T0* C, T0* a1, T6 a2);
/* DS_BILINKABLE [INTEGER].make */
extern T0* T516c4(T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].make */
extern T0* T518c6(T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].make_area */
extern void T518f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER]].make */
extern T0* T517c2(T6 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T415c5(T6 a1, T6 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T415f8(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T149c4(T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T437f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T459f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T459f17(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T459f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T502f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T459f19(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T459f18(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T469c14(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge405os12930;
extern T0* ge405ov12930;
extern T0* T469f5(T0* C);
/* LX_ACTION.make */
extern T0* T520c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge405os12929;
extern T0* ge405ov12929;
extern T0* T469f3(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T467c12(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T485f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T485f30(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T485f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T529f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T485f33(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T492f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T513c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T492c10(T1 a1);
/* LX_FULL_DFA.initialize */
extern void T437f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T437f43(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T437f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T467f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T485f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T490f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T460f4(T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T437f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T492f14(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].force */
extern void T491f36(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].key_storage_put */
extern void T491f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_put */
extern void T491f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_put */
extern void T491f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_item */
extern T6 T491f17(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_item */
extern T6 T491f16(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].hash_position */
extern T6 T491f11(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f25(T6* C);
/* INTEGER_32.infix "&" */
extern T6 T6f26(T6* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].resize */
extern void T491f41(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_resize */
extern void T491f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].special_integer_ */
extern T0* T491f31(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].key_storage_resize */
extern void T491f48(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item_storage_resize */
extern void T491f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T471f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].resized_area */
extern T0* T470f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA].copy_data */
extern void T470f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA].move_data */
extern void T470f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].overlapping_move */
extern void T470f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].non_overlapping_move */
extern void T470f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].make */
extern T0* T470c4(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].key_storage_item */
extern T6 T491f20(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_resize */
extern void T491f46(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_modulus */
extern T6 T491f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_capacity */
extern T6 T491f10(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item_storage_put */
extern void T491f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].search_position */
extern void T491f37(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER].test */
extern T1 T440f1(T0* C, T6 a1, T6 a2);
/* INTEGER_32.is_equal */
extern T1 T6f28(T6* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].unset_found_item */
extern void T491f39(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item */
extern T0* T491f2(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item_storage_item */
extern T0* T491f5(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].has */
extern T1 T491f1(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make */
extern T0* T491c35(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_with_equality_testers */
extern void T491f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER].make */
extern T0* T538c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER].new_cursor */
extern T0* T538f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER].make */
extern T0* T554c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_cursor */
extern T0* T491f30(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER].make */
extern T0* T540c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_sparse_container */
extern void T491f45(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_slots */
extern void T491f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_clashes */
extern void T491f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_key_storage */
extern void T491f51(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_item_storage */
extern void T491f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T471f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T521c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T471c3(void);
/* KL_EQUALITY_TESTER [INTEGER].default_create */
extern T0* T440c2(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T486c8(T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T486f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T533c2(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T532f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T553c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T532c3(void);
/* ARRAY [INTEGER].item */
extern T6 T191f4(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T468f2(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T468f5(T0* C);
/* INTEGER_32.min */
extern T6 T6f18(T6* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T468f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T468f1(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T437f42(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T483f5(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make */
extern T0* T483c4(T6 a1, T6 a2);
/* ARRAY [LX_RULE].make_area */
extern void T483f6(T0* C, T6 a1);
/* ARRAY [STRING].count */
extern T6 T33f10(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T437f41(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T460f2(T0* C);
/* ARRAY [STRING].put */
extern void T33f12(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING].make */
extern T0* T33c11(T6 a1, T6 a2);
/* ARRAY [STRING].make_area */
extern void T33f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.parse_string */
extern void T435f220(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T435f224(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T435f237(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T435f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T136f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T135f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T135f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T135f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T135f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T135f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T135c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T136f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T218c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T136c3(void);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T435f235(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T435f170(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T435f216(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T467c13(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T515c4(T6 a1, T0* a2);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T468f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].forget_right */
extern void T516f7(T0* C);
/* DS_BILINKABLE [INTEGER].forget_left */
extern void T516f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T415f6(T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER].put_right */
extern void T516f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_left */
extern void T516f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T464f14(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T464f19(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T464f21(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T464f22(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T464f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T464f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T464f8(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T464f7(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T464f6(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T464f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T464c18(T6 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T464f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
extern T0* T509c2(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item */
extern T0* T463f2(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item_storage_item */
extern T0* T463f6(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].search_position */
extern void T463f43(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_item */
extern T6 T463f18(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].hash_position */
extern T6 T463f13(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T423f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].key_storage_item */
extern T0* T463f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_item */
extern T6 T463f19(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].has */
extern T1 T463f1(T0* C, T0* a1);
/* INTEGER_32.out */
extern T0* T6f12(T6* C);
/* STRING_8.append_integer */
extern void T17f45(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T435f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T435f168(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T435f268(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f12(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T449f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T449f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T449f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T496c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T435f189(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T466f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
extern T0* T465f2(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].copy_data */
extern void T465f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_SYMBOL_CLASS].move_data */
extern void T465f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].overlapping_move */
extern void T465f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].non_overlapping_move */
extern void T465f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T465c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T466f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T510c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T466c3(void);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T435f167(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T435f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T464f20(T0* C, T1 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].force */
extern void T463f42(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].key_storage_put */
extern void T463f50(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_put */
extern void T463f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_put */
extern void T463f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].resize */
extern void T463f47(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_resize */
extern void T463f55(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].special_integer_ */
extern T0* T463f31(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].key_storage_resize */
extern void T463f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item_storage_resize */
extern void T463f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_resize */
extern void T463f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_modulus */
extern T6 T463f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_capacity */
extern T6 T463f12(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item_storage_put */
extern void T463f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].unset_found_item */
extern void T463f45(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T435f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T464f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T464f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort */
extern void T555f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort_with_comparator */
extern void T555f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER].subsort_with_comparator */
extern void T555f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T464f25(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER].less_than */
extern T1 T559f1(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge323os12662;
extern T0* ge323ov12662;
extern T0* T464f17(T0* C);
/* DS_SHELL_SORTER [INTEGER].make */
extern T0* T555c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER].make */
extern T0* T559c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T435f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T467c6(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T511c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T435f162(T0* C);
/* LX_NFA.build_optional */
extern void T467f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T492f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T467f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T467f10(T0* C);
/* LX_NFA.build_closure */
extern void T467f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T435f159(T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T467f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T485f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T485f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T529f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T485f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T485f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T529f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T485f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T529f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T485f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T529f3(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T1 T485f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T529f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T485f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T529f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T1 T485f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T1 T485f20(T0* C, T0* a1);
/* LX_NFA.build_union */
extern void T467f7(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T435f250(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T474c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T435f249(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T460f11(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T488f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T490f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T490f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T490f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T490f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T460f13(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T460f1(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T436f34(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T469f21(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T469f20(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T469f19(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T469f18(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T469f17(T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T469f16(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T469f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T467f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T492f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T436f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T468c9(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T468f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T435f248(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T435f263(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T480c7(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T435f262(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T479c7(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T435f261(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T478c7(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T435f247(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].forth */
extern void T473f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_forth */
extern void T463f61(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].add_traversing_cursor */
extern void T463f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_next_cursor */
extern void T473f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].remove_traversing_cursor */
extern void T463f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_position */
extern void T473f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T464f23(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T468f8(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T468f7(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].item */
extern T0* T473f2(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_item */
extern T0* T463f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].after */
extern T1 T473f1(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_after */
extern T1 T463f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].start */
extern void T473f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_start */
extern void T463f60(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_off */
extern T1 T463f39(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].is_empty */
extern T1 T463f38(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_cursor */
extern T0* T463f3(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].make */
extern T0* T473c6(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T468f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T435f234(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T435f233(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T435f231(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T435f246(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T472c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T435f245(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T435f230(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T435f244(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T435f260(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T477c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T435f259(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T476c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T435f184(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T435f258(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T435f205(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T435f257(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T475c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T435f256(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T435f266(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T481c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T435f181(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T435f255(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T435f265(T0* C);
/* LX_WILDCARD_PARSER.text */
extern T0* T435f175(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T324f3(T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T435f254(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T435f243(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T435f253(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T435f129(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T435f242(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T435f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T324f1(T0* C);
/* YY_BUFFER.fill */
extern void T204f15(T0* C);
/* YY_BUFFER.set_index */
extern void T204f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T435f128(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T435f127(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T435f241(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T47f18(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T47f19(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T47f20(T0* C, T14 a1, T2 a2);
/* LX_WILDCARD_PARSER.std */
extern T0* T435f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T324f2(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T435f25(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T435f229(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T435f238(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T435f251(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T435f264(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T435f267(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T470f6(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T32f7(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T465f6(T0* C);
/* SPECIAL [INTEGER].clear_all */
extern void T63f12(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T135f6(T0* C);
/* LX_WILDCARD_PARSER.abort */
extern void T435f232(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T435f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T435f228(T0* C);
/* YY_BUFFER.set_position */
extern void T204f14(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T435f14(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T204c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T204f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T324f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f52(T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T324f9(T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f56(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T204f9(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T324c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge298os2994;
extern T1 ge298ov2994;
extern T1 T51f6(T0* C);
/* PLATFORM.default_create */
extern T0* T429c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge223os1588;
extern T0* ge223ov1588;
extern T0* T324f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T51c7(void);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T435c219(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER].make */
extern T0* T462c4(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T461c1(void);
/* LX_START_CONDITIONS.make */
extern void T460f10(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T460c10(T6 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T460f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T505c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T504f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T550c2(T6 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T503c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T504c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T435f222(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T435f227(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge383os10828;
extern T0* ge383ov10828;
extern T0* T435f81(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T435f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T65f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge383os10827;
extern T0* ge383ov10827;
extern T0* T435f80(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge383os10826;
extern T0* ge383ov10826;
extern T0* T435f79(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge383os10825;
extern T0* ge383ov10825;
extern T0* T435f78(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge383os10824;
extern T0* ge383ov10824;
extern T0* T435f77(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge383os10823;
extern T0* ge383ov10823;
extern T0* T435f76(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge383os10822;
extern T0* ge383ov10822;
extern T0* T435f75(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge383os10821;
extern T0* ge383ov10821;
extern T0* T435f73(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge383os10820;
extern T0* ge383ov10820;
extern T0* T435f71(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge383os10819;
extern T0* ge383ov10819;
extern T0* T435f70(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T435f226(T0* C);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T435f221(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].set_key_equality_tester */
extern void T463f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING].internal_set_equality_tester */
extern void T507f6(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_map */
extern T0* T463c40(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_with_equality_testers */
extern void T463f44(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING].make */
extern T0* T507c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING].new_cursor */
extern T0* T507f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING].make */
extern T0* T551c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_sparse_container */
extern void T463f51(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_slots */
extern void T463f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_clashes */
extern void T463f58(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_key_storage */
extern void T463f57(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_item_storage */
extern void T463f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].set_key_equality_tester */
extern void T78f43(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge174os10986;
extern T0* ge174ov10986;
extern T0* T435f20(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T423c2(void);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern void T78f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern T0* T78c45(T6 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T78f46(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T78f47(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T78f52(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T78f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern T0* T78f19(T0* C);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T6 T78f8(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T78f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].make_key_storage */
extern void T78f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].make_item_storage */
extern void T78f48(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T435f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T435f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T435f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge384os10998;
extern T0* ge384ov10998;
extern T0* T435f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T435f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge384os10997;
extern T0* ge384ov10997;
extern T0* T435f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge384os10996;
extern T0* ge384ov10996;
extern T0* T435f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge384os10995;
extern T0* ge384ov10995;
extern T0* T435f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge384os10994;
extern T0* ge384ov10994;
extern T0* T435f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge384os10993;
extern T0* ge384ov10993;
extern T0* T435f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge384os10992;
extern T0* ge384ov10992;
extern T0* T435f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge400os6753;
extern T0* ge400ov6753;
extern T0* T435f16(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T436f32(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T436f31(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T436f30(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T436f29(T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T436c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T460c12(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T460f14(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T460f15(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T460f18(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T505f5(T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T460f17(T0* C, T6 a1, T6 a2);
/* LX_START_CONDITIONS.put_last */
extern void T460f16(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T488c6(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T490c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T490f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T536c2(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T28c10(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge204os2379;
extern T0* ge204ov2379;
extern T0* T28f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T449c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T412f15(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge131os9346;
extern T0* ge131ov9346;
extern T0* T359f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T360f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge131os9345;
extern T0* ge131ov9345;
extern T0* T359f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T360f39(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T360f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T359f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T359f25(T0* C);
/* GEANT_FILESET_ELEMENT.target_arguments_stack */
extern T0* T359f24(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern unsigned char ge135os2239;
extern T0* ge135ov2239;
extern T0* T359f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T360c33(T0* a1);
/* DS_HASH_SET [STRING].set_equality_tester */
extern void T409f35(T0* C, T0* a1);
/* DS_HASH_SET [STRING].make */
extern T0* T409c34(T6 a1);
/* DS_HASH_SET [STRING].new_cursor */
extern T0* T409f1(T0* C);
/* DS_HASH_SET_CURSOR [STRING].make */
extern T0* T411c6(T0* a1);
/* DS_HASH_SET [STRING].make_slots */
extern void T409f40(T0* C, T6 a1);
/* DS_HASH_SET [STRING].make_clashes */
extern void T409f39(T0* C, T6 a1);
/* DS_HASH_SET [STRING].make_key_storage */
extern void T409f38(T0* C, T6 a1);
/* DS_HASH_SET [STRING].make_item_storage */
extern void T409f37(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T407c38(T6 a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T433c2(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T407f43(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T407f24(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T431c4(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T407f46(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T407f56(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T407f37(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T407f22(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T407f55(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T407f54(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T407f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T434f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_FILESET_ENTRY].make_area */
extern T0* T458c2(T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make */
extern T0* T432c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T434c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T359f30(T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T359f23(T0* C);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge131os9353;
extern T0* ge131ov9353;
extern T0* T359f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge131os9351;
extern T0* ge131ov9351;
extern T0* T359f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge131os9344;
extern T0* ge131ov9344;
extern T0* T359f4(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T359f3(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge131os9348;
extern T0* ge131ov9348;
extern T0* T359f2(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T359f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T359f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T359f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T359f33(T0* C, T0* a1);
/* XM_ELEMENT.element_by_name */
extern T0* T95f4(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T189f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T94f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T189f15(T0* C);
/* XM_DOCUMENT.cursor_off */
extern T1 T94f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T95f39(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T95f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T95f8(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T95f11(T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T1 T314f1(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T314f3(T0* C);
/* XM_ELEMENT.has_namespace */
extern T1 T95f13(T0* C);
/* XM_ELEMENT.same_string */
extern T1 T95f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge236os1950;
extern T0* ge236ov1950;
extern T0* T95f12(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T318f2(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T318c11(void);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge116os9008;
extern T0* ge116ov9008;
extern T0* T304f20(T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T388f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge116os9007;
extern T0* ge116ov9007;
extern T0* T304f19(T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T388f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge116os9006;
extern T0* ge116ov9006;
extern T0* T304f18(T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T388f33(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge116os9005;
extern T0* ge116ov9005;
extern T0* T304f17(T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T388f32(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge116os9004;
extern T0* ge116ov9004;
extern T0* T304f16(T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T388f31(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge116os9003;
extern T0* ge116ov9003;
extern T0* T304f15(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T388f30(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge116os9002;
extern T0* ge116ov9002;
extern T0* T304f14(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T388f29(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge116os9001;
extern T0* ge116ov9001;
extern T0* T304f13(T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T388f28(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T304f12(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T304f5(T0* C);
/* GEANT_REPLACE_TASK.target_arguments_stack */
extern T0* T304f25(T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T304f8(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge116os9000;
extern T0* ge116ov9000;
extern T0* T304f11(T0* C);
/* GEANT_REPLACE_TASK.task_make */
extern void T304f31(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T304f34(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T304f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T304f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T304f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T304f33(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T388c27(T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T388f38(T0* C, T0* a1);
/* GEANT_TARGET.replace_task_name */
extern unsigned char ge129os2283;
extern T0* ge129ov2283;
extern T0* T26f72(T0* C);
/* GEANT_INPUT_TASK.make */
extern T0* T303c30(T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T387f19(T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T303f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T303f21(T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T303f26(T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T303f25(T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T303f24(T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge109os8982;
extern T0* ge109ov8982;
extern T0* T303f17(T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T387f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge109os8981;
extern T0* ge109ov8981;
extern T0* T303f16(T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T387f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge109os8980;
extern T0* ge109ov8980;
extern T0* T303f15(T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T387f16(T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge109os8979;
extern T0* ge109ov8979;
extern T0* T303f14(T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T387f15(T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge109os8978;
extern T0* ge109ov8978;
extern T0* T303f13(T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T387f14(T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T303f12(T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T303f5(T0* C);
/* GEANT_INPUT_TASK.target_arguments_stack */
extern T0* T303f23(T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T303f8(T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge109os8977;
extern T0* ge109ov8977;
extern T0* T303f11(T0* C);
/* GEANT_INPUT_TASK.task_make */
extern void T303f32(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T303f35(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T303f37(T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T303f36(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T303f38(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T303f34(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T387c13(T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T387f21(T0* C, T0* a1);
/* GEANT_TARGET.input_task_name */
extern unsigned char ge129os2282;
extern T0* ge129ov2282;
extern T0* T26f71(T0* C);
/* GEANT_AVAILABLE_TASK.make */
extern T0* T302c24(T0* a1, T0* a2);
/* GEANT_AVAILABLE_COMMAND.set_variable_name */
extern void T386f17(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.variable_attribute_name */
extern unsigned char ge96os8960;
extern T0* ge96ov8960;
extern T0* T302f15(T0* C);
/* GEANT_AVAILABLE_TASK.false_value_attribute_name */
extern unsigned char ge96os8962;
extern T0* ge96ov8962;
extern T0* T302f14(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_false_value */
extern void T386f16(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.true_value_attribute_name */
extern unsigned char ge96os8961;
extern T0* ge96ov8961;
extern T0* T302f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_true_value */
extern void T386f15(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_resource_name */
extern void T386f14(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.attribute_value */
extern T0* T302f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T302f5(T0* C);
/* GEANT_AVAILABLE_TASK.target_arguments_stack */
extern T0* T302f20(T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T302f8(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.resource_attribute_name */
extern unsigned char ge96os8959;
extern T0* ge96ov8959;
extern T0* T302f11(T0* C);
/* GEANT_AVAILABLE_TASK.task_make */
extern void T302f26(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T302f29(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T302f31(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T302f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T302f32(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T302f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T386c13(T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T386f19(T0* C, T0* a1);
/* GEANT_TARGET.available_task_name */
extern unsigned char ge129os2281;
extern T0* ge129ov2281;
extern T0* T26f70(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T301c26(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T365f5(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern unsigned char ge138os7616;
extern T0* ge138ov7616;
extern T0* T365f13(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T34f36(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].forth */
extern void T271f9(T0* C);
/* DS_LINKED_LIST [STRING].cursor_forth */
extern void T224f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].add_traversing_cursor */
extern void T224f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T271f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].remove_traversing_cursor */
extern void T224f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set */
extern void T271f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T34f66(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T34f55(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T34f54(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T34f53(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T34f52(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T34f60(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T34f26(T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T34f59(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T34f58(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T34f57(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T34f20(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T34f5(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T34f51(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T34f49(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].item */
extern T0* T271f4(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].start */
extern void T271f8(T0* C);
/* DS_LINKED_LIST [STRING].cursor_start */
extern void T224f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].cursor_off */
extern T1 T224f9(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].new_cursor */
extern T0* T224f2(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].make */
extern T0* T271c7(T0* a1);
/* ST_SPLITTER.split */
extern T0* T371f1(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T371f2(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING].force_last */
extern void T224f11(T0* C, T0* a1);
/* DS_LINKABLE [STRING].put_right */
extern void T275f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING].make */
extern T0* T275c3(T0* a1);
/* DS_LINKED_LIST [STRING].is_empty */
extern T1 T224f6(T0* C);
/* DS_HASH_SET [INTEGER].has */
extern T1 T417f1(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].search_position */
extern void T417f31(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].clashes_item */
extern T6 T417f12(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].hash_position */
extern T6 T417f19(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].key_storage_item */
extern T6 T417f18(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].item_storage_item */
extern T6 T417f27(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].key_equality_tester */
extern T0* T417f17(T0* C);
/* DS_HASH_SET [INTEGER].slots_item */
extern T6 T417f14(T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T75f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T193f56(T0* C, T2 a1);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T193f65(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T193f72(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T193f55(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge315os6248;
extern T0* ge315ov6248;
extern T0* T193f39(T0* C);
/* UC_UTF8_STRING.append_string */
extern void T193f55p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T193f64(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T193f41(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T251s1(T1 a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T193f9(T0* C, T6 a1);
/* UC_UTF8_STRING.append_substring */
extern void T193f57(T0* C, T0* a1, T6 a2, T6 a3);
/* ST_SPLITTER.string_ */
extern T0* T371f5(T0* C);
/* DS_LINKED_LIST [STRING].make */
extern T0* T224c10(void);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge60os1571;
extern T0* ge60ov1571;
extern T0* T301f16(T0* C);
/* ST_SPLITTER.set_separators */
extern void T371f10(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER].put */
extern void T417f30(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].slots_put */
extern void T417f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER].clashes_put */
extern void T417f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER].item_storage_put */
extern void T417f37(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER].unset_found_item */
extern void T417f36(T0* C);
/* DS_HASH_SET [INTEGER].make */
extern T0* T417c29(T6 a1);
/* DS_HASH_SET [INTEGER].new_cursor */
extern T0* T417f10(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER].make */
extern T0* T439c3(T0* a1);
/* DS_HASH_SET [INTEGER].make_slots */
extern void T417f35(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].special_integer_ */
extern T0* T417f23(T0* C);
/* DS_HASH_SET [INTEGER].new_modulus */
extern T6 T417f6(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].make_clashes */
extern void T417f34(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].make_key_storage */
extern void T417f33(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER].make_item_storage */
extern void T417f32(T0* C, T6 a1);
/* ST_SPLITTER.make */
extern T0* T371c9(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T301f29(T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T301f20(T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T301f19(T0* C);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge115os8949;
extern T0* ge115ov8949;
extern T0* T301f15(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T301f14(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T301f22(T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge115os8948;
extern T0* ge115ov8948;
extern T0* T301f13(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T385f7(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T301f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T301f5(T0* C);
/* GEANT_PRECURSOR_TASK.target_arguments_stack */
extern T0* T301f21(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T301f8(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge115os8947;
extern T0* ge115ov8947;
extern T0* T301f11(T0* C);
/* GEANT_PRECURSOR_TASK.task_make */
extern void T301f28(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T301f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T301f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T301f32(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T301f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T301f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T385c6(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T385f6p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T385f9(T0* C, T0* a1);
/* GEANT_TARGET.precursor_task_name */
extern unsigned char ge129os2280;
extern T0* ge129ov2280;
extern T0* T26f69(T0* C);
/* GEANT_EXIT_TASK.make */
extern T0* T300c21(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T193f46(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T112f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T112f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T112f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T112f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T197f1(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T255f4(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2183os6487;
extern T0* ge2183ov6487;
extern T0* T112f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T197c13(void);
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
/* ARRAY [NATURAL_64].put */
extern void T255f6(T0* C, T11 a1, T6 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* ARRAY [NATURAL_64].make */
extern T0* T255c5(T6 a1, T6 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T255f7(T0* C, T6 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T254c2(T6 a1);
/* STRING_8.has */
extern T1 T17f28(T0* C, T2 a1);
/* CHARACTER_8.is_digit */
extern T1 T2f6(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f7(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge36os93;
extern T0* ge36ov93;
extern T0* T2f9(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T241c2(T6 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f19(T6* C);
/* UC_UTF8_STRING.code */
extern T10 T193f49(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f27(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f21(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T112f18(T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2180os1256;
extern T0* ge2180ov1256;
extern T0* T193f48(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T112f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T112f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T112f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c47(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T112f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T112c16(void);
/* STRING_8.to_integer */
extern T6 T17f15(T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f21(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T384f6(T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T193f45(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T193f47(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T112f2(T0* C);
/* STRING_8.is_integer */
extern T1 T17f14(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T300f12(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T300f5(T0* C);
/* GEANT_EXIT_TASK.target_arguments_stack */
extern T0* T300f17(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T300f8(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge101os8939;
extern T0* ge101ov8939;
extern T0* T300f11(T0* C);
/* GEANT_EXIT_TASK.task_make */
extern void T300f23(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T300f26(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T300f28(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T300f27(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T300f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T300f25(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T384c5(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T384f8(T0* C, T0* a1);
/* GEANT_TARGET.exit_task_name */
extern unsigned char ge129os2279;
extern T0* ge129ov2279;
extern T0* T26f68(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T299c26(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T383f24(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge114os8918;
extern T0* ge114ov8918;
extern T0* T299f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T383f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge114os8915;
extern T0* ge114ov8915;
extern T0* T299f16(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge114os8917;
extern T0* ge114ov8917;
extern T0* T299f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T383f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge114os8916;
extern T0* ge114ov8916;
extern T0* T299f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T383f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T383f20(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge114os8914;
extern T0* ge114ov8914;
extern T0* T299f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T383f19(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T299f12(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T299f5(T0* C);
/* GEANT_OUTOFDATE_TASK.target_arguments_stack */
extern T0* T299f22(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T299f8(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge114os8913;
extern T0* ge114ov8913;
extern T0* T299f11(T0* C);
/* GEANT_OUTOFDATE_TASK.task_make */
extern void T299f28(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T299f31(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T299f33(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T299f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T299f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T299f30(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T383c18(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T383f26(T0* C, T0* a1);
/* GEANT_TARGET.outofdate_task_name */
extern unsigned char ge129os2278;
extern T0* ge129ov2278;
extern T0* T26f67(T0* C);
/* GEANT_XSLT_TASK.make */
extern T0* T298c39(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T380f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge123os8873;
extern T0* ge123ov8873;
extern T0* T298f28(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T380f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge123os8872;
extern T0* ge123ov8872;
extern T0* T298f27(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T380f34(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge123os8870;
extern T0* ge123ov8870;
extern T0* T298f26(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].force_last */
extern void T382f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].resize */
extern void T382f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].resize */
extern T0* T420f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING, STRING]].resized_area */
extern T0* T419f3(T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING, STRING]].copy_data */
extern void T419f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_PAIR [STRING, STRING]].move_data */
extern void T419f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING, STRING]].overlapping_move */
extern void T419f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING, STRING]].non_overlapping_move */
extern void T419f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING, STRING]].make */
extern T0* T419c4(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_capacity */
extern T6 T382f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].extendible */
extern T1 T382f8(T0* C, T6 a1);
/* DS_PAIR [STRING, STRING].make */
extern T0* T381c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T365f3(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T298f25(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge123os8874;
extern T0* ge123ov8874;
extern T0* T298f24(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T380f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge123os8871;
extern T0* ge123ov8871;
extern T0* T298f23(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T380f32(T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T298f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T298f31(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T298f35(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T298f34(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge123os8864;
extern T0* ge123ov8864;
extern T0* T298f21(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T380f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge123os8863;
extern T0* ge123ov8863;
extern T0* T298f20(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T380f30(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge123os8862;
extern T0* ge123ov8862;
extern T0* T298f19(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T380f29(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge123os8861;
extern T0* ge123ov8861;
extern T0* T298f18(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T380f28(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T380f39(T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge123os8869;
extern T0* ge123ov8869;
extern T0* T298f17(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T380f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge123os8868;
extern T0* ge123ov8868;
extern T0* T298f16(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T380f26(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge123os8867;
extern T0* ge123ov8867;
extern T0* T298f15(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T380f25(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge123os8866;
extern T0* ge123ov8866;
extern T0* T298f14(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T298f13(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T298f12(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T298f5(T0* C);
/* GEANT_XSLT_TASK.target_arguments_stack */
extern T0* T298f33(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T298f8(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge123os8865;
extern T0* ge123ov8865;
extern T0* T298f11(T0* C);
/* GEANT_XSLT_TASK.task_make */
extern void T298f41(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T298f44(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T298f46(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T298f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T298f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T298f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T380c24(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].make */
extern T0* T382c10(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_cursor */
extern T0* T382f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]].make */
extern T0* T421c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].make */
extern T0* T420f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_PAIR [STRING, STRING]].make_area */
extern T0* T441c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].default_create */
extern T0* T420c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T380f24p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T380f38(T0* C, T0* a1);
/* GEANT_TARGET.xslt_task_name */
extern unsigned char ge129os2277;
extern T0* ge129ov2277;
extern T0* T26f66(T0* C);
/* GEANT_SETENV_TASK.make */
extern T0* T297c22(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T379f9(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge117os8851;
extern T0* ge117ov8851;
extern T0* T297f13(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T379f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T297f12(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T297f5(T0* C);
/* GEANT_SETENV_TASK.target_arguments_stack */
extern T0* T297f18(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T297f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge117os8850;
extern T0* ge117ov8850;
extern T0* T297f11(T0* C);
/* GEANT_SETENV_TASK.task_make */
extern void T297f24(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T297f27(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T297f29(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T297f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T297f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T297f26(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T379c7(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T379f11(T0* C, T0* a1);
/* GEANT_TARGET.setenv_task_name */
extern unsigned char ge129os2276;
extern T0* ge129ov2276;
extern T0* T26f65(T0* C);
/* GEANT_MOVE_TASK.make */
extern T0* T296c24(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T378f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge113os8832;
extern T0* ge113ov8832;
extern T0* T296f15(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T378f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge113os8831;
extern T0* ge113ov8831;
extern T0* T296f14(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T378f17(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge113os8830;
extern T0* ge113ov8830;
extern T0* T296f13(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T378f16(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T296f12(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T296f5(T0* C);
/* GEANT_MOVE_TASK.target_arguments_stack */
extern T0* T296f20(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T296f8(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge113os8829;
extern T0* ge113ov8829;
extern T0* T296f11(T0* C);
/* GEANT_MOVE_TASK.task_make */
extern void T296f26(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T296f29(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T296f31(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T296f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T296f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T296f28(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T378c15(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T378f21(T0* C, T0* a1);
/* GEANT_TARGET.move_task_name */
extern unsigned char ge129os2275;
extern T0* ge129ov2275;
extern T0* T26f64(T0* C);
/* GEANT_COPY_TASK.make */
extern T0* T295c29(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T377f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge97os8809;
extern T0* ge97ov8809;
extern T0* T295f17(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T377f22(T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T295f16(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T295f20(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T295f25(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T295f24(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T295f23(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge97os8808;
extern T0* ge97ov8808;
extern T0* T295f15(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T377f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge97os8807;
extern T0* ge97ov8807;
extern T0* T295f14(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T377f20(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge97os8806;
extern T0* ge97ov8806;
extern T0* T295f13(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T377f19(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T295f12(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T295f5(T0* C);
/* GEANT_COPY_TASK.target_arguments_stack */
extern T0* T295f22(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T295f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge97os8805;
extern T0* ge97ov8805;
extern T0* T295f11(T0* C);
/* GEANT_COPY_TASK.task_make */
extern void T295f31(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T295f34(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T295f36(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T295f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T295f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T295f33(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T377c18(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T377f25(T0* C, T0* a1);
/* GEANT_TARGET.copy_task_name */
extern unsigned char ge129os2274;
extern T0* ge129ov2274;
extern T0* T26f63(T0* C);
/* GEANT_DELETE_TASK.make */
extern T0* T294c24(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T374f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T375c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T376f30(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge127os9444;
extern T0* ge127ov9444;
extern T0* T375f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T376f29(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T375f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T375f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge127os9443;
extern T0* ge127ov9443;
extern T0* T375f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T376f28(T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T375f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T375f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T375f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T375f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge127os9442;
extern T0* ge127ov9442;
extern T0* T375f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T376f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge127os9441;
extern T0* ge127ov9441;
extern T0* T375f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T376f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge127os9440;
extern T0* ge127ov9440;
extern T0* T375f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T376f25(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T375f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T375f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.target_arguments_stack */
extern T0* T375f14(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T375f4(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge127os9439;
extern T0* ge127ov9439;
extern T0* T375f3(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T376c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T376f31(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T375f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T375f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T375f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T375f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge98os8787;
extern T0* ge98ov8787;
extern T0* T294f15(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T374f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge98os8786;
extern T0* ge98ov8786;
extern T0* T294f14(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T374f19(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge98os8785;
extern T0* ge98ov8785;
extern T0* T294f13(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T374f18(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T294f12(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T294f5(T0* C);
/* GEANT_DELETE_TASK.target_arguments_stack */
extern T0* T294f20(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T294f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge98os8784;
extern T0* ge98ov8784;
extern T0* T294f11(T0* C);
/* GEANT_DELETE_TASK.task_make */
extern void T294f26(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T294f29(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T294f31(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T294f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T294f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T294f28(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T374c17(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T374f23(T0* C, T0* a1);
/* GEANT_TARGET.delete_task_name */
extern unsigned char ge129os2273;
extern T0* ge129ov2273;
extern T0* T26f62(T0* C);
/* GEANT_MKDIR_TASK.make */
extern T0* T293c21(T0* a1, T0* a2);
/* GEANT_MKDIR_COMMAND.set_directory */
extern void T373f10(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.attribute_value */
extern T0* T293f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T293f5(T0* C);
/* GEANT_MKDIR_TASK.target_arguments_stack */
extern T0* T293f17(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T293f8(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.directory_attribute_name */
extern unsigned char ge112os8776;
extern T0* ge112ov8776;
extern T0* T293f11(T0* C);
/* GEANT_MKDIR_TASK.task_make */
extern void T293f23(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T293f26(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T293f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T293f27(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T293f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T293f25(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T373c9(T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T373f12(T0* C, T0* a1);
/* GEANT_TARGET.mkdir_task_name */
extern unsigned char ge129os2272;
extern T0* ge129ov2272;
extern T0* T26f61(T0* C);
/* GEANT_ECHO_TASK.make */
extern T0* T292c27(T0* a1, T0* a2);
/* GEANT_ECHO_COMMAND.set_append */
extern void T372f10(T0* C, T1 a1);
/* GEANT_ECHO_TASK.boolean_value */
extern T1 T292f15(T0* C, T0* a1);
/* GEANT_ECHO_TASK.std */
extern T0* T292f18(T0* C);
/* GEANT_ECHO_TASK.false_attribute_value */
extern T0* T292f23(T0* C);
/* GEANT_ECHO_TASK.true_attribute_value */
extern T0* T292f22(T0* C);
/* GEANT_ECHO_TASK.string_ */
extern T0* T292f21(T0* C);
/* GEANT_ECHO_TASK.append_attribute_name */
extern unsigned char ge99os8764;
extern T0* ge99ov8764;
extern T0* T292f14(T0* C);
/* GEANT_ECHO_COMMAND.set_to_file */
extern void T372f9(T0* C, T0* a1);
/* GEANT_ECHO_TASK.to_file_attribute_name */
extern unsigned char ge99os8763;
extern T0* ge99ov8763;
extern T0* T292f13(T0* C);
/* GEANT_ECHO_COMMAND.set_message */
extern void T372f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.attribute_value */
extern T0* T292f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T292f5(T0* C);
/* GEANT_ECHO_TASK.target_arguments_stack */
extern T0* T292f20(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T292f30(T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T292f19(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T292f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.message_attribute_name */
extern unsigned char ge99os8762;
extern T0* ge99ov8762;
extern T0* T292f11(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T193f50(T0* C);
/* STRING_8.is_empty */
extern T1 T17f29(T0* C);
/* XM_ELEMENT.text */
extern T0* T95f26(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T75f5(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f39(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T75f6(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T193f8(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T95f27(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T1 T318f10(T0* C);
/* GEANT_ECHO_TASK.task_make */
extern void T292f29(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T292f32(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T292f34(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T292f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T292f35(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T292f31(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T372c7(T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T372f12(T0* C, T0* a1);
/* GEANT_TARGET.echo_task_name */
extern unsigned char ge129os2271;
extern T0* ge129ov2271;
extern T0* T26f60(T0* C);
/* GEANT_GEANT_TASK.make */
extern T0* T291c33(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T291f21(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T291f36(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T291f25(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T291f24(T0* C);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge102os8735;
extern T0* ge102ov8735;
extern T0* T291f20(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T291f19(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T291f27(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge102os8734;
extern T0* ge102ov8734;
extern T0* T291f18(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge102os8732;
extern T0* ge102ov8732;
extern T0* T291f17(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T370f28(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge102os8733;
extern T0* ge102ov8733;
extern T0* T291f16(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T370f27(T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T370f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge102os8729;
extern T0* ge102ov8729;
extern T0* T291f15(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T370f25(T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T291f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T291f29(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T291f28(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge102os8731;
extern T0* ge102ov8731;
extern T0* T291f13(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T370f24(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T291f12(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T291f5(T0* C);
/* GEANT_GEANT_TASK.target_arguments_stack */
extern T0* T291f26(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T291f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge102os8730;
extern T0* ge102ov8730;
extern T0* T291f11(T0* C);
/* GEANT_GEANT_TASK.task_make */
extern void T291f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T291f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T291f40(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T291f39(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T291f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T291f37(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T370c23(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T370f23p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T370f30(T0* C, T0* a1);
/* GEANT_TARGET.geant_task_name */
extern unsigned char ge129os2270;
extern T0* ge129ov2270;
extern T0* T26f59(T0* C);
/* GEANT_GETEST_TASK.make */
extern T0* T290c37(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force */
extern void T78f69(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].key_storage_put */
extern void T78f61(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T78f59(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T78f58(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T6 T78f36(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T6 T78f34(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T6 T78f35(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T78f57(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T78f67(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].key_storage_resize */
extern void T78f66(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].item_storage_resize */
extern void T78f65(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].key_storage_item */
extern T0* T78f30(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T78f64(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T6 T78f32(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].item_storage_put */
extern void T78f60(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T78f56(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge106os8700;
extern T0* ge106ov8700;
extern T0* T290f27(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T290f26(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T290f25(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T290f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge106os8699;
extern T0* ge106ov8699;
extern T0* T290f23(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T369f30(T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge106os8698;
extern T0* ge106ov8698;
extern T0* T290f22(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T369f29(T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge106os8697;
extern T0* ge106ov8697;
extern T0* T290f21(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T369f28(T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge106os8696;
extern T0* ge106ov8696;
extern T0* T290f20(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T369f27(T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge106os8695;
extern T0* ge106ov8695;
extern T0* T290f19(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T369f26(T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge106os8694;
extern T0* ge106ov8694;
extern T0* T290f18(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T369f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge106os8693;
extern T0* ge106ov8693;
extern T0* T290f17(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T369f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge106os8692;
extern T0* ge106ov8692;
extern T0* T290f16(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T369f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge106os8691;
extern T0* ge106ov8691;
extern T0* T290f15(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T369f22(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T290f14(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T290f5(T0* C);
/* GEANT_GETEST_TASK.target_arguments_stack */
extern T0* T290f33(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge106os8690;
extern T0* ge106ov8690;
extern T0* T290f13(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T369f21(T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T290f12(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T290f30(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T290f32(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T290f8(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge106os8689;
extern T0* ge106ov8689;
extern T0* T290f11(T0* C);
/* GEANT_GETEST_TASK.task_make */
extern void T290f39(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T290f42(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T290f44(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T290f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T290f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T290f41(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T369c20(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T369f20p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T369f32(T0* C, T0* a1);
/* GEANT_TARGET.getest_task_name */
extern unsigned char ge129os2269;
extern T0* ge129ov2269;
extern T0* T26f58(T0* C);
/* GEANT_GEPP_TASK.make */
extern T0* T289c32(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T368f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge105os8664;
extern T0* ge105ov8664;
extern T0* T289f20(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T368f24(T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge105os8663;
extern T0* ge105ov8663;
extern T0* T289f19(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T368f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge105os8662;
extern T0* ge105ov8662;
extern T0* T289f18(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T289f17(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T289f26(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge105os8661;
extern T0* ge105ov8661;
extern T0* T289f16(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T368f22(T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T289f15(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T289f23(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T289f28(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T289f27(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge105os8660;
extern T0* ge105ov8660;
extern T0* T289f14(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T368f21(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge105os8659;
extern T0* ge105ov8659;
extern T0* T289f13(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T368f20(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T289f12(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T289f5(T0* C);
/* GEANT_GEPP_TASK.target_arguments_stack */
extern T0* T289f25(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T289f8(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge105os8658;
extern T0* ge105ov8658;
extern T0* T289f11(T0* C);
/* GEANT_GEPP_TASK.task_make */
extern void T289f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T289f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T289f39(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T289f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T289f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T289f36(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T368c19(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T368f19p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T368f27(T0* C, T0* a1);
/* GEANT_TARGET.gepp_task_name */
extern unsigned char ge129os2268;
extern T0* ge129ov2268;
extern T0* T26f57(T0* C);
/* GEANT_GEYACC_TASK.make */
extern T0* T288c32(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T367f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge108os8633;
extern T0* ge108ov8633;
extern T0* T288f20(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T367f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge108os8632;
extern T0* ge108ov8632;
extern T0* T288f19(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T367f23(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge108os8631;
extern T0* ge108ov8631;
extern T0* T288f18(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T367f22(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge108os8630;
extern T0* ge108ov8630;
extern T0* T288f17(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T367f21(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge108os8635;
extern T0* ge108ov8635;
extern T0* T288f16(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T367f20(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge108os8634;
extern T0* ge108ov8634;
extern T0* T288f15(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T367f19(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T288f14(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T288f5(T0* C);
/* GEANT_GEYACC_TASK.target_arguments_stack */
extern T0* T288f28(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge108os8629;
extern T0* ge108ov8629;
extern T0* T288f13(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T367f18(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T288f12(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T288f23(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T288f27(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T288f26(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T288f25(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T288f8(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge108os8628;
extern T0* ge108ov8628;
extern T0* T288f11(T0* C);
/* GEANT_GEYACC_TASK.task_make */
extern void T288f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T288f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T288f39(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T288f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T288f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T288f36(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T367c17(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T367f17p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T367f27(T0* C, T0* a1);
/* GEANT_TARGET.geyacc_task_name */
extern unsigned char ge129os2267;
extern T0* ge129ov2267;
extern T0* T26f56(T0* C);
/* GEANT_GELEX_TASK.make */
extern T0* T287c35(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T366f31(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge104os8599;
extern T0* ge104ov8599;
extern T0* T287f23(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T366f30(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge104os8598;
extern T0* ge104ov8598;
extern T0* T287f22(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T366f29(T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge104os8597;
extern T0* ge104ov8597;
extern T0* T287f21(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T366f28(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge104os8596;
extern T0* ge104ov8596;
extern T0* T287f20(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T366f27(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge104os8595;
extern T0* ge104ov8595;
extern T0* T287f19(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T366f26(T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge104os8594;
extern T0* ge104ov8594;
extern T0* T287f18(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T366f25(T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge104os8593;
extern T0* ge104ov8593;
extern T0* T287f17(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T366f24(T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge104os8592;
extern T0* ge104ov8592;
extern T0* T287f16(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T366f23(T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge104os8591;
extern T0* ge104ov8591;
extern T0* T287f15(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T366f22(T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T287f14(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T287f26(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T287f31(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T287f30(T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T287f29(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge104os8590;
extern T0* ge104ov8590;
extern T0* T287f13(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T366f21(T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T287f12(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T287f5(T0* C);
/* GEANT_GELEX_TASK.target_arguments_stack */
extern T0* T287f28(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T287f8(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge104os8589;
extern T0* ge104ov8589;
extern T0* T287f11(T0* C);
/* GEANT_GELEX_TASK.task_make */
extern void T287f37(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T287f40(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T287f42(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T287f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T287f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T287f39(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T366c20(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T366f20p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T366f33(T0* C, T0* a1);
/* GEANT_TARGET.gelex_task_name */
extern unsigned char ge129os2266;
extern T0* ge129ov2266;
extern T0* T26f55(T0* C);
/* GEANT_GEXACE_TASK.make */
extern T0* T286c33(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_last */
extern void T78f68(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T286f21(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T286f26(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge107os8565;
extern T0* ge107ov8565;
extern T0* T286f20(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T364f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge107os8564;
extern T0* ge107ov8564;
extern T0* T286f19(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T364f25(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge107os8563;
extern T0* ge107ov8563;
extern T0* T286f18(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T364f24(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge107os8562;
extern T0* ge107ov8562;
extern T0* T286f17(T0* C);
/* GEANT_GEXACE_TASK.cluster_attribute_name */
extern unsigned char ge107os8561;
extern T0* ge107ov8561;
extern T0* T286f16(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T364f23(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T286f15(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T286f5(T0* C);
/* GEANT_GEXACE_TASK.target_arguments_stack */
extern T0* T286f29(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge107os8560;
extern T0* ge107ov8560;
extern T0* T286f14(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T364f22(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge107os8559;
extern T0* ge107ov8559;
extern T0* T286f13(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T364f21(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T286f12(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T286f24(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T286f28(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T286f27(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T286f8(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge107os8558;
extern T0* ge107ov8558;
extern T0* T286f11(T0* C);
/* GEANT_GEXACE_TASK.task_make */
extern void T286f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T286f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T286f40(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T286f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T286f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T286f37(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T364c20(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T364f20p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T364f28(T0* C, T0* a1);
/* GEANT_TARGET.gexace_task_name */
extern unsigned char ge129os2265;
extern T0* ge129ov2265;
extern T0* T26f54(T0* C);
/* GEANT_UNSET_TASK.make */
extern T0* T285c21(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T363f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T285f12(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T285f5(T0* C);
/* GEANT_UNSET_TASK.target_arguments_stack */
extern T0* T285f17(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T285f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge121os8550;
extern T0* ge121ov8550;
extern T0* T285f11(T0* C);
/* GEANT_UNSET_TASK.task_make */
extern void T285f23(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T285f26(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T285f28(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T285f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T285f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T285f25(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T363c5(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T363f8(T0* C, T0* a1);
/* GEANT_TARGET.unset_task_name */
extern unsigned char ge129os2264;
extern T0* ge129ov2264;
extern T0* T26f53(T0* C);
/* GEANT_SET_TASK.make */
extern T0* T284c22(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T362f8(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge118os8540;
extern T0* ge118ov8540;
extern T0* T284f13(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T362f7(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T284f12(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T284f5(T0* C);
/* GEANT_SET_TASK.target_arguments_stack */
extern T0* T284f18(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T284f8(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge118os8539;
extern T0* ge118ov8539;
extern T0* T284f11(T0* C);
/* GEANT_SET_TASK.task_make */
extern void T284f24(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T284f27(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T284f29(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T284f28(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T284f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T284f26(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T362c6(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T362f10(T0* C, T0* a1);
/* GEANT_TARGET.set_task_name */
extern unsigned char ge129os2263;
extern T0* ge129ov2263;
extern T0* T26f52(T0* C);
/* GEANT_LCC_TASK.make */
extern T0* T283c22(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T361f13(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge111os8529;
extern T0* ge111ov8529;
extern T0* T283f13(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T361f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T283f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T283f5(T0* C);
/* GEANT_LCC_TASK.target_arguments_stack */
extern T0* T283f18(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T283f8(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge111os8528;
extern T0* ge111ov8528;
extern T0* T283f11(T0* C);
/* GEANT_LCC_TASK.task_make */
extern void T283f24(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T283f27(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T283f29(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T283f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T283f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T283f26(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T361c11(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T361f15(T0* C, T0* a1);
/* GEANT_TARGET.lcc_task_name */
extern unsigned char ge129os2262;
extern T0* ge129ov2262;
extern T0* T26f51(T0* C);
/* GEANT_EXEC_TASK.make */
extern T0* T282c28(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T358f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge100os8512;
extern T0* ge100ov8512;
extern T0* T282f16(T0* C);
/* GEANT_EXEC_COMMAND.set_accept_errors */
extern void T358f14(T0* C, T1 a1);
/* GEANT_EXEC_TASK.boolean_value */
extern T1 T282f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.std */
extern T0* T282f19(T0* C);
/* GEANT_EXEC_TASK.false_attribute_value */
extern T0* T282f24(T0* C);
/* GEANT_EXEC_TASK.true_attribute_value */
extern T0* T282f23(T0* C);
/* GEANT_EXEC_TASK.string_ */
extern T0* T282f22(T0* C);
/* GEANT_EXEC_TASK.accept_errors_attribute_name */
extern unsigned char ge100os8510;
extern T0* ge100ov8510;
extern T0* T282f14(T0* C);
/* GEANT_EXEC_COMMAND.set_exit_code_variable_name */
extern void T358f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge100os8511;
extern T0* ge100ov8511;
extern T0* T282f13(T0* C);
/* GEANT_EXEC_COMMAND.set_command_line */
extern void T358f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.attribute_value */
extern T0* T282f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T282f5(T0* C);
/* GEANT_EXEC_TASK.target_arguments_stack */
extern T0* T282f21(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T282f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.executable_attribute_name */
extern unsigned char ge100os8509;
extern T0* ge100ov8509;
extern T0* T282f11(T0* C);
/* GEANT_EXEC_TASK.task_make */
extern void T282f30(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T282f33(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T282f35(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T282f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T282f36(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T282f32(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T358c11(T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T358f17(T0* C, T0* a1);
/* GEANT_TARGET.exec_task_name */
extern unsigned char ge129os2261;
extern T0* ge129ov2261;
extern T0* T26f50(T0* C);
/* GEANT_VE_TASK.make */
extern T0* T281c32(T0* a1, T0* a2);
/* GEANT_VE_COMMAND.set_exit_code_variable_name */
extern void T357f26(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value */
extern T0* T281f20(T0* C, T0* a1);
/* GEANT_VE_TASK.project_variables_resolver */
extern T0* T281f5(T0* C);
/* GEANT_VE_TASK.target_arguments_stack */
extern T0* T281f28(T0* C);
/* GEANT_VE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge122os8484;
extern T0* ge122ov8484;
extern T0* T281f19(T0* C);
/* GEANT_VE_COMMAND.set_tuning_level */
extern void T357f25(T0* C, T0* a1);
/* GEANT_VE_TASK.level_attribute_name */
extern unsigned char ge122os8483;
extern T0* ge122ov8483;
extern T0* T281f18(T0* C);
/* GEANT_VE_COMMAND.set_tuned_system */
extern void T357f24(T0* C, T0* a1);
/* GEANT_VE_TASK.tune_attribute_name */
extern unsigned char ge122os8482;
extern T0* ge122ov8482;
extern T0* T281f17(T0* C);
/* GEANT_VE_COMMAND.set_recursive_clean */
extern void T357f23(T0* C, T1 a1);
/* GEANT_VE_TASK.boolean_value */
extern T1 T281f16(T0* C, T0* a1);
/* GEANT_VE_TASK.std */
extern T0* T281f23(T0* C);
/* GEANT_VE_TASK.false_attribute_value */
extern T0* T281f27(T0* C);
/* GEANT_VE_TASK.true_attribute_value */
extern T0* T281f26(T0* C);
/* GEANT_VE_TASK.string_ */
extern T0* T281f25(T0* C);
/* GEANT_VE_TASK.recursive_attribute_name */
extern unsigned char ge122os8481;
extern T0* ge122ov8481;
extern T0* T281f15(T0* C);
/* GEANT_VE_COMMAND.set_clean */
extern void T357f22(T0* C, T0* a1);
/* GEANT_VE_TASK.clean_attribute_name */
extern unsigned char ge122os8480;
extern T0* ge122ov8480;
extern T0* T281f14(T0* C);
/* GEANT_VE_COMMAND.set_xace_filename */
extern void T357f21(T0* C, T0* a1);
/* GEANT_VE_TASK.xace_attribute_name */
extern unsigned char ge122os8479;
extern T0* ge122ov8479;
extern T0* T281f13(T0* C);
/* GEANT_VE_COMMAND.set_esd_filename */
extern void T357f20(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value_or_default */
extern T0* T281f12(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.has_attribute */
extern T1 T281f8(T0* C, T0* a1);
/* GEANT_VE_TASK.esd_attribute_name */
extern unsigned char ge122os8478;
extern T0* ge122ov8478;
extern T0* T281f11(T0* C);
/* GEANT_VE_TASK.task_make */
extern void T281f34(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.interpreting_element_make */
extern void T281f37(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.set_project */
extern void T281f39(T0* C, T0* a1);
/* GEANT_VE_TASK.element_make */
extern void T281f38(T0* C, T0* a1);
/* GEANT_VE_TASK.set_xml_element */
extern void T281f40(T0* C, T0* a1);
/* GEANT_VE_TASK.set_command */
extern void T281f36(T0* C, T0* a1);
/* GEANT_VE_COMMAND.make */
extern T0* T357c19(T0* a1);
/* GEANT_VE_COMMAND.set_project */
extern void T357f28(T0* C, T0* a1);
/* GEANT_TARGET.ve_task_name */
extern unsigned char ge129os2260;
extern T0* ge129ov2260;
extern T0* T26f49(T0* C);
/* GEANT_ISE_TASK.make */
extern T0* T280c31(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T356f23(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T280f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T280f5(T0* C);
/* GEANT_ISE_TASK.target_arguments_stack */
extern T0* T280f27(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge110os8456;
extern T0* ge110ov8456;
extern T0* T280f18(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T356f22(T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge110os8454;
extern T0* ge110ov8454;
extern T0* T280f17(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T356f21(T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T280f16(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T280f22(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T280f26(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T280f25(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T280f24(T0* C);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge110os8453;
extern T0* ge110ov8453;
extern T0* T280f15(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T356f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge110os8455;
extern T0* ge110ov8455;
extern T0* T280f14(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T356f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge110os8452;
extern T0* ge110ov8452;
extern T0* T280f13(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T356f18(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T280f12(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T280f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge110os8451;
extern T0* ge110ov8451;
extern T0* T280f11(T0* C);
/* GEANT_ISE_TASK.task_make */
extern void T280f33(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T280f36(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T280f38(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T280f37(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T280f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T280f35(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T356c17(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T356f25(T0* C, T0* a1);
/* GEANT_TARGET.ise_task_name */
extern unsigned char ge129os2259;
extern T0* ge129ov2259;
extern T0* T26f48(T0* C);
/* GEANT_SE_TASK.make */
extern T0* T279c33(T0* a1, T0* a2);
/* GEANT_SE_COMMAND.set_exit_code_variable_name */
extern void T355f31(T0* C, T0* a1);
/* GEANT_SE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge119os8423;
extern T0* ge119ov8423;
extern T0* T279f21(T0* C);
/* GEANT_SE_COMMAND.set_no_style_warning */
extern void T355f30(T0* C, T1 a1);
/* GEANT_SE_TASK.no_style_warning_attribute_name */
extern unsigned char ge119os8421;
extern T0* ge119ov8421;
extern T0* T279f20(T0* C);
/* GEANT_SE_COMMAND.set_case_insensitive */
extern void T355f29(T0* C, T1 a1);
/* GEANT_SE_TASK.boolean_value */
extern T1 T279f19(T0* C, T0* a1);
/* GEANT_SE_TASK.std */
extern T0* T279f24(T0* C);
/* GEANT_SE_TASK.false_attribute_value */
extern T0* T279f29(T0* C);
/* GEANT_SE_TASK.true_attribute_value */
extern T0* T279f28(T0* C);
/* GEANT_SE_TASK.string_ */
extern T0* T279f27(T0* C);
/* GEANT_SE_TASK.case_insensitive_attribute_name */
extern unsigned char ge119os8420;
extern T0* ge119ov8420;
extern T0* T279f18(T0* C);
/* GEANT_SE_COMMAND.set_executable */
extern void T355f28(T0* C, T0* a1);
/* GEANT_SE_TASK.executable_attribute_name */
extern unsigned char ge119os8419;
extern T0* ge119ov8419;
extern T0* T279f17(T0* C);
/* GEANT_SE_COMMAND.set_creation_procedure */
extern void T355f27(T0* C, T0* a1);
/* GEANT_SE_TASK.creation_procedure_attribute_name */
extern unsigned char ge119os8418;
extern T0* ge119ov8418;
extern T0* T279f16(T0* C);
/* GEANT_SE_COMMAND.set_root_class */
extern void T355f26(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value */
extern T0* T279f15(T0* C, T0* a1);
/* GEANT_SE_TASK.project_variables_resolver */
extern T0* T279f5(T0* C);
/* GEANT_SE_TASK.target_arguments_stack */
extern T0* T279f26(T0* C);
/* GEANT_SE_TASK.root_class_attribute_name */
extern unsigned char ge119os8417;
extern T0* ge119ov8417;
extern T0* T279f14(T0* C);
/* GEANT_SE_COMMAND.set_clean */
extern void T355f25(T0* C, T0* a1);
/* GEANT_SE_TASK.clean_attribute_name */
extern unsigned char ge119os8422;
extern T0* ge119ov8422;
extern T0* T279f13(T0* C);
/* GEANT_SE_COMMAND.set_ace_filename */
extern void T355f24(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value_or_default */
extern T0* T279f12(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.has_attribute */
extern T1 T279f8(T0* C, T0* a1);
/* GEANT_SE_TASK.ace_attribute_name */
extern unsigned char ge119os8416;
extern T0* ge119ov8416;
extern T0* T279f11(T0* C);
/* GEANT_SE_TASK.task_make */
extern void T279f35(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.interpreting_element_make */
extern void T279f38(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.set_project */
extern void T279f40(T0* C, T0* a1);
/* GEANT_SE_TASK.element_make */
extern void T279f39(T0* C, T0* a1);
/* GEANT_SE_TASK.set_xml_element */
extern void T279f41(T0* C, T0* a1);
/* GEANT_SE_TASK.set_command */
extern void T279f37(T0* C, T0* a1);
/* GEANT_SE_COMMAND.make */
extern T0* T355c23(T0* a1);
/* GEANT_SE_COMMAND.set_project */
extern void T355f33(T0* C, T0* a1);
/* GEANT_TARGET.se_task_name */
extern unsigned char ge129os2258;
extern T0* ge129ov2258;
extern T0* T26f47(T0* C);
/* GEANT_GEC_TASK.make */
extern T0* T278c34(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T354f30(T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge103os8376;
extern T0* ge103ov8376;
extern T0* T278f22(T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T354f29(T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge103os8378;
extern T0* ge103ov8378;
extern T0* T278f21(T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T354f28(T0* C, T6 a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T278f20(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T278f5(T0* C);
/* GEANT_GEC_TASK.target_arguments_stack */
extern T0* T278f30(T0* C);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge103os8380;
extern T0* ge103ov8380;
extern T0* T278f19(T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T354f27(T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge103os8379;
extern T0* ge103ov8379;
extern T0* T278f18(T0* C);
/* GEANT_GEC_COMMAND.set_cat_mode */
extern void T354f26(T0* C, T1 a1);
/* GEANT_GEC_TASK.cat_attribute_name */
extern unsigned char ge103os8374;
extern T0* ge103ov8374;
extern T0* T278f17(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T354f25(T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge103os8377;
extern T0* ge103ov8377;
extern T0* T278f16(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T354f24(T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T278f15(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T278f25(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T278f29(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T278f28(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T278f27(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge103os8373;
extern T0* ge103ov8373;
extern T0* T278f14(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T354f23(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge103os8375;
extern T0* ge103ov8375;
extern T0* T278f13(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T354f22(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T278f12(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T278f8(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge103os8372;
extern T0* ge103ov8372;
extern T0* T278f11(T0* C);
/* GEANT_GEC_TASK.task_make */
extern void T278f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T278f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T278f41(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T278f40(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T278f42(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T278f38(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T354c21(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T354f21p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T354f32(T0* C, T0* a1);
/* GEANT_TARGET.gec_task_name */
extern unsigned char ge129os2257;
extern T0* ge129ov2257;
extern T0* T26f46(T0* C);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge62os2226;
extern T0* ge62ov2226;
extern T0* T26f4(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge62os2227;
extern T0* ge62ov2227;
extern T0* T26f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T75f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T75f10(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T193f13(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T193f29(T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f17(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T193f12(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T193f28(T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge128os2252;
extern T0* ge128ov2252;
extern T0* T26f5(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T26f23(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T189f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T189f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T94f23(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T95f37(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T95f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T189c9(T0* a1);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T26f45(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T34f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].forth */
extern void T64f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].key */
extern T0* T64f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].after */
extern T1 T64f3(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].start */
extern void T64f8(T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T26f78(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].item */
extern T0* T64f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T34f38(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T99f2(T0* C);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T26f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T54f33(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T80f7(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T80f5(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge282os3774;
extern T0* ge282ov3774;
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
extern T1 T352f1(T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T352f3(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T352f4(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T352f36(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T352f35(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T352c35(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T352f37(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T352f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge282os3772;
extern T0* ge282ov3772;
extern T0* T54f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T53f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T53f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T54f23(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T80f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T53f26(T0* C);
/* GEANT_TARGET.file_system */
extern unsigned char ge202os1584;
extern T0* ge202ov1584;
extern T0* T26f44(T0* C);
/* GEANT_TARGET.unix_file_system */
extern unsigned char ge202os1587;
extern T0* ge202ov1587;
extern T0* T26f77(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T54c32(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge298os2993;
extern T1 ge298ov2993;
extern T1 T51f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T51f4(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge298os2997;
extern T0* ge298ov2997;
extern T0* T51f5(T0* C);
/* STRING_8.is_equal */
extern T1 T17f23(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f25(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T51f3(T0* C, T0* a1);
/* GEANT_TARGET.windows_file_system */
extern unsigned char ge202os1585;
extern T0* ge202ov1585;
extern T0* T26f76(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T53c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge298os2992;
extern T1 ge298ov2992;
extern T1 T51f1(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T26f75(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T242f1(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T242f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T242f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T58f7(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T25f50(T0* C);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T25f52(T0* C, T6 a1);
/* GEANT_VARIABLES.found_item */
extern T0* T29f42(T0* C);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T29f34(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T34f43(T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T34f40(T0* C, T6 a1);
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
extern T0* T243f2(T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T29f33(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item */
extern T0* T34f37(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T243f1(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T29f32(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T242f4(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T75f20(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T75f3(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T193f75(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T193f78(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T193f75p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f38(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T242f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T193f16(T0* C);
/* UC_UTF8_STRING.unicode */
extern unsigned char ge231os4787;
extern T0* ge231ov4787;
extern T0* T193f31(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T250c29(void);
/* STRING_8.out */
extern T0* T17f3(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T95f7(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T95f9(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T1 T318f3(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T242f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T58f17(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T26f28(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T242c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T95f6(T0* C, T0* a1);
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
extern T0* T68f3(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T22f20(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].forth */
extern void T122f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_forth */
extern void T31f65(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].add_traversing_cursor */
extern void T31f70(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_next_cursor */
extern void T122f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_traversing_cursor */
extern void T31f69(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_position */
extern void T122f14(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_item */
extern T6 T31f19(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].go_after */
extern void T122f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_go_after */
extern void T31f75(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_off */
extern T1 T31f40(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].key */
extern T0* T122f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_key */
extern T0* T31f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].key_storage_item */
extern T0* T31f18(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].item */
extern T0* T122f2(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_item */
extern T0* T31f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item_storage_item */
extern T0* T31f5(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].after */
extern T1 T122f1(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_after */
extern T1 T31f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].start */
extern void T122f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_start */
extern void T31f64(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].is_empty */
extern T1 T31f39(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_cursor */
extern T0* T31f29(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].make */
extern T0* T122c8(T0* a1);
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
extern T0* T185f2(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T34c45(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T34f48(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T34f47(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T34f56(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T34f61(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T34f65(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T34f64(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T34f63(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T34f62(T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T22f39(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T26f36(T0* C);
/* GEANT_TARGET.show_dependent_targets */
extern void T26f93(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T68f10(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge205os2967;
extern T0* ge205ov2967;
extern T0* T46f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T68c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T68f11(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T68f15(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T68f2(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T68f14(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T26f7(T0* C, T0* a1, T2 a2);
/* GEANT_TARGET.dependencies */
extern T0* T26f40(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge62os2229;
extern T0* ge62ov2229;
extern T0* T26f41(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T26f39(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T185f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T185f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T123f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].resized_area */
extern T0* T118f3(T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].copy_data */
extern void T118f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_TARGET].move_data */
extern void T118f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].overlapping_move */
extern void T118f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].non_overlapping_move */
extern void T118f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T118c4(T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T185f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T185f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T185c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T123f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_TARGET].make_area */
extern T0* T202c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T123c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T99f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T99f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].resize */
extern T0* T176f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].resized_area */
extern T0* T175f3(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].copy_data */
extern void T175f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].move_data */
extern void T175f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].overlapping_move */
extern void T175f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].non_overlapping_move */
extern void T175f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T99f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T99f6(T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T22f18(T0* C);
/* GEANT_PROJECT.trace */
extern void T22f24(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge60os1567;
extern T0* ge60ov1567;
extern T0* T21f11(T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T22f3(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T22f35(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T22f17(T0* C);
/* GEANT_PROJECT.std */
extern T0* T22f10(T0* C);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T22f7(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T22f5(T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T22f27(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T22f26(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T26f30(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T26f29(T0* C);
/* DS_ARRAYED_LIST [STRING].has */
extern T1 T70f22(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge62os2232;
extern T0* ge62ov2232;
extern T0* T26f8(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item */
extern T0* T31f2(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].search_position */
extern void T31f46(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].hash_position */
extern T6 T31f12(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_item */
extern T6 T31f14(T0* C, T6 a1);
/* GEANT.exit_application */
extern void T21f22(T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T21f14(T0* C);
/* GEANT.std */
extern T0* T21f13(T0* C);
/* UC_UTF8_STRING.infix "+" */
extern T0* T193f7(T0* C, T0* a1);
/* STRING_8.infix "+" */
extern T0* T17f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has */
extern T1 T31f1(T0* C, T0* a1);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T22f25(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T26f92(T0* C);
/* ARRAY [STRING].force */
extern void T33f14(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING].auto_resize */
extern void T33f15(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING].fill_with */
extern void T32f12(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING].capacity */
extern T6 T33f8(T0* C);
/* SPECIAL [STRING].aliased_resized_area */
extern T0* T32f4(T0* C, T6 a1);
/* ARRAY [STRING].additional_space */
extern T6 T33f7(T0* C);
/* ARRAY [STRING].empty_area */
extern T1 T33f6(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T117f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T117f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].back */
extern void T122f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_back */
extern void T31f67(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T117f15(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T117f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T117f4(T0* C);
/* GEANT_TARGET.conflicts_with */
extern T1 T26f34(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T26f38(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].before */
extern T1 T122f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_before */
extern T1 T31f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].finish */
extern void T122f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_finish */
extern void T31f66(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T117f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove */
extern void T31f63(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_position */
extern void T31f68(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].key_storage_put */
extern void T31f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item_storage_put */
extern void T31f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_put */
extern void T31f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_put */
extern void T31f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_forth */
extern void T31f72(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_all_cursors */
extern void T31f74(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_after */
extern void T31f73(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].internal_set_key_equality_tester */
extern void T31f71(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING].internal_set_equality_tester */
extern void T120f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].unset_found_item */
extern void T31f48(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T26f96(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T117f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T117f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T117f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].force_last */
extern void T31f45(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].resize */
extern void T31f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_resize */
extern void T31f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].special_integer_ */
extern T0* T31f30(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].key_storage_resize */
extern void T31f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item_storage_resize */
extern void T31f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_resize */
extern void T31f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_modulus */
extern T6 T31f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_capacity */
extern T6 T31f11(T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T117f3(T0* C);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T117f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T117f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T26f91(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T26f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T184f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T183f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T184f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T183f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T184f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T183f22(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T181f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T181f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].forth */
extern void T348f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_forth */
extern void T264f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].add_traversing_cursor */
extern void T264f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_next_cursor */
extern void T348f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].remove_traversing_cursor */
extern void T264f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_position */
extern void T348f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_item */
extern T6 T264f17(T0* C, T6 a1);
/* GEANT_PARENT.exit_application */
extern void T181f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T181f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T181f10(T0* C);
/* GEANT_SELECT.is_executable */
extern T1 T263f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].item */
extern T0* T348f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_item */
extern T0* T264f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].item_storage_item */
extern T0* T264f34(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].after */
extern T1 T348f3(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_after */
extern T1 T264f31(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].start */
extern void T348f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_start */
extern void T264f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_off */
extern T1 T264f36(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].is_empty */
extern T1 T264f35(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_cursor */
extern T0* T264f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].make */
extern T0* T348c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T181f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T181f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has_item */
extern T1 T31f42(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T181f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].forth */
extern void T342f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_forth */
extern void T262f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].add_traversing_cursor */
extern void T262f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_next_cursor */
extern void T342f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].remove_traversing_cursor */
extern void T262f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_position */
extern void T342f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_item */
extern T6 T262f17(T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T261f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].item */
extern T0* T342f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_item */
extern T0* T262f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].item_storage_item */
extern T0* T262f34(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].after */
extern T1 T342f3(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_after */
extern T1 T262f31(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].start */
extern void T342f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_start */
extern void T262f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_off */
extern T1 T262f36(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].is_empty */
extern T1 T262f35(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_cursor */
extern T0* T262f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].make */
extern T0* T342c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T181f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].back */
extern void T336f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_back */
extern void T260f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].add_traversing_cursor */
extern void T260f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_next_cursor */
extern void T336f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].remove_traversing_cursor */
extern void T260f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_position */
extern void T336f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_item */
extern T6 T260f17(T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T259f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T259f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].item */
extern T0* T336f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_item */
extern T0* T260f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].item_storage_item */
extern T0* T260f34(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].before */
extern T1 T336f3(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_before */
extern T1 T260f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].finish */
extern void T336f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_finish */
extern void T260f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_off */
extern T1 T260f36(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].is_empty */
extern T1 T260f35(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_cursor */
extern T0* T260f27(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].make */
extern T0* T336c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T184f2(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T183f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T183f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T184f1(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T1 T183f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T184f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T183f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T183f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T184f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T1 T183f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T1 T183f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T183f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T184c7(T0* a1);
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
extern T0* T83f8(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T83f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T83f6(T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge210os3813;
extern T0* ge210ov3813;
extern T0* T53f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T54f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T83f17(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T83f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T83f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T83f14(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T83c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T53f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T54f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T54f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge208os3813;
extern T0* ge208ov3813;
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
extern T0* T89f2(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T89f7(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T89f6(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T89f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T89f12(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f4(T2* C, T2 a1);
/* STRING_8.make_empty */
extern T0* T17c44(void);
/* XM_EIFFEL_PARSER.position */
extern T0* T89f4(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T129f1(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T89f9(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T89f15(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T130f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T130f2(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T130f1(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T129f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T209f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T209f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T209c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T129f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T129c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T129f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T210c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T130f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T211f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T211c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T130c5(void);
/* KL_STDERR_FILE.flush */
extern void T47f21(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T47f22(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T47f23(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T90f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T56f7(T0* C);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T30c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T30f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T116c10(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T116f12(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T116f6(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T116f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T183f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T183f18(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T248f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].resized_area */
extern T0* T249f2(T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].copy_data */
extern void T249f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_PARENT].move_data */
extern void T249f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].overlapping_move */
extern void T249f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].non_overlapping_move */
extern void T249f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T249c4(T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T183f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T183f6(T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T181f1(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T199c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].force_last */
extern void T264f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].key_storage_put */
extern void T264f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_put */
extern void T264f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_put */
extern void T264f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_item */
extern T6 T264f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].hash_position */
extern T6 T264f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].resize */
extern void T264f44(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_resize */
extern void T264f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].special_integer_ */
extern T0* T264f27(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].key_storage_resize */
extern void T264f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].item_storage_resize */
extern void T264f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T349f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].resized_area */
extern T0* T347f2(T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].copy_data */
extern void T347f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_SELECT].move_data */
extern void T347f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].overlapping_move */
extern void T347f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].non_overlapping_move */
extern void T347f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T347c4(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].key_storage_item */
extern T0* T264f16(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_resize */
extern void T264f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_modulus */
extern T6 T264f19(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_capacity */
extern T6 T264f6(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].item_storage_put */
extern void T264f43(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].search_position */
extern void T264f42(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].unset_found_item */
extern void T264f41(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T258c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T263f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T258f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T258f8(T0* C);
/* GEANT_SELECT_ELEMENT.target_arguments_stack */
extern T0* T258f7(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T258f3(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge148os8347;
extern T0* ge148ov8347;
extern T0* T258f2(T0* C);
/* GEANT_SELECT.make */
extern T0* T263c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T258f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T258f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T258f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T258f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge140os7909;
extern T0* ge140ov7909;
extern T0* T199f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].force_last */
extern void T262f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].key_storage_put */
extern void T262f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_put */
extern void T262f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_put */
extern void T262f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_item */
extern T6 T262f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].hash_position */
extern T6 T262f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].resize */
extern void T262f44(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_resize */
extern void T262f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].special_integer_ */
extern T0* T262f27(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].key_storage_resize */
extern void T262f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].item_storage_resize */
extern void T262f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T343f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].resized_area */
extern T0* T341f2(T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].copy_data */
extern void T341f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_REDEFINE].move_data */
extern void T341f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].overlapping_move */
extern void T341f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].non_overlapping_move */
extern void T341f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T341c4(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].key_storage_item */
extern T0* T262f16(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_resize */
extern void T262f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_modulus */
extern T6 T262f19(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_capacity */
extern T6 T262f6(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].item_storage_put */
extern void T262f43(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].search_position */
extern void T262f42(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].unset_found_item */
extern void T262f41(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T257c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T261f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T257f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T257f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.target_arguments_stack */
extern T0* T257f7(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T257f3(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge144os8343;
extern T0* ge144ov8343;
extern T0* T257f2(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T261c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T257f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T257f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T257f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T257f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge140os7908;
extern T0* ge140ov7908;
extern T0* T199f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].force_last */
extern void T260f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].key_storage_put */
extern void T260f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_put */
extern void T260f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_put */
extern void T260f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_item */
extern T6 T260f10(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].hash_position */
extern T6 T260f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].resize */
extern void T260f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_resize */
extern void T260f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].special_integer_ */
extern T0* T260f28(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].key_storage_resize */
extern void T260f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].item_storage_resize */
extern void T260f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T337f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].resized_area */
extern T0* T335f2(T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].copy_data */
extern void T335f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_RENAME].move_data */
extern void T335f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].overlapping_move */
extern void T335f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].non_overlapping_move */
extern void T335f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T335c4(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].key_storage_item */
extern T0* T260f16(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_resize */
extern void T260f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_modulus */
extern T6 T260f20(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_capacity */
extern T6 T260f7(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].item_storage_put */
extern void T260f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].search_position */
extern void T260f41(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].unset_found_item */
extern void T260f43(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T199f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T199f12(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T199f11(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].has */
extern T1 T260f1(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T256c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T259f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge146os8339;
extern T0* ge146ov8339;
extern T0* T256f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T259f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T256f4(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T256f9(T0* C);
/* GEANT_RENAME_ELEMENT.target_arguments_stack */
extern T0* T256f8(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T256f3(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge146os8338;
extern T0* ge146ov8338;
extern T0* T256f2(T0* C);
/* GEANT_RENAME.make */
extern T0* T259c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T256f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T256f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T256f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T256f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T199f8(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T199f16(T0* C);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge140os7907;
extern T0* ge140ov7907;
extern T0* T199f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T181f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T199f3(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T199f15(T0* C);
/* GEANT_PARENT_ELEMENT.target_arguments_stack */
extern T0* T199f14(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T199f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge140os7905;
extern T0* ge140ov7905;
extern T0* T199f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T181c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].set_key_equality_tester */
extern void T264f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING].internal_set_equality_tester */
extern void T345f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_map_equal */
extern T0* T264c37(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_with_equality_testers */
extern void T264f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING].make */
extern T0* T345c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING].new_cursor */
extern T0* T345f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING].make */
extern T0* T397c3(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_sparse_container */
extern void T264f48(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_slots */
extern void T264f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_clashes */
extern void T264f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_key_storage */
extern void T264f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_item_storage */
extern void T264f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T349f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_SELECT].make_area */
extern T0* T398c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T349c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T344c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].set_key_equality_tester */
extern void T262f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING].internal_set_equality_tester */
extern void T339f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_map_equal */
extern T0* T262c37(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_with_equality_testers */
extern void T262f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING].make */
extern T0* T339c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING].new_cursor */
extern T0* T339f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING].make */
extern T0* T395c3(T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_sparse_container */
extern void T262f48(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_slots */
extern void T262f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_clashes */
extern void T262f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_key_storage */
extern void T262f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_item_storage */
extern void T262f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T343f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_REDEFINE].make_area */
extern T0* T396c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T343c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T338c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].set_key_equality_tester */
extern void T260f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING].internal_set_equality_tester */
extern void T333f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_map_equal */
extern T0* T260c38(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_with_equality_testers */
extern void T260f42(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING].make */
extern T0* T333c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING].new_cursor */
extern T0* T333f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING].make */
extern T0* T393c3(T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_sparse_container */
extern void T260f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_slots */
extern void T260f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_clashes */
extern void T260f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_key_storage */
extern void T260f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_item_storage */
extern void T260f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T337f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_RENAME].make_area */
extern T0* T394c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T337c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T332c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T199f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T199f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T199f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T199f23(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T116f4(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T116f8(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge134os6513;
extern T0* ge134ov6513;
extern T0* T116f3(T0* C);
/* GEANT_INHERIT.make */
extern T0* T117c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T183c16(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T248f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_PARENT].make_area */
extern T0* T328c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T248c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T116f11(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T116f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T116f13(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T116f15(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge141os2388;
extern T0* ge141ov2388;
extern T0* T30f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T22f34(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T116c9(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T199c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge140os7906;
extern T0* ge140ov7906;
extern T0* T199f2(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T22f33(T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T30f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge141os2387;
extern T0* ge141ov2387;
extern T0* T30f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T22f32(T0* C, T0* a1);
/* GEANT_TARGET.make */
extern T0* T26c80(T0* a1, T0* a2);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T186f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T186f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T186f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T186f1(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T186f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T186c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T186f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T26f15(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge60os1569;
extern T0* ge60ov1569;
extern T0* T26f13(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T26f86(T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T26f11(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern T0* T26f26(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern T0* T26f25(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T26f24(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge62os2231;
extern T0* ge62ov2231;
extern T0* T26f9(T0* C);
/* GEANT_TARGET.set_exports */
extern void T26f85(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].set_equality_tester */
extern void T70f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].put */
extern void T70f29(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING].move_cursors_right */
extern void T70f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_position */
extern void T71f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING].move_right */
extern void T70f33(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING].put_last */
extern void T70f32(T0* C, T0* a1);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge62os2230;
extern T0* ge62ov2230;
extern T0* T26f6(T0* C);
/* GEANT_TARGET.set_description */
extern void T26f84(T0* C, T0* a1);
/* GEANT_TARGET.set_obsolete_message */
extern void T26f83(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T26f82(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge62os2228;
extern T0* ge62ov2228;
extern T0* T26f2(T0* C);
/* GEANT_TARGET.make */
extern void T26f80p1(T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T26f88(T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T26f87(T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T26f89(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].set_key_equality_tester */
extern void T31f44(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_map */
extern T0* T31c43(T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_with_equality_testers */
extern void T31f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING].make */
extern T0* T120c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING].new_cursor */
extern T0* T120f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING].make */
extern T0* T201c3(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_sparse_container */
extern void T31f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_slots */
extern void T31f62(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_clashes */
extern void T31f61(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_key_storage */
extern void T31f60(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_item_storage */
extern void T31f59(T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T30f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T30f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge141os2390;
extern T0* ge141ov2390;
extern T0* T30f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T22f30(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge141os2386;
extern T0* ge141ov2386;
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
extern void T25f58(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T25f61(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T25f69(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T25f68(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T25f67(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T25f66(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T25f74(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T25f36(T0* C);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T25f73(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T25f72(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T25f71(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T25f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T25f15(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T25f65(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T25f63(T0* C);
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
extern T1 T95f3(T0* C, T0* a1);
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
extern unsigned char ge141os2385;
extern T0* ge141ov2385;
extern T0* T30f2(T0* C);
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
extern T0* T90f4(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T89f1(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T89f205(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T89f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T89f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T89f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T89f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T89f223(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T89f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T89f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T167f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T139f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T165f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T150f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].copy_data */
extern void T150f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_EXTERNAL_ID].move_data */
extern void T150f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].overlapping_move */
extern void T150f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].non_overlapping_move */
extern void T150f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T150c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T165f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T235c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T165c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T139f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T89f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T139c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T89f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].force */
extern void T132f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].key_storage_put */
extern void T132f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_put */
extern void T132f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_put */
extern void T132f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_item */
extern T6 T132f17(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_item */
extern T6 T132f16(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].hash_position */
extern T6 T132f13(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].resize */
extern void T132f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_resize */
extern void T132f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].special_integer_ */
extern T0* T132f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].key_storage_resize */
extern void T132f57(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item_storage_resize */
extern void T132f56(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T217f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T212f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].copy_data */
extern void T212f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].move_data */
extern void T212f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].overlapping_move */
extern void T212f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].non_overlapping_move */
extern void T212f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T212c4(T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].key_storage_item */
extern T0* T132f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_resize */
extern void T132f55(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_modulus */
extern T6 T132f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_capacity */
extern T6 T132f12(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item_storage_put */
extern void T132f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].search_position */
extern void T132f41(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].unset_found_item */
extern void T132f44(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].has */
extern T1 T132f1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T170c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T170f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T134c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T170f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T170f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T170f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T170f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T170f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER].make */
extern T0* T208c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T170f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T170f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T170f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T170f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T170f32(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T170f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T170f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1392os6561;
extern T0* ge1392ov6561;
extern T0* T170f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T170f53(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1392os6560;
extern T0* ge1392ov6560;
extern T0* T170f48(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1392os6559;
extern T0* ge1392ov6559;
extern T0* T170f46(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1392os6558;
extern T0* ge1392ov6558;
extern T0* T170f44(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1392os6557;
extern T0* ge1392ov6557;
extern T0* T170f42(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1392os6554;
extern T0* ge1392ov6554;
extern T0* T170f40(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T170f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T170f223(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
extern void T246f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER].subcopy */
extern void T191f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge166os2937;
extern T0* ge166ov2937;
extern T0* T170f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T246c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T170f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1392os6551;
extern T0* ge1392ov6551;
extern T0* T170f38(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T170f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T170f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T170f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T203c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T170f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T164f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T89f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T164c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T164f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T164f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T164f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T164f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T164f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T164f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T164f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T164f32(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T164f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T164f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T164f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T164f52(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T164f46(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T164f44(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T164f42(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T164f40(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T164f38(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T164f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T164f219(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T164f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T164f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T164f36(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T164f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T164f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T164f6(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T89f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T167f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T89f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T89f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T164c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T143f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T143f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T143f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T143f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].resize */
extern T0* T163f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING]].resized_area */
extern T0* T162f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING]].copy_data */
extern void T162f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [STRING]].move_data */
extern void T162f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING]].overlapping_move */
extern void T162f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING]].non_overlapping_move */
extern void T162f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING]].make */
extern T0* T162c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].make */
extern T0* T163f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING]].make_area */
extern T0* T234c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].default_create */
extern T0* T163c3(void);
/* DS_BILINKED_LIST [STRING].force_last */
extern void T144f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].put_right */
extern void T226f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].attach_left */
extern void T226f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].make */
extern T0* T226c4(T0* a1);
/* DS_BILINKED_LIST [STRING].is_empty */
extern T1 T144f3(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T89f162(T0* C);
/* DS_BILINKED_LIST [STRING].set_equality_tester */
extern void T144f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T89f180(T0* C);
/* DS_BILINKED_LIST [STRING].make */
extern T0* T144c11(void);
/* DS_BILINKED_LIST [STRING].new_cursor */
extern T0* T144f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].make */
extern T0* T225c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T143f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T143f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1304os7420;
extern T0* ge1304ov7420;
extern T0* T143f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T143f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T143f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T143f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T143f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T143f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T143f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T143f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T89f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T143c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T161f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T159f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].copy_data */
extern void T159f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].move_data */
extern void T159f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].overlapping_move */
extern void T159f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].non_overlapping_move */
extern void T159f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T159c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T161f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T233c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T161c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T143f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T143f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T143f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T143f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T143f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T143f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T160f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T157f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].copy_data */
extern void T157f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].move_data */
extern void T157f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].overlapping_move */
extern void T157f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].non_overlapping_move */
extern void T157f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T157c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T160f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T232c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T160c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T142f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T223f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T223f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T223c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T142f3(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T89f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T142c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T142f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T222c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T89f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T222f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T142f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T142f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T222f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T142f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T222f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T89f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T167f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T222f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T222f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T142f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T142f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T141f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T141c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T141f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T141f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T141f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T141f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T141f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T141f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T221c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T221f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T269c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T141c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T221f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T270f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T270f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T270c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T221f3(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T141c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T221f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T89f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T141c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T89f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T141f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T141f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T141c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T141f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T155f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T154f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].copy_data */
extern void T154f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].move_data */
extern void T154f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].overlapping_move */
extern void T154f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].non_overlapping_move */
extern void T154f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T154c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T155f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T231c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T155c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T141c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T141f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T89f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T167f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T89f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T140f1(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T140f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T140f11(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T140f12(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T137f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T137f13(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING].item */
extern T0* T144f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T219f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T140f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T140f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T140f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T140f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T153f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T152f2(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].copy_data */
extern void T152f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].move_data */
extern void T152f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].overlapping_move */
extern void T152f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].non_overlapping_move */
extern void T152f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T152c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T153f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T230c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T153c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T140f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T140f39(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T140f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T140f37(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T140f36(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T140f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T140f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T140f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T140f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T140f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T140f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T140f7(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T140f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T89f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T140c31(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T219c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T140f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T140f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T220c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T140f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T140f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T140f41(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T140f40(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T89f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T89f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T137f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].forth */
extern void T225f9(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_forth */
extern void T144f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].add_traversing_cursor */
extern void T144f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T225f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].remove_traversing_cursor */
extern void T144f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set */
extern void T225f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING].item */
extern T0* T225f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].start */
extern void T225f8(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_start */
extern void T144f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].cursor_off */
extern T1 T144f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T137f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T137f16(T0* C);
/* DS_BILINKED_LIST [STRING].last */
extern T0* T144f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T137f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T137f15(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T89f242(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T137f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T137f14(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T137f8(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T151f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T149f3(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].copy_data */
extern void T149f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [BOOLEAN].move_data */
extern void T149f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].overlapping_move */
extern void T149f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].non_overlapping_move */
extern void T149f9(T0* C, T6 a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T151f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T229c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T151c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T89f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T134f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1390os4984;
extern T0* ge1390ov4984;
extern T0* T89f23(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T168c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T168f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T168f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T168f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T168f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T168f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T168f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T168f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T168f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T168f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T168f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T168f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T168f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T168f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T168f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T168f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T168f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T168f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T168f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T168f226(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T168f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T168f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T168f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T168f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T168f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T168f16(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T130f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T134f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T89f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T134f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T134f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T139f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T89f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T167f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T89f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T167f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T167c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T138f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T138f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T138f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T148f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T147f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].copy_data */
extern void T147f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_DECLARATION].move_data */
extern void T147f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].overlapping_move */
extern void T147f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].non_overlapping_move */
extern void T147f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T147c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T148f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T228c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T148c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T138c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T138f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T89f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T89f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T89f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T89f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T167f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T89f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T89f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T167f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T89f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T89f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T89f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T89f200(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f51(T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T134f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T194f29(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T194f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].item */
extern T2 T252f2(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T194f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T55f27(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T194f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].remove */
extern void T252f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].wipe_out */
extern void T252f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T194f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T194f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T194f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER].force */
extern void T252f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER].put_right */
extern void T331f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].is_empty */
extern T1 T252f4(T0* C);
/* DS_LINKABLE [CHARACTER].make */
extern T0* T331c3(T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T192f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T192f29(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T194f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T75f21(T0* C, T0* a1);
/* UC_UTF8_STRING.old_clear_all */
extern void T193f86(T0* C);
/* STRING_8.clear_all */
extern void T17f54(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T194f4(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1385os7748;
extern T0* ge1385ov7748;
extern T0* T194f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T253f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T253f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T253f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T253f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T253f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge232os4788;
extern T0* ge232ov4788;
extern T0* T194f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T253c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T194f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T194f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T194f34(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T353f9(T0* C);
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
extern void T194f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T192f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T192f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T253f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T253f1(T0* C, T6 a1, T6 a2);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge301os7809;
extern T6 ge301ov7809;
extern T6 T196f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T6 T196f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T195f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T89f201(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T194c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].make */
extern T0* T252c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T134f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T164f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T170f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T170f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item */
extern T0* T132f2(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item_storage_item */
extern T0* T132f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T89f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T89f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T89f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T89f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T89f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T89f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T89f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T89f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T193c54(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T193f62(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T192f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T192f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T192f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T192f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T89f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T89f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T89f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T89f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T89f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1390os5052;
extern T0* ge1390ov5052;
extern T0* T89f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1390os5053;
extern T0* ge1390ov5053;
extern T0* T89f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T89f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T193c58(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T146f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T145f2(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].copy_data */
extern void T145f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].move_data */
extern void T145f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].overlapping_move */
extern void T145f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].non_overlapping_move */
extern void T145f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T145c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T146f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T227c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T146c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T89f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T137f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T137f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T137f1(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T89f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T137f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T137c20(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T137c18(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T89f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T89f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T89f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T89f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T89f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T89f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T89f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T164f221(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T170f225(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T164f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T170f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T164f220(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T353c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T192f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T164f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T164f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T170f224(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T170f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T170f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T89f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T89f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T89f29(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T89f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T89f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T89f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T89f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T89f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T147f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING]].clear_all */
extern void T162f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T157f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T159f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T154f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T150f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T152f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T145f6(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T89f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T89f213(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T131c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T89f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T89f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].wipe_out */
extern void T132f38(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_wipe_out */
extern void T132f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_wipe_out */
extern void T132f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].key_storage_wipe_out */
extern void T132f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item_storage_wipe_out */
extern void T132f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].move_all_cursors_after */
extern void T132f43(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_next_cursor */
extern void T215f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_position */
extern void T215f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T89f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T126c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T126f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T126f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T126f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T126f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T126f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T126f182(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T126f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T126f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T126f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T126f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T126f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T126f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T126f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T126f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T126f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T126f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T126f224(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T126f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T126f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T126f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T126f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T126f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T126f15(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T56c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T93f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T174c2(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T239c7(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T239f2(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T276c3(T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T89f204(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T90c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T90f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T173f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T93c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T90f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T96c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T90f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T171c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T89f203(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T89c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T89f20(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].set_key_equality_tester */
extern void T132f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING].internal_set_equality_tester */
extern void T213f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map_default */
extern T0* T132c37(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map */
extern void T132f42(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_with_equality_testers */
extern void T132f54(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T213c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING].new_cursor */
extern T0* T213f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T267c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_cursor */
extern T0* T132f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T215c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_sparse_container */
extern void T132f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_slots */
extern void T132f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_clashes */
extern void T132f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_key_storage */
extern void T132f61(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_item_storage */
extern void T132f60(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T217f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T268c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T217c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].default_capacity */
extern T6 T132f7(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T89f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T89f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1386os4931;
extern T0* ge1386ov4931;
extern T0* T89f50(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T89f182(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1386os4930;
extern T0* ge1386ov4930;
extern T0* T89f48(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1386os4929;
extern T0* ge1386ov4929;
extern T0* T89f46(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1386os4928;
extern T0* ge1386ov4928;
extern T0* T89f44(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1386os4927;
extern T0* ge1386ov4927;
extern T0* T89f42(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1386os4926;
extern T0* ge1386ov4926;
extern T0* T89f40(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1386os4925;
extern T0* ge1386ov4925;
extern T0* T89f38(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1386os4924;
extern T0* ge1386ov4924;
extern T0* T89f36(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1386os4923;
extern T0* ge1386ov4923;
extern T0* T89f34(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1386os4922;
extern T0* ge1386ov4922;
extern T0* T89f32(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T89f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T87f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T87f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T87c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T55f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T55f3(T0* C);
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
extern T1 T55f7(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T84f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T84f4(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2163os3247;
extern T0* ge2163ov3247;
extern T0* T55f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T84c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T84f16(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T84f6(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T55f60(T0* C);
/* UNIX_FILE_INFO.update */
extern void T84f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T84f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T55f6(T0* C);
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
extern T1 T55f2(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T55f8(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T1 T84f2(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T6 T84f5(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.reset */
extern void T55f59(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge282os3771;
extern T0* ge282ov3771;
extern T0* T53f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T54f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T54f6(T0* C);
/* GEANT.default_build_filename */
extern unsigned char ge53os1564;
extern T0* ge53ov1564;
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
extern T0* T25c57(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge58os1698;
extern T0* ge58ov1698;
extern T0* T25f8(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge58os1697;
extern T0* ge58ov1697;
extern T0* T25f7(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge58os1696;
extern T0* ge58ov1696;
extern T0* T25f6(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge58os1695;
extern T0* ge58ov1695;
extern T0* T25f5(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge58os1694;
extern T0* ge58ov1694;
extern T0* T25f4(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T29f31(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge60os1570;
extern T0* ge60ov1570;
extern T0* T25f3(T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T25f40(T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T25f42(T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T25f41(T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T25f39(T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge58os1693;
extern T0* ge58ov1693;
extern T0* T25f2(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T25f1(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T25f57p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T25f60(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T25f59(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T25f62(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T25f70(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T25f78(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T25f77(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T25f76(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T25f75(T0* C, T6 a1);
/* GEANT_VARIABLES.set_variable_value */
extern void T29f45(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force */
extern void T29f46(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T29f55(T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T29f54(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T29f53(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T29f52(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T29f60(T0* C, T6 a1);
/* GEANT_VARIABLES.key_storage_resize */
extern void T29f59(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T29f58(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T29f57(T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T29f5(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T29f51(T0* C, T0* a1, T6 a2);
/* GEANT.default_builtin_variables */
extern T0* T21f4(T0* C);
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
/* DS_ARRAYED_LIST [STRING].first */
extern T0* T70f5(T0* C);
/* GEANT.commandline_variables */
extern T0* T21f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].forth */
extern void T71f9(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_forth */
extern void T70f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].add_traversing_cursor */
extern void T70f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_next_cursor */
extern void T71f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].remove_traversing_cursor */
extern void T70f36(T0* C, T0* a1);
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
extern T0* T40f14(T0* C);
/* AP_ERROR.message */
extern T0* T40f15(T0* C, T0* a1);
/* AP_ERROR.arguments */
extern unsigned char ge219os1589;
extern T0* ge219ov1589;
extern T0* T40f17(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c4(void);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* ARRAY [STRING].valid_index */
extern T1 T33f5(T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T40f16(T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T40c18(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T34f46(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST_CURSOR [STRING].item */
extern T0* T71f2(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_item */
extern T0* T70f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].after */
extern T1 T71f1(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_after */
extern T1 T70f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].start */
extern void T71f8(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_start */
extern void T70f30(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].is_empty */
extern T1 T70f20(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].off */
extern T1 T71f4(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_off */
extern T1 T70f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].cursor_before */
extern T1 T70f15(T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T21f27(T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T37f2(T0* C);
/* DS_ARRAYED_LIST [STRING].last */
extern T0* T70f2(T0* C);
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
/* AP_PARSER.check_mandatory_options */
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
extern void T73f23(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T73f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T103f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T73f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T103f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T73f28(T0* C, T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T40c19(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T36f6(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T36f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T73f2(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T73f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T73f11(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T36f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T36f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T73f1(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T73f5(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T36f15(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T36f17(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T36f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T73f22(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T73f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T73f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T103f2(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_off */
extern T1 T73f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_before */
extern T1 T73f19(T0* C, T0* a1);
/* AP_PARSER.parse_argument */
extern void T38f33(T0* C);
/* AP_PARSER.parse_short */
extern void T38f36(T0* C);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T40c21(T0* a1);
/* DS_ARRAYED_LIST [STRING].off */
extern T1 T70f7(T0* C);
/* AP_ERROR.make_unknown_option_error */
extern T0* T40c20(T0* a1);
/* CHARACTER_8.out */
extern T0* T2f1(T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T74f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T74f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T107f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T74f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T107f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T74f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T74f2(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T74f5(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item */
extern T0* T74f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T74f1(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T74f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T74f20(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T74f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T74f15(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T107f2(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_off */
extern T1 T74f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_before */
extern T1 T74f17(T0* C, T0* a1);
/* AP_PARSER.parse_long */
extern void T38f35(T0* C);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T40c22(T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T38f23(T0* C);
/* DS_ARRAYED_LIST [STRING].forth */
extern void T70f26(T0* C);
/* DS_ARRAYED_LIST [STRING].item_for_iteration */
extern T0* T70f6(T0* C);
/* DS_ARRAYED_LIST [STRING].after */
extern T1 T70f4(T0* C);
/* DS_ARRAYED_LIST [STRING].start */
extern void T70f25(T0* C);
/* AP_PARSER.reset_parser */
extern void T38f32(T0* C);
/* AP_PARSER.all_options */
extern T0* T38f17(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T73f3(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T73c20(T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T73f14(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T103c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T106f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_OPTION].make_area */
extern T0* T178c2(T6 a1);
/* SPECIAL [AP_OPTION].make */
extern T0* T105c4(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T106c3(void);
/* AP_ERROR_HANDLER.reset */
extern void T45f10(T0* C);
/* DS_ARRAYED_LIST [STRING].force */
extern void T70f24(T0* C, T0* a1, T6 a2);
/* AP_PARSER.arguments */
extern T0* T38f11(T0* C);
/* AP_STRING_OPTION.make */
extern T0* T37c23(T2 a1, T0* a2);
/* AP_STRING_OPTION.initialize */
extern void T37f25(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T37f25p1(T0* C);
/* AP_STRING_OPTION.set_long_form */
extern void T37f26(T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T37f24(T0* C, T2 a1);
/* AP_FLAG.make */
extern T0* T35c18(T2 a1, T0* a2);
/* AP_FLAG.initialize */
extern void T35f20(T0* C);
/* AP_FLAG.set_long_form */
extern void T35f19(T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T35f21(T0* C, T2 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T74f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T74f22(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern T0* T109f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].resized_area */
extern T0* T108f3(T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].copy_data */
extern void T108f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].move_data */
extern void T108f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].overlapping_move */
extern void T108f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].non_overlapping_move */
extern void T108f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T108c4(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T74f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T74f12(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T36c11(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T36f14(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T36f4(T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T69c6(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T36f13(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T36f12(T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T35f17(T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T35c16(T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T73f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T73f24(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].resize */
extern T0* T106f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].resized_area */
extern T0* T105f3(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].copy_data */
extern void T105f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_OPTION].move_data */
extern void T105f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].overlapping_move */
extern void T105f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].non_overlapping_move */
extern void T105f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T73f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T73f15(T0* C, T6 a1);
/* AP_STRING_OPTION.set_parameter_description */
extern void T37f22(T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T37f21(T0* C, T0* a1);
/* AP_STRING_OPTION.make_with_short_form */
extern T0* T37c20(T2 a1);
/* AP_PARSER.set_parameters_description */
extern void T38f27(T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T38f26(T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T38c25(void);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T72f35(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T72c34(T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T72f38(T0* C);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T72f37(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T72f36(T0* C, T2 a1);
/* AP_PARSER.make_empty */
extern void T38f30(T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T45c7(void);
/* AP_ERROR_HANDLER.std */
extern T0* T45f3(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T74c18(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T74f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T107c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T109f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_area */
extern T0* T179c2(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T109c3(void);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T21f1(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T515f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T487f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T487f12p1(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T513f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T511f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T487f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T487f11p1(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.execute */
extern void T304f30(T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T388f37(T0* C);
/* GEANT_FILESET.forth */
extern void T360f37(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T360f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T360f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T25f84(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T25f88(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T25f90(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T25f92(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_position */
extern void T64f10(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T25f91(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T25f89(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T360f24(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T407f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T407f7(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T407f40(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T407f45(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T407f58(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T431f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T407f57(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T431f5(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T407f26(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T388f40(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T53f42(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T352f47(T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T54f28(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T83f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T53f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T53f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T83f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T83f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T83f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T352f26(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T352f30(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T352f29(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T352f28(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T352f50(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T352f53(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T352f54(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T54f38(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T388f18(T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T388f25(T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T388f24(T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T360f23(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T413f7(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T413f9(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T413f8(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T413f11(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T413f10(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T407f2(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T407f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T407f9(T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T360f22(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T413f6(T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T388f17(T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T360f3(T0* C);
/* GEANT_FILESET.after */
extern T1 T360f2(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T407f1(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T407f5(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T360f36(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T407f39(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T407f44(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T407f25(T0* C);
/* GEANT_FILESET.execute */
extern void T360f35(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T360f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T407f42(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T407f52(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T407f65(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T407f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T407f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T407f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T407f64(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T407f67(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T407f66(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T407f63(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T407f31(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T407f19(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T407f17(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T413f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T407f32(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T407f47(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T433f1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T413f4(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T413f5(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T413c12(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING].forth */
extern void T411f8(T0* C);
/* DS_HASH_SET [STRING].cursor_forth */
extern void T409f52(T0* C, T0* a1);
/* DS_HASH_SET [STRING].add_traversing_cursor */
extern void T409f54(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_next_cursor */
extern void T411f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING].remove_traversing_cursor */
extern void T409f53(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_position */
extern void T411f9(T0* C, T6 a1);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T360f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T407f41(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T407f49(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T407f62(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T407f61(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T407f60(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].resize */
extern T0* T434f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].resized_area */
extern T0* T432f3(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].copy_data */
extern void T432f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_FILESET_ENTRY].move_data */
extern void T432f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].overlapping_move */
extern void T432f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].non_overlapping_move */
extern void T432f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T407f59(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T407f16(T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T360f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T53f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T55f40(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T55f42(T0* C);
/* UNIX_FILE_INFO.date */
extern T6 T84f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T54f30(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T53f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T55f39(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T54f26(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T404f2(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T193f85(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f58(T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T193f84(T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f57(T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T404f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T404f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T422f5(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T422f303(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T422f315(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T422f328(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T422f149(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T422f231(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T422f295(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T422f294(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge491os10119;
extern T6 ge491ov10119;
extern T6 T422f60(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T422f194(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T422f293(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T443f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T422f292(T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T443f5(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T422f291(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T422f297(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge497os10286;
extern T0* ge497ov10286;
extern T0* T422f150(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T445c4(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T445f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T445f9(T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T445f5(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T445c5(void);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge171os1946;
extern T0* ge171ov1946;
extern T0* T445f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge497os10278;
extern T0* ge497ov10278;
extern T0* T422f166(T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T445f1(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T422f326(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T422f84(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T422f83(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T422f82(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T422f335(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T422f334(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T422f290(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T443f2(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T422f288(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T422f269(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T443f3(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T422f14(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T444f2(T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T444f1(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T422f53(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T422f316(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T422f329(T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T422f52(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T422f7(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T422f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T422f302(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T422f1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T422f299(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T422f299p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T422f314(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T422f49(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T422f189(T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T422f48(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T422f313(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T422f47(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T422f45(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T422f130(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T422f128(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T422f126(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T422f312(T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T443f18(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T422f65(T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T443f17(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T422f327(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge497os10287;
extern T0* ge497ov10287;
extern T0* T422f146(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge491os10120;
extern T6 ge491ov10120;
extern T6 T422f145(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T443f19(T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T443f25(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T443f24(T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T443f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T422f140(T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T422f221(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge497os10280;
extern T0* ge497ov10280;
extern T0* T422f243(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T422f220(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T422f216(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T422f133(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T422f325(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T422f131(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T422f129(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T422f127(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T422f108(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T422f332(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T443f23(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T443f22(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T443f21(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T422f333(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T422f331(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T443f20(T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T443f26(T0* C, T6 a1);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T443f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T445f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T445f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T448f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge497os10289;
extern T0* ge497ov10289;
extern T0* T422f158(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge497os10274;
extern T0* ge497ov10274;
extern T0* T422f28(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge497os10284;
extern T0* ge497ov10284;
extern T0* T422f242(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge497os10283;
extern T0* ge497ov10283;
extern T0* T422f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge497os10282;
extern T0* ge497ov10282;
extern T0* T422f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge497os10281;
extern T0* ge497ov10281;
extern T0* T422f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge497os10285;
extern T0* ge497ov10285;
extern T0* T422f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge497os10279;
extern T0* ge497ov10279;
extern T0* T422f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge497os10275;
extern T0* ge497ov10275;
extern T0* T422f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge497os10276;
extern T0* ge497ov10276;
extern T0* T422f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge497os10277;
extern T0* ge497ov10277;
extern T0* T422f233(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T422f156(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge497os10288;
extern T0* ge497ov10288;
extern T0* T422f234(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T422f154(T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T445f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge491os10118;
extern T0* ge491ov10118;
extern T0* T422f151(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T422f86(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T422f330(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T422f62(T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T443f16(T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T443f15(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T422f311(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T422f310(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T443f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T422f309(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T422f309p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T422c298(void);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T422f298p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T422f308(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T422f324(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T422f323(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T422f322(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T422f321(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T422f320(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T422f319(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T422f318(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T422f317(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T422f301(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T422f300(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T422f307(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T422f306(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge497os10273;
extern T0* ge497ov10273;
extern T0* T422f27(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T444c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T444f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T444f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T444f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T444f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T422f305(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T422f305p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern */
extern unsigned char ge491os10117;
extern T0* ge491ov10117;
extern T0* T422f26(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T443c13(T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge136os9535;
extern T0* ge136ov9535;
extern T0* T404f8(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge136os9533;
extern T0* ge136ov9533;
extern T0* T404f7(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T404f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge136os9532;
extern T0* ge136ov9532;
extern T0* T404f6(T0* C);
/* GEANT_MAP.string_ */
extern T0* T404f4(T0* C);
/* GEANT_MAP.is_executable */
extern T1 T404f1(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge136os9534;
extern T0* ge136ov9534;
extern T0* T404f9(T0* C);
/* DS_HASH_SET_CURSOR [STRING].item */
extern T0* T411f2(T0* C);
/* DS_HASH_SET [STRING].cursor_item */
extern T0* T409f28(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].after */
extern T1 T411f1(T0* C);
/* DS_HASH_SET [STRING].cursor_after */
extern T1 T409f27(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].start */
extern void T411f7(T0* C);
/* DS_HASH_SET [STRING].cursor_start */
extern void T409f51(T0* C, T0* a1);
/* DS_HASH_SET [STRING].cursor_off */
extern T1 T409f33(T0* C, T0* a1);
/* DS_HASH_SET [STRING].is_empty */
extern T1 T409f32(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T360f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T352f40(T0* C);
/* KL_DIRECTORY.old_close */
extern void T352f43(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T352f22(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T352f44(T0* C, T14 a1);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T412f2(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T412f7(T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T53f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T352f24(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T352f14(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T352f25(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T54f29(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T360f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T352f39(T0* C);
/* KL_DIRECTORY.readentry */
extern void T352f42(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T352f21(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T352f17(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T352f9(T0* C);
/* KL_DIRECTORY.is_closed */
extern T1 T352f12(T0* C);
/* KL_DIRECTORY.open_read */
extern void T352f38(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T352f41(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T352f19(T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T360f21(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T360f19(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T360f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T360f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T360f1(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T360f4(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T388f39(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T388f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T418f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T418f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T418f33(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T418f26(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T418f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T418f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T418f9(T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T75f16(T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T75f17(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T75f18(T0* C);
/* STRING_8.substring_index */
extern T6 T17f31(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T493f1(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T493f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* NATURAL_32.to_integer_32 */
extern T6 T10f9(T10* C);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T493f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER].fill_with */
extern void T63f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2180os1254;
extern T0* ge2180ov1254;
extern T0* T17f32(T0* C);
/* STRING_SEARCHER.make */
extern T0* T493c5(void);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T75f15(T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T388f23(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T193f52(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T418f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T418f3(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T418f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T418f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T418f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T418f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T418f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T418f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T418f17(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T418f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T418f20(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T418c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T418f27(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge89os9038;
extern T0* ge89ov9038;
extern T0* T388f22(T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T55f67(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T55f32(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge292os3942;
extern T0* ge292ov3942;
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
extern unsigned char ge89os9037;
extern T0* ge89ov9037;
extern T0* T388f20(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T388f42(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T422f6(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T422f304(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T388f41(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T25f87(T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T25f56(T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T25f55(T0* C);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T25f54(T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T25f86(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T193f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T193f53(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f30(T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T388f5(T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T388f9(T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T304f32(T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T304f24(T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T304f23(T0* C);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T304f22(T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T304f21(T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T304f28(T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T304f27(T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T304f26(T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T303f31(T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T387f20(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T422f2(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].has */
extern T1 T224f3(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T387f12(T0* C);
/* KL_STDIN_FILE.read_line */
extern void T424f15(T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T424f18(T0* C, T2 a1);
/* KL_LINKABLE [CHARACTER].put_right */
extern void T85f4(T0* C, T0* a1);
/* KL_LINKABLE [CHARACTER].make */
extern T0* T85c3(T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T424f17(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T424f21(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T424f12(T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T424f7(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T424f13(T0* C, T14 a1);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge205os2966;
extern T0* ge205ov2966;
extern T0* T387f11(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T424c14(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T424f16(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T424f20(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T424f5(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T424f19(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.output */
extern T0* T387f10(T0* C);
/* DS_LINKED_LIST [STRING].set_equality_tester */
extern void T224f12(T0* C, T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T371c11(T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T303f33(T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T303f22(T0* C);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T303f20(T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T303f19(T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T303f29(T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T303f28(T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T303f27(T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T302f25(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T386f18(T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T386f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T386f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T386f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T386f11(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T302f27(T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T302f19(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T302f18(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T302f17(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T302f16(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T302f23(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T302f22(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T302f21(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T301f27(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T385f8(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T301f18(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T301f17(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T301f25(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T301f24(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T301f23(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T300f22(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T384f7(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T300f24(T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T300f16(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T300f15(T0* C);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T300f14(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T300f13(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T300f20(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T300f19(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T300f18(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T299f27(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T383f25(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T383f15(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T383f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T383f12(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T383f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T383f16(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T383f4(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T299f29(T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T299f21(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T299f20(T0* C);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T299f19(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T299f18(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T299f25(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T299f24(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T299f23(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T298f40(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T380f37(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T380f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T380f44(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T402f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T402f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T402f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T402f9(T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2299os4792;
extern T0* ge2299ov4792;
extern T0* T402f8(T0* C);
/* DP_SHELL_COMMAND.get */
extern T0* T402f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T402f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T402c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T402f3(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].item */
extern T0* T382f2(T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T380f21(T0* C);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T380f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T380f41(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T380f40(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T380f20(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T29f71(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T380f19(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T380f18(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T380f23(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T380f22(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T298f42(T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T298f32(T0* C);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T298f30(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T298f29(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T298f38(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T298f37(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T298f36(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T297f23(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T379f10(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T98f8(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.put */
extern void T98f9(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T98f6(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T180f4(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].force */
extern void T452f25(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].add_space */
extern void T452f28(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].accommodate */
extern void T452f29(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_deleted_marks */
extern void T452f33(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_keys */
extern void T452f32(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_content */
extern void T452f31(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].put */
extern void T452f30(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].set_conflict */
extern void T452f34(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].found */
extern T1 T452f21(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].occupied */
extern T1 T452f20(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_key_equality_tester */
extern void T452f26(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].make_map */
extern T0* T452c24(T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING].make */
extern void T452f24p1(T0* C, T6 a1);
/* SPECIAL [C_STRING].make */
extern T0* T499c2(T6 a1);
/* PRIMES.higher_prime */
extern T6 T498f1(T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T498f3(T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T498c5(void);
/* GE_HASH_TABLE [C_STRING, STRING].soon_full */
extern T1 T452f15(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].not_found */
extern T1 T452f14(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].internal_search */
extern void T452f27(T0* C, T0* a1);
/* GE_STRING_EQUALITY_TESTER.test */
extern T1 T494f1(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2149os4802;
extern T0* ge2149ov4802;
extern T0* T98f4(T0* C);
/* GE_STRING_EQUALITY_TESTER.default_create */
extern T0* T494c2(void);
/* C_STRING.make */
extern T0* T180c10(T0* a1);
/* C_STRING.set_string */
extern void T180f11(T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T180f12(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T247f11(T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f8(T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f10(T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f7(T10* C);
/* MANAGED_POINTER.resize */
extern void T247f10(T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f7(T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f9(T14* C, T14 a1, T6 a2, T6 a3);
/* POINTER.memory_realloc */
extern T14 T14f4(T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f6(T14* C, T14 a1, T6 a2);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T379f6(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T297f25(T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T297f17(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T297f16(T0* C);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T297f15(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T297f14(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T297f21(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T297f20(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T297f19(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T296f25(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T378f20(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T378f24(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T378f12(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T378f14(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T378f13(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T378f4(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T378f23(T0* C, T0* a1, T0* a2);
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
extern T6 T84f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T55f52(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T55f44(T0* C);
/* UNIX_FILE_INFO.inode */
extern T6 T84f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge281os3962;
extern T0* ge281ov3962;
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
extern T0* T378f11(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T378f22(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T378f5(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T296f27(T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T296f19(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T296f18(T0* C);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T296f17(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T296f16(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T296f23(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T296f22(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T296f21(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T295f30(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T377f24(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T377f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T377f14(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T377f17(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T377f16(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T377f5(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T377f27(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T53f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T55f69(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T450f36(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T450f39(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T450f40(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T451f22(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T451f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T451f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T451f21(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T451f25(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T451f27(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T451f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T450f35(T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T450f19(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T450f32(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T450f30(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T450f18(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T450f29(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T450f17(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T450f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T451f1(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T451f2(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T451f20(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T451f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T451f18(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T451f24(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T451f15(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T451f24p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T451f17(T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T451c19(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T451f23(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T450f1(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T450f4(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T450f34(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T450f16(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T450f27(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T450f38(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T450f22(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T450f38p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T450f24(T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T450f15(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T450f26(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T450f41(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T450f14(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T450f25(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T450c33(T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T450f37(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T450f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T54f39(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T377f15(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T377f13(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T377f26(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T377f6(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T295f32(T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T295f21(T0* C);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T295f19(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T295f18(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T295f28(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T295f27(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T295f26(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T294f25(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T374f22(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T376f24(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T376f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T376f3(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T376f2(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T376f23(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T376f22(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T376f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T376f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T376f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T376f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T376f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T376f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T376f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T376f13(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T376f1(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T374f8(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T374f7(T0* C);
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
extern T1 T374f5(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T53f40(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T352f45(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T352f48(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T352f49(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T352f52(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T352f32(T0* C);
/* KL_DIRECTORY.count */
extern T6 T352f34(T0* C);
/* DIRECTORY.close */
extern void T456f18(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T456f8(T0* C);
/* DIRECTORY.dir_close */
extern void T456f23(T0* C, T14 a1);
/* DIRECTORY.readentry */
extern void T456f17(T0* C);
/* DIRECTORY.dir_next */
extern T0* T456f7(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T456f16(T0* C);
/* DIRECTORY.dir_rewind */
extern void T456f22(T0* C, T14 a1);
/* DIRECTORY.make_open_read */
extern T0* T456c15(T0* a1);
/* DIRECTORY.open_read */
extern void T456f21(T0* C);
/* DIRECTORY.dir_open */
extern T14 T456f10(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T456f13(T0* C, T0* a1);
/* DIRECTORY.make */
extern T0* T456c13(T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T352f51(T0* C);
/* ARRAYED_LIST [STRING].forth */
extern void T457f14(T0* C);
/* RAW_FILE.delete */
extern void T455f11(T0* C);
/* RAW_FILE.file_unlink */
extern void T455f13(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T1 T455f4(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T1 T84f13(T0* C);
/* RAW_FILE.buffered_file_info */
extern T0* T455f7(T0* C);
/* RAW_FILE.set_buffer */
extern void T455f12(T0* C);
/* DIRECTORY.recursive_delete */
extern void T456f14(T0* C);
/* DIRECTORY.delete */
extern void T456f20(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T456f24(T0* C, T14 a1);
/* DIRECTORY.is_empty */
extern T1 T456f5(T0* C);
/* DIRECTORY.count */
extern T6 T456f12(T0* C);
/* DIRECTORY.delete_content */
extern void T456f19(T0* C);
/* DIRECTORY.linear_representation */
extern T0* T456f9(T0* C);
/* ARRAYED_LIST [STRING].extend */
extern void T457f15(T0* C, T0* a1);
/* ARRAYED_LIST [STRING].force_i_th */
extern void T457f18(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING].put_i_th */
extern void T457f21(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING].auto_resize */
extern void T457f20(T0* C, T6 a1, T6 a2);
/* ARRAYED_LIST [STRING].capacity */
extern T6 T457f10(T0* C);
/* ARRAYED_LIST [STRING].make_area */
extern void T457f19(T0* C, T6 a1);
/* ARRAYED_LIST [STRING].additional_space */
extern T6 T457f9(T0* C);
/* ARRAYED_LIST [STRING].empty_area */
extern T1 T457f8(T0* C);
/* ARRAYED_LIST [STRING].set_count */
extern void T457f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING].make */
extern T0* T457c12(T6 a1);
/* ARRAYED_LIST [STRING].array_make */
extern void T457f17(T0* C, T6 a1, T6 a2);
/* RAW_FILE.is_directory */
extern T1 T455f3(T0* C);
/* UNIX_FILE_INFO.is_directory */
extern T1 T84f12(T0* C);
/* RAW_FILE.is_symlink */
extern T1 T455f2(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T1 T84f11(T0* C);
/* RAW_FILE.exists */
extern T1 T455f1(T0* C);
/* RAW_FILE.file_exists */
extern T1 T455f6(T0* C, T14 a1);
/* RAW_FILE.make */
extern T0* T455c10(T0* a1);
/* FILE_NAME.set_file_name */
extern void T454f10(T0* C, T0* a1);
/* FILE_NAME.set_count */
extern void T454f15(T0* C, T6 a1);
/* FILE_NAME.c_strlen */
extern T6 T454f4(T0* C, T14 a1);
/* FILE_NAME.eif_append_file_name */
extern void T454f14(T0* C, T14 a1, T14 a2, T14 a3);
/* FILE_NAME.resize */
extern void T454f13(T0* C, T6 a1);
/* FILE_NAME.capacity */
extern T6 T454f2(T0* C);
/* FILE_NAME.make_from_string */
extern T0* T454c9(T0* a1);
/* FILE_NAME.append */
extern void T454f12(T0* C, T0* a1);
/* FILE_NAME.additional_space */
extern T6 T454f6(T0* C);
/* FILE_NAME.string_make */
extern void T454f11(T0* C, T6 a1);
/* FILE_NAME.make_area */
extern void T454f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING].item */
extern T0* T457f2(T0* C);
/* ARRAYED_LIST [STRING].after */
extern T1 T457f1(T0* C);
/* ARRAYED_LIST [STRING].start */
extern void T457f13(T0* C);
/* KL_DIRECTORY.linear_representation */
extern T0* T352f33(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T54f36(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T374f14(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T374f13(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T374f16(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T374f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T374f6(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T294f27(T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T294f19(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T294f18(T0* C);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T294f17(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T294f16(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T294f23(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T294f22(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T294f21(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T293f22(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T373f11(T0* C);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T373f6(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T373f5(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T373f8(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T373f7(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T293f24(T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T293f16(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T293f15(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T293f14(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T293f13(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T293f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T293f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T293f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T292f28(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T372f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T418f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T418f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T418f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T418f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T418f28p1(T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T292f17(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T292f16(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T292f26(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T292f25(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T292f24(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T291f34(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T370f29(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T370f34(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T370f18(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T370f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T25f53(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T370f16(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T370f32(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T26f79(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T22f21(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T22f22(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T370f35(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T370f20(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T370f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T370f31(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T370f36(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T370f17(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T25f85(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T370f15(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T370f14(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T370f13(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T370f22(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T370f21(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T370f5(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T291f23(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T291f22(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T291f32(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T291f31(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T291f30(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T290f38(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T369f31(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T369f33(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T369f17(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T369f16(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T369f19(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T369f18(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T369f15(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T290f40(T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T290f31(T0* C);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T290f29(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T290f28(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T290f36(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T290f35(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T290f34(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T289f33(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T368f26(T0* C);
/* GEANT_FILESET.has_map */
extern T1 T360f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T368f29(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T368f16(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T368f15(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T368f14(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T368f18(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T368f17(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T368f5(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T368f28(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T368f13(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T289f35(T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T289f24(T0* C);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T289f22(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T289f21(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T289f31(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T289f30(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T289f29(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T288f33(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T367f26(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T367f28(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T367f14(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T367f13(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T367f12(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T367f16(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T367f15(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T288f35(T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T288f24(T0* C);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T288f22(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T288f21(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T288f31(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T288f30(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T288f29(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T287f36(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T366f32(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T366f34(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T366f17(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T366f16(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T366f19(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T366f18(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T366f15(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T287f38(T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T287f27(T0* C);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T287f25(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T287f24(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T287f34(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T287f33(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T287f32(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T286f34(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T364f27(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T364f29(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T364f17(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T364f16(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T364f19(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T364f18(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T364f8(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T364f7(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T364f6(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T364f15(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T286f36(T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T286f25(T0* C);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T286f23(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T286f22(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T286f32(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T286f31(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T286f30(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T285f22(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T363f7(T0* C);
/* GEANT_UNSET_TASK.exit_application */
extern void T285f24(T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T285f16(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T285f15(T0* C);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T285f14(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T285f13(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T285f20(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T285f19(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T285f18(T0* C);
/* GEANT_SET_TASK.execute */
extern void T284f23(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T362f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T284f25(T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T284f17(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T284f16(T0* C);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T284f15(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T284f14(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T284f21(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T284f20(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T284f19(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T283f23(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T361f14(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T361f16(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T361f8(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T361f7(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T361f6(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T361f10(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T361f9(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T283f25(T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T283f17(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T283f16(T0* C);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T283f15(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T283f14(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T283f21(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T283f20(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T283f19(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T282f29(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T358f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T358f10(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T358f18(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.is_commandline_executable */
extern T1 T358f4(T0* C);
/* GEANT_EXEC_TASK.exit_application */
extern void T282f31(T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T282f20(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T282f18(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T282f17(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T282f27(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T282f26(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T282f25(T0* C);
/* GEANT_VE_TASK.execute */
extern void T281f33(T0* C);
/* GEANT_VE_COMMAND.execute */
extern void T357f27(T0* C);
/* GEANT_VE_COMMAND.execute_clean */
extern void T357f31(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T53f39(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T54f35(T0* C, T0* a1);
/* GEANT_VE_COMMAND.execute_tuner */
extern void T357f30(T0* C);
/* GEANT_VE_COMMAND.operating_system */
extern T0* T357f17(T0* C);
/* GEANT_VE_COMMAND.is_tunable */
extern T1 T357f6(T0* C);
/* GEANT_VE_COMMAND.execute_shell */
extern void T357f29(T0* C, T0* a1);
/* GEANT_VE_COMMAND.string_ */
extern T0* T357f16(T0* C);
/* GEANT_VE_COMMAND.unix_file_system */
extern T0* T357f15(T0* C);
/* GEANT_VE_COMMAND.file_system */
extern T0* T357f14(T0* C);
/* GEANT_VE_COMMAND.windows_file_system */
extern T0* T357f18(T0* C);
/* GEANT_VE_COMMAND.is_compilable */
extern T1 T357f4(T0* C);
/* GEANT_VE_TASK.exit_application */
extern void T281f35(T0* C, T6 a1, T0* a2);
/* GEANT_VE_TASK.exceptions */
extern T0* T281f24(T0* C);
/* GEANT_VE_TASK.dir_attribute_name */
extern T0* T281f22(T0* C);
/* GEANT_VE_TASK.file_system */
extern T0* T281f21(T0* C);
/* GEANT_VE_TASK.unix_file_system */
extern T0* T281f31(T0* C);
/* GEANT_VE_TASK.windows_file_system */
extern T0* T281f30(T0* C);
/* GEANT_VE_TASK.operating_system */
extern T0* T281f29(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T280f32(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T356f24(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T356f27(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T53f41(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T352f46(T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T352f23(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge277os9179;
extern T0* ge277ov9179;
extern T0* T352f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T54f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T53f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T54f27(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T356f12(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T356f13(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T356f16(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T356f15(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T356f26(T0* C);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T356f28(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T356f14(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T356f4(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T280f34(T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T280f23(T0* C);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T280f21(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T280f20(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T280f30(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T280f29(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T280f28(T0* C);
/* GEANT_SE_TASK.execute */
extern void T279f34(T0* C);
/* GEANT_SE_COMMAND.execute */
extern void T355f32(T0* C);
/* GEANT_SE_COMMAND.new_traditional_cmdline */
extern T0* T355f18(T0* C);
/* GEANT_SE_COMMAND.unix_file_system */
extern T0* T355f22(T0* C);
/* GEANT_SE_COMMAND.string_ */
extern T0* T355f19(T0* C);
/* GEANT_SE_COMMAND.new_ace_cmdline */
extern T0* T355f17(T0* C);
/* GEANT_SE_COMMAND.is_ace_configuration */
extern T1 T355f4(T0* C);
/* GEANT_SE_COMMAND.execute_shell */
extern void T355f34(T0* C, T0* a1);
/* GEANT_SE_COMMAND.file_system */
extern T0* T355f16(T0* C);
/* GEANT_SE_COMMAND.windows_file_system */
extern T0* T355f21(T0* C);
/* GEANT_SE_COMMAND.operating_system */
extern T0* T355f20(T0* C);
/* GEANT_SE_COMMAND.new_clean_cmdline */
extern T0* T355f15(T0* C);
/* GEANT_SE_COMMAND.is_cleanable */
extern T1 T355f6(T0* C);
/* GEANT_SE_TASK.exit_application */
extern void T279f36(T0* C, T6 a1, T0* a2);
/* GEANT_SE_TASK.exceptions */
extern T0* T279f25(T0* C);
/* GEANT_SE_TASK.dir_attribute_name */
extern T0* T279f23(T0* C);
/* GEANT_SE_TASK.file_system */
extern T0* T279f22(T0* C);
/* GEANT_SE_TASK.unix_file_system */
extern T0* T279f32(T0* C);
/* GEANT_SE_TASK.windows_file_system */
extern T0* T279f31(T0* C);
/* GEANT_SE_TASK.operating_system */
extern T0* T279f30(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T278f35(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T354f31(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T354f33(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T354f16(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T354f20(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T354f19(T0* C);
/* UC_UTF8_STRING.append_integer */
extern void T193f83(T0* C, T6 a1);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T354f4(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T354f15(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T354f18(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T354f17(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T354f5(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T278f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T278f26(T0* C);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T278f24(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T278f23(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T278f33(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T278f32(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T278f31(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T313f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T312f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T311f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T188f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T95f31(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T313f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T318f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T318f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T312f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T318f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T311f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T318f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T188f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T318f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T95f36(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T318f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T170f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T170f233(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T205f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T194f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge206os3914;
extern T0* ge206ov3914;
extern T0* T353f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T170f233p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T205f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T205f18(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T170f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T205c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T205f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T205f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T205f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T205f16(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge395os7946;
extern T6 ge395ov7946;
extern T6 T205f11(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T168f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T168f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T168f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T168f19(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T164f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T164f229(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T164f229p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T164f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T126f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T126f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T126f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T126f18(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T170f227(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T170f227p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T170f227p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T170f237(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T203f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T75f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T203f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T203f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T203f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T203f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T203f1(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T250f3(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T203f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T203f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T170f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T170f181(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T170f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T170f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T170f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T170f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1394os6620;
extern T0* ge1394ov6620;
extern T0* T170f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T170f241(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T170f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T170f240(T0* C);
/* DS_LINKED_STACK [INTEGER].remove */
extern void T208f7(T0* C);
/* DS_LINKED_STACK [INTEGER].item */
extern T6 T208f2(T0* C);
/* DS_LINKED_STACK [INTEGER].is_empty */
extern T1 T208f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T170f238(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER].force */
extern void T208f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER].put_right */
extern void T266f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER].make */
extern T0* T266c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T170f239(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T170f236(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T170f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T170f235(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T205f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T324f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T194f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T194f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T353f5(T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T205f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T324f11(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T205f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T324f12(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T170f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T170f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T170f234(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T168f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T168f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T168f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T168f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T168f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T168f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T168f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T168f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T168f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T168f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T168f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T168f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T168f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T168f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T168f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T168f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T168f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T168f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T168f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T168f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T168f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T164f223(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T164f223p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T164f232(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T164f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T164f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T164f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T164f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T164f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T164f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T164f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T164f237(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T164f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T164f236(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T164f233(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T164f235(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T164f231(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T164f234(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T164f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T164f230(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T164f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T164f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T126f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T126f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T126f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T126f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T126f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T126f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T126f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T126f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T126f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T126f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T126f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T126f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T126f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T126f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T126f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T126f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T126f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T126f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T126f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T126f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T126f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T170f229(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T168f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T164f225(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T126f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T170f230(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T194f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T75f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f19(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f20(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T250f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge249os8200;
extern T0* ge249ov8200;
extern T0* T250f9(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge249os8199;
extern T0* ge249ov8199;
extern T0* T250f12(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge249os8188;
extern T0* ge249ov8188;
extern T0* T250f19(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T195f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T250f28(T0* C);
/* SPECIAL [ARRAY [INTEGER]].make */
extern T0* T329c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge249os8198;
extern T0* ge249ov8198;
extern T0* T250f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge249os8197;
extern T0* ge249ov8197;
extern T0* T250f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge249os8196;
extern T0* ge249ov8196;
extern T0* T250f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge249os8195;
extern T0* ge249ov8195;
extern T0* T250f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge249os8194;
extern T0* ge249ov8194;
extern T0* T250f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge249os8193;
extern T0* ge249ov8193;
extern T0* T250f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge249os8192;
extern T0* ge249ov8192;
extern T0* T250f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge249os8191;
extern T0* ge249ov8191;
extern T0* T250f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge249os8190;
extern T0* ge249ov8190;
extern T0* T250f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge249os8189;
extern T0* ge249ov8189;
extern T0* T250f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge249os8187;
extern T0* ge249ov8187;
extern T0* T250f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge249os8186;
extern T0* ge249ov8186;
extern T0* T250f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge249os8185;
extern T0* ge249ov8185;
extern T0* T250f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge249os8184;
extern T0* ge249ov8184;
extern T0* T250f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge249os8183;
extern T0* ge249ov8183;
extern T0* T250f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge249os8182;
extern T0* ge249ov8182;
extern T0* T250f13(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER]]].make */
extern T0* T330c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T75f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T168f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T164f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T126f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T170f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T168f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T164f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T126f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T170f228(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T353f10(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T353f4(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T55f26(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T168f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T164f224(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T126f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T171f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T171f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T171f12(T0* C);
/* DS_LINKED_QUEUE [STRING].make */
extern T0* T238c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T236c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T273c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].new_cursor */
extern T0* T273f1(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T274c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T131f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T96f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T96f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T93f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T310c31(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T390c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T310f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T310f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T391c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T310f35(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T310f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T310f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T310f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T310f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T310f41(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T310f40(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T392f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T425c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T389c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T392c3(void);
/* XM_DOCUMENT.make */
extern T0* T94c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T94f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T94f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T94f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T317f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T317c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T94f6(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T94f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T95f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T189f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T94f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T94f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T189f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T317f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T94f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T317f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T94f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T94f36(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T94f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T94f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T189f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T94f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T95f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T94f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T94f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T189f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T94f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T95f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T95f40(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T95f46(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T95f45(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T95f44(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T95f49(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T95f47(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T95f50(T0* C);
/* XM_ELEMENT.remove_first */
extern void T95f43(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T95f48(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T94f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T94f5(T0* C);
/* XM_DOCUMENT.list_make */
extern void T94f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T95c30(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T95f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1346os5710;
extern T0* ge1346ov5710;
extern T0* T94f3(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T314c8(void);
/* XM_NAMESPACE.make */
extern void T314f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T314c7(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T171f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T131f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T96f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T96f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T93f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T171f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T131f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T96f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T96f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T93f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T93f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T174f3(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T239f8(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T325f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T325c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T239f3(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T323c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T93f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T311c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T95f33(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T95f33p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T95f33p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T95f34(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T95f18(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T95f17(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T311c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T171f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T131f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T96f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T96f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T93f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T312c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T312c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T171f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T131f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T96f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T96f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T93f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T313c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T171f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T236f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].force_last */
extern void T273f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].put_right */
extern void T351f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].attach_left */
extern void T351f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T351c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].is_empty */
extern T1 T273f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T236f8(T0* C);
/* DS_HASH_TABLE [STRING, STRING].set_equality_tester */
extern void T78f44(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T236f9(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_map_default */
extern T0* T78c42(void);
/* DS_HASH_TABLE [STRING, STRING].default_capacity */
extern T6 T78f1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T131f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T96f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T96f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T93f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T95c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T95c28(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T94f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T94f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T93f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T310f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T310f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T310f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T310f13(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T310f11(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T314f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T310f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T310f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T310f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T310f45(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T392f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T389f3(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].copy_data */
extern void T389f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_NAMESPACE].move_data */
extern void T389f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].overlapping_move */
extern void T389f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].non_overlapping_move */
extern void T389f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T310f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T310f5(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T310f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T310f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T310f10(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T310f36(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T310f33(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T390f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T310f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T314f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T310f2(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T310f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T171f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T171f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T236f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1320os8006;
extern T0* ge1320ov8006;
extern T0* T236f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T171f6(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T171f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T171f39(T0* C);
/* DS_LINKED_QUEUE [STRING].remove */
extern void T238f8(T0* C);
/* DS_LINKED_QUEUE [STRING].wipe_out */
extern void T238f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T171f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1287os7044;
extern T0* ge1287ov7044;
extern T0* T171f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1287os7052;
extern T0* ge1287ov7052;
extern T0* T171f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T171f8(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T171f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T171f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1287os7045;
extern T0* ge1287ov7045;
extern T0* T171f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1287os7051;
extern T0* ge1287ov7051;
extern T0* T171f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T171f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1287os7046;
extern T0* ge1287ov7046;
extern T0* T171f22(T0* C);
/* DS_LINKED_QUEUE [STRING].item */
extern T0* T238f1(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T171f15(T0* C);
/* DS_LINKED_QUEUE [STRING].is_empty */
extern T1 T238f2(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T236f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].back */
extern void T274f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_back */
extern void T273f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].add_traversing_cursor */
extern void T273f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_next_cursor */
extern void T274f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_traversing_cursor */
extern void T273f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set */
extern void T274f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].go_before */
extern void T274f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_go_before */
extern void T273f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_before */
extern void T274f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_off */
extern T1 T273f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].item */
extern T0* T78f23(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].item_storage_item */
extern T0* T78f28(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T1 T78f22(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].item */
extern T0* T274f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].finish */
extern void T274f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_finish */
extern void T273f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1320os8007;
extern T0* ge1320ov8007;
extern T0* T236f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T236f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T171f4(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T131f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T96f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T96f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T93f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T171f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T236f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_last */
extern void T273f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].set_last_cell */
extern void T273f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].forget_right */
extern void T351f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_last_cursors_after */
extern void T273f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_after */
extern void T274f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].wipe_out */
extern void T273f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_all_cursors_after */
extern void T273f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T171f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T131f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T96f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T96f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T93f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T95f2(T0* C);
/* XM_DOCUMENT.process */
extern void T94f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T318f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T1 T95f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T94f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T171f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T131f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T96f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T96f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T93f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T171f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T236f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_new */
extern void T78f53(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].last */
extern T0* T273f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T236f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T171f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING].force */
extern void T238f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T236f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T131f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T96f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T96f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T93f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T188c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T171f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T131f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T96f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T93f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T171f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T96f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T93f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T78f54(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].add_traversing_cursor */
extern void T78f63(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].remove_traversing_cursor */
extern void T78f62(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_off */
extern T1 T78f38(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].is_empty */
extern T1 T78f37(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T34f68(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T34f71(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T34f70(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T34f42(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T34f41(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T29f67(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T29f70(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T29f69(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T29f41(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T29f40(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T25f80(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T25f83(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T25f82(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T25f49(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T25f48(T0* C);
/* DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T78f55(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T34f69(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T29f68(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T25f81(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T72f39(T0* C);
/* AP_STRING_OPTION.reset */
extern void T37f27(T0* C);
/* AP_FLAG.reset */
extern void T35f22(T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T72f40(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T72f41(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T72f14(T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T45f11(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T72f13(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T72f22(T0* C, T0* a1, T6 a2);
/* STRING_8.make_filled */
extern T0* T17c53(T2 a1, T6 a2);
/* STRING_8.fill_character */
extern void T17f55(T0* C, T2 a1);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f14(T0* C, T2 a1, T6 a2, T6 a3);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T306f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T306f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T306f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER].force */
extern void T191f13(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER].auto_resize */
extern void T191f14(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER].capacity */
extern T6 T191f7(T0* C);
/* SPECIAL [INTEGER].aliased_resized_area */
extern T0* T63f4(T0* C, T6 a1);
/* ARRAY [INTEGER].additional_space */
extern T6 T191f6(T0* C);
/* ARRAY [INTEGER].empty_area */
extern T1 T191f5(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T73f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T73f29(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T305f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T75f14(T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T305f2(T0* C);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T308f1(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T308f12(T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T193f81(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T193f82(T0* C, T6 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T308f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T308f2(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T308f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge152os4728;
extern T0* ge152ov4728;
extern T0* T72f17(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T308f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T308c9(void);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T72f15(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T72f24(T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T72f28(T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T72f27(T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T72f33(T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T72f32(T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T72f31(T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T72f23(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T306c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T305c3(void);
/* AP_STRING_OPTION.record_occurrence */
extern void T37f28(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T35f23(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T515f3(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T513f2(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T511f3(T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T304f1(T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T388f1(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T414f1(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T388f6(T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge167os5102;
extern T0* ge167ov5102;
extern T0* T388f4(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T414c2(void);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T303f1(T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T387f1(T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T302f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T386f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_file_executable */
extern T1 T386f4(T0* C);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T301f1(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T385f1(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T300f1(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T384f1(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T299f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T383f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T383f5(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T298f1(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T380f1(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T297f1(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T379f1(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T296f1(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T378f1(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T378f6(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T295f1(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T377f1(T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T377f7(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T377f4(T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T294f1(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T374f1(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T374f4(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T293f1(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T373f1(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T292f1(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T372f1(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T291f1(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T370f1(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T370f6(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T290f1(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T369f1(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T289f1(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T368f1(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T368f6(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T288f1(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T367f1(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T287f1(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T366f1(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T286f1(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T364f1(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T364f5(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T285f1(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T363f1(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T284f1(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T362f1(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T283f1(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T361f1(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T282f1(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T358f1(T0* C);
/* GEANT_EXEC_COMMAND.is_fileset_executable */
extern T1 T358f5(T0* C);
/* GEANT_VE_TASK.is_executable */
extern T1 T281f1(T0* C);
/* GEANT_VE_COMMAND.is_executable */
extern T1 T357f1(T0* C);
/* GEANT_VE_COMMAND.is_cleanable */
extern T1 T357f5(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T280f1(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T356f1(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T356f5(T0* C);
/* GEANT_SE_TASK.is_executable */
extern T1 T279f1(T0* C);
/* GEANT_SE_COMMAND.is_executable */
extern T1 T355f1(T0* C);
/* GEANT_SE_COMMAND.is_traditional_configuration */
extern T1 T355f5(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T278f1(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T354f1(T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T304f2(T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T304f10(T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T304f7(T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T303f2(T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T303f10(T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T303f7(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T302f2(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T302f10(T0* C);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T302f7(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T301f2(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T301f10(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T301f7(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T300f2(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T300f10(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T300f7(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T299f2(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T299f10(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T299f7(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T298f2(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T298f10(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T298f7(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T297f2(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T297f10(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T297f7(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T296f2(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T296f10(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T296f7(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T295f2(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T295f10(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T295f7(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T294f2(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T294f10(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T294f7(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T293f2(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T293f10(T0* C);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T293f7(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T292f2(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T292f10(T0* C);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T292f7(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T291f2(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T291f10(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T291f7(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T290f2(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T290f10(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T290f7(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T289f2(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T289f10(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T289f7(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T288f2(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T288f10(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T288f7(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T287f2(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T287f10(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T287f7(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T286f2(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T286f10(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T286f7(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T285f2(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T285f10(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T285f7(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T284f2(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T284f10(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T284f7(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T283f2(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T283f10(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T283f7(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T282f2(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T282f10(T0* C);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T282f7(T0* C);
/* GEANT_VE_TASK.is_enabled */
extern T1 T281f2(T0* C);
/* GEANT_VE_TASK.unless_attribute_name */
extern T0* T281f10(T0* C);
/* GEANT_VE_TASK.if_attribute_name */
extern T0* T281f7(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T280f2(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T280f10(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T280f7(T0* C);
/* GEANT_SE_TASK.is_enabled */
extern T1 T279f2(T0* C);
/* GEANT_SE_TASK.unless_attribute_name */
extern T0* T279f10(T0* C);
/* GEANT_SE_TASK.if_attribute_name */
extern T0* T279f7(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T278f2(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T278f10(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T278f7(T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T304f3(T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T303f3(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T302f3(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T301f3(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T300f3(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T299f3(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T298f3(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T297f3(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T296f3(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T295f3(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T294f3(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T293f3(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T292f3(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T291f3(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T290f3(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T289f3(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T288f3(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T287f3(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T286f3(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T285f3(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T284f3(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T283f3(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T282f3(T0* C);
/* GEANT_VE_TASK.exit_code */
extern T6 T281f3(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T280f3(T0* C);
/* GEANT_SE_TASK.exit_code */
extern T6 T279f3(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T278f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T170f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T127c5(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T168f1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T164f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T126f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T170f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T168f4(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T164f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T126f4(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T170f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T194f3(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T194f2(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T168f5(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T164f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T126f5(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T170f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T168f6(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T164f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T126f6(T0* C);
/* DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T1 T78f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T34f34(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T1 T29f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T25f45(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T78f26(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T34f35(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T29f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T25f46(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T78f27(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T34f44(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T29f43(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T25f51(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T78f5(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T64c7(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T34f30(T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T29f30(T0* C);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T25f35(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T496f1(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T496f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T496f6(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T496f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T481f1(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T481f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T481f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T481f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T480f1(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T480f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T480f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T480f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T479f1(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T479f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T479f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T479f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T478f1(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T478f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T478f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T478f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T477f1(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T477f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T477f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T477f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T476f1(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T476f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T476f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T476f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T475f1(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T475f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T475f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T475f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T474f1(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T474f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T474f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T474f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T472f1(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T472f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T472f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T472f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T49f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T49f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T49f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T49f5(T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T72f10(T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T37f1(T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T37f4(T0* C);
/* AP_FLAG.was_found */
extern T1 T35f1(T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T72f7(T0* C);
/* AP_STRING_OPTION.needs_parameter */
extern T1 T37f15(T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T35f10(T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T72f8(T0* C);
/* AP_STRING_OPTION.name */
extern T0* T37f10(T0* C);
/* AP_FLAG.name */
extern T0* T35f8(T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T72f21(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f17(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f17p1(T0* C);
/* AP_FLAG.names */
extern T0* T35f14(T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T72f26(T0* C);
/* AP_STRING_OPTION.example */
extern T0* T37f18(T0* C);
/* AP_FLAG.example */
extern T0* T35f15(T0* C);
/* AP_DISPLAY_HELP_FLAG.has_long_form */
extern T1 T72f6(T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T37f11(T0* C);
/* AP_FLAG.has_long_form */
extern T1 T35f9(T0* C);
/* FILE_NAME.to_c */
extern T0* T454f3(T0* C);
/* UC_UTF8_STRING.to_c */
extern T0* T193f3(T0* C);
/* STRING_8.to_c */
extern T0* T17f11(T0* C);
extern T0* gema33(T6 c, ...);
extern T0* gema191(T6 c, ...);
extern T0* gema173(T6 c, ...);
extern T0* gema448(T6 c, ...);
extern T0* gema415(T6 c, ...);
extern void gevoid(T0* C, ...);
extern T0* gevoid0(T0* C, ...);
extern T1 gevoid1(T0* C, ...);
extern T6 gevoid6(T0* C, ...);
extern T2 gevoid2(T0* C, ...);
extern T0* ge304ov2977;
extern T0* ge308ov4781;
extern T0* ge315ov6247;
extern T0* ge246ov7711;
extern T0* ge364ov11271;
extern T0* ge198ov2977;
extern T0* ge488ov9579;
extern T0* ge520ov9421;
extern T0* ge282ov3773;
extern T0* ge306ov2977;
extern T0* ge210ov3811;
extern T0* ge210ov3812;
extern T0* ge199ov4070;
extern T0* ge199ov4069;
extern T0* ge208ov3811;
extern T0* ge208ov3812;
extern T0* ge1380ov5086;
extern T0* ge1380ov5085;
extern T0* ge1387ov5380;
extern T0* ge1387ov5342;
extern T0* ge1387ov5340;
extern T0* ge1387ov5381;
extern T0* ge1387ov5353;
extern T0* ge1387ov5352;
extern T0* ge1387ov5363;
extern T0* ge1387ov5357;
extern T0* ge1387ov5356;
extern T0* ge1387ov5355;
extern T0* ge1387ov5361;
extern T0* ge1387ov5360;
extern T0* ge1387ov5362;
extern T0* ge1387ov5339;
extern T0* ge1387ov5365;
extern T0* ge1387ov5374;
extern T0* ge1390ov5027;
extern T0* ge1390ov5025;
extern T0* ge1390ov5026;
extern T0* ge1387ov5375;
extern T0* ge1387ov5376;
extern T0* ge1387ov5379;
extern T0* ge1387ov5377;
extern T0* ge1387ov5378;
extern T0* ge1387ov5372;
extern T0* ge1383ov7116;
extern T0* ge1383ov7117;
extern T0* ge1387ov5345;
extern T0* ge1387ov5368;
extern T0* ge1387ov5388;
extern T0* ge1387ov5389;
extern T0* ge1387ov5390;
extern T0* ge1387ov5383;
extern T0* ge1387ov5366;
extern T0* ge1387ov5367;
extern T0* ge1387ov5369;
extern T0* ge1387ov5373;
extern T0* ge281ov3961;
extern T0* ge210ov3822;
extern T0* ge208ov3822;
extern T0* ge151ov2444;
extern T0* ge154ov2947;
extern T0* ge154ov2953;
extern T0* ge216ov1565;
extern T0* ge154ov2948;
extern T0* ge154ov2954;
extern T0* ge154ov2949;
extern T0* ge154ov2955;
extern T0* ge154ov2950;
extern T0* ge154ov2956;
extern T0* ge154ov2951;
extern T0* ge154ov2957;
extern T0* ge151ov2439;
extern T0* ge151ov2438;
extern T0* ge151ov2446;
extern T0* ge151ov2445;
extern T0* ge492ov10195;
extern T0* ge492ov10232;
extern T0* ge492ov10217;
extern T0* ge492ov10210;
extern T0* ge492ov10220;
extern T0* ge492ov10213;
extern T0* ge492ov10221;
extern T0* ge492ov10230;
extern T0* ge492ov10223;
extern T0* ge492ov10219;
extern T0* ge492ov10207;
extern T0* ge492ov10208;
extern T0* ge492ov10222;
extern T0* ge492ov10209;
extern T0* ge492ov10196;
extern T0* ge492ov10197;
extern T0* ge492ov10198;
extern T0* ge492ov10204;
extern T0* ge492ov10206;
extern T0* ge492ov10201;
extern T0* ge492ov10226;
extern T0* ge492ov10225;
extern T0* ge492ov10202;
extern T0* ge492ov10203;
extern T0* ge492ov10200;
extern T0* ge492ov10199;
extern T0* ge277ov9181;
extern T0* ge89ov9039;
extern T0* ge292ov3941;
extern T0* ge281ov3963;
extern T0* ge311ov2977;
extern T0* ge277ov9180;
extern T0* ge1394ov6622;
extern T0* ge1394ov6623;
extern T0* ge1385ov7719;
extern T0* ge1385ov7721;
extern T0* ge1338ov5676;
extern T0* ge1319ov7493;
extern T0* ge1319ov7494;
extern T0* ge152ov4716;
extern T0* ge152ov4717;
extern T0* ge152ov4718;
extern T0* ge152ov4715;
extern T0* ge1385ov7718;
extern T0* ge1385ov7720;
extern T0* ge349ov2961;
extern T0* ge335ov2961;
extern T0* ge341ov2961;
extern T0* ge340ov2961;
extern T0* ge339ov2961;
extern T0* ge330ov2961;
extern T0* ge329ov2961;
extern T0* ge346ov2961;
extern T0* ge359ov2961;
extern T0* ge1242ov2961;
extern T0* ge1246ov2961;
extern EIF_TYPE getypes[];

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

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
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
#include <string.h>
#include <stdlib.h>
