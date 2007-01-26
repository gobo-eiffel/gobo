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
typedef struct {int id;} EIF_OBJECT;
#define EIF_REFERENCE EIF_OBJECT*
typedef char EIF_BOOLEAN;
typedef unsigned char EIF_CHARACTER;
typedef int32_t EIF_INTEGER_32;
typedef int8_t EIF_INTEGER_8;
typedef int16_t EIF_INTEGER_16;
#define EIF_INTEGER EIF_INTEGER_32
typedef int64_t EIF_INTEGER_64;
typedef uint8_t EIF_NATURAL_8;
typedef uint16_t EIF_NATURAL_16;
typedef uint32_t EIF_NATURAL_32;
#define EIF_NATURAL EIF_NATURAL_32
typedef uint64_t EIF_NATURAL_64;
typedef void* EIF_POINTER;
typedef float EIF_REAL_32;
typedef double EIF_REAL_64;
#define EIF_REAL EIF_REAL_32
#define EIF_DOUBLE EIF_REAL_64
typedef uint32_t EIF_WIDE_CHAR;
#define EIF_PROCEDURE EIF_POINTER

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

#endif

#define T0 EIF_OBJECT

/* CHARACTER */
#define T1 EIF_CHARACTER

/* BOOLEAN */
#define T2 EIF_BOOLEAN

/* WIDE_CHARACTER */
#define T3 EIF_WIDE_CHAR

/* INTEGER */
#define T4 EIF_INTEGER

/* INTEGER_8 */
#define T5 EIF_INTEGER_8

/* INTEGER_16 */
#define T6 EIF_INTEGER_16

/* INTEGER_64 */
#define T7 EIF_INTEGER_64

/* NATURAL_8 */
#define T8 EIF_NATURAL_8

/* NATURAL_16 */
#define T9 EIF_NATURAL_16

/* NATURAL_32 */
#define T10 EIF_NATURAL_32

/* NATURAL_64 */
#define T11 EIF_NATURAL_64

/* REAL */
#define T12 EIF_REAL_32

/* DOUBLE */
#define T13 EIF_REAL_64

/* POINTER */
#define T14 EIF_POINTER

/* SPECIAL [CHARACTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T1 a2[1]; /* item */
} T15;

/* STRING */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* count */
	T4 a9; /* internal_hash_code */
} T16;

/* GEXACE */
typedef struct {
	int id;
	T0* a2; /* variables */
	T0* a4; /* commands */
	T0* a5; /* error_handler */
	T4 a7; /* next_option_position */
	T2 a12; /* is_shallow */
} T18;

/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T19;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a3; /* program_name */
} T20;

/* DS_HASH_TABLE [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* key_equality_tester */
	T4 a2; /* position */
	T4 a4; /* last_position */
	T4 a5; /* capacity */
	T4 a8; /* slots_position */
	T4 a10; /* count */
	T0* a11; /* equality_tester */
	T4 a12; /* found_position */
	T4 a13; /* modulus */
	T4 a14; /* clashes_previous_position */
	T0* a17; /* items */
	T0* a20; /* clashes */
	T0* a21; /* slots */
	T0* a22; /* keys */
	T4 a23; /* free_slot */
	T0* a24; /* internal_cursor */
	T0* a27; /* special_item_routines */
	T0* a28; /* special_key_routines */
} T21;

/* UC_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T22;

/* DS_LINKED_LIST [GEXACE_COMMAND] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T24;

/* ET_XACE_DEFAULT_ERROR_HANDLER */
typedef struct {
	int id;
	T4 a2; /* error_count */
	T0* a3; /* warning_file */
	T0* a5; /* info_file */
	T0* a7; /* error_file */
} T25;

/* KL_EXCEPTIONS */
typedef struct {
	int id;
} T27;

/* DS_LINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T28;

/* DS_PAIR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* second */
	T0* a2; /* first */
} T29;

/* DS_LINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T30;

/* UT_USAGE_MESSAGE */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T31;

/* GEXACE_SYSTEM_COMMAND */
typedef struct {
	int id;
	T0* a1; /* generators */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T0* a4; /* xace_filename */
	T2 a6; /* is_shallow */
	T2 a7; /* is_ve */
	T0* a8; /* output_filename */
} T33;

/* GEXACE_LIBRARY_COMMAND */
typedef struct {
	int id;
	T0* a1; /* generators */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T0* a4; /* xace_filename */
	T2 a6; /* is_shallow */
	T2 a7; /* is_ve */
	T0* a8; /* output_filename */
} T37;

/* GEXACE_VALIDATE_COMMAND */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T0* a3; /* xace_filename */
	T2 a5; /* is_shallow */
} T38;

/* ET_XACE_XML_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T2 a3; /* is_shallow */
} T40;

/* ET_XACE_GE_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T41;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a3; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
} T42;

/* ET_XACE_SE_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T43;

/* ET_XACE_ASE_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T44;

/* ET_XACE_ISE_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T45;

/* ET_XACE_VE_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T2 a5; /* is_shallow */
} T46;

/* ET_XACE_VE41_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T47;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T48;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T49;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2[1]; /* item */
} T50;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T51;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T52;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T53;

/* DS_LINKABLE [GEXACE_COMMAND] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T54;

/* KL_STANDARD_FILES */
typedef struct {
	int id;
} T56;

/* KL_STDERR_FILE */
typedef struct {
	int id;
	T14 a1; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T57;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a1; /* file_pointer */
	T0* a3; /* name */
	T4 a4; /* mode */
} T58;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct {
	int id;
	T0* a1; /* name */
} T59;

/* DS_LINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T61;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T62;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T63;

/* DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T64;

/* UC_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* byte_count */
	T4 a4; /* internal_hash_code */
	T4 a5; /* last_byte_index_input */
	T4 a6; /* last_byte_index_result */
	T0* a7; /* area */
} T65;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T66;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T68;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T69;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T70;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct {
	int id;
	T11 a2; /* part1 */
	T4 a3; /* sign */
	T11 a4; /* part2 */
	T4 a6; /* last_state */
	T0* a7; /* leading_separators */
	T0* a8; /* trailing_separators */
	T2 a9; /* leading_separators_acceptable */
	T2 a10; /* trailing_separators_acceptable */
	T4 a11; /* conversion_type */
	T2 a12; /* internal_overflowed */
} T71;

/* ET_XACE_SYSTEM_PARSER */
typedef struct {
	int id;
	T0* a1; /* last_system */
	T0* a2; /* ast_factory */
	T2 a3; /* is_shallow */
	T0* a4; /* library_parser */
	T2 a5; /* is_ve */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a11; /* parsed_libraries */
	T0* a12; /* error_handler */
} T73;

/* ET_XACE_SYSTEM */
typedef struct {
	int id;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
} T74;

/* KL_TEXT_INPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a7; /* name */
	T0* a10; /* string_name */
	T0* a11; /* character_buffer */
	T2 a12; /* end_of_file */
	T14 a17; /* file_pointer */
	T2 a19; /* descriptor_available */
	T1 a26; /* last_character */
} T75;

/* KL_TEXT_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a14; /* file_pointer */
	T2 a16; /* descriptor_available */
} T77;

/* ET_XACE_LIBRARY_PARSER */
typedef struct {
	int id;
	T0* a1; /* last_library */
	T2 a2; /* is_shallow */
	T2 a3; /* is_ve */
	T0* a4; /* ast_factory */
	T0* a5; /* library_parser */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a11; /* parsed_libraries */
	T0* a12; /* error_handler */
} T78;

/* ET_XACE_LIBRARY */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a2; /* options */
	T0* a3; /* clusters */
	T0* a4; /* library_prefix */
	T0* a5; /* libraries */
} T79;

/* ET_XACE_PARSER */
typedef struct {
	int id;
	T0* a1; /* ast_factory */
	T0* a2; /* xml_parser */
	T0* a3; /* tree_pipe */
	T0* a6; /* xml_validator */
	T0* a7; /* xml_preprocessor */
	T0* a9; /* parsed_libraries */
	T0* a13; /* error_handler */
	T0* a15; /* library_parser */
	T2 a137; /* is_shallow */
	T2 a138; /* is_ve */
} T80;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T81;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T82;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T83;

/* ET_XACE_AST_FACTORY */
typedef struct {
	int id;
} T84;

/* XM_DOCUMENT */
typedef struct {
	int id;
	T0* a1; /* root_element */
	T0* a4; /* internal_cursor */
	T0* a7; /* first_cell */
	T0* a8; /* last_cell */
	T4 a9; /* count */
	T0* a13; /* parent */
} T85;

/* XM_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* parent */
	T0* a8; /* name */
	T0* a15; /* namespace */
	T0* a18; /* first_cell */
	T0* a19; /* last_cell */
	T4 a20; /* count */
	T0* a21; /* internal_cursor */
} T86;

/* XM_POSITION_TABLE */
typedef struct {
	int id;
	T0* a2; /* table */
} T87;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct {
	int id;
	T0* a1; /* error */
	T0* a3; /* tree */
	T0* a5; /* start */
	T0* a8; /* last */
} T89;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct {
	int id;
	T2 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
} T90;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
} T91;

/* ET_XACE_VALIDATOR */
typedef struct {
	int id;
	T2 a1; /* has_error */
	T0* a2; /* error_handler */
} T92;

/* ET_XACE_PREPROCESSOR */
typedef struct {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
} T93;

/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2; /* last_position */
	T4 a3; /* free_slot */
	T4 a5; /* position */
	T0* a6; /* key_equality_tester */
	T0* a7; /* equality_tester */
	T0* a8; /* internal_cursor */
	T4 a10; /* found_position */
	T0* a11; /* items */
	T0* a12; /* keys */
	T0* a13; /* clashes */
	T4 a14; /* modulus */
	T0* a15; /* slots */
	T4 a16; /* capacity */
	T0* a19; /* special_item_routines */
	T0* a20; /* special_key_routines */
	T4 a30; /* slots_position */
	T4 a31; /* clashes_previous_position */
} T94;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct {
	int id;
} T95;

/* XM_EIFFEL_PARSER */
typedef struct {
	int id;
	T0* a6; /* last_error_description */
	T4 a8; /* yy_parsing_status */
	T0* a10; /* scanner */
	T0* a16; /* error_positions */
	T0* a18; /* scanners */
	T2 a19; /* in_external_dtd */
	T0* a20; /* callbacks */
	T0* a21; /* entities */
	T0* a23; /* pe_entities */
	T0* a24; /* dtd_resolver */
	T0* a26; /* entity_resolver */
	T2 a27; /* use_namespaces */
	T4 a28; /* string_mode */
	T0* a30; /* yyss */
	T0* a33; /* yytranslate */
	T0* a35; /* yyr1 */
	T0* a37; /* yytypes1 */
	T0* a39; /* yytypes2 */
	T0* a41; /* yydefact */
	T0* a43; /* yydefgoto */
	T0* a45; /* yypact */
	T0* a47; /* yypgoto */
	T0* a49; /* yytable */
	T0* a51; /* yycheck */
	T4 a54; /* yy_suspended_yystacksize */
	T4 a55; /* yy_suspended_yystate */
	T4 a56; /* yy_suspended_yyn */
	T4 a57; /* yy_suspended_yychar1 */
	T4 a58; /* yy_suspended_index */
	T4 a59; /* yy_suspended_yyss_top */
	T4 a60; /* yy_suspended_yy_goto */
	T4 a62; /* error_count */
	T2 a63; /* yy_lookahead_needed */
	T4 a64; /* yyerrstatus */
	T4 a65; /* yyssp */
	T4 a73; /* last_token */
	T4 a82; /* yyvsp1 */
	T4 a83; /* yyvsp2 */
	T4 a84; /* yyvsp3 */
	T4 a85; /* yyvsp4 */
	T4 a86; /* yyvsp5 */
	T4 a87; /* yyvsp6 */
	T4 a88; /* yyvsp7 */
	T4 a89; /* yyvsp8 */
	T4 a90; /* yyvsp9 */
	T4 a91; /* yyvsp10 */
	T4 a92; /* yyvsp11 */
	T0* a93; /* last_string_value */
	T4 a103; /* yyvsc1 */
	T0* a104; /* yyvs1 */
	T0* a105; /* yyspecial_routines1 */
	T0* a107; /* last_any_value */
	T4 a108; /* yyvsc4 */
	T0* a109; /* yyvs4 */
	T0* a110; /* yyspecial_routines4 */
	T4 a112; /* yyvsc2 */
	T0* a113; /* yyvs2 */
	T0* a114; /* yyspecial_routines2 */
	T0* a121; /* yyvs11 */
	T4 a122; /* yyvsc11 */
	T0* a123; /* yyspecial_routines11 */
	T0* a125; /* yyvs10 */
	T0* a126; /* yyvs5 */
	T4 a128; /* yyvsc10 */
	T0* a129; /* yyspecial_routines10 */
	T4 a135; /* yyvsc3 */
	T0* a136; /* yyvs3 */
	T0* a137; /* yyspecial_routines3 */
	T0* a143; /* yyvs6 */
	T4 a145; /* yyvsc6 */
	T0* a146; /* yyspecial_routines6 */
	T0* a151; /* yyvs8 */
	T0* a154; /* yyvs7 */
	T4 a155; /* yyvsc8 */
	T0* a156; /* yyspecial_routines8 */
	T4 a158; /* yyvsc7 */
	T0* a159; /* yyspecial_routines7 */
	T0* a161; /* yyvs9 */
	T4 a163; /* yyvsc9 */
	T0* a164; /* yyspecial_routines9 */
	T4 a170; /* yyvsc5 */
	T0* a171; /* yyspecial_routines5 */
	T0* a177; /* dtd_callbacks */
} T96;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 a1; /* count */
	T8 a2[1]; /* item */
} T101;

/* UT_MESSAGE */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T102;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T103;

/* ET_XACE_CLUSTERS */
typedef struct {
	int id;
	T0* a1; /* clusters */
} T104;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct {
	int id;
	T0* a1; /* libraries */
} T105;

/* ET_XACE_OPTIONS */
typedef struct {
	int id;
	T0* a177; /* declared_abstract */
	T0* a179; /* declared_recursive */
	T0* a181; /* declared_read_only */
	T0* a183; /* declared_address_expression */
	T0* a185; /* declared_arguments */
	T0* a187; /* declared_array_optimization */
	T0* a189; /* declared_assertion */
	T0* a191; /* declared_check_vape */
	T0* a193; /* declared_cls_compliant */
	T0* a195; /* declared_console_application */
	T0* a197; /* declared_dead_code_removal */
	T0* a199; /* declared_debug_option */
	T0* a201; /* declared_debug_tag */
	T0* a203; /* declared_document */
	T0* a205; /* declared_dotnet_naming_convention */
	T0* a207; /* declared_dynamic_runtime */
	T0* a209; /* declared_exception_trace */
	T0* a211; /* declared_il_verifiable */
	T0* a213; /* declared_inlining */
	T4 a215; /* declared_inlining_size */
	T0* a217; /* declared_line_generation */
	T0* a219; /* declared_metadata_cache_path */
	T0* a221; /* declared_msil_assembly_compatibility */
	T0* a223; /* declared_msil_clr_version */
	T0* a225; /* declared_msil_generation */
	T0* a227; /* declared_msil_generation_version */
	T0* a229; /* declared_multithreaded */
	T0* a231; /* declared_override_cluster */
	T0* a233; /* declared_precompiled */
	T0* a235; /* declared_profile */
	T0* a237; /* declared_shared_library_definition */
	T0* a239; /* declared_target */
	T0* a241; /* declared_trace */
	T0* a243; /* declared_use_cluster_name_as_namespace */
	T0* a245; /* declared_use_full_cluster_name_as_namespace */
	T0* a247; /* declared_finalize_option */
	T0* a249; /* declared_case_insensitive */
	T0* a251; /* declared_garbage_collector */
	T0* a253; /* declared_high_memory_compiler */
	T0* a255; /* declared_manifest_string_trace */
	T0* a257; /* declared_verbose */
	T0* a259; /* declared_warning */
	T0* a261; /* declared_clean */
	T0* a263; /* declared_gc_info */
	T0* a265; /* declared_split */
	T0* a267; /* declared_strip_option */
	T0* a269; /* declared_wedit */
	T0* a271; /* declared_target_os */
	T0* a273; /* declared_target_architecture */
	T0* a275; /* declared_unicode */
	T0* a277; /* declared_assembly */
	T0* a279; /* declared_callback */
	T0* a281; /* declared_component */
	T0* a283; /* declared_create_keyword_extension */
	T0* a285; /* declared_culture */
	T0* a287; /* declared_c_compiler_options */
	T0* a289; /* declared_debugger */
	T0* a291; /* declared_exclude */
	T0* a293; /* declared_include */
	T0* a295; /* declared_export_option */
	T0* a297; /* declared_flat_fst_optimization */
	T4 a299; /* declared_fst_expansion_factor */
	T0* a301; /* declared_fst_optimization */
	T0* a303; /* declared_header */
	T4 a305; /* declared_heap_size */
	T0* a307; /* declared_jumps_optimization */
	T0* a309; /* declared_layout */
	T0* a311; /* declared_layout_optimization */
	T0* a313; /* declared_leaves_optimization */
	T0* a315; /* declared_link */
	T0* a317; /* declared_linker */
	T0* a319; /* declared_linux_fpu_double_precision */
	T0* a321; /* declared_map */
	T0* a323; /* declared_no_default_lib */
	T0* a325; /* declared_portable_code_generation */
	T0* a327; /* declared_prefix_option */
	T0* a329; /* declared_public_key_token */
	T0* a331; /* declared_reloads_optimization */
	T4 a333; /* declared_stack_size */
	T0* a335; /* declared_storable_filename */
	T0* a337; /* declared_version */
	T0* a339; /* declared_visible_filename */
	T0* a341; /* declared_namespace */
} T106;

/* DS_HASH_SET_CURSOR [STRING] */
typedef struct {
	int id;
	T4 a3; /* position */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
} T107;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a6; /* next_cursor */
} T108;

/* DS_HASH_SET [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a5; /* position */
	T0* a8; /* equality_tester */
	T4 a9; /* capacity */
	T4 a12; /* slots_position */
	T4 a13; /* free_slot */
	T4 a14; /* last_position */
	T4 a18; /* modulus */
	T0* a20; /* internal_cursor */
	T4 a21; /* clashes_previous_position */
	T4 a24; /* found_position */
	T0* a25; /* items */
	T0* a27; /* clashes */
	T0* a28; /* slots */
	T0* a29; /* special_item_routines */
} T109;

/* DS_ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* special_routines */
	T0* a5; /* storage */
	T4 a6; /* capacity */
	T0* a7; /* internal_cursor */
	T0* a8; /* equality_tester */
} T110;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T111;

/* ET_XACE_CLUSTER */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a2; /* pathname */
	T2 a3; /* is_abstract */
	T0* a4; /* options */
	T0* a5; /* subclusters */
	T0* a6; /* libraries */
	T2 a7; /* is_relative */
	T0* a8; /* library_prefix */
	T0* a10; /* cluster_prefix */
	T0* a11; /* class_options */
	T2 a12; /* is_recursive */
	T2 a13; /* is_read_only */
	T2 a14; /* is_implicit */
	T0* a17; /* parent */
	T2 a19; /* is_mounted */
	T0* a25; /* provider_constraint */
	T0* a26; /* dependant_constraint */
} T112;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T4 a6; /* capacity */
	T0* a7; /* internal_cursor */
} T113;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct {
	int id;
	T0* a1; /* pathname */
	T0* a2; /* library */
	T0* a3; /* position */
	T0* a4; /* library_prefix */
	T2 a5; /* is_root */
} T114;

/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T115;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T116;

/* ET_XACE_CLASS_OPTIONS */
typedef struct {
	int id;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
} T117;

/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a3; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
} T118;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T119;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct {
	int id;
	T0* a1; /* feature_name */
	T0* a2; /* options */
} T120;

/* ET_XACE_EXTERNALS */
typedef struct {
	int id;
	T0* a4; /* c_compiler_options */
	T0* a5; /* include_directories */
	T0* a6; /* link_libraries */
} T121;

/* ET_XACE_OPTION_NAMES */
typedef struct {
	int id;
} T122;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* internal_cursor */
	T0* a6; /* first_cell */
	T0* a7; /* last_cell */
} T123;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T124;

/* ET_XACE_ASSEMBLY */
typedef struct {
	int id;
	T0* a1; /* tag */
	T0* a2; /* assembly_name */
	T0* a3; /* version */
	T0* a4; /* culture */
	T0* a5; /* public_key_token */
	T0* a6; /* class_prefix */
	T0* a7; /* assembly_pathname */
} T125;

/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* internal_cursor */
	T0* a6; /* first_cell */
	T0* a7; /* last_cell */
} T126;

/* ET_XACE_EXPORTED_FEATURE */
typedef struct {
	int id;
	T0* a1; /* class_name */
	T0* a2; /* feature_name */
	T0* a3; /* external_name */
} T129;

/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T130;

/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a5; /* position */
	T0* a8; /* items */
	T0* a9; /* key_equality_tester */
	T4 a10; /* capacity */
	T4 a13; /* slots_position */
	T4 a14; /* free_slot */
	T4 a15; /* last_position */
	T4 a19; /* modulus */
	T4 a20; /* clashes_previous_position */
	T0* a22; /* equality_tester */
	T4 a23; /* found_position */
	T0* a26; /* clashes */
	T0* a27; /* slots */
	T0* a28; /* keys */
	T0* a29; /* internal_cursor */
	T0* a31; /* special_item_routines */
	T0* a32; /* special_key_routines */
} T132;

/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING] */
typedef struct {
	int id;
	T0* a4; /* container */
	T4 a5; /* position */
	T0* a6; /* next_cursor */
} T133;

/* XM_ATTRIBUTE */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
} T135;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
	T0* a7; /* container */
	T2 a8; /* before */
} T136;

/* DS_HASH_TABLE [INTEGER, STRING] */
typedef struct {
	int id;
	T4 a4; /* found_position */
	T4 a7; /* position */
	T0* a8; /* items */
	T0* a9; /* key_equality_tester */
	T4 a10; /* free_slot */
	T4 a11; /* last_position */
	T4 a16; /* count */
	T4 a17; /* modulus */
	T4 a18; /* slots_position */
	T4 a19; /* clashes_previous_position */
	T0* a21; /* equality_tester */
	T0* a22; /* clashes */
	T0* a23; /* slots */
	T0* a24; /* keys */
	T4 a25; /* capacity */
	T0* a27; /* internal_cursor */
	T0* a29; /* special_item_routines */
	T0* a30; /* special_key_routines */
} T138;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a4; /* file_name */
	T0* a5; /* buffered_file_info */
} T141;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 a1; /* count */
	T11 a2[1]; /* item */
} T142;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T143;

/* XM_NAMESPACE_RESOLVER */
typedef struct {
	int id;
	T0* a1; /* next */
	T0* a2; /* context */
	T0* a3; /* element_prefix */
	T0* a5; /* element_local_part */
	T2 a9; /* forward_xmlns */
	T0* a11; /* attributes_prefix */
	T0* a13; /* attributes_local_part */
	T0* a14; /* attributes_value */
} T144;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T145;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T146;

/* XM_CALLBACKS_NULL */
typedef struct {
	int id;
} T147;

/* UT_TEMPLATE_EXPANDER */
typedef struct {
	int id;
} T149;

/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T151;

/* SPECIAL [ET_XACE_LIBRARY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T152;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY] */
typedef struct {
	int id;
} T153;

/* XM_EIFFEL_SCANNER */
typedef struct {
	int id;
	T4 a2; /* last_token */
	T0* a3; /* last_value */
	T0* a7; /* input_name */
	T4 a8; /* position */
	T4 a9; /* column */
	T4 a10; /* line */
	T0* a12; /* input_filter */
	T4 a13; /* yy_start_state */
	T0* a14; /* character_entity */
	T0* a16; /* input_stream */
	T0* a17; /* input_resolver */
	T2 a25; /* yy_more_flag */
	T4 a26; /* yy_more_len */
	T4 a27; /* yy_end */
	T4 a28; /* yy_start */
	T4 a29; /* yy_line */
	T4 a30; /* yy_column */
	T4 a31; /* yy_position */
	T0* a32; /* input_buffer */
	T0* a34; /* yy_state_stack */
	T4 a35; /* yy_state_count */
	T0* a36; /* yy_ec */
	T0* a37; /* yy_content_area */
	T0* a38; /* yy_content */
	T0* a39; /* yy_accept */
	T4 a40; /* yy_last_accepting_state */
	T4 a41; /* yy_last_accepting_cpos */
	T0* a42; /* yy_chk */
	T0* a43; /* yy_base */
	T0* a44; /* yy_def */
	T0* a45; /* yy_meta */
	T0* a47; /* yy_nxt */
	T4 a49; /* yy_lp */
	T0* a50; /* yy_acclist */
	T4 a53; /* yy_looking_for_trail_begin */
	T4 a55; /* yy_full_match */
	T4 a56; /* yy_full_state */
	T4 a57; /* yy_full_lp */
	T2 a63; /* yy_rejected */
	T0* a65; /* last_error */
	T0* a66; /* start_conditions */
} T154;

/* XM_DEFAULT_POSITION */
typedef struct {
	int id;
	T0* a1; /* source_name */
	T4 a2; /* row */
	T4 a3; /* column */
	T4 a4; /* byte_index */
} T155;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct {
	int id;
	T0* a2; /* first_cell */
	T0* a3; /* internal_cursor */
	T0* a6; /* last_cell */
	T4 a7; /* count */
} T157;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T158;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct {
	int id;
	T4 a3; /* position */
	T0* a6; /* items */
	T4 a8; /* count */
	T4 a9; /* last_position */
	T4 a10; /* free_slot */
	T4 a11; /* capacity */
	T4 a14; /* slots_position */
	T0* a18; /* key_equality_tester */
	T4 a19; /* modulus */
	T4 a20; /* clashes_previous_position */
	T0* a22; /* internal_cursor */
	T4 a24; /* found_position */
	T0* a25; /* keys */
	T0* a26; /* clashes */
	T0* a27; /* slots */
	T0* a30; /* equality_tester */
	T0* a32; /* special_item_routines */
	T0* a33; /* special_key_routines */
} T159;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct {
	int id;
} T161;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T162;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T163;

/* XM_EIFFEL_PARSER_NAME */
typedef struct {
	int id;
	T2 a2; /* use_namespaces */
	T4 a3; /* count */
	T0* a4; /* first */
	T0* a5; /* second */
	T0* a6; /* tail */
} T164;

/* XM_EIFFEL_DECLARATION */
typedef struct {
	int id;
	T0* a1; /* version */
	T0* a3; /* encoding */
	T2 a5; /* stand_alone */
} T165;

/* XM_DTD_EXTERNAL_ID */
typedef struct {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
} T166;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T4 a2; /* position */
	T0* a4; /* equality_tester */
	T4 a5; /* count */
	T4 a6; /* capacity */
	T4 a8; /* free_slot */
	T4 a9; /* last_position */
	T4 a14; /* modulus */
	T4 a15; /* slots_position */
	T4 a16; /* clashes_previous_position */
	T0* a20; /* internal_cursor */
	T4 a22; /* found_position */
	T0* a24; /* clashes */
	T0* a25; /* slots */
	T0* a26; /* items */
	T0* a27; /* special_item_routines */
} T167;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct {
	int id;
	T0* a1; /* items */
	T1 a2; /* repetition */
	T0* a3; /* name */
	T1 a4; /* type */
	T2 a5; /* is_character_data_allowed */
} T168;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T169;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct {
	int id;
	T0* a1; /* name */
	T1 a2; /* type */
	T2 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T1 a5; /* value */
	T0* a6; /* default_value */
} T170;

/* DS_BILINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
	T0* a7; /* equality_tester */
} T171;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T172;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T173;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T174;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
} T175;

/* SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T2 a2[1]; /* item */
} T176;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T177;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct {
	int id;
} T178;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T179;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
} T180;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T181;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
} T182;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T184;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T186;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
} T187;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
} T188;

/* SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T189;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
} T190;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a7; /* input_buffer */
	T2 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_error */
	T0* a11; /* start_conditions */
	T4 a12; /* yy_start_state */
	T4 a13; /* yy_line */
	T4 a14; /* yy_column */
	T4 a15; /* yy_position */
	T4 a16; /* line */
	T4 a17; /* column */
	T4 a18; /* position */
	T2 a19; /* yy_more_flag */
	T4 a20; /* yy_more_len */
	T4 a21; /* yy_last_accepting_state */
	T4 a22; /* yy_last_accepting_cpos */
	T2 a23; /* yy_rejected */
	T4 a24; /* yy_state_count */
	T4 a25; /* yy_full_match */
	T4 a26; /* yy_lp */
	T4 a27; /* yy_looking_for_trail_begin */
	T4 a28; /* yy_full_lp */
	T4 a29; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T4 a33; /* yy_end */
	T4 a34; /* yy_start */
	T0* a35; /* yy_nxt */
	T0* a37; /* yy_chk */
	T0* a39; /* yy_base */
	T0* a41; /* yy_def */
	T0* a43; /* yy_ec */
	T0* a45; /* yy_meta */
	T0* a47; /* yy_accept */
	T0* a49; /* yy_content */
	T0* a50; /* yy_content_area */
	T4 a57; /* last_token */
	T0* a58; /* last_value */
	T0* a64; /* input_filter */
	T0* a67; /* input_stream */
	T0* a68; /* input_resolver */
	T0* a88; /* yy_acclist */
} T191;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
} T192;

/* XM_DTD_CALLBACKS_NULL */
typedef struct {
	int id;
} T194;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct {
	int id;
	T4 a2; /* last_token */
	T0* a3; /* last_value */
	T0* a7; /* input_name */
	T4 a8; /* position */
	T4 a9; /* column */
	T4 a10; /* line */
	T0* a12; /* input_filter */
	T4 a13; /* yy_start_state */
	T0* a15; /* character_entity */
	T0* a17; /* input_stream */
	T0* a18; /* input_resolver */
	T2 a20; /* decl_start_sent */
	T2 a22; /* decl_end_sent */
	T2 a30; /* yy_more_flag */
	T4 a31; /* yy_more_len */
	T4 a32; /* yy_end */
	T4 a33; /* yy_start */
	T4 a34; /* yy_line */
	T4 a35; /* yy_column */
	T4 a36; /* yy_position */
	T0* a37; /* input_buffer */
	T0* a39; /* yy_state_stack */
	T4 a40; /* yy_state_count */
	T0* a41; /* yy_ec */
	T0* a42; /* yy_content_area */
	T0* a43; /* yy_content */
	T0* a44; /* yy_accept */
	T4 a45; /* yy_last_accepting_state */
	T4 a46; /* yy_last_accepting_cpos */
	T0* a47; /* yy_chk */
	T0* a48; /* yy_base */
	T0* a49; /* yy_def */
	T0* a50; /* yy_meta */
	T0* a52; /* yy_nxt */
	T4 a54; /* yy_lp */
	T0* a55; /* yy_acclist */
	T4 a58; /* yy_looking_for_trail_begin */
	T4 a60; /* yy_full_match */
	T4 a61; /* yy_full_state */
	T4 a62; /* yy_full_lp */
	T2 a68; /* yy_rejected */
	T0* a70; /* last_error */
	T0* a71; /* start_conditions */
} T195;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a7; /* input_buffer */
	T2 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_error */
	T0* a11; /* start_conditions */
	T4 a12; /* yy_start_state */
	T4 a13; /* yy_line */
	T4 a14; /* yy_column */
	T4 a15; /* yy_position */
	T4 a16; /* line */
	T4 a17; /* column */
	T4 a18; /* position */
	T2 a19; /* yy_more_flag */
	T4 a20; /* yy_more_len */
	T4 a21; /* yy_last_accepting_state */
	T4 a22; /* yy_last_accepting_cpos */
	T2 a23; /* yy_rejected */
	T4 a24; /* yy_state_count */
	T4 a25; /* yy_full_match */
	T4 a26; /* yy_lp */
	T4 a27; /* yy_looking_for_trail_begin */
	T4 a28; /* yy_full_lp */
	T4 a29; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T4 a33; /* yy_end */
	T4 a34; /* yy_start */
	T2 a35; /* pre_sent */
	T2 a36; /* post_sent */
	T0* a37; /* yy_nxt */
	T0* a39; /* yy_chk */
	T0* a41; /* yy_base */
	T0* a43; /* yy_def */
	T0* a45; /* yy_ec */
	T0* a47; /* yy_meta */
	T0* a49; /* yy_accept */
	T0* a51; /* yy_content */
	T0* a52; /* yy_content_area */
	T4 a58; /* last_token */
	T0* a59; /* last_value */
	T0* a65; /* input_filter */
	T0* a69; /* input_stream */
	T0* a70; /* input_resolver */
	T0* a91; /* yy_acclist */
} T197;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T199;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T200;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T201;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T202;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T203;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T204;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T205;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T206;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T207;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T208;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T209;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T210;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
} T211;

/* KL_OPERATING_SYSTEM */
typedef struct {
	int id;
} T212;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T214;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a6; /* last_cell */
	T4 a7; /* count */
} T215;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T216;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T217;

/* UC_UTF8_STRING */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a3; /* area */
	T4 a18; /* byte_count */
	T4 a30; /* internal_hash_code */
	T4 a33; /* last_byte_index_input */
	T4 a34; /* last_byte_index_result */
} T219;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct {
	int id;
	T0* a1; /* last_string */
	T0* a8; /* impl */
	T0* a9; /* utf_queue */
	T4 a10; /* encoding */
} T220;

/* KL_INTEGER_ROUTINES */
typedef struct {
	int id;
} T221;

/* KL_PLATFORM */
typedef struct {
	int id;
} T222;

/* UT_TRISTATE */
typedef struct {
	int id;
	T1 a4; /* value */
} T223;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T224;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct {
	int id;
} T225;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct {
	int id;
	T0* a1; /* container */
} T226;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T227;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct {
	int id;
} T228;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct {
	int id;
	T0* a1; /* container */
} T229;

/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T230;

/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T231;

/* DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T232;

/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T233;

/* SPECIAL [DS_HASH_SET [STRING]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T234;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING]] */
typedef struct {
	int id;
} T236;

/* DS_HASH_TABLE_CURSOR [INTEGER, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T238;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T239;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct {
	int id;
	T0* a5; /* context */
} T240;

/* DS_LINKED_QUEUE [STRING] */
typedef struct {
	int id;
	T0* a3; /* first_cell */
	T4 a4; /* count */
	T0* a5; /* last_cell */
} T242;

/* TO_SPECIAL [ET_XACE_LIBRARY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T243;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct {
	int id;
	T4 a5; /* code */
} T244;

/* YY_BUFFER */
typedef struct {
	int id;
	T2 a1; /* beginning_of_line */
	T4 a2; /* count */
	T2 a3; /* filled */
	T0* a4; /* content */
	T4 a5; /* index */
	T4 a6; /* line */
	T4 a7; /* column */
	T4 a8; /* position */
	T4 a11; /* capacity */
} T245;

/* YY_FILE_BUFFER */
typedef struct {
	int id;
	T2 a1; /* beginning_of_line */
	T4 a2; /* count */
	T2 a3; /* filled */
	T0* a4; /* content */
	T4 a5; /* index */
	T4 a6; /* line */
	T4 a7; /* column */
	T4 a8; /* position */
	T0* a10; /* file */
	T2 a12; /* end_of_file */
	T4 a13; /* capacity */
	T2 a14; /* interactive */
} T246;

/* DS_LINKED_STACK [INTEGER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T249;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T250;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T251;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T252;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T253;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T255;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
} T256;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T257;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T258;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T259;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T260;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T261;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T262;

/* DS_BILINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T263;

/* DS_BILINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T264;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* area */
} T265;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T266;

/* TO_SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
} T267;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T268;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T269;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T270;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T271;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T272;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T0* a1; /* area */
} T273;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T274;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T275;

/* UC_UNICODE_ROUTINES */
typedef struct {
	int id;
} T276;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T277;

/* EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
} T279;

/* UC_UTF8_ROUTINES */
typedef struct {
	int id;
} T280;

/* DS_LINKED_QUEUE [CHARACTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* first_cell */
	T0* a5; /* last_cell */
} T282;

/* UC_UTF16_ROUTINES */
typedef struct {
	int id;
} T283;

/* TO_SPECIAL [ET_XACE_CLUSTER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T284;

/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T285;

/* TO_SPECIAL [DS_HASH_SET [STRING]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T286;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a4; /* last_cell */
	T0* a5; /* internal_cursor */
	T0* a7; /* first_cell */
} T288;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T2 a1; /* before */
	T0* a3; /* current_cell */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
	T2 a6; /* after */
} T289;

/* DS_LINKABLE [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* item */
	T0* a2; /* right */
} T290;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T0* a1; /* area */
} T291;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T292;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T293;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct {
	int id;
	T4 a3; /* position */
	T0* a6; /* items */
	T0* a7; /* equality_tester */
	T4 a8; /* last_position */
	T4 a9; /* capacity */
	T4 a12; /* slots_position */
	T4 a14; /* count */
	T4 a15; /* modulus */
	T4 a16; /* clashes_previous_position */
	T4 a21; /* free_slot */
	T0* a22; /* internal_cursor */
	T4 a24; /* found_position */
	T0* a26; /* clashes */
	T0* a27; /* slots */
	T0* a28; /* special_item_routines */
} T294;

/* XM_COMMENT */
typedef struct {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
} T295;

/* XM_PROCESSING_INSTRUCTION */
typedef struct {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
} T296;

/* XM_CHARACTER_DATA */
typedef struct {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
} T297;

/* XM_NAMESPACE */
typedef struct {
	int id;
	T0* a2; /* uri */
	T0* a4; /* ns_prefix */
} T298;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T300;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a4; /* as_special */
	T0* a6; /* area */
} T301;

/* SPECIAL [ARRAY [INTEGER]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T302;

/* SPECIAL [SPECIAL [ARRAY [INTEGER]]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T303;

/* DS_LINKABLE [CHARACTER] */
typedef struct {
	int id;
	T1 a1; /* item */
	T0* a2; /* right */
} T304;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T305;

/* C_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* managed_data */
} T306;

/* DS_LINKABLE [XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
} T308;

/* XM_NODE_TYPER */
typedef struct {
	int id;
	T0* a1; /* element */
	T0* a3; /* xml_attribute */
	T0* a5; /* composite */
	T0* a6; /* document */
	T0* a7; /* character_data */
	T0* a8; /* processing_instruction */
	T0* a9; /* comment */
} T309;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct {
	int id;
	T1 a5; /* secondary_directory_separator */
} T316;

/* KL_UNIX_FILE_SYSTEM */
typedef struct {
	int id;
} T317;

/* KL_STRING_INPUT_STREAM */
typedef struct {
	int id;
	T2 a1; /* end_of_input */
	T1 a2; /* last_character */
	T0* a6; /* string */
	T4 a7; /* location */
} T319;

/* SPECIAL [XM_NAMESPACE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T320;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct {
	int id;
} T321;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T322;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct {
	int id;
} T323;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T324;

/* MANAGED_POINTER */
typedef struct {
	int id;
	T2 a1; /* is_shared */
	T14 a3; /* item */
	T4 a6; /* count */
} T325;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T326;

/* PLATFORM */
typedef struct {
	int id;
} T327;

/* TYPED_POINTER [NATURAL_8] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T328;

/* EXCEPTIONS */
typedef struct {
	int id;
} T329;

/* STRING_SEARCHER */
typedef struct {
	int id;
	T0* a2; /* deltas */
} T330;

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern int geargc;
extern char** geargv;

/* Call to UT_ERROR.default_message */
extern T0* T32x2035(T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T39x2056(T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T39x2055(T0* C);
/* Call to XM_NODE.parent */
extern T0* T137x4670(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T4 T154x7137(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T154x7012(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T2 T154x7142(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T154x7023(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T4 T154x7133(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T154x7021(T0* C);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T26x1627(T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T26x1632(T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T39x2060(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T39x2059(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T97x4948(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T98x5004(T0* C, T0* a1, T0* a2, T2 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T98x5005(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T98x5010(T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T98x5003(T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T98x5009(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T98x5011(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T98x5008(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T98x5012(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T98x5006(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T98x5007(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T98x5002(T0* C);
/* Call to XM_NODE.node_set_parent */
extern void T137x4678(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T137x4680(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T154x7008(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T154x7007(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T154x7013(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T154x7004(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T154x7148(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T154x7006(T0* C, T0* a1);
/* GEXACE.make */
extern T0* T18c20();
/* KL_EXCEPTIONS.die */
extern void T27f2(T0* C, T4 a1);
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

#endif
/* GEXACE.exceptions */
extern unsigned char ge118os1326;
extern T0* ge118ov1326;
extern T0* T18f6(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T27c1();
/* ET_XACE_DEFAULT_ERROR_HANDLER.has_error */
extern T2 T25f1(T0* C);
/* INTEGER.infix ">" */
extern T2 T4f4(T4* C, T4 a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].forth */
extern void T19f9(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_forth */
extern void T24f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].add_traversing_cursor */
extern void T24f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set_next_cursor */
extern void T19f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].remove_traversing_cursor */
extern void T24f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set */
extern void T19f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].item */
extern T0* T19f2(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].start */
extern void T19f8(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_start */
extern void T24f10(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_off */
extern T2 T24f7(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].new_cursor */
extern T0* T24f1(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].make */
extern T0* T19c7(T0* a1);
/* GEXACE.process_arguments */
extern void T18f22(T0* C);
/* GEXACE.process_command */
extern void T18f26(T0* C);
/* GEXACE.report_usage_error */
extern void T18f29(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error */
extern void T25f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T25f15(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T25f15p1(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T57f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T57f13(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T57f12(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T57f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T57f17(T0* C, T14 a1, T14 a2, T4 a3);
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

extern void file_mkdir(char* dirname);
extern void file_rename(char* old, char* new);
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

#endif
/* TYPED_POINTER [ANY].to_pointer */
extern T14 T70f2(T70* C);
/* KL_STRING_ROUTINES.as_string */
extern T0* T48f11(T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T219f6(T0* C);
/* UC_UTF8_STRING.next_byte_index */
extern T4 T219f23(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T4 T280f3(T0* C, T1 a1);
/* CHARACTER.infix "<=" */
extern T2 T1f18(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f2(T1* C, T1 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge131os3278;
extern T0* ge131ov3278;
extern T0* T219f24(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T280c22();
/* KL_INTEGER_ROUTINES.to_character */
extern T1 T221f2(T0* C, T4 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge67os2295;
extern T0* ge67ov2295;
extern T0* T219f22(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T221c4();
/* INTEGER.infix "<=" */
extern T2 T4f6(T4* C, T4 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge193os7933;
extern T4 ge193ov7933;
extern T4 T222f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T4 T222f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge121os2292;
extern T0* ge121ov2292;
extern T0* T219f21(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T222c5();
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T4 T219f20(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T4 T280f4(T0* C, T1 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T4 T280f2(T0* C, T1 a1);
/* STRING.append_character */
extern void T16f34(T0* C, T1 a1);
/* STRING.resize */
extern void T16f39(T0* C, T4 a1);
/* SPECIAL [CHARACTER].aliased_resized_area */
extern T0* T15f4(T0* C, T4 a1);
/* INTEGER.infix ">=" */
extern T2 T4f2(T4* C, T4 a1);
/* STRING.additional_space */
extern T4 T16f19(T0* C);
/* INTEGER.max */
extern T4 T4f12(T4* C, T4 a1);
/* STRING.capacity */
extern T4 T16f18(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T1 T219f19(T0* C, T4 a1);
/* UC_UTF8_STRING.old_item */
extern T1 T219f31(T0* C, T4 a1);
/* UC_UTF8_STRING.set_count */
extern void T219f62(T0* C, T4 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T219f70(T0* C);
/* STRING.make */
extern void T16f31(T0* C, T4 a1);
/* STRING.make */
extern T0* T16c31(T4 a1);
/* STRING.make_area */
extern void T16f33(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c8(T4 a1);
/* STRING.string */
extern T0* T16f22(T0* C);
/* STRING.append */
extern void T16f38(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.as_string */
extern T0* T219f5(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T219f17(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T2 T66f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge62os1411;
extern T0* ge62ov1411;
extern T0* T48f6(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T66c2();
/* KL_STDERR_FILE.string_ */
extern unsigned char ge70os1319;
extern T0* ge70ov1319;
extern T0* T57f3(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T48c15();
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T25f6(T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge52os1306;
extern T0* ge52ov1306;
extern T0* T18f15(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T31c7(T0* a1);
/* ARRAY [STRING].put */
extern void T62f7(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T62c6(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T62f8(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T49c4(T4 a1);
/* GEXACE.process_validate */
extern void T18f33(T0* C);
/* GEXACE.process_xace_file */
extern void T18f36(T0* C, T0* a1);
/* GEXACE.next_option */
extern T0* T18f17(T0* C);
/* KL_ARGUMENTS.argument */
extern T0* T20f1(T0* C, T4 a1);
/* GEXACE.has_next_option */
extern T2 T18f16(T0* C);
/* GEXACE.is_valid_option_position */
extern T2 T18f19(T0* C, T4 a1);
/* GEXACE.consume_option */
extern void T18f28(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].force_last */
extern void T24f9(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].put_right */
extern void T54f4(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T54c3(T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].is_empty */
extern T2 T24f3(T0* C);
/* GEXACE_VALIDATE_COMMAND.set_shallow */
extern void T38f7(T0* C, T2 a1);
/* GEXACE_VALIDATE_COMMAND.make */
extern T0* T38c6(T0* a1, T0* a2);
/* GEXACE.process_library */
extern void T18f32(T0* C);
/* GEXACE.process_output */
extern void T18f35(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_output_filename */
extern void T37f12(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T33f12(T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T18f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T2 T42f1(T0* C);
/* ET_XACE_XML_GENERATOR.set_shallow */
extern void T40f17(T0* C, T2 a1);
/* ET_XACE_XML_GENERATOR.make */
extern T0* T40c16(T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.make */
extern T0* T47c9(T0* a1, T0* a2);
/* GEXACE_LIBRARY_COMMAND.set_ve */
extern void T37f11(T0* C, T2 a1);
/* GEXACE_SYSTEM_COMMAND.set_ve */
extern void T33f11(T0* C, T2 a1);
/* ET_XACE_VE_GENERATOR.make */
extern T0* T46c16(T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.make */
extern T0* T45c15(T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.make */
extern T0* T44c10(T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.make */
extern T0* T43c10(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T42f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T64f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T64c3(T0* a1);
/* ET_XACE_GE_GENERATOR.make */
extern T0* T41c15(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_last */
extern void T21f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].keys_put */
extern void T21f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T21f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T21f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T4 T21f9(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T4 T21f7(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T4 T219f14(T0* C);
/* UC_UTF8_STRING.hash_code */
extern T4 T219f14p1(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f10(T4* C, T4 a1);
/* STRING.hash_code */
extern T4 T16f10(T0* C);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T21f43(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T21f51(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T52f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T50f3(T0* C, T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T50c4(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern unsigned char ge68os1827;
extern T0* ge68ov1827;
extern T0* T21f26(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T52c4();
/* DS_HASH_TABLE [STRING, STRING].keys_resize */
extern void T21f50(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T53f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T49f3(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_resize */
extern void T21f49(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_item */
extern T0* T21f15(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T4 T21f16(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T21f48(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T4 T21f18(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T4 T21f6(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_put */
extern void T21f42(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T21f41(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T2 T22f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.same_string */
extern T2 T48f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.item_code */
extern T4 T219f13(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_index */
extern T4 T219f28(T0* C, T4 a1);
/* STRING.item_code */
extern T4 T16f11(T0* C, T4 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T2 T48f8(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T2 T219f11(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T4 T219f27(T0* C, T0* a1, T4 a2);
/* UC_UTF8_STRING.item */
extern T1 T219f12(T0* C, T4 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T1 T219f29(T0* C, T4 a1);
/* STRING.item */
extern T1 T16f3(T0* C, T4 a1);
/* STRING.same_string */
extern T2 T16f13(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T2 T219f10(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T4 T219f26(T0* C, T0* a1, T4 a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern T0* T22f2(T0* C);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T21f40(T0* C);
/* STRING.is_equal */
extern T2 T16f7(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f8(T0* C, T0* a1, T0* a2, T4 a3);
/* GEXACE.next_option_value */
extern T0* T18f11(T0* C);
/* STRING.substring */
extern T0* T16f4(T0* C, T4 a1, T4 a2);
/* STRING.set_count */
extern void T16f32(T0* C, T4 a1);
/* STRING.new_string */
extern T0* T16f6(T0* C, T4 a1);
/* STRING.index_of */
extern T4 T16f5(T0* C, T1 a1, T4 a2);
/* GEXACE.has_next_option_value */
extern T2 T18f10(T0* C);
/* GEXACE.is_next_option_long_option */
extern T2 T18f9(T0* C);
/* GEXACE.string_ */
extern T0* T18f18(T0* C);
/* GEXACE_LIBRARY_COMMAND.set_shallow */
extern void T37f10(T0* C, T2 a1);
/* GEXACE_LIBRARY_COMMAND.make */
extern T0* T37c9(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].make */
extern T0* T42c8();
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T42f4(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T63c7(T0* a1);
/* GEXACE.process_cluster */
extern void T18f31(T0* C);
/* GEXACE.process_system */
extern void T18f30(T0* C);
/* GEXACE_SYSTEM_COMMAND.set_shallow */
extern void T33f10(T0* C, T2 a1);
/* GEXACE_SYSTEM_COMMAND.make */
extern T0* T33c9(T0* a1, T0* a2);
/* GEXACE.match_long_option */
extern T2 T18f8(T0* C, T0* a1);
/* GEXACE.process_options */
extern void T18f25(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.enable_verbose */
extern void T25f10(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge102os2309;
extern T0* ge102ov2309;
extern T0* T56f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T58c7();
/* KL_STDOUT_FILE.make_open_stdout */
extern void T58f8(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T58f10(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T58f2(T0* C, T4 a1);
/* KL_STDOUT_FILE.old_make */
extern void T58f9(T0* C, T0* a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge102os2310;
extern T0* ge102ov2310;
extern T0* T56f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T57c9();
/* KL_STDERR_FILE.make_open_stderr */
extern void T57f11(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T57f15(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T57f2(T0* C, T4 a1);
/* KL_STDERR_FILE.old_make */
extern void T57f14(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge100os1918;
extern T0* ge100ov1918;
extern T0* T25f4(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T56c3();
/* GEXACE.process_define */
extern void T18f24(T0* C);
/* GEXACE.process_define_string */
extern void T18f27(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].forth */
extern void T28f10(T0* C);
/* DS_LINKED_LIST [STRING].cursor_forth */
extern void T30f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].add_traversing_cursor */
extern void T30f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T28f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].remove_traversing_cursor */
extern void T30f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set */
extern void T28f11(T0* C, T0* a1, T2 a2, T2 a3);
/* GEXACE.split_on_first */
extern T0* T18f14(T0* C, T0* a1, T1 a2);
/* DS_PAIR [STRING, STRING].make */
extern T0* T29c3(T0* a1, T0* a2);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T48f2(T0* C, T0* a1, T4 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T219f57(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T219f72(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T219f57p1(T0* C);
/* STRING.wipe_out */
extern void T16f35(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T48f9(T0* C, T0* a1);
/* UC_UTF8_STRING.twin */
extern T0* T219f16(T0* C);
/* UC_UTF8_STRING.copy */
extern void T219f61(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T219f61p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f3(T0* C);
/* STRING.twin */
extern T0* T16f14(T0* C);
/* STRING.copy */
extern void T16f37(T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T219f9(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern void T219f56(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern T0* T219c56(T4 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T219f64(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T4 T219f37(T0* C);
/* UC_UTF8_STRING.capacity */
extern T4 T219f37p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T219f56p1(T0* C, T4 a1);
/* UC_UTF8_STRING.make_area */
extern void T219f71(T0* C, T4 a1);
/* UC_UTF8_STRING.substring */
extern T0* T219f15(T0* C, T4 a1, T4 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T219c58(T0* a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T219f69(T0* C, T0* a1, T4 a2, T4 a3, T4 a4, T4 a5);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T219f78(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T4 T280f6(T0* C, T4 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T219f68(T0* C, T1 a1, T4 a2, T4 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T4 T280f5(T0* C, T1 a1);
/* UC_UTF8_STRING.put_byte */
extern void T219f76(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.old_put */
extern void T219f67(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T219f35(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T4 T280f1(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T4 T219f43(T0* C, T4 a1, T4 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge142os8342;
extern T0* ge142ov8342;
extern T0* T280f12(T0* C);
/* UC_STRING.make_empty */
extern T0* T65c8();
/* UC_STRING.make */
extern void T65f9(T0* C, T4 a1);
/* UC_STRING.old_set_count */
extern void T65f12(T0* C, T4 a1);
/* UC_STRING.set_count */
extern void T65f11(T0* C, T4 a1);
/* UC_STRING.byte_capacity */
extern T4 T65f2(T0* C);
/* UC_STRING.capacity */
extern T4 T65f2p1(T0* C);
/* UC_STRING.make */
extern void T65f9p1(T0* C, T4 a1);
/* UC_STRING.make_area */
extern void T65f13(T0* C, T4 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T65f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T280f9(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T219f39(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].item */
extern T0* T28f2(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].start */
extern void T28f9(T0* C);
/* DS_LINKED_LIST [STRING].cursor_start */
extern void T30f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].cursor_off */
extern T2 T30f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].new_cursor */
extern T0* T30f1(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].make */
extern T0* T28c8(T0* a1);
/* GEXACE.split_string */
extern T0* T18f13(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING].put_last */
extern void T30f10(T0* C, T0* a1);
/* DS_LINKABLE [STRING].put_right */
extern void T61f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING].make */
extern T0* T61c3(T0* a1);
/* DS_LINKED_LIST [STRING].is_empty */
extern T2 T30f3(T0* C);
/* DS_LINKED_LIST [STRING].make */
extern T0* T30c9();
/* GEXACE.make_command_line_parser */
extern void T18f21(T0* C);
/* GEXACE.reset */
extern void T18f23(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make */
extern T0* T25c9();
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_warning_null */
extern void T25f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge101os1919;
extern T0* ge101ov1919;
extern T0* T25f8(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T59c3(T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T25f13(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T25f12(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T24c8();
/* DS_HASH_TABLE [STRING, STRING].set_key_equality_tester */
extern void T21f37(T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge133os1325;
extern T0* ge133ov1325;
extern T0* T18f3(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T22c3();
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern void T21f36(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern T0* T21c36(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T21f39(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T21f47(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T21f25(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T51c3(T0* a1);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T21f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T52f2(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T68c2(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T21f54(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_keys */
extern void T21f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T53f2(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T69c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T53c3();
/* DS_HASH_TABLE [STRING, STRING].make_items */
extern void T21f52(T0* C, T4 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T20f5(T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge116os1318;
extern T0* ge116ov1318;
extern T0* T18f1(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T20c4();
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T197f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T197f233(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T246f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T220f25(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge103os4003;
extern T0* ge103ov4003;
extern T0* T319f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T197f233p1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T197f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T197f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T197f32(T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T4 T301f1(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T246f19(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_BUFFER.set_position */
extern void T245f14(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_index */
extern void T246f18(T0* C, T4 a1);
/* YY_BUFFER.set_index */
extern void T245f13(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T197f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T246c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T246f21(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T246f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T246f25(T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T301f10(T0* C, T1 a1, T4 a2);
/* STRING.put */
extern void T16f44(T0* C, T1 a1, T4 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T2 T220f12(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T75f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T246f16(T0* C, T4 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T301c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge190os2336;
extern T2 ge190ov2336;
extern T2 T212f6(T0* C);
/* PLATFORM.default_create */
extern T0* T327c2();
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge120os1333;
extern T0* ge120ov1333;
extern T0* T301f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T212c7();
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge286os8124;
extern T4 ge286ov8124;
extern T4 T246f11(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T220c27(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].make */
extern T0* T282c6();
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T195f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T195f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T195f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T195f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T195f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T195f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T195f19(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T191f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T191f229(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T191f229p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T191f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T191f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T191f32(T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T191f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T154f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T154f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T154f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T154f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T154f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T154f182(T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T154f18(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T197f227(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T197f227p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T2 T197f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T197f227p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T197f237(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T244f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T4 T48f14(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T244f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T244f3(T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T280f23(T0* C, T0* a1, T4 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T280f20(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T244f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T2 T244f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T2 T244f1(T0* C);
/* UC_UNICODE_ROUTINES.valid_code */
extern T2 T276f2(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge128os2296;
extern T0* ge128ov2296;
extern T0* T244f4(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T276c25();
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T244f9(T0* C, T0* a1);
/* STRING.to_integer */
extern T4 T16f12(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T71f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T71f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T71f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T71f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T83f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T143f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge1970os3426;
extern T0* ge1970ov3426;
extern T0* T71f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T83c13();
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f3(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f9(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T6f3(T6* C);
/* ARRAY [NATURAL_64].put */
extern void T143f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T143c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T143f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T142c2(T4 a1);
/* STRING.has */
extern T2 T16f23(T0* C, T1 a1);
/* CHARACTER.is_digit */
extern T2 T1f4(T1* C);
/* NATURAL_8.infix ">" */
extern T2 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER.character_types */
extern T8 T1f6(T1* C, T4 a1);
/* CHARACTER.internal_character_types */
extern unsigned char ge35os35;
extern T0* ge35ov35;
extern T0* T1f8(T1* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T101c2(T4 a1);
/* INTEGER.to_natural_64 */
extern T11 T4f14(T4* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T71f21(T0* C, T4 a1);
/* STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T16f16(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T71f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T71f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T71f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c41(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T71f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T71c15();
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T2 T197f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T2 T197f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T197f181(T0* C, T4 a1, T4 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T301f3(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T4 T197f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T197f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T1 T197f207(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T197f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1208os7030;
extern T0* ge1208ov7030;
extern T0* T197f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T197f241(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T197f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T197f240(T0* C);
/* DS_LINKED_STACK [INTEGER].remove */
extern void T249f7(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T197f225(T0* C, T4 a1);
/* DS_LINKED_STACK [INTEGER].item */
extern T4 T249f2(T0* C);
/* DS_LINKED_STACK [INTEGER].is_empty */
extern T2 T249f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T197f238(T0* C, T4 a1);
/* DS_LINKED_STACK [INTEGER].force */
extern void T249f6(T0* C, T4 a1);
/* DS_LINKABLE [INTEGER].put_right */
extern void T290f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER].make */
extern T0* T290c3(T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T197f239(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T197f236(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T2 T197f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T197f235(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T246f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T301f5(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T220f26(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T220f26p1(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T4 T319f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T319f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T75f30(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge184os4025;
extern T0* ge184ov4025;
extern T0* T75f34(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T75f33(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T75f35(T0* C, T14 a1, T14 a2, T4 a3);
/* SPECIAL [CHARACTER].item_address */
extern T14 T15f5(T0* C, T4 a1);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T239f2(T239* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T75f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T75f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T75f29(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T1 T220f13(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].item */
extern T1 T282f2(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T220f30(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].remove */
extern void T282f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].wipe_out */
extern void T282f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T220f32(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T220f34(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T220f35(T0* C, T4 a1);
/* DS_LINKED_QUEUE [CHARACTER].force */
extern void T282f8(T0* C, T1 a1);
/* DS_LINKABLE [CHARACTER].put_right */
extern void T304f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].is_empty */
extern T2 T282f4(T0* C);
/* DS_LINKABLE [CHARACTER].make */
extern T0* T304c3(T1 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T220f21(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T48f17(T0* C, T0* a1);
/* STRING.clear_all */
extern void T16f46(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T220f3(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1199os7877;
extern T0* ge1199ov7877;
extern T0* T220f24(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T4 T283f7(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T2 T283f6(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T4 T283f5(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T2 T283f4(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T2 T283f3(T0* C, T4 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge129os2297;
extern T0* ge129ov2297;
extern T0* T220f17(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T283c16();
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T4 T220f23(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T4 T220f22(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T220f33(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T75f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T75f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T75f28(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T220f31(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T2 T280f8(T0* C, T1 a1, T1 a2, T1 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T2 T280f7(T0* C, T1 a1, T1 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T2 T283f2(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T2 T283f1(T0* C, T4 a1, T4 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T246f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T301f11(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.subcopy */
extern void T16f49(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_FILE_BUFFER.resize */
extern void T246f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T301f12(T0* C, T4 a1);
/* YY_BUFFER.fill */
extern void T245f15(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T4 T197f98(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T4 T197f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T197f232(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T1 T301f2(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T197f234(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T195f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T195f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T195f214(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T2 T195f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T195f159(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T4 T195f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T195f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T1 T195f194(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T195f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T195f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T195f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T195f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T195f205(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T195f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T195f213(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T2 T195f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T195f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T4 T195f66(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T4 T195f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T195f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T195f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T195f209(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T191f223(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T2 T191f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T191f223p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T191f232(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T2 T191f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T2 T191f62(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T191f178(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T4 T191f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T191f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T1 T191f205(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T191f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T191f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T191f237(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T191f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T191f236(T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T191f221(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T191f233(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T191f235(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T191f231(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T191f234(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T2 T191f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T191f230(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T4 T191f95(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T4 T191f94(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T191f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T154f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T154f209(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T2 T154f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T154f157(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T4 T154f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T154f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T1 T154f192(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T154f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T154f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T154f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T154f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T154f218(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T154f210(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T154f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T154f208(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T154f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T2 T154f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T154f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T4 T154f61(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T4 T154f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T154f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T197f229(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T195f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T191f225(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T154f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T197f230(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T220f29(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T2 T48f12(T0* C, T0* a1, T0* a2);
/* CHARACTER.lower */
extern T1 T1f17(T1* C);
/* CHARACTER.is_upper */
extern T2 T1f20(T1* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T4 T276f1(T0* C, T4 a1);
/* ARRAY [INTEGER].item */
extern T4 T217f4(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge124os8193;
extern T0* ge124ov8193;
extern T0* T276f3(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge124os8192;
extern T0* ge124ov8192;
extern T0* T276f8(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge124os8181;
extern T0* ge124ov8181;
extern T0* T276f15(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T4 T221f3(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T276f24(T0* C);
/* SPECIAL [ARRAY [INTEGER]].make */
extern T0* T302c2(T4 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge124os8191;
extern T0* ge124ov8191;
extern T0* T276f7(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge124os8190;
extern T0* ge124ov8190;
extern T0* T276f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge124os8189;
extern T0* ge124ov8189;
extern T0* T276f6(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge124os8188;
extern T0* ge124ov8188;
extern T0* T276f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge124os8187;
extern T0* ge124ov8187;
extern T0* T276f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge124os8186;
extern T0* ge124ov8186;
extern T0* T276f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge124os8185;
extern T0* ge124ov8185;
extern T0* T276f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge124os8184;
extern T0* ge124ov8184;
extern T0* T276f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge124os8183;
extern T0* ge124ov8183;
extern T0* T276f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge124os8182;
extern T0* ge124ov8182;
extern T0* T276f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge124os8180;
extern T0* ge124ov8180;
extern T0* T276f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge124os8179;
extern T0* ge124ov8179;
extern T0* T276f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge124os8178;
extern T0* ge124ov8178;
extern T0* T276f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge124os8177;
extern T0* ge124ov8177;
extern T0* T276f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge124os8176;
extern T0* ge124ov8176;
extern T0* T276f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge124os8175;
extern T0* ge124ov8175;
extern T0* T276f9(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER]]].make */
extern T0* T303c2(T4 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T48f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T195f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T191f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T154f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T197f231(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T161f3(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T195f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T191f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T154f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T197f228(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T161f7(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T319f10(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T75f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T75f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T75f42(T0* C, T14 a1);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T2 T319f4(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T2 T75f24(T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T75f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T75f2(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T195f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T191f224(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T154f199(T0* C);
/* XM_CHARACTER_DATA.process */
extern void T297f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T309f17(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T309f13(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T296f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T309f16(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T295f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T309f15(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T135f8(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T309f14(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T86f39(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T309f11(T0* C, T0* a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T297f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T296f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T295f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T135f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T86f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T147f2(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T144f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T144f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T144f12(T0* C);
/* DS_LINKED_QUEUE [STRING].make */
extern T0* T242c6();
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T240c10();
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T288c9();
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].new_cursor */
extern T0* T288f1(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T289c7(T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T91f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T294c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T321c2();
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T294f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T294f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T322c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T294f35(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T294f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T294f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T4 T294f20(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T294f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_keys */
extern void T294f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_items */
extern void T294f40(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T323f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T326c2(T4 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T320c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T323c3();
/* XM_DOCUMENT.make */
extern T0* T85c15();
/* XM_DOCUMENT.make_with_root_named */
extern void T85f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T85f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T85f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T308f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T308c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T2 T85f6(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T85f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T86f38(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T136f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T85f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T85f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T136f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T85f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T136f17(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_ELEMENT.cursor_forth */
extern void T86f45(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T86f47(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T86f48(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T136f14(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T85f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T85f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T136f13(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T308f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T85f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T308f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T85f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T85f36(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T136f15(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T85f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T85f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T2 T136f4(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T2 T85f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T2 T86f24(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T85f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T85f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T2 T136f3(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T2 T85f11(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T2 T86f23(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T86f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T86f37(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T86f36(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T86f35(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T86f42(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T86f40(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T86f43(T0* C);
/* XM_ELEMENT.remove_first */
extern void T86f34(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T86f41(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T136f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T136f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T85f23(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T2 T85f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T86f44(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T2 T86f25(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T86f7(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T136c9(T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T85f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T85f5(T0* C);
/* XM_DOCUMENT.list_make */
extern void T85f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T86c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T86f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1160os4679;
extern T0* ge1160ov4679;
extern T0* T85f3(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T298c8();
/* XM_NAMESPACE.make */
extern void T298f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T298c7(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T90f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T90f6p1(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T147c1();
/* XM_CALLBACKS_NULL.on_comment */
extern void T147f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T144f28(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T91f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T91f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T87f4(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T215f14(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T300f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T300c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T2 T215f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T216c3(T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T96f4(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T157f1(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T96f11(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T96f17(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T158f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T158f2(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T2 T158f1(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T157f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T250f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T250f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T250c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T2 T157f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T157c8();
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T157f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T251c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T158f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T252f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T252c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T158c5();
/* XM_EIFFEL_PARSER.is_correct */
extern T2 T96f1(T0* C);
/* XM_EIFFEL_PARSER.syntax_error */
extern T2 T96f3(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T2 T91f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T295c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T86f28(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T86f28p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T86f28p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T86f33(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T86f17(T0* C);
/* XM_ELEMENT.is_empty */
extern T2 T86f16(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T295c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T90f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T90f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T147f5(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T144f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T91f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T296c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T296c4(T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T90f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T90f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T147f6(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T144f30(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T91f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T297c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T90f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T90f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T147f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T144f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T240f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].force_last */
extern void T288f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].put_right */
extern void T305f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].attach_left */
extern void T305f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T305c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].is_empty */
extern T2 T288f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T240f8(T0* C);
/* DS_HASH_TABLE [STRING, STRING].set_equality_tester */
extern void T21f57(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T240f9(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_map_default */
extern T0* T21c56();
/* DS_HASH_TABLE [STRING, STRING].default_capacity */
extern T4 T21f34(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T91f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T86c27(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T86c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T85f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T85f27(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T136f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T85f25(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T86f46(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T91f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T294f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T294f39(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T294f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T4 T294f13(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T4 T294f11(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T4 T298f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T294f37(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T294f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_resize */
extern void T294f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_resize */
extern void T294f45(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T323f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T320f3(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_item */
extern T0* T294f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_item */
extern T0* T294f5(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T4 T294f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T294f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T4 T294f10(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_put */
extern void T294f36(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T294f33(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T2 T321f1(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T2 T298f1(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T298f3(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T294f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T2 T298f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T294f2(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T2 T294f1(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T90f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T90f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T147f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T144f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T240f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_last */
extern void T288f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].set_last_cell */
extern void T288f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].forget_right */
extern void T305f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_last_cursors_after */
extern void T288f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_next_cursor */
extern void T289f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_after */
extern void T289f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].wipe_out */
extern void T288f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_all_cursors_after */
extern void T288f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T240f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1134os8041;
extern T0* ge1134ov8041;
extern T0* T240f7(T0* C);
/* STRING.make_empty */
extern T0* T16c42();
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T144f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T240f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].back */
extern void T289f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_back */
extern void T288f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].add_traversing_cursor */
extern void T288f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_traversing_cursor */
extern void T288f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set */
extern void T289f13(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].go_before */
extern void T289f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_go_before */
extern void T288f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_before */
extern void T289f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_off */
extern T2 T288f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].item */
extern T0* T21f32(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].items_item */
extern T0* T21f33(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T2 T21f31(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].item */
extern T0* T289f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].finish */
extern void T289f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_finish */
extern void T288f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1134os8042;
extern T0* ge1134ov8042;
extern T0* T240f6(T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T2 T144f4(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T91f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T86f2(T0* C);
/* XM_DOCUMENT.process */
extern void T85f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T309f12(T0* C, T0* a1);
/* XM_NODE_TYPER.default_create */
extern T0* T309c10();
/* XM_ELEMENT.is_root_node */
extern T2 T86f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T2 T85f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T90f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T90f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T147f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T144f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T240f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_new */
extern void T21f58(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].last */
extern T0* T288f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T2 T240f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T144f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING].force */
extern void T242f7(T0* C, T0* a1);
/* DS_LINKED_QUEUE [STRING].is_empty */
extern T2 T242f2(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T240f13(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T2 T144f8(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T2 T144f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T144f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1101os2114;
extern T0* ge1101ov2114;
extern T0* T144f20(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T91f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T135c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T90f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T90f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T147f3(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T144f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T91f13(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T90f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T90f7p1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T147f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T144f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T144f31p1(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T48f5(T0* C, T0* a1, T0* a2);
/* STRING.append_string */
extern void T16f36(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T48f10(T0* C, T0* a1, T0* a2);
/* STRING.infix "+" */
extern T0* T16f15(T0* C, T0* a1);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T219f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T219f7(T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T219f52(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge207os3221;
extern T0* ge207ov3221;
extern T0* T219f38(T0* C);
/* UC_UTF8_STRING.append_substring */
extern void T219f54(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T219f66(T0* C, T4 a1);
/* UC_UTF8_STRING.resize */
extern void T219f77(T0* C, T4 a1);
/* UC_UTF8_STRING.append_string */
extern void T219f52p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T219f65(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T4 T219f40(T0* C);
/* ISE_RUNTIME.check_assert */
extern T2 T281s1(T2 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T144f6(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T144f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T144f39(T0* C);
/* DS_LINKED_QUEUE [STRING].remove */
extern void T242f8(T0* C);
/* DS_LINKED_QUEUE [STRING].wipe_out */
extern void T242f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T144f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1101os2113;
extern T0* ge1101ov2113;
extern T0* T144f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1101os2121;
extern T0* ge1101ov2121;
extern T0* T144f18(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1101os2120;
extern T0* ge1101ov2120;
extern T0* T144f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T2 T144f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1101os2115;
extern T0* ge1101ov2115;
extern T0* T144f22(T0* C);
/* DS_LINKED_QUEUE [STRING].item */
extern T0* T242f1(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T2 T144f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T2 T240f1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T91f18(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T90f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T90f12p1(T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T147f11(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T144f35(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T91f20(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T90f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T90f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T147f12(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T144f41(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T91f23(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T90f16(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T144f40(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T91f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T90f5(T0* C, T0* a1);
/* ET_XACE_VE41_GENERATOR.generate_system */
extern void T47f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_esd_file */
extern void T47f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_options */
extern void T47f20(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_OPTIONS.console_application */
extern T2 T106f23(T0* C);
/* UT_TRISTATE.is_true */
extern T2 T223f2(T0* C);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T2 T106f90(T0* C);
/* UT_TRISTATE.is_undefined */
extern T2 T223f1(T0* C);
/* UT_TRISTATE.is_false */
extern T2 T223f3(T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T106f53(T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1009os6390;
extern T0* ge1009ov6390;
extern T0* T106f240(T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge997os2064;
extern T0* ge997ov2064;
extern T0* T106f176(T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T122c199();
/* ET_XACE_OPTIONS.is_target_declared */
extern T2 T106f165(T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T4 T106f161(T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T2 T106f160(T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T2 T106f158(T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T2 T106f157(T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T2 T106f149(T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T2 T106f148(T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T2 T106f45(T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T2 T106f147(T0* C);
/* ET_XACE_OPTIONS.map */
extern T2 T106f145(T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T2 T106f144(T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T106f140(T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1009os6363;
extern T0* ge1009ov6363;
extern T0* T106f318(T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T2 T106f139(T0* C);
/* ET_XACE_VE41_GENERATOR.string_ */
extern T0* T47f8(T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T2 T106f135(T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T2 T106f134(T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T2 T106f133(T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T2 T106f132(T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T2 T106f129(T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T2 T106f128(T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T106f33(T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1009os6355;
extern T0* ge1009ov6355;
extern T0* T106f214(T0* C);
/* DS_HASH_SET [STRING].put_new */
extern void T109f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING].items_put */
extern void T109f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [STRING].slots_put */
extern void T109f49(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [STRING].clashes_put */
extern void T109f48(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [STRING].slots_item */
extern T4 T109f17(T0* C, T4 a1);
/* DS_HASH_SET [STRING].hash_position */
extern T4 T109f11(T0* C, T0* a1);
/* DS_HASH_SET [STRING].clashes_item */
extern T4 T109f16(T0* C, T4 a1);
/* DS_HASH_SET [STRING].unset_found_item */
extern void T109f45(T0* C);
/* DS_HASH_SET [STRING].set_equality_tester */
extern void T109f38(T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T106f175(T0* C);
/* DS_HASH_SET [STRING].make */
extern void T109f40(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make */
extern T0* T109c40(T4 a1);
/* DS_HASH_SET [STRING].new_cursor */
extern T0* T109f2(T0* C);
/* DS_HASH_SET_CURSOR [STRING].make */
extern T0* T107c6(T0* a1);
/* DS_HASH_SET [STRING].make_slots */
extern void T109f53(T0* C, T4 a1);
/* DS_HASH_SET [STRING].special_integer_ */
extern T0* T109f30(T0* C);
/* DS_HASH_SET [STRING].new_modulus */
extern T4 T109f19(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_clashes */
extern void T109f52(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_keys */
extern void T109f51(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_items */
extern void T109f50(T0* C, T4 a1);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T2 T106f126(T0* C);
/* DS_HASH_SET [STRING].is_empty */
extern T2 T109f4(T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T4 T106f123(T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T2 T106f122(T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T2 T106f117(T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T2 T106f116(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T77f31(T0* C, T4 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T77f30(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T77f33(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T77f35(T0* C, T14 a1, T1 a2);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T4 T106f115(T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T2 T106f114(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T77f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T77f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T77f34(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T77f9(T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T2 T106f113(T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T2 T106f112(T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T2 T106f59(T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T2 T106f111(T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T2 T106f30(T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T2 T106f103(T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T2 T106f101(T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T2 T106f100(T0* C);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T2 T106f99(T0* C);
/* ET_XACE_OPTIONS.debug_option */
extern T2 T106f25(T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T2 T106f98(T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T106f24(T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1009os6334;
extern T0* ge1009ov6334;
extern T0* T106f198(T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T2 T106f97(T0* C);
/* DS_HASH_SET [STRING].has */
extern T2 T109f3(T0* C, T0* a1);
/* DS_HASH_SET [STRING].search_position */
extern void T109f44(T0* C, T0* a1);
/* DS_HASH_SET [STRING].keys_item */
extern T0* T109f23(T0* C, T4 a1);
/* DS_HASH_SET [STRING].items_item */
extern T0* T109f31(T0* C, T4 a1);
/* DS_HASH_SET [STRING].key_equality_tester */
extern T0* T109f22(T0* C);
/* ET_XACE_VE41_GENERATOR.options */
extern T0* T47f7(T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T106f20(T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1009os6323;
extern T0* ge1009ov6323;
extern T0* T106f190(T0* C);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T2 T106f81(T0* C);
/* ET_XACE_VE41_GENERATOR.print_link_libraries */
extern void T47f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.remove_all_characters */
extern T0* T47f6(T0* C, T0* a1, T1 a2);
/* UC_UTF8_STRING.remove */
extern void T219f60(T0* C, T4 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T219f73(T0* C, T4 a1, T4 a2);
/* STRING.remove */
extern void T16f45(T0* C, T4 a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T2 T121f2(T0* C);
/* ET_XACE_SYSTEM.merge_externals */
extern void T74f8(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T105f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T113f3(T0* C, T4 a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T104f7(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T112f39(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T111f2(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].forth */
extern void T108f9(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_forth */
extern void T110f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_position */
extern void T108f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].add_traversing_cursor */
extern void T110f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_next_cursor */
extern void T108f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].remove_traversing_cursor */
extern void T110f24(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T121f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].force_last */
extern void T30f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].item */
extern T0* T108f2(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_item */
extern T0* T110f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T110f14(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].after */
extern T2 T108f1(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_after */
extern T2 T110f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING].start */
extern void T108f8(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_start */
extern void T110f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].is_empty */
extern T2 T110f2(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].off */
extern T2 T108f5(T0* C);
/* DS_ARRAYED_LIST [STRING].cursor_off */
extern T2 T110f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].cursor_before */
extern T2 T110f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T110f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T108c7(T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T106f138(T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1009os6362;
extern T0* ge1009ov6362;
extern T0* T106f316(T0* C);
/* DS_ARRAYED_LIST [STRING].set_equality_tester */
extern void T110f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T110c17(T4 a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T2 T106f137(T0* C);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T121f10(T0* C, T0* a1);
/* ET_XACE_OPTIONS.header */
extern T0* T106f121(T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1009os6351;
extern T0* ge1009ov6351;
extern T0* T106f304(T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T2 T106f120(T0* C);
/* DS_HASH_SET_CURSOR [STRING].forth */
extern void T107f8(T0* C);
/* DS_HASH_SET [STRING].cursor_forth */
extern void T109f64(T0* C, T0* a1);
/* DS_HASH_SET [STRING].add_traversing_cursor */
extern void T109f66(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_next_cursor */
extern void T107f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING].remove_traversing_cursor */
extern void T109f65(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_position */
extern void T107f9(T0* C, T4 a1);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T121f9(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].item */
extern T0* T107f2(T0* C);
/* DS_HASH_SET [STRING].cursor_item */
extern T0* T109f33(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].after */
extern T2 T107f1(T0* C);
/* DS_HASH_SET [STRING].cursor_after */
extern T2 T109f32(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].start */
extern void T107f7(T0* C);
/* DS_HASH_SET [STRING].cursor_start */
extern void T109f63(T0* C, T0* a1);
/* DS_HASH_SET [STRING].cursor_off */
extern T2 T109f36(T0* C, T0* a1);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T106f96(T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1009os6333;
extern T0* ge1009ov6333;
extern T0* T106f288(T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T2 T106f95(T0* C);
/* ET_XACE_EXTERNALS.make */
extern T0* T121c8();
/* ET_XACE_VE41_GENERATOR.print_callbacks */
extern void T47f18(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].forth */
extern void T133f9(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_forth */
extern void T132f61(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].add_traversing_cursor */
extern void T132f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].set_next_cursor */
extern void T133f11(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].remove_traversing_cursor */
extern void T132f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].set_position */
extern void T133f10(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].clashes_item */
extern T4 T132f17(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].item */
extern T0* T133f3(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_item */
extern T0* T132f35(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].items_item */
extern T0* T132f7(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].key */
extern T0* T133f2(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_key */
extern T0* T132f34(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].keys_item */
extern T0* T132f21(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].after */
extern T2 T133f1(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_after */
extern T2 T132f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].start */
extern void T133f8(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_start */
extern void T132f60(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].cursor_off */
extern T2 T132f39(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].is_empty */
extern T2 T132f38(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].new_cursor */
extern T0* T132f2(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING], STRING].make */
extern T0* T133c7(T0* a1);
/* ET_XACE_VE41_GENERATOR.merge_callbacks */
extern void T47f23(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T116f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T115f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T115f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T116f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T115f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T116f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T119f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T118f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T118f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T119f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T118f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T119f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].force */
extern void T132f42(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].keys_put */
extern void T132f50(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].slots_put */
extern void T132f49(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].clashes_put */
extern void T132f48(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].slots_item */
extern T4 T132f18(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].hash_position */
extern T4 T132f12(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].resize */
extern void T132f47(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].clashes_resize */
extern void T132f55(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].special_integer_ */
extern T0* T132f30(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].keys_resize */
extern void T132f54(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].items_resize */
extern void T132f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING]].resize */
extern T0* T236f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_HASH_SET [STRING]].resized_area */
extern T0* T234f3(T0* C, T4 a1);
/* SPECIAL [DS_HASH_SET [STRING]].make */
extern T0* T234c4(T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].slots_resize */
extern void T132f52(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].new_modulus */
extern T4 T132f24(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].new_capacity */
extern T4 T132f11(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].items_put */
extern void T132f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].search_position */
extern void T132f43(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].unset_found_item */
extern void T132f45(T0* C);
/* DS_HASH_SET [STRING].force */
extern void T109f39(T0* C, T0* a1);
/* DS_HASH_SET [STRING].resize */
extern void T109f47(T0* C, T4 a1);
/* DS_HASH_SET [STRING].clashes_resize */
extern void T109f58(T0* C, T4 a1);
/* DS_HASH_SET [STRING].keys_resize */
extern void T109f57(T0* C, T4 a1);
/* DS_HASH_SET [STRING].items_resize */
extern void T109f56(T0* C, T4 a1);
/* DS_HASH_SET [STRING].slots_resize */
extern void T109f55(T0* C, T4 a1);
/* DS_HASH_SET [STRING].new_capacity */
extern T4 T109f10(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_default */
extern T0* T109c37();
/* DS_HASH_SET [STRING].default_capacity */
extern T4 T109f7(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].item */
extern T0* T132f4(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].has */
extern T2 T132f3(T0* C, T0* a1);
/* ET_XACE_OPTIONS.callback */
extern T0* T106f83(T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1009os6324;
extern T0* ge1009ov6324;
extern T0* T106f280(T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T2 T106f82(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T119f4(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T119f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T118f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T2 T118f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T118f4(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T119c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T116f4(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T116f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T115f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T2 T115f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T115f2(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T116c7(T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].set_key_equality_tester */
extern void T132f41(T0* C, T0* a1);
/* ET_XACE_VE41_GENERATOR.string_equality_tester */
extern T0* T47f5(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_map */
extern T0* T132c40(T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_with_equality_testers */
extern void T132f44(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_sparse_container */
extern void T132f51(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_slots */
extern void T132f59(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_clashes */
extern void T132f58(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_keys */
extern void T132f57(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING], STRING].make_items */
extern void T132f56(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING]].make */
extern T0* T236f2(T0* C, T4 a1);
/* TO_SPECIAL [DS_HASH_SET [STRING]].make_area */
extern T0* T286c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING]].default_create */
extern T0* T236c3();
/* ET_XACE_VE41_GENERATOR.print_interface_classes */
extern void T47f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.merge_interface_classes */
extern void T47f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.layout */
extern T0* T106f131(T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1009os6358;
extern T0* ge1009ov6358;
extern T0* T106f310(T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T2 T106f130(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T2 T219f47(T0* C);
/* STRING.is_empty */
extern T2 T16f25(T0* C);
/* ET_XACE_VE41_GENERATOR.print_clusters */
extern void T47f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_cluster */
extern void T47f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T112f18(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T317f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T219f53(T0* C, T1 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T317f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T316f1(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T2 T316f3(T0* C, T1 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T316f2(T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge99os1329;
extern T0* ge99ov1329;
extern T0* T112f21(T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge99os1332;
extern T0* ge99ov1332;
extern T0* T112f24(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T317c4();
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge190os2335;
extern T2 ge190ov2335;
extern T2 T212f5(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T212f3(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T279f2(T0* C);
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

#endif
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge190os2339;
extern T0* ge190ov2339;
extern T0* T212f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T279c4();
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T212f2(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T279f1(T0* C, T0* a1);
/* STRING.make_from_c */
extern T0* T16c47(T14 a1);
/* STRING.from_c */
extern void T16f48(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T306f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T306f8(T0* C, T0* a1, T4 a2, T4 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T325f2(T0* C, T4 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T328f2(T328* C, T14 a1, T4 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T328f3(T328* C, T14 a1, T14 a2, T4 a3);
#include <string.h>
/* C_STRING.share_from_pointer */
extern void T306f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T306f7(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T325f9(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T325c8(T14 a1, T4 a2);
/* C_STRING.c_strlen */
extern T4 T306f3(T0* C, T14 a1);
/* STRING.c_string_provider */
extern unsigned char ge6os1165;
extern T0* ge6ov1165;
extern T0* T16f26(T0* C);
/* C_STRING.make_empty */
extern T0* T306c4(T4 a1);
/* MANAGED_POINTER.make */
extern T0* T325c7(T4 a1);
/* EXCEPTIONS.raise */
extern void T329f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T329f4(T0* C, T14 a1, T4 a2);
/* EXCEPTIONS.default_create */
extern T0* T329c2();
/* MANAGED_POINTER.default_pointer */
extern T14 T325f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T4 a1, T4 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T4 a1, T4 a2);
#include <stdlib.h>
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T279f3(T0* C, T14 a1);
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

extern EIF_INTEGER eif_system(char* s);
extern void eif_system_asynchronous(char* cmd);
extern char* eif_getenv(char* k);

#endif
/* UC_UTF8_STRING.to_c */
extern T0* T219f4(T0* C);
/* STRING.to_c */
extern T0* T16f24(T0* C);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge99os1330;
extern T0* ge99ov1330;
extern T0* T112f23(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T316c6();
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge190os2334;
extern T2 ge190ov2334;
extern T2 T212f1(T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern T0* T112f22(T0* C);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T112f16(T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T112f20(T0* C);
/* ET_XACE_VE41_GENERATOR.print_escaped_name */
extern void T47f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_indentation */
extern void T47f14(T0* C, T4 a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T77f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T77f27(T0* C, T0* a1);
/* ET_XACE_VE_GENERATOR.generate_system */
extern void T46f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_xml_system_file */
extern void T46f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_mounted_libraries */
extern void T46f26(T0* C, T0* a1, T4 a2, T0* a3);
/* UC_UTF8_STRING.has_substring */
extern T2 T219f48(T0* C, T0* a1);
/* STRING.has_substring */
extern T2 T16f27(T0* C, T0* a1);
/* STRING.substring_index */
extern T4 T16f29(T0* C, T0* a1, T4 a2);
/* STRING_SEARCHER.substring_index */
extern T4 T330f1(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T4 T330f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T330f6(T0* C, T0* a1, T4 a2, T0* a3);
/* SPECIAL [INTEGER].fill_with */
extern void T50f10(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.string_searcher */
extern unsigned char ge6os1164;
extern T0* ge6ov1164;
extern T0* T16f30(T0* C);
/* STRING_SEARCHER.make */
extern T0* T330c5();
/* ET_XACE_VE_GENERATOR.print_clusters */
extern void T46f25(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_cluster */
extern void T46f28(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_class_options */
extern void T46f30(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_feature_options */
extern void T46f31(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.string_ */
extern T0* T46f9(T0* C);
/* ET_XACE_VE_GENERATOR.print_console_application_option */
extern void T46f24(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_VE_GENERATOR.print_options */
extern void T46f23(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T2 T106f70(T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T2 T106f174(T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T106f65(T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1009os6400;
extern T0* ge1009ov6400;
extern T0* T106f260(T0* C);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T2 T106f173(T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T106f172(T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1009os6399;
extern T0* ge1009ov6399;
extern T0* T106f340(T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T2 T106f171(T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T106f170(T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1009os6398;
extern T0* ge1009ov6398;
extern T0* T106f338(T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T2 T106f169(T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T2 T106f64(T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T2 T106f168(T0* C);
/* ET_XACE_OPTIONS.unicode */
extern T0* T106f75(T0* C);
/* ET_XACE_OPTIONS.default_unicode */
extern unsigned char ge1009os6394;
extern T0* ge1009ov6394;
extern T0* T106f276(T0* C);
/* ET_XACE_OPTIONS.is_unicode_declared */
extern T2 T106f167(T0* C);
/* ET_XACE_OPTIONS.trace */
extern T2 T106f54(T0* C);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T2 T106f166(T0* C);
/* ET_XACE_OPTIONS.target_os */
extern T0* T106f72(T0* C);
/* ET_XACE_OPTIONS.default_target_os */
extern unsigned char ge1009os6392;
extern T0* ge1009ov6392;
extern T0* T106f272(T0* C);
/* ET_XACE_OPTIONS.is_target_os_declared */
extern T2 T106f71(T0* C);
/* ET_XACE_OPTIONS.target_architecture */
extern T0* T106f74(T0* C);
/* ET_XACE_OPTIONS.default_target_architecture */
extern unsigned char ge1009os6391;
extern T0* ge1009ov6391;
extern T0* T106f274(T0* C);
/* ET_XACE_OPTIONS.is_target_architecture_declared */
extern T2 T106f73(T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T2 T106f69(T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T2 T106f164(T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T106f163(T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1009os6388;
extern T0* ge1009ov6388;
extern T0* T106f336(T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T2 T106f162(T0* C);
/* ET_XACE_OPTIONS.split */
extern T2 T106f68(T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T2 T106f159(T0* C);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T106f52(T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1009os6384;
extern T0* ge1009ov6384;
extern T0* T106f238(T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T2 T106f51(T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T2 T106f14(T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T2 T106f13(T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T2 T106f16(T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T2 T106f15(T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T106f156(T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1009os6380;
extern T0* ge1009ov6380;
extern T0* T106f330(T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T2 T106f155(T0* C);
/* ET_XACE_OPTIONS.profile */
extern T2 T106f50(T0* C);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T2 T106f154(T0* C);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T106f153(T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1009os6378;
extern T0* ge1009ov6378;
extern T0* T106f328(T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T2 T106f152(T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T106f49(T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1009os6377;
extern T0* ge1009ov6377;
extern T0* T106f234(T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T2 T106f48(T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T2 T106f151(T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T2 T106f150(T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T106f47(T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1009os6375;
extern T0* ge1009ov6375;
extern T0* T106f232(T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T2 T106f46(T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T2 T106f42(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T2 T106f146(T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T2 T106f63(T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T2 T106f143(T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T2 T106f142(T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T2 T106f141(T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T2 T106f35(T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T2 T106f136(T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T4 T106f34(T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T2 T106f127(T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T2 T106f32(T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T2 T106f125(T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T2 T106f62(T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T2 T106f124(T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T2 T106f67(T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T2 T106f119(T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T106f61(T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1009os6348;
extern T0* ge1009ov6348;
extern T0* T106f252(T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T2 T106f118(T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T106f110(T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1009os6343;
extern T0* ge1009ov6343;
extern T0* T106f296(T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T2 T106f109(T0* C);
/* ET_XACE_OPTIONS.include */
extern T0* T106f108(T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1009os6354;
extern T0* ge1009ov6354;
extern T0* T106f294(T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T2 T106f107(T0* C);
/* ET_XACE_OPTIONS.exclude */
extern T0* T106f106(T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1009os6342;
extern T0* ge1009ov6342;
extern T0* T106f292(T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T2 T106f105(T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T2 T106f31(T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T2 T106f104(T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T2 T106f29(T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T2 T106f102(T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T106f28(T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1009os6338;
extern T0* ge1009ov6338;
extern T0* T106f204(T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T2 T106f27(T0* C);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T106f26(T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1009os6336;
extern T0* ge1009ov6336;
extern T0* T106f202(T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T106f94(T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1009os6332;
extern T0* ge1009ov6332;
extern T0* T106f286(T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T2 T106f93(T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T2 T106f92(T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T2 T106f91(T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T106f89(T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1009os6329;
extern T0* ge1009ov6329;
extern T0* T106f282(T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T2 T106f88(T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T2 T106f22(T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T2 T106f87(T0* C);
/* ET_XACE_OPTIONS.clean */
extern T2 T106f66(T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T2 T106f86(T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T2 T106f21(T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T2 T106f85(T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T2 T106f60(T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T2 T106f84(T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T106f80(T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1009os6322;
extern T0* ge1009ov6322;
extern T0* T106f278(T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T2 T106f79(T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T2 T106f19(T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T2 T106f78(T0* C);
/* ET_XACE_OPTIONS.arguments */
extern T0* T106f18(T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1009os6320;
extern T0* ge1009ov6320;
extern T0* T106f186(T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T2 T106f77(T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T2 T106f17(T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T2 T106f76(T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T2 T106f12(T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T2 T106f11(T0* C);
/* ET_XACE_VE_GENERATOR.print_indentation */
extern void T46f22(T0* C, T4 a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_quote_escaped_string */
extern void T46f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.quot_entity */
extern unsigned char ge1101os2108;
extern T0* ge1101ov2108;
extern T0* T46f7(T0* C);
/* ET_XACE_VE_GENERATOR.print_escaped_string */
extern void T46f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_escaped_character */
extern void T46f29(T0* C, T4 a1, T0* a2);
/* ET_XACE_VE_GENERATOR.amp_entity */
extern unsigned char ge1101os2107;
extern T0* ge1101ov2107;
extern T0* T46f15(T0* C);
/* ET_XACE_VE_GENERATOR.gt_entity */
extern unsigned char ge1101os2106;
extern T0* ge1101ov2106;
extern T0* T46f13(T0* C);
/* ET_XACE_VE_GENERATOR.lt_entity */
extern unsigned char ge1101os2105;
extern T0* ge1101ov2105;
extern T0* T46f11(T0* C);
/* ET_XACE_VE_GENERATOR.is_escaped */
extern T2 T46f8(T0* C, T4 a1);
/* ET_XACE_ISE_GENERATOR.generate_system */
extern void T45f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_ace_file */
extern void T45f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_link_libraries */
extern void T45f26(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING].is_last */
extern T2 T28f7(T0* C);
/* DS_LINKED_LIST [STRING].cursor_is_last */
extern T2 T30f8(T0* C, T0* a1);
/* ET_XACE_ISE_GENERATOR.replace_all_characters */
extern T0* T45f9(T0* C, T0* a1, T1 a2, T1 a3);
/* UC_UTF8_STRING.put */
extern void T219f59(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T219f74(T0* C, T4 a1, T4 a2);
/* ET_XACE_ISE_GENERATOR.string_ */
extern T0* T45f7(T0* C);
/* ET_XACE_ISE_GENERATOR.is_windows */
extern T2 T45f8(T0* C);
/* ET_XACE_ISE_GENERATOR.operating_system */
extern T0* T45f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T211f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T211f4(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge172os7716;
extern T0* ge172ov7716;
extern T0* T211f3(T0* C);
/* ET_XACE_ISE_GENERATOR.execution_environment */
extern unsigned char ge119os1328;
extern T0* ge119ov1328;
extern T0* T45f13(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T211c5();
/* DS_HASH_TABLE [STRING, STRING].value */
extern T0* T21f30(T0* C, T0* a1);
/* ET_XACE_ISE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T45f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T2 T121f3(T0* C);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T2 T121f1(T0* C);
/* ET_XACE_ISE_GENERATOR.print_assemblies */
extern void T45f24(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T124f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T123f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T123f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T124f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T123f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T124f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T124f2(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T124f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T123f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T2 T123f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T123f2(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T124c7(T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T2 T123f1(T0* C);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T104f6(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T112f38(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T123f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T232f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T232c3(T0* a1);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T125f9(T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T125c8(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T123c8();
/* ET_XACE_ISE_GENERATOR.print_clusters */
extern void T45f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_cluster */
extern void T45f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_class_options */
extern T2 T45f11(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ISE_GENERATOR.options */
extern T0* T45f6(T0* C);
/* ET_XACE_ISE_GENERATOR.print_cluster_options */
extern T2 T45f10(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_OPTIONS.namespace */
extern T0* T106f343(T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1009os6373;
extern T0* ge1009ov6373;
extern T0* T106f344(T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T2 T106f342(T0* C);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T2 T112f15(T0* C);
/* ET_XACE_ISE_GENERATOR.print_options */
extern void T45f22(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T2 T106f58(T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T2 T106f57(T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T2 T106f56(T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T2 T106f55(T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T106f44(T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1009os6371;
extern T0* ge1009ov6371;
extern T0* T106f228(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T2 T106f43(T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T106f41(T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1009os6369;
extern T0* ge1009ov6369;
extern T0* T106f224(T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T2 T106f40(T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T106f39(T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1009os6368;
extern T0* ge1009ov6368;
extern T0* T106f222(T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T2 T106f38(T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T106f37(T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1009os6367;
extern T0* ge1009ov6367;
extern T0* T106f220(T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T2 T106f36(T0* C);
/* ET_XACE_ISE_GENERATOR.print_escaped_name */
extern void T45f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.is_lace_keyword */
extern T2 T45f5(T0* C, T0* a1);
/* ARRAY [STRING].item */
extern T0* T62f5(T0* C, T4 a1);
/* ET_XACE_ISE_GENERATOR.lace_keywords */
extern unsigned char ge1035os2190;
extern T0* ge1035ov2190;
extern T0* T45f12(T0* C);
/* UC_UTF8_STRING.has */
extern T2 T219f44(T0* C, T1 a1);
/* UC_UTF8_STRING.index_of */
extern T4 T219f45(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.index_of_code */
extern T4 T219f46(T0* C, T4 a1, T4 a2);
/* ET_XACE_ISE_GENERATOR.print_indentation */
extern void T45f20(T0* C, T4 a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.generate_system */
extern void T44f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_ace_file */
extern void T44f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_c_compiler_options */
extern void T44f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_generate */
extern void T44f22(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ASE_GENERATOR.options */
extern T0* T44f6(T0* C);
/* ET_XACE_ASE_GENERATOR.string_ */
extern T0* T44f7(T0* C);
/* ET_XACE_ASE_GENERATOR.print_generate */
extern void T44f22p1(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ASE_GENERATOR.print_link_libraries */
extern void T44f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_include_directories */
extern void T44f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.generate_cecil_file */
extern void T44f19(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T25f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T82c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T77f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T77f25(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T77f26(T0* C, T14 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].forth */
extern void T130f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_forth */
extern void T126f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].add_traversing_cursor */
extern void T126f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set_next_cursor */
extern void T130f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].remove_traversing_cursor */
extern void T126f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set */
extern void T130f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].item */
extern T0* T130f2(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].start */
extern void T130f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_start */
extern void T126f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_off */
extern T2 T126f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].new_cursor */
extern T0* T126f2(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T130c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T2 T77f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T2 T77f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T77f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T2 T77f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T2 T77f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T77f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T77f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T77f24p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T77f17(T0* C, T14 a1, T4 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T77c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T77f23(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].is_empty */
extern T2 T126f1(T0* C);
/* ET_XACE_EXTERNALS.is_empty */
extern T2 T121f7(T0* C);
/* ET_XACE_SYSTEM.merge_exported_features */
extern void T74f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_exported_features */
extern void T104f8(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_exported_features */
extern void T112f40(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].force_last */
extern void T126f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].put_right */
extern void T233f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T233c3(T0* a1);
/* ET_XACE_EXPORTED_FEATURE.make */
extern T0* T129c4(T0* a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T126c8();
/* ET_XACE_ASE_GENERATOR.print_clusters */
extern void T44f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_cluster */
extern void T44f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_class_options */
extern T2 T44f9(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ASE_GENERATOR.print_cluster_options */
extern T2 T44f8(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ASE_GENERATOR.print_options */
extern void T44f17(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_ASE_GENERATOR.print_escaped_name */
extern void T44f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_indentation */
extern void T44f15(T0* C, T4 a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_system */
extern void T43f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_ace_file */
extern void T43f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_c_compiler_options */
extern void T43f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_generate */
extern void T43f22(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.options */
extern T0* T43f6(T0* C);
/* ET_XACE_SE_GENERATOR.string_ */
extern T0* T43f7(T0* C);
/* ET_XACE_SE_GENERATOR.print_link_libraries */
extern void T43f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_include_directories */
extern void T43f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_cecil_file */
extern void T43f19(T0* C, T0* a1);
/* ET_XACE_SE_GENERATOR.print_clusters */
extern void T43f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_cluster */
extern void T43f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_class_options */
extern T2 T43f9(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_cluster_options */
extern T2 T43f8(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_options */
extern void T43f17(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_SE_GENERATOR.print_escaped_name */
extern void T43f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_indentation */
extern void T43f15(T0* C, T4 a1, T0* a2);
/* ET_XACE_GE_GENERATOR.generate_system */
extern void T41f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_ace_file */
extern void T41f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_link_libraries */
extern void T41f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.replace_all_characters */
extern T0* T41f9(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_GE_GENERATOR.string_ */
extern T0* T41f7(T0* C);
/* ET_XACE_GE_GENERATOR.is_windows */
extern T2 T41f8(T0* C);
/* ET_XACE_GE_GENERATOR.operating_system */
extern T0* T41f14(T0* C);
/* ET_XACE_GE_GENERATOR.execution_environment */
extern T0* T41f13(T0* C);
/* ET_XACE_GE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T41f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_assemblies */
extern void T41f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_clusters */
extern void T41f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_cluster */
extern void T41f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_class_options */
extern T2 T41f11(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.options */
extern T0* T41f6(T0* C);
/* ET_XACE_GE_GENERATOR.print_cluster_options */
extern T2 T41f10(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_options */
extern void T41f22(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_GE_GENERATOR.print_escaped_name */
extern void T41f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.is_lace_keyword */
extern T2 T41f5(T0* C, T0* a1);
/* ET_XACE_GE_GENERATOR.lace_keywords */
extern T0* T41f12(T0* C);
/* ET_XACE_GE_GENERATOR.print_indentation */
extern void T41f20(T0* C, T4 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.generate_system */
extern void T40f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_xml_system_file */
extern void T40f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_mounted_libraries */
extern void T40f27(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_clusters */
extern void T40f26(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_cluster */
extern void T40f29(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_class_options */
extern void T40f31(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_feature_options */
extern void T40f32(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.string_ */
extern T0* T40f9(T0* C);
/* ET_XACE_XML_GENERATOR.print_console_application_option */
extern void T40f25(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_options */
extern void T40f24(T0* C, T0* a1, T4 a2, T0* a3);
/* ET_XACE_XML_GENERATOR.print_indentation */
extern void T40f23(T0* C, T4 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_quote_escaped_string */
extern void T40f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.quot_entity */
extern T0* T40f7(T0* C);
/* ET_XACE_XML_GENERATOR.print_escaped_string */
extern void T40f28(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_escaped_character */
extern void T40f30(T0* C, T4 a1, T0* a2);
/* ET_XACE_XML_GENERATOR.amp_entity */
extern T0* T40f15(T0* C);
/* ET_XACE_XML_GENERATOR.gt_entity */
extern T0* T40f13(T0* C);
/* ET_XACE_XML_GENERATOR.lt_entity */
extern T0* T40f11(T0* C);
/* ET_XACE_XML_GENERATOR.is_escaped */
extern T2 T40f8(T0* C, T4 a1);
/* ET_XACE_VE41_GENERATOR.generate_library */
extern void T47f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE41_GENERATOR.print_eld_file */
extern void T47f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.merge_externals */
extern void T79f8(T0* C, T0* a1);
/* ET_XACE_VE_GENERATOR.generate_library */
extern void T46f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_VE_GENERATOR.print_xml_library_file */
extern void T46f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.generate_library */
extern void T45f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_ISE_GENERATOR.print_precompile_ace_file */
extern void T45f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.generate_library */
extern void T44f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_loadpath_clusters */
extern void T44f14(T0* C, T0* a1, T0* a2);
/* ET_XACE_ASE_GENERATOR.print_loadpath_cluster */
extern void T44f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.generate_library */
extern void T43f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_loadpath_clusters */
extern void T43f14(T0* C, T0* a1, T0* a2);
/* ET_XACE_SE_GENERATOR.print_loadpath_cluster */
extern void T43f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.generate_library */
extern void T41f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_GE_GENERATOR.print_precompile_ace_file */
extern void T41f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.generate_library */
extern void T40f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XML_GENERATOR.print_xml_library_file */
extern void T40f21(T0* C, T0* a1, T0* a2);
/* GEXACE_VALIDATE_COMMAND.execute */
extern void T38f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_read_file_error */
extern void T25f16(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T81c7(T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T80f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T96f2(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T96f7(T0* C);
/* INTEGER.out */
extern T0* T4f18(T4* C);
/* STRING.append_integer */
extern void T16f43(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T96f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T2 T96f14(T0* C, T1 a1);
/* CHARACTER.infix ">=" */
extern T2 T1f16(T1* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T25f18(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T102c7(T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T89f4(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T25f19(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T103c7(T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T80f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.mount_libraries */
extern void T79f14(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T105f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T104f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T104f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T111f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T111f13(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].resize */
extern T0* T225f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ET_XACE_CLUSTER].resized_area */
extern T0* T224f3(T0* C, T4 a1);
/* SPECIAL [ET_XACE_CLUSTER].make */
extern T0* T224c4(T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T4 T111f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T2 T111f8(T0* C, T4 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T112f41(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T104f10(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T112f43(T0* C, T2 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T104f13(T0* C, T2 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T104c9();
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T111c10(T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T111f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T226c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T225f1(T0* C, T4 a1);
/* TO_SPECIAL [ET_XACE_CLUSTER].make_area */
extern T0* T284c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T225c3();
/* ET_XACE_PARSER.fill_library */
extern void T80f235(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY.set_libraries */
extern void T79f13(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_clusters */
extern void T79f12(T0* C, T0* a1);
/* ET_XACE_LIBRARY.merge_libraries */
extern void T79f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T105f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T114f10(T0* C, T2 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T114f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T114f7(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T114f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T25f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T324c7(T0* a1, T0* a2);
/* XM_DEFAULT_POSITION.out */
extern T0* T155f5(T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T155f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T105f4(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T105f3(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T105f7(T0* C, T2 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T2 T113f1(T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T104f5(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T112f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_externals */
extern void T80f237(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.put_class_option */
extern void T112f30(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T115f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T230f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T230c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].is_empty */
extern T2 T115f3(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T115c8();
/* ET_XACE_PARSER.new_export */
extern T0* T80f133(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T106f371(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T2 T118f1(T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T117f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T118f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T231f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T231c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T118c8();
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T80f228(T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T84f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T120c3(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1041os1965;
extern T0* ge1041ov1965;
extern T0* T80f230(T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1041os1966;
extern T0* ge1041ov1966;
extern T0* T80f227(T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T84f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T117c4(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1041os1941;
extern T0* ge1041ov1941;
extern T0* T80f18(T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1041os1964;
extern T0* ge1041ov1964;
extern T0* T80f132(T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T106f379(T0* C, T0* a1);
/* DS_HASH_SET [STRING].force_last */
extern void T109f43(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1041os1963;
extern T0* ge1041ov1963;
extern T0* T80f131(T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T106f390(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T110f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T110f20(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T4 T110f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T2 T110f9(T0* C, T4 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1041os1950;
extern T0* ge1041ov1950;
extern T0* T80f130(T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1041os1967;
extern T0* ge1041ov1967;
extern T0* T80f129(T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T84f4(T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T106c345();
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1041os1954;
extern T0* ge1041ov1954;
extern T0* T80f26(T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T80f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T80f236(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1041os1961;
extern T0* ge1041ov1961;
extern T0* T80f128(T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1041os1962;
extern T0* ge1041ov1962;
extern T0* T80f127(T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1041os1960;
extern T0* ge1041ov1960;
extern T0* T80f125(T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1041os1959;
extern T0* ge1041ov1959;
extern T0* T80f122(T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1041os1958;
extern T0* ge1041ov1958;
extern T0* T80f120(T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1041os1957;
extern T0* ge1041ov1957;
extern T0* T80f118(T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1041os1955;
extern T0* ge1041ov1955;
extern T0* T80f116(T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1041os1956;
extern T0* ge1041ov1956;
extern T0* T80f115(T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T106f428(T0* C, T2 a1);
/* UT_TRISTATE.set_false */
extern void T223f7(T0* C);
/* UT_TRISTATE.set_true */
extern void T223f6(T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T223c5();
/* UT_TRISTATE.set_undefined */
extern void T223f8(T0* C);
/* ET_XACE_OPTIONS.set_warning */
extern void T106f427(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1009os6233;
extern T0* ge1009ov6233;
extern T0* T106f10(T0* C);
/* DS_HASH_SET [STRING].put_last */
extern void T109f41(T0* C, T0* a1);
/* DS_HASH_SET [STRING].compress */
extern void T109f54(T0* C);
/* DS_HASH_SET [STRING].slots_wipe_out */
extern void T109f62(T0* C);
/* DS_HASH_SET [STRING].clashes_wipe_out */
extern void T109f61(T0* C);
/* DS_HASH_SET [STRING].move_all_cursors */
extern void T109f60(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [STRING].keys_put */
extern void T109f59(T0* C, T0* a1, T4 a2);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T106f426(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T106f425(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T106f424(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T106f423(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T106f422(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_unicode */
extern void T106f421(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_unicode */
extern unsigned char ge1009os6232;
extern T0* ge1009ov6232;
extern T0* T106f9(T0* C);
/* ET_XACE_OPTIONS.set_trace */
extern void T106f420(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_target_os */
extern void T106f419(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_target_architecture */
extern void T106f418(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_target */
extern void T106f417(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1009os6231;
extern T0* ge1009ov6231;
extern T0* T106f8(T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T106f416(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T106f415(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T106f414(T0* C, T4 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T106f413(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T106f412(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T106f411(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T106f410(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T106f409(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T106f408(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_profile */
extern void T106f407(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T106f406(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T106f405(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T106f404(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T106f403(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T106f402(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T106f401(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T106f400(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T106f399(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T106f398(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T106f397(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T106f396(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T106f395(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T106f394(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T106f393(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T106f392(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T106f391(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1009os6230;
extern T0* ge1009ov6230;
extern T0* T106f7(T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T106f389(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T106f388(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T106f387(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T106f386(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1009os6229;
extern T0* ge1009ov6229;
extern T0* T106f6(T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T106f385(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T106f384(T0* C, T4 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T106f383(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1009os6228;
extern T0* ge1009ov6228;
extern T0* T106f5(T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T106f382(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T106f381(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T106f380(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T106f378(T0* C, T4 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T106f377(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T106f376(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1009os6227;
extern T0* ge1009ov6227;
extern T0* T106f4(T0* C);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T106f375(T0* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T25f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T202c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T106f374(T0* C, T4 a1);
/* UC_UTF8_STRING.to_integer */
extern T4 T219f25(T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T219f32(T0* C);
/* KL_STRING_ROUTINES.is_integer */
extern T2 T48f4(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f3(T1* C, T1 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T106f373(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T106f372(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T106f370(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T106f369(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T106f368(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T106f367(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T106f366(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T106f365(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T106f364(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T106f363(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T106f362(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1009os6226;
extern T0* ge1009ov6226;
extern T0* T106f3(T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T106f361(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T106f360(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T106f359(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T106f358(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T106f357(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T106f356(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T106f355(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T106f354(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T106f353(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T106f352(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1009os6225;
extern T0* ge1009ov6225;
extern T0* T106f2(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T25f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T201c7(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T201f4(T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T106f351(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1009os6224;
extern T0* ge1009ov6224;
extern T0* T106f1(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T25f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T200c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T106f350(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T106f349(T0* C, T2 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T106f348(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T106f347(T0* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T25f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T199c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T2 T80f114(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T106f346(T0* C, T2 a1);
/* ET_XACE_PARSER.is_true */
extern T2 T80f113(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, STRING].found_item */
extern T4 T138f2(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].items_item */
extern T4 T138f6(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].found */
extern T2 T138f1(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].search */
extern void T138f34(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, STRING].search_position */
extern void T138f37(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, STRING].clashes_item */
extern T4 T138f13(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].hash_position */
extern T4 T138f14(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, STRING].keys_item */
extern T0* T138f20(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].slots_item */
extern T4 T138f15(T0* C, T4 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1010os3683;
extern T0* ge1010ov3683;
extern T0* T80f29(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].put_new */
extern void T138f36(T0* C, T4 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER, STRING].keys_put */
extern void T138f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, STRING].items_put */
extern void T138f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, STRING].slots_put */
extern void T138f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, STRING].clashes_put */
extern void T138f40(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, STRING].unset_found_item */
extern void T138f39(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].set_key_equality_tester */
extern void T138f35(T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T80f14(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].make_map */
extern T0* T138c33(T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].make_with_equality_testers */
extern void T138f38(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [INTEGER, STRING].make_sparse_container */
extern void T138f44(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].new_cursor */
extern T0* T138f28(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER, STRING].make */
extern T0* T238c3(T0* a1);
/* DS_HASH_TABLE [INTEGER, STRING].make_slots */
extern void T138f48(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].special_integer_ */
extern T0* T138f31(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].new_modulus */
extern T4 T138f26(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].make_clashes */
extern void T138f47(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].make_keys */
extern void T138f46(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, STRING].make_items */
extern void T138f45(T0* C, T4 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1041os1946;
extern T0* ge1041ov1946;
extern T0* T80f28(T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1041os1953;
extern T0* ge1041ov1953;
extern T0* T80f24(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T105f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T113f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T113f13(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].resize */
extern T0* T228f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].resized_area */
extern T0* T227f3(T0* C, T4 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T227c4(T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T4 T113f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T2 T113f9(T0* C, T4 a1);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T84f3(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T105c5();
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T113c11(T4 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T113f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T229c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T228f1(T0* C, T4 a1);
/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_area */
extern T0* T285c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T228c3();
/* ET_XACE_PARSER.new_mount */
extern T0* T80f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T114f9(T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T84f7(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T114c8(T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.parse_library */
extern void T78f236(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_library */
extern void T78f233(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.fill_externals */
extern void T78f235(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.new_export */
extern T0* T78f130(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_exported_feature */
extern T0* T78f224(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.uc_alias */
extern T0* T78f226(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_feature */
extern T0* T78f223(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_class */
extern T0* T78f133(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_export */
extern T0* T78f129(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_include_dir */
extern T0* T78f128(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_location */
extern T0* T78f127(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_link_library */
extern T0* T78f126(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_external */
extern T0* T78f24(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_options */
extern T0* T78f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_options */
extern void T78f234(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.uc_debug */
extern T0* T78f125(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_optimize */
extern T0* T78f124(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_check */
extern T0* T78f122(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_loop */
extern T0* T78f119(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_invariant */
extern T0* T78f117(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_ensure */
extern T0* T78f115(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_enable */
extern T0* T78f113(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_require */
extern T0* T78f112(T0* C);
/* ET_XACE_LIBRARY_PARSER.is_false */
extern T2 T78f111(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.is_true */
extern T2 T78f110(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.option_codes */
extern T0* T78f26(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_equality_tester */
extern T0* T78f13(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_value */
extern T0* T78f25(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_option */
extern T0* T78f22(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_mount */
extern T0* T78f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.execution_environment */
extern T0* T78f135(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_mount */
extern unsigned char ge1041os1949;
extern T0* ge1041ov1949;
extern T0* T78f20(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_prefix */
extern unsigned char ge1041os1951;
extern T0* ge1041ov1951;
extern T0* T78f19(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_cluster */
extern T0* T78f18(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_libraries */
extern void T112f36(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T112f35(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T104f11(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T112f42(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T112f45(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T104f15(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T112f44(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T104f14(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T112f34(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T112f33(T0* C, T2 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T112f32(T0* C, T2 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T112f31(T0* C, T2 a1);
/* ET_XACE_LIBRARY_PARSER.new_class */
extern T0* T78f134(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_feature */
extern T0* T78f225(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T112f29(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T112f28(T0* C, T2 a1);
/* ET_XACE_LIBRARY_PARSER.uc_relative */
extern unsigned char ge1041os1948;
extern T0* ge1041ov1948;
extern T0* T78f132(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T25f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T25f32(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T25f33(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T59f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T59f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T59f5(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T274c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.uc_abstract */
extern unsigned char ge1041os1947;
extern T0* ge1041ov1947;
extern T0* T78f131(T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T84f6(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.make */
extern T0* T112c27(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.uc_cluster */
extern unsigned char ge1041os1944;
extern T0* ge1041ov1944;
extern T0* T78f16(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_ */
extern T0* T78f15(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_name */
extern unsigned char ge1041os1945;
extern T0* ge1041ov1945;
extern T0* T78f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T211f2(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T48f16(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T48f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* ET_XACE_PARSER.execution_environment */
extern T0* T80f139(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].force_new */
extern void T94f51(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].keys_put */
extern void T94f57(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].items_put */
extern void T94f56(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].slots_put */
extern void T94f55(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].clashes_put */
extern void T94f54(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].slots_item */
extern T4 T94f29(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].hash_position */
extern T4 T94f28(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].clashes_item */
extern T4 T94f27(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].resize */
extern void T94f53(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].clashes_resize */
extern void T94f61(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].special_integer_ */
extern T0* T94f21(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].keys_resize */
extern void T94f60(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].items_resize */
extern void T94f59(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].resize */
extern T0* T153f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ET_XACE_LIBRARY].resized_area */
extern T0* T152f3(T0* C, T4 a1);
/* SPECIAL [ET_XACE_LIBRARY].make */
extern T0* T152c4(T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].keys_item */
extern T0* T94f32(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].slots_resize */
extern void T94f58(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].new_modulus */
extern T4 T94f17(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].new_capacity */
extern T4 T94f25(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].unset_found_item */
extern void T94f40(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].found_item */
extern T0* T94f23(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].items_item */
extern T0* T94f24(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].found */
extern T2 T94f22(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].search */
extern void T94f50(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].search_position */
extern void T94f52(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T80f22(T0* C);
/* ET_XACE_LIBRARY.set_library_prefix */
extern void T79f11(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T80f27(T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T84f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T104c3(T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T111f11(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_options */
extern void T79f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T80f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.new_class */
extern T0* T80f136(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T80f229(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T80f135(T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T80f134(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T25f24(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T203c7(T0* a1, T0* a2, T0* a3);
/* XM_POSITION_TABLE.item */
extern T0* T87f1(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T214f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T215f11(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T215f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T214f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T215f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T214f11(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T214f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T215f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T214f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T2 T215f3(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T214f2(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T214f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T215f9(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T215f1(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T214c7(T0* a1);
/* ET_XACE_LIBRARY.set_name */
extern void T79f9(T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T86f4(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T2 T86f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T2 T86f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T86f13(T0* C);
/* XM_NODE_TYPER.is_attribute */
extern T2 T309f2(T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T2 T86f3(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_name */
extern T0* T80f16(T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T84f5(T0* C);
/* ET_XACE_LIBRARY.make */
extern T0* T79c7();
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T92f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T25f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T204c7(T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T92f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T92f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T25f29(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T208c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T92f40(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T92f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T92f29(T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T92f28(T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T92f27(T0* C);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T92f15(T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T92f26(T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T92f12(T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T92f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T92f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T92f13(T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T92f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T92f25(T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T92f24(T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T92f23(T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T92f22(T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T92f21(T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T92f20(T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T92f19(T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T92f18(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T25f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T210c8(T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T210f7(T0* C);
/* DS_HASH_TABLE [INTEGER, STRING].has */
extern T2 T138f3(T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T122f26(T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T122f30(T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T92f17(T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T92f11(T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T92f38(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T92f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T25f30(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T209c7(T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1041os1968;
extern T0* ge1041ov1968;
extern T0* T92f16(T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T92f10(T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1041os1952;
extern T0* ge1041ov1952;
extern T0* T92f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T25f26(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T205c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T92f7(T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T92f6(T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T92f34(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1041os1943;
extern T0* ge1041ov1943;
extern T0* T92f5(T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T92f3(T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T80f11(T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T80f10(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].wipe_out */
extern void T94f36(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].slots_wipe_out */
extern void T94f44(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].clashes_wipe_out */
extern void T94f43(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].keys_wipe_out */
extern void T94f42(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].items_wipe_out */
extern void T94f41(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].move_all_cursors_after */
extern void T94f39(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING].set_next_cursor */
extern void T151f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING].set_position */
extern void T151f5(T0* C, T4 a1);
/* ET_XACE_PARSER.new_system */
extern T0* T80f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM.mount_libraries */
extern void T74f16(T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T80f234(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM.set_libraries */
extern void T74f15(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_options */
extern void T74f14(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_creation_procedure_name */
extern void T74f13(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_root_class_name */
extern void T74f12(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_system_name */
extern void T74f11(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_clusters */
extern void T74f10(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1041os1942;
extern T0* ge1041ov1942;
extern T0* T80f19(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T86f6(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T2 T86f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T2 T86f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T2 T86f14(T0* C);
/* XM_NODE_TYPER.is_element */
extern T2 T309f4(T0* C);
/* XM_ELEMENT.has_element_by_name */
extern T2 T86f5(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1041os1940;
extern T0* ge1041ov1940;
extern T0* T80f17(T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T84f1(T0* C, T0* a1);
/* ET_XACE_SYSTEM.make */
extern T0* T74c7(T0* a1);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T93f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T2 T93f3(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T25f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T275c7(T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T2 T93f8(T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T149f1(T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T149f2(T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1048os5125;
extern T0* ge1048ov5125;
extern T0* T93f4(T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T149c3();
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T93f9(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T4 T219f49(T0* C, T1 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T4 T219f50(T0* C, T4 a1);
/* STRING.occurrences */
extern T4 T16f28(T0* C, T1 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T2 T93f7(T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1041os1970;
extern T0* ge1041ov1970;
extern T0* T93f6(T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1041os1969;
extern T0* ge1041ov1969;
extern T0* T93f5(T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T93f12(T0* C, T0* a1);
/* XM_ATTRIBUTE.set_value */
extern void T135f7(T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T92f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T92f33(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T25f28(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T207c7(T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T92f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T92f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T25f27(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T206c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T92f8(T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1041os1939;
extern T0* ge1041ov1939;
extern T0* T92f4(T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T80f5(T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T80f4(T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T89f2(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T96f201(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T96f207(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T96f213(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T96f212(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T96f223(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T96f251(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T96f257(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T96f258(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T174f6(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T176f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING]].clear_all */
extern void T189f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T184f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T186f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T181f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T177f6(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T49f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T179f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T172f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T162f6(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T96f222(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T96f221(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T163f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T162f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T162c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T163f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T257c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T163c3();
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T96f220(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T96f250(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T194f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T166f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T192f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T177f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T177c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T192f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T273c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T192c3();
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T166f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T96f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T166c4();
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T96f249(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].force */
extern void T159f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_put */
extern void T159f52(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_put */
extern void T159f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_put */
extern void T159f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_item */
extern T4 T159f17(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_item */
extern T4 T159f16(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].hash_position */
extern T4 T159f13(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].resize */
extern void T159f49(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_resize */
extern void T159f57(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].special_integer_ */
extern T0* T159f31(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_resize */
extern void T159f56(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_resize */
extern void T159f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T256f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T253f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T253c4(T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_item */
extern T0* T159f21(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_resize */
extern void T159f54(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_modulus */
extern T4 T159f28(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_capacity */
extern T4 T159f12(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_put */
extern void T159f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].search_position */
extern void T159f40(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].unset_found_item */
extern void T159f43(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].has */
extern T2 T159f1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T197c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T197f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T161c4();
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T197f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T197f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T197f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T197f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T197f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER].make */
extern T0* T249c5();
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T197f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T197f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T197f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T197f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1206os6971;
extern T0* ge1206ov6971;
extern T0* T197f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T197f53(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T52f3(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1206os6970;
extern T0* ge1206ov6970;
extern T0* T197f48(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1206os6969;
extern T0* ge1206ov6969;
extern T0* T197f46(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1206os6968;
extern T0* ge1206ov6968;
extern T0* T197f44(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1206os6967;
extern T0* ge1206ov6967;
extern T0* T197f42(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1206os6964;
extern T0* ge1206ov6964;
extern T0* T197f40(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T197f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T197f223(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
extern void T277f2(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* ARRAY [INTEGER].subcopy */
extern void T217f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].copy_data */
extern void T50f6(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].move_data */
extern void T50f7(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T50f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T50f8(T0* C, T4 a1, T4 a2, T4 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge63os2039;
extern T0* ge63ov2039;
extern T0* T197f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T277c1();
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T197f221(T0* C, T0* a1);
/* ARRAY [INTEGER].make */
extern T0* T217c5(T4 a1, T4 a2);
/* ARRAY [INTEGER].make_area */
extern void T217f6(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1206os6961;
extern T0* ge1206ov6961;
extern T0* T197f38(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T197f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T197f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge291os7163;
extern T0* ge291ov7163;
extern T0* T197f6(T0* C);
/* YY_BUFFER.make */
extern T0* T245c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T245f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T301f9(T0* C, T0* a1, T4 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T245f9(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T244c8();
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T197f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T96f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T191c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T191f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T191f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T191f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T191f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T191f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T191f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T191f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T191f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T191f52(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T191f46(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T191f44(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T191f42(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T191f40(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T191f38(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T191f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T191f219(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T191f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T191f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T191f36(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T191f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T191f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T191f6(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T96f248(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T194f7(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T96f247(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T96f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T191c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T170f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T170f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T170f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T170f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].resize */
extern T0* T190f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING]].resized_area */
extern T0* T189f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING]].make */
extern T0* T189c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].make */
extern T0* T190f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING]].make_area */
extern T0* T272c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].default_create */
extern T0* T190c3();
/* DS_BILINKED_LIST [STRING].force_last */
extern void T171f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].put_right */
extern void T264f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].attach_left */
extern void T264f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].make */
extern T0* T264c4(T0* a1);
/* DS_BILINKED_LIST [STRING].is_empty */
extern T2 T171f3(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T96f162(T0* C);
/* DS_BILINKED_LIST [STRING].set_equality_tester */
extern void T171f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T96f180(T0* C);
/* DS_BILINKED_LIST [STRING].make */
extern T0* T171c11();
/* DS_BILINKED_LIST [STRING].new_cursor */
extern T0* T171f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].make */
extern T0* T263c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T170f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T170f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1118os7594;
extern T0* ge1118ov7594;
extern T0* T170f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T170f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T170f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T170f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T170f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T170f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T170f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T170f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T96f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T170c12();
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T188f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T186f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T186c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T188f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T271c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T188c3();
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T170f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T2 T170f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T2 T170f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T2 T170f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T2 T170f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T170f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T187f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T184f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T184c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T187f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T270c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T187c3();
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T169f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T262f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T262f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T262c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T2 T169f3(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T96f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T169c8();
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T169f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T261c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T96f246(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T261f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T169f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T169f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T261f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T169f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T261f10(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T96f256(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T194f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T261f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T261f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T169f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T2 T169f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T168f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T168c10();
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T168f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T168f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T168f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T168f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T168f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T168f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T260c7();
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T260f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T292c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T168c9();
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T260f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T293f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T293f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T293c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T2 T260f3(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T168c8();
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T260f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T96f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T168c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T96f245(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T168f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T168f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T168c7();
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T168f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T182f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T181f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T181c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T182f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T269c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T182c3();
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T168c6();
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T168f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T96f244(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T194f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T96f243(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T2 T167f1(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T167f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T4 T167f11(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T4 T167f12(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T4 T164f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T164f13(T0* C, T4 a1);
/* DS_BILINKED_LIST [STRING].item */
extern T0* T171f8(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T2 T258f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_item */
extern T0* T167f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_item */
extern T0* T167f29(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T167f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T4 T167f13(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T180f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T179f2(T0* C, T4 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T179c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T180f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T268c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T180c3();
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T167f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_put */
extern void T167f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T167f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T167f37(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T167f36(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T167f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T167f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_resize */
extern void T167f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_resize */
extern void T167f45(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T167f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T4 T167f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T4 T167f7(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T167f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T96f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T167c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T258c2();
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T167f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T167f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T259c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T167f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T167f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_keys */
extern void T167f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_items */
extern void T167f40(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T96f242(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T96f241(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T164f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].forth */
extern void T263f9(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_forth */
extern void T171f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].add_traversing_cursor */
extern void T171f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T263f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].remove_traversing_cursor */
extern void T171f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set */
extern void T263f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [STRING].item */
extern T0* T263f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].start */
extern void T263f8(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_start */
extern void T171f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].cursor_off */
extern T2 T171f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T164f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T164f16(T0* C);
/* DS_BILINKED_LIST [STRING].last */
extern T0* T171f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T164f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T2 T164f15(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T96f240(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T2 T164f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T2 T164f14(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T164f8(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T178f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T176f3(T0* C, T4 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T176c4(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T178f1(T0* C, T4 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T267c2(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T178c3();
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T96f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T161f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1204os5235;
extern T0* ge1204ov5235;
extern T0* T96f25(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T195c198();
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T195f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T195f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T195f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T195f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T195f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T195f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T195f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T195f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T195f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T195f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T195f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T195f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T195f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T195f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T195f226(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T195f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T195f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T195f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T195f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T195f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T195f16(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T158f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T2 T161f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T96f255(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T161f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T161f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T2 T166f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T96f238(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T194f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T96f237(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T194f4(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T194c1();
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T165f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T165f8(T0* C, T2 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T165f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T175f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T174f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T174c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T175f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T266c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T175c3();
/* XM_EIFFEL_DECLARATION.make */
extern T0* T165c7();
/* XM_EIFFEL_DECLARATION.process */
extern void T165f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T96f259(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T96f236(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T96f235(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T96f234(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T194f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T96f233(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T96f232(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T194f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T96f231(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T96f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T96f192(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T96f198(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T220f28(T0* C, T4 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge193os7935;
extern T4 ge193ov7935;
extern T4 T222f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T4 T222f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T221f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T96f199(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item */
extern T0* T159f2(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_item */
extern T0* T159f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T96f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T96f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T96f254(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T96f253(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T96f97(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T4 T96f188(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T2 T96f187(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T96f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T219c51(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T219f63(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T2 T96f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T96f95(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T2 T96f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T96f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1204os5302;
extern T0* ge1204ov5302;
extern T0* T96f191(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1204os5303;
extern T0* ge1204ov5303;
extern T0* T96f190(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T96f197(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T219c55();
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T173f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T172f2(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T172c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T173f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T265c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T173c3();
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T96f229(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T164f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T164f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T2 T164f1(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T96f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T164f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T164c20();
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T164c18();
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T96f219(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T96f218(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T96f217(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T96f216(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T96f227(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T96f215(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T96f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T96f252(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T2 T191f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T2 T197f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T191f220(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T319c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T280f21(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T191f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T197f224(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T197f68(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T96f225(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T96f224(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T96f31(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T96f214(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T96f211(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T96f210(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T96f206(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].wipe_out */
extern void T159f37(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_wipe_out */
extern void T159f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_wipe_out */
extern void T159f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_wipe_out */
extern void T159f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_wipe_out */
extern void T159f44(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].move_all_cursors_after */
extern void T159f42(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_next_cursor */
extern void T255f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_position */
extern void T255f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T96f204(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T154c196();
/* XM_EIFFEL_SCANNER.reset */
extern void T154f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T154f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T154f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T154f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T154f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T154f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T154f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T154f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T154f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T154f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T154f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T154f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T154f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T154f224(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T154f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T154f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T154f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T154f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T154f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T154f15(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T75f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T75f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T75f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T75f40(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T75f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T75f40p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T75f20(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T75f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T141f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T141f2(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge1950os2588;
extern T0* ge1950ov2588;
extern T0* T75f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T141c6();
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T141f8(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T141f3(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T75f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T141f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T141f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T75f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T75f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T75c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T75f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T75f8(T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T80c231(T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T80f233(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T91f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T87c3();
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T215c8();
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T96f203(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T89c10();
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T89f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T146f4(T0* C, T4 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T91c9();
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T89f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T90c4();
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T89f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T144c25();
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T96f202(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T96c200();
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T96f22(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].set_key_equality_tester */
extern void T159f39(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map_default */
extern T0* T159c36();
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map */
extern void T159f41(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_with_equality_testers */
extern void T159f53(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_sparse_container */
extern void T159f58(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_cursor */
extern T0* T159f34(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T255c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_slots */
extern void T159f62(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_clashes */
extern void T159f61(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_keys */
extern void T159f60(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_items */
extern void T159f59(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T256f2(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T291c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T256c3();
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].default_capacity */
extern T4 T159f7(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T96f205(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T96f209(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1200os5182;
extern T0* ge1200ov5182;
extern T0* T96f52(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T96f182(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1200os5181;
extern T0* ge1200ov5181;
extern T0* T96f50(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1200os5180;
extern T0* ge1200ov5180;
extern T0* T96f48(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1200os5179;
extern T0* ge1200ov5179;
extern T0* T96f46(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1200os5178;
extern T0* ge1200ov5178;
extern T0* T96f44(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1200os5177;
extern T0* ge1200ov5177;
extern T0* T96f42(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1200os5176;
extern T0* ge1200ov5176;
extern T0* T96f40(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1200os5175;
extern T0* ge1200ov5175;
extern T0* T96f38(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1200os5174;
extern T0* ge1200ov5174;
extern T0* T96f36(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1200os5173;
extern T0* ge1200ov5173;
extern T0* T96f34(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T96f208(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T95f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T2 T95f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T95c3();
/* ET_XACE_VALIDATOR.make */
extern T0* T92c30(T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T93c10(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_parsed_libraries */
extern void T78f232(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern void T78f231(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern T0* T78c231(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].set_key_equality_tester */
extern void T94f37(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_map */
extern T0* T94c35(T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_with_equality_testers */
extern void T94f38(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_sparse_container */
extern void T94f45(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].new_cursor */
extern T0* T94f18(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING].make */
extern T0* T151c4(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_slots */
extern void T94f49(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_clashes */
extern void T94f48(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_keys */
extern void T94f47(T0* C, T4 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING].make_items */
extern void T94f46(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].make */
extern T0* T153f1(T0* C, T4 a1);
/* TO_SPECIAL [ET_XACE_LIBRARY].make_area */
extern T0* T243c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].default_create */
extern T0* T153c3();
/* ET_XACE_AST_FACTORY.make */
extern T0* T84c10();
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T37f14(T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T37f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T63f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T42f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T42f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T63f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T42f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T63f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T63f4(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T63f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T42f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T2 T42f7(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.parse_file */
extern void T78f230(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.new_library */
extern T0* T78f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_ve */
extern void T78f229(T0* C, T2 a1);
/* ET_XACE_LIBRARY_PARSER.set_shallow */
extern void T78f228(T0* C, T2 a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables */
extern T0* T78c227(T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T33f14(T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T33f15(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.parse_file */
extern void T73f232(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.new_system */
extern T0* T73f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_system */
extern void T73f234(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.fill_externals */
extern void T73f236(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_PARSER.new_export */
extern T0* T73f132(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_exported_feature */
extern T0* T73f226(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_alias */
extern T0* T73f228(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_feature */
extern T0* T73f225(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_export */
extern T0* T73f131(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_include_dir */
extern T0* T73f130(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_location */
extern T0* T73f129(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_link_library */
extern T0* T73f128(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_external */
extern T0* T73f26(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_options */
extern T0* T73f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_options */
extern void T73f235(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.uc_debug */
extern T0* T73f127(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_optimize */
extern T0* T73f126(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_check */
extern T0* T73f124(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_loop */
extern T0* T73f121(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_invariant */
extern T0* T73f119(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_ensure */
extern T0* T73f117(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_enable */
extern T0* T73f115(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_require */
extern T0* T73f114(T0* C);
/* ET_XACE_SYSTEM_PARSER.is_false */
extern T2 T73f113(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.is_true */
extern T2 T73f112(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.option_codes */
extern T0* T73f28(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_equality_tester */
extern T0* T73f13(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_value */
extern T0* T73f27(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_option */
extern T0* T73f24(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_mount */
extern T0* T73f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.execution_environment */
extern T0* T73f137(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_prefix */
extern T0* T73f135(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_mount */
extern T0* T73f22(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_cluster */
extern T0* T73f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.new_class */
extern T0* T73f136(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_feature */
extern T0* T73f227(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_relative */
extern T0* T73f134(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_abstract */
extern T0* T73f133(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_cluster */
extern T0* T73f19(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_ */
extern T0* T73f18(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_creation */
extern T0* T73f17(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_class */
extern T0* T73f16(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_root */
extern T0* T73f15(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_name */
extern T0* T73f14(T0* C);
/* ET_XACE_SYSTEM_PARSER.set_ve */
extern void T73f231(T0* C, T2 a1);
/* ET_XACE_SYSTEM_PARSER.set_shallow */
extern void T73f230(T0* C, T2 a1);
/* ET_XACE_SYSTEM_PARSER.make_with_variables */
extern T0* T73c229(T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.make_with_variables_and_factory */
extern void T73f233(T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T38f8(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T37f13(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T33f13(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T197f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T155c7(T0* a1, T4 a2, T4 a3, T4 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T195f1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T191f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T154f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T2 T197f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T2 T195f4(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T2 T191f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T2 T154f4(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_valid_encoding */
extern T2 T197f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T2 T220f2(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_valid_encoding */
extern T2 T195f5(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_valid_encoding */
extern T2 T191f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T154f5(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T4 T197f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T4 T195f6(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T4 T191f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T4 T154f6(T0* C);
/* ET_XACE_ISE_GENERATOR.default_system_output_filename */
extern unsigned char ge1035os2055;
extern T0* ge1035ov2055;
extern T0* T45f3(T0* C);
/* ET_XACE_SE_GENERATOR.default_system_output_filename */
extern unsigned char ge1036os2055;
extern T0* ge1036ov2055;
extern T0* T43f3(T0* C);
/* ET_XACE_GE_GENERATOR.default_system_output_filename */
extern unsigned char ge1034os2055;
extern T0* ge1034ov2055;
extern T0* T41f3(T0* C);
/* ET_XACE_XML_GENERATOR.default_system_output_filename */
extern unsigned char ge1039os2055;
extern T0* ge1039ov2055;
extern T0* T40f4(T0* C);
/* ET_XACE_ISE_GENERATOR.default_library_output_filename */
extern unsigned char ge1035os2056;
extern T0* ge1035ov2056;
extern T0* T45f4(T0* C);
/* ET_XACE_GE_GENERATOR.default_library_output_filename */
extern unsigned char ge1034os2056;
extern T0* ge1034ov2056;
extern T0* T41f4(T0* C);
/* ET_XACE_XML_GENERATOR.default_library_output_filename */
extern unsigned char ge1039os2056;
extern T0* ge1039ov2056;
extern T0* T40f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T324f1(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T324f3(T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T324f6(T0* C);
/* ARRAY [STRING].valid_index */
extern T2 T62f4(T0* C, T4 a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T324f4(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T275f1(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T275f3(T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T275f6(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T275f4(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T274f1(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T274f3(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T274f6(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T274f4(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T210f1(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T210f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T210f6(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T210f4(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T209f1(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T209f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T209f6(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T209f4(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T208f1(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T208f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T208f6(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T208f4(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T207f1(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T207f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T207f6(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T207f4(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T206f1(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T206f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T206f6(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T206f4(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T205f1(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T205f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T205f6(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T205f4(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T204f1(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T204f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T204f6(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T204f4(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T203f1(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T203f3(T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T203f6(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T203f4(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T202f1(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T202f3(T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T202f6(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T202f4(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T201f1(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T201f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T201f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T200f1(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T200f3(T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T200f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T200f4(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T199f1(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T199f3(T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T199f6(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T199f4(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T103f1(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T103f3(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T103f6(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T103f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T102f1(T0* C);
/* UT_MESSAGE.message */
extern T0* T102f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T102f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T102f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T82f1(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T82f3(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T82f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T82f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T81f1(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T81f3(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T81f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T81f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T31f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T31f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T31f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T31f5(T0* C);
extern T0* gema217(T4 c, ...);
extern T0* gema62(T4 c, ...);
extern T0* gema146(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge1036ov2056;
extern T0* ge1038ov2056;
extern T0* ge1037ov2056;
extern T0* ge1032ov2055;
extern T0* ge1038ov2055;
extern T0* ge1037ov2055;
extern T0* ge196ov2319;
extern T0* ge200ov2291;
extern T0* ge54ov1633;
extern T0* ge54ov1634;
extern T0* ge207ov3220;
extern T0* ge142ov8341;
extern T0* ge1208ov7032;
extern T0* ge1208ov7033;
extern T0* ge184ov4024;
extern T0* ge1199ov7848;
extern T0* ge1199ov7850;
extern T0* ge1152ov4645;
extern T0* ge1133ov6885;
extern T0* ge1133ov6884;
extern T0* ge1010ov3705;
extern T0* ge1010ov3697;
extern T0* ge1010ov3707;
extern T0* ge1010ov3694;
extern T0* ge1010ov3699;
extern T0* ge1010ov3700;
extern T0* ge1010ov3701;
extern T0* ge1010ov3688;
extern T0* ge1010ov3684;
extern T0* ge1010ov3702;
extern T0* ge1010ov3696;
extern T0* ge1010ov3689;
extern T0* ge1010ov3685;
extern T0* ge1010ov3691;
extern T0* ge1010ov3706;
extern T0* ge1010ov3703;
extern T0* ge1010ov3695;
extern T0* ge1010ov3693;
extern T0* ge1010ov3690;
extern T0* ge1010ov3692;
extern T0* ge1010ov3711;
extern T0* ge1010ov3708;
extern T0* ge1010ov3686;
extern T0* ge203ov2319;
extern T0* ge1010ov3698;
extern T0* ge1036ov2198;
extern T0* ge1010ov3710;
extern T0* ge173ov4044;
extern T0* ge1010ov3709;
extern T0* ge1194ov4929;
extern T0* ge1194ov4928;
extern T0* ge1044ov3514;
extern T0* ge1010ov3704;
extern T0* ge1010ov3687;
extern T0* ge1044ov3513;
extern T0* ge1044ov3512;
extern T0* ge1010ov3515;
extern T0* ge1010ov3516;
extern T0* ge1010ov3517;
extern T0* ge1010ov3518;
extern T0* ge1010ov3519;
extern T0* ge1010ov3520;
extern T0* ge1010ov3521;
extern T0* ge1010ov3522;
extern T0* ge1010ov3523;
extern T0* ge1010ov3524;
extern T0* ge1010ov3525;
extern T0* ge1010ov3526;
extern T0* ge1010ov3527;
extern T0* ge1010ov3528;
extern T0* ge1010ov3529;
extern T0* ge1010ov3530;
extern T0* ge1010ov3531;
extern T0* ge1010ov3532;
extern T0* ge1010ov3533;
extern T0* ge1010ov3534;
extern T0* ge1010ov3535;
extern T0* ge1010ov3536;
extern T0* ge1010ov3537;
extern T0* ge1010ov3538;
extern T0* ge1010ov3539;
extern T0* ge1010ov3540;
extern T0* ge1010ov3541;
extern T0* ge1010ov3542;
extern T0* ge1010ov3543;
extern T0* ge1010ov3544;
extern T0* ge1010ov3545;
extern T0* ge1010ov3546;
extern T0* ge1010ov3547;
extern T0* ge1010ov3548;
extern T0* ge1010ov3549;
extern T0* ge1010ov3550;
extern T0* ge1010ov3551;
extern T0* ge1010ov3552;
extern T0* ge1010ov3553;
extern T0* ge1010ov3554;
extern T0* ge1010ov3555;
extern T0* ge1010ov3556;
extern T0* ge1010ov3557;
extern T0* ge1010ov3558;
extern T0* ge1010ov3559;
extern T0* ge1010ov3560;
extern T0* ge1010ov3561;
extern T0* ge1010ov3562;
extern T0* ge1010ov3563;
extern T0* ge1010ov3564;
extern T0* ge1010ov3565;
extern T0* ge1010ov3566;
extern T0* ge1010ov3567;
extern T0* ge1010ov3568;
extern T0* ge1010ov3569;
extern T0* ge1010ov3570;
extern T0* ge1010ov3571;
extern T0* ge1010ov3572;
extern T0* ge1010ov3573;
extern T0* ge1010ov3574;
extern T0* ge1010ov3575;
extern T0* ge1010ov3576;
extern T0* ge1010ov3577;
extern T0* ge1010ov3578;
extern T0* ge1010ov3579;
extern T0* ge1010ov3580;
extern T0* ge1010ov3581;
extern T0* ge1010ov3582;
extern T0* ge1010ov3583;
extern T0* ge1010ov3584;
extern T0* ge1010ov3585;
extern T0* ge1010ov3586;
extern T0* ge1010ov3587;
extern T0* ge1010ov3588;
extern T0* ge1010ov3589;
extern T0* ge1010ov3590;
extern T0* ge1010ov3591;
extern T0* ge1010ov3592;
extern T0* ge1010ov3593;
extern T0* ge1010ov3594;
extern T0* ge1010ov3595;
extern T0* ge1010ov3596;
extern T0* ge1010ov3597;
extern T0* ge1010ov3598;
extern T0* ge95ov2319;
extern T0* ge1000ov5829;
extern T0* ge1006ov4620;
extern T0* ge1201ov5553;
extern T0* ge1201ov5515;
extern T0* ge1201ov5513;
extern T0* ge1201ov5554;
extern T0* ge1201ov5526;
extern T0* ge1201ov5525;
extern T0* ge1201ov5536;
extern T0* ge1201ov5530;
extern T0* ge1201ov5529;
extern T0* ge1201ov5528;
extern T0* ge1201ov5534;
extern T0* ge1201ov5533;
extern T0* ge1201ov5535;
extern T0* ge1201ov5512;
extern T0* ge1201ov5538;
extern T0* ge1201ov5547;
extern T0* ge1204ov5277;
extern T0* ge1204ov5275;
extern T0* ge1204ov5276;
extern T0* ge1201ov5548;
extern T0* ge1201ov5549;
extern T0* ge1201ov5552;
extern T0* ge1201ov5550;
extern T0* ge1201ov5551;
extern T0* ge1201ov5545;
extern T0* ge1197ov7474;
extern T0* ge1197ov7475;
extern T0* ge1201ov5518;
extern T0* ge1201ov5541;
extern T0* ge1201ov5561;
extern T0* ge1201ov5562;
extern T0* ge1201ov5556;
extern T0* ge1201ov5539;
extern T0* ge1201ov5540;
extern T0* ge1201ov5542;
extern T0* ge1201ov5546;
extern T0* ge1199ov7847;
extern T0* ge1199ov7849;
extern T0* ge1021ov2036;
extern T0* ge1018ov2036;
extern T0* ge1012ov2036;
extern T0* ge1028ov2036;
extern T0* ge1025ov2036;
extern T0* ge1027ov2036;
extern T0* ge1024ov2036;
extern T0* ge1020ov2036;
extern T0* ge1019ov2036;
extern T0* ge1031ov2036;
extern T0* ge1015ov2036;
extern T0* ge1026ov2036;
extern T0* ge1030ov2036;
extern T0* ge1022ov2036;
extern T0* ge1013ov2036;
extern T0* ge1023ov2036;
extern T0* ge1057ov2036;
extern T0* ge1054ov2036;
extern T0* ge1053ov2036;
extern T0* ge1062ov2036;
extern EIF_TYPE getypes[];

