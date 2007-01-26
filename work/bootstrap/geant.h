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
	T4 z1; /* count */
	T1 z2[1]; /* item */
} T15;

/* STRING */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* count */
	T4 a11; /* internal_hash_code */
} T16;

/* GEANT */
typedef struct {
	int id;
	T0* a2; /* error_handler */
	T2 a3; /* verbose */
	T2 a5; /* debug_mode */
	T2 a6; /* no_exec */
	T0* a7; /* build_filename */
	T0* a9; /* start_target_name */
	T2 a10; /* show_target_info */
} T19;

/* GEANT_PROJECT */
typedef struct {
	int id;
	T0* a1; /* targets */
	T0* a2; /* name */
	T2 a4; /* build_successful */
	T0* a6; /* start_target_name */
	T0* a8; /* default_target_name */
	T0* a9; /* output_file */
	T0* a11; /* variables */
	T0* a12; /* selected_targets */
	T0* a13; /* options */
	T0* a14; /* inherit_clause */
	T0* a15; /* description */
	T2 a16; /* old_inherit */
	T0* a19; /* current_target */
} T20;

/* GEANT_PROJECT_LOADER */
typedef struct {
	int id;
	T0* a1; /* project_element */
	T0* a2; /* build_filename */
} T21;

/* GEANT_PROJECT_OPTIONS */
typedef struct {
	int id;
	T2 a1; /* verbose */
	T2 a2; /* debug_mode */
	T2 a3; /* no_exec */
} T22;

/* GEANT_PROJECT_VARIABLES */
typedef struct {
	int id;
	T0* a9; /* key_equality_tester */
	T4 a10; /* position */
	T4 a12; /* count */
	T4 a13; /* capacity */
	T4 a16; /* slots_position */
	T4 a17; /* free_slot */
	T4 a18; /* last_position */
	T0* a22; /* equality_tester */
	T4 a23; /* found_position */
	T4 a24; /* modulus */
	T4 a25; /* clashes_previous_position */
	T0* a27; /* items */
	T0* a30; /* clashes */
	T0* a31; /* slots */
	T0* a32; /* keys */
	T0* a33; /* internal_cursor */
	T0* a36; /* special_item_routines */
	T0* a37; /* special_key_routines */
} T23;

/* GEANT_TARGET */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a3; /* xml_element */
	T0* a12; /* formal_arguments */
	T0* a16; /* project */
	T0* a19; /* obsolete_message */
	T0* a20; /* description */
	T0* a21; /* exports */
	T2 a22; /* execute_once */
	T2 a31; /* is_executed */
	T0* a35; /* precursor_target */
	T0* a37; /* redefining_target */
} T24;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a3; /* program_name */
} T25;

/* UT_ERROR_HANDLER */
typedef struct {
	int id;
	T0* a1; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
} T26;

/* GEANT_VARIABLES */
typedef struct {
	int id;
	T4 a1; /* position */
	T4 a3; /* count */
	T4 a4; /* capacity */
	T4 a7; /* slots_position */
	T4 a8; /* free_slot */
	T4 a9; /* last_position */
	T0* a13; /* key_equality_tester */
	T4 a14; /* found_position */
	T4 a15; /* modulus */
	T4 a16; /* clashes_previous_position */
	T0* a18; /* items */
	T0* a21; /* clashes */
	T0* a22; /* slots */
	T0* a23; /* keys */
	T0* a24; /* equality_tester */
	T0* a26; /* special_item_routines */
	T0* a27; /* special_key_routines */
	T0* a28; /* internal_cursor */
} T27;

/* GEANT_PROJECT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* project */
	T0* a5; /* xml_element */
} T28;

/* DS_HASH_TABLE [GEANT_TARGET, STRING] */
typedef struct {
	int id;
	T4 a3; /* position */
	T0* a6; /* items */
	T0* a7; /* key_equality_tester */
	T4 a8; /* last_position */
	T4 a9; /* capacity */
	T4 a12; /* slots_position */
	T4 a14; /* count */
	T4 a15; /* modulus */
	T4 a16; /* clashes_previous_position */
	T0* a19; /* equality_tester */
	T4 a20; /* found_position */
	T0* a23; /* clashes */
	T0* a24; /* slots */
	T0* a25; /* keys */
	T4 a26; /* free_slot */
	T0* a27; /* internal_cursor */
	T0* a30; /* special_item_routines */
	T0* a31; /* special_key_routines */
} T29;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T30;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T31;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct {
	int id;
	T4 a1; /* position */
	T4 a3; /* count */
	T4 a4; /* capacity */
	T4 a7; /* slots_position */
	T4 a8; /* free_slot */
	T4 a9; /* last_position */
	T0* a13; /* key_equality_tester */
	T4 a14; /* found_position */
	T4 a15; /* modulus */
	T4 a16; /* clashes_previous_position */
	T0* a18; /* items */
	T0* a21; /* clashes */
	T0* a22; /* slots */
	T0* a23; /* keys */
	T0* a24; /* equality_tester */
	T0* a26; /* special_item_routines */
	T0* a27; /* special_key_routines */
	T0* a28; /* internal_cursor */
} T32;

/* KL_STANDARD_FILES */
typedef struct {
	int id;
} T33;

/* KL_STDERR_FILE */
typedef struct {
	int id;
	T14 a3; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T34;

/* KL_EXCEPTIONS */
typedef struct {
	int id;
} T35;

/* UT_VERSION_NUMBER */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T36;

/* UT_USAGE_MESSAGE */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T38;

/* KL_OPERATING_SYSTEM */
typedef struct {
	int id;
} T39;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T41;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct {
	int id;
	T1 a21; /* secondary_directory_separator */
} T42;

/* KL_UNIX_FILE_SYSTEM */
typedef struct {
	int id;
} T43;

/* KL_TEXT_INPUT_FILE */
typedef struct {
	int id;
	T0* a4; /* string_name */
	T4 a9; /* mode */
	T0* a15; /* name */
	T0* a17; /* character_buffer */
	T2 a18; /* end_of_file */
	T14 a21; /* file_pointer */
	T2 a23; /* descriptor_available */
	T1 a28; /* last_character */
} T44;

/* GEANT_PROJECT_PARSER */
typedef struct {
	int id;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
} T45;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct {
	int id;
	T0* a4; /* variables */
} T47;

/* UC_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T48;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 z1; /* count */
	T4 z2[1]; /* item */
} T50;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T51;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T52;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T53;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a1; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T55;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T56;

/* DS_HASH_TABLE [STRING, STRING] */
typedef struct {
	int id;
	T0* a2; /* key_equality_tester */
	T0* a3; /* equality_tester */
	T4 a4; /* capacity */
	T4 a5; /* modulus */
	T4 a7; /* last_position */
	T4 a8; /* free_slot */
	T4 a10; /* position */
	T0* a11; /* internal_cursor */
	T0* a13; /* special_item_routines */
	T0* a14; /* items */
	T0* a15; /* special_key_routines */
	T0* a16; /* keys */
	T0* a17; /* clashes */
	T0* a19; /* slots */
	T4 a20; /* found_position */
	T4 a30; /* count */
	T4 a39; /* slots_position */
	T4 a40; /* clashes_previous_position */
} T58;

/* EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
	T4 a4; /* return_code */
} T59;

/* UC_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* byte_count */
	T4 a4; /* internal_hash_code */
	T4 a5; /* last_byte_index_input */
	T4 a6; /* last_byte_index_result */
	T0* a7; /* area */
} T60;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T61;

/* KL_PATHNAME */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T2 a5; /* is_relative */
	T0* a11; /* components */
} T63;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a6; /* file_name */
	T0* a7; /* buffered_file_info */
} T64;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct {
	int id;
} T67;

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
} T69;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a8; /* last */
} T70;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct {
	int id;
	T0* a1; /* document */
	T0* a2; /* next */
	T0* a3; /* source_parser */
	T0* a4; /* last_position_table */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
} T73;

/* XM_DOCUMENT */
typedef struct {
	int id;
	T0* a1; /* root_element */
	T0* a4; /* internal_cursor */
	T0* a7; /* first_cell */
	T0* a8; /* last_cell */
	T4 a9; /* count */
	T0* a11; /* parent */
} T74;

/* XM_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* parent */
	T0* a14; /* namespace */
	T0* a15; /* name */
	T0* a16; /* internal_cursor */
	T0* a19; /* first_cell */
	T0* a20; /* last_cell */
	T4 a21; /* count */
} T75;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct {
	int id;
	T2 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
} T76;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
	T4 a5; /* return_code */
} T77;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T78;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T79;

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
} T80;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
} T82;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T83;

/* GEANT_INHERIT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a7; /* xml_element */
} T84;

/* GEANT_INHERIT */
typedef struct {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
} T85;

/* SPECIAL [GEANT_TARGET] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T86;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING] */
typedef struct {
	int id;
	T0* a5; /* container */
	T4 a6; /* position */
	T0* a7; /* next_cursor */
} T88;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct {
	int id;
} T89;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T90;

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
} T92;

/* XM_DEFAULT_POSITION */
typedef struct {
	int id;
	T0* a1; /* source_name */
	T4 a2; /* row */
	T4 a3; /* column */
	T4 a4; /* byte_index */
} T93;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct {
	int id;
	T0* a2; /* first_cell */
	T0* a3; /* internal_cursor */
	T0* a6; /* last_cell */
	T4 a7; /* count */
} T95;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T96;

/* XM_CALLBACKS_NULL */
typedef struct {
	int id;
} T97;

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
} T98;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct {
	int id;
} T100;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T101;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T102;

/* XM_EIFFEL_PARSER_NAME */
typedef struct {
	int id;
	T2 a2; /* use_namespaces */
	T4 a3; /* count */
	T0* a4; /* first */
	T0* a5; /* second */
	T0* a6; /* tail */
} T103;

/* XM_EIFFEL_DECLARATION */
typedef struct {
	int id;
	T0* a1; /* version */
	T0* a3; /* encoding */
	T2 a5; /* stand_alone */
} T104;

/* XM_DTD_EXTERNAL_ID */
typedef struct {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
} T105;

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
} T106;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct {
	int id;
	T0* a1; /* items */
	T1 a2; /* repetition */
	T0* a3; /* name */
	T1 a4; /* type */
	T2 a5; /* is_character_data_allowed */
} T107;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T108;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct {
	int id;
	T0* a1; /* name */
	T1 a2; /* type */
	T2 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T1 a5; /* value */
	T0* a6; /* default_value */
} T109;

/* DS_BILINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
	T0* a7; /* equality_tester */
} T110;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T111;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T112;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T113;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
} T114;

/* SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T4 z1; /* count */
	T2 z2[1]; /* item */
} T115;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T116;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct {
	int id;
} T117;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T118;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
} T119;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T120;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
} T121;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T123;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T125;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
} T126;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
} T127;

/* SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T128;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
} T129;

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
} T130;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
} T131;

/* XM_DTD_CALLBACKS_NULL */
typedef struct {
	int id;
} T133;

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
} T134;

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
} T136;

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
} T137;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T138;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T139;

/* XM_POSITION_TABLE */
typedef struct {
	int id;
	T0* a1; /* table */
} T140;

/* C_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* managed_data */
} T141;

/* GEANT_PARENT */
typedef struct {
	int id;
	T0* a2; /* renames */
	T0* a3; /* parent_project */
	T0* a4; /* redefines */
	T0* a5; /* selects */
	T0* a6; /* project */
	T0* a7; /* unchanged_targets */
	T0* a8; /* renamed_targets */
	T0* a9; /* redefined_targets */
} T143;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T4 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T4 a7; /* count */
} T145;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a6; /* next_cursor */
} T146;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T147;

/* DS_ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a6; /* count */
	T0* a7; /* equality_tester */
} T149;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct {
	int id;
	T0* a6; /* xml_element */
} T150;

/* XM_ATTRIBUTE */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
} T152;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a8; /* next_cursor */
} T153;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T155;

/* UC_UTF8_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* area */
	T4 a17; /* byte_count */
	T4 a28; /* internal_hash_code */
	T4 a30; /* last_byte_index_input */
	T4 a31; /* last_byte_index_result */
} T157;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct {
	int id;
	T0* a1; /* last_string */
	T0* a8; /* impl */
	T0* a9; /* utf_queue */
	T4 a10; /* encoding */
} T158;

/* KL_INTEGER_ROUTINES */
typedef struct {
	int id;
} T159;

/* KL_PLATFORM */
typedef struct {
	int id;
} T160;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T161;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T162;

/* GEANT_PARENT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* parent */
	T0* a4; /* project */
	T0* a13; /* xml_element */
} T163;

/* TO_SPECIAL [GEANT_TARGET] */
typedef struct {
	int id;
	T0* a1; /* area */
} T165;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct {
	int id;
	T4 a5; /* code */
} T166;

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
} T167;

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
} T168;

/* DS_LINKED_STACK [INTEGER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T171;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T172;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T173;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T174;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T175;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T177;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
} T178;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T179;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T180;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T181;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T182;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T183;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T184;

/* DS_LINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T185;

/* DS_BILINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T186;

/* DS_BILINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T187;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* area */
} T188;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T189;

/* TO_SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
} T190;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T191;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T192;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T193;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T194;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T195;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T0* a1; /* area */
} T196;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct {
	int id;
	T0* a5; /* context */
} T197;

/* DS_LINKED_QUEUE [STRING] */
typedef struct {
	int id;
	T0* a3; /* first_cell */
	T4 a4; /* count */
	T0* a5; /* last_cell */
} T199;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T200;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 z1; /* count */
	T8 z2[1]; /* item */
} T201;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T202;

/* GEANT_STRING_INTERPRETER */
typedef struct {
	int id;
	T0* a5; /* variable_resolver */
} T203;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct {
	int id;
	T0* a3; /* variables */
} T204;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T206;

/* MANAGED_POINTER */
typedef struct {
	int id;
	T2 a1; /* is_shared */
	T14 a3; /* item */
	T4 a6; /* count */
} T207;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct {
	int id;
} T208;

/* SPECIAL [GEANT_PARENT] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T209;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T210;

/* UC_UTF8_ROUTINES */
typedef struct {
	int id;
} T211;

/* DS_LINKED_QUEUE [CHARACTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* first_cell */
	T0* a5; /* last_cell */
} T213;

/* UC_UTF16_ROUTINES */
typedef struct {
	int id;
} T214;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 z1; /* count */
	T11 z2[1]; /* item */
} T215;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T216;

/* GEANT_RENAME_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* rename_clause */
	T0* a6; /* project */
	T0* a7; /* xml_element */
} T217;

/* GEANT_REDEFINE_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* redefine_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
} T218;

/* GEANT_SELECT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* select_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
} T219;

/* GEANT_RENAME */
typedef struct {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
} T220;

/* DS_HASH_TABLE [GEANT_RENAME, STRING] */
typedef struct {
	int id;
	T4 a2; /* position */
	T0* a4; /* equality_tester */
	T4 a5; /* last_position */
	T4 a6; /* capacity */
	T4 a9; /* slots_position */
	T4 a11; /* count */
	T0* a12; /* key_equality_tester */
	T4 a13; /* modulus */
	T4 a14; /* clashes_previous_position */
	T4 a17; /* found_position */
	T0* a18; /* items */
	T0* a21; /* clashes */
	T0* a22; /* slots */
	T0* a23; /* keys */
	T4 a24; /* free_slot */
	T0* a25; /* internal_cursor */
	T0* a28; /* special_item_routines */
	T0* a29; /* special_key_routines */
} T221;

/* GEANT_REDEFINE */
typedef struct {
	int id;
	T0* a1; /* name */
} T222;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING] */
typedef struct {
	int id;
	T0* a1; /* equality_tester */
	T4 a2; /* position */
	T4 a4; /* last_position */
	T4 a5; /* capacity */
	T4 a8; /* slots_position */
	T4 a10; /* count */
	T0* a11; /* key_equality_tester */
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
} T223;

/* GEANT_SELECT */
typedef struct {
	int id;
	T0* a1; /* name */
} T224;

/* DS_HASH_TABLE [GEANT_SELECT, STRING] */
typedef struct {
	int id;
	T0* a1; /* equality_tester */
	T4 a2; /* position */
	T4 a4; /* last_position */
	T4 a5; /* capacity */
	T4 a8; /* slots_position */
	T4 a10; /* count */
	T0* a11; /* key_equality_tester */
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
} T225;

/* UC_UNICODE_ROUTINES */
typedef struct {
	int id;
} T226;

/* DS_LINKABLE [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* item */
	T0* a2; /* right */
} T227;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T0* a1; /* area */
} T228;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T229;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T230;

/* DS_LINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T231;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a4; /* last_cell */
	T0* a5; /* internal_cursor */
	T0* a7; /* first_cell */
} T233;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T2 a1; /* before */
	T0* a3; /* current_cell */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
	T2 a6; /* after */
} T234;

/* DS_LINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T235;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T236;

/* GEANT_GEC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T238;

/* GEANT_SE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T239;

/* GEANT_ISE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T240;

/* GEANT_VE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T241;

/* GEANT_EXEC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T242;

/* GEANT_LCC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T243;

/* GEANT_SET_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T244;

/* GEANT_UNSET_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T245;

/* GEANT_GEXACE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T246;

/* GEANT_GELEX_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T247;

/* GEANT_GEYACC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T248;

/* GEANT_GEPP_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T249;

/* GEANT_GETEST_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T250;

/* GEANT_GEANT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T251;

/* GEANT_GEXMLSPLIT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T252;

/* GEANT_ECHO_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T253;

/* GEANT_MKDIR_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T254;

/* GEANT_DELETE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T255;

/* GEANT_COPY_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T256;

/* GEANT_MOVE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T257;

/* GEANT_SETENV_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T258;

/* GEANT_XSLT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T259;

/* GEANT_OUTOFDATE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T260;

/* GEANT_EXIT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T261;

/* GEANT_PRECURSOR_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T262;

/* GEANT_AVAILABLE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T263;

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
} T264;

/* XM_COMMENT */
typedef struct {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
} T265;

/* XM_PROCESSING_INSTRUCTION */
typedef struct {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
} T266;

/* XM_CHARACTER_DATA */
typedef struct {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
} T267;

/* XM_NAMESPACE */
typedef struct {
	int id;
	T0* a2; /* uri */
	T0* a4; /* ns_prefix */
} T268;

/* DS_LINKABLE [XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
} T271;

/* XM_NODE_TYPER */
typedef struct {
	int id;
	T0* a1; /* element */
	T0* a4; /* xml_attribute */
	T0* a5; /* composite */
	T0* a6; /* document */
	T0* a7; /* character_data */
	T0* a8; /* processing_instruction */
	T0* a9; /* comment */
} T272;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T278;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a4; /* as_special */
	T0* a6; /* area */
} T279;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T280;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T281;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct {
	int id;
} T282;

/* TYPED_POINTER [NATURAL_8] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T283;

/* EXCEPTIONS */
typedef struct {
	int id;
} T284;

/* TO_SPECIAL [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T285;

/* DS_LINKABLE [CHARACTER] */
typedef struct {
	int id;
	T1 a1; /* item */
	T0* a2; /* right */
} T286;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct {
	int id;
} T287;

/* SPECIAL [GEANT_RENAME] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T288;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T289;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct {
	int id;
} T290;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct {
	int id;
} T291;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T292;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T293;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct {
	int id;
} T294;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct {
	int id;
} T295;

/* SPECIAL [GEANT_SELECT] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T296;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T297;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct {
	int id;
} T298;

/* SPECIAL [ARRAY [INTEGER]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T299;

/* SPECIAL [SPECIAL [ARRAY [INTEGER]]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T300;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T301;

/* KL_DIRECTORY */
typedef struct {
	int id;
	T0* a2; /* string_name */
	T0* a5; /* name */
	T4 a7; /* mode */
	T2 a10; /* end_of_input */
	T0* a11; /* last_entry */
	T0* a13; /* entry_buffer */
	T0* a15; /* lastentry */
	T14 a18; /* directory_pointer */
} T302;

/* KL_STRING_INPUT_STREAM */
typedef struct {
	int id;
	T2 a1; /* end_of_input */
	T1 a2; /* last_character */
	T0* a6; /* string */
	T4 a7; /* location */
} T303;

/* GEANT_GEC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* exit_code_variable_name */
	T0* a7; /* ace_filename */
	T0* a8; /* clean */
	T2 a9; /* c_compile */
	T2 a10; /* finalize */
	T2 a11; /* cat_mode */
} T304;

/* GEANT_SE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* exit_code_variable_name */
	T0* a8; /* ace_filename */
	T0* a9; /* root_class */
	T0* a10; /* executable */
	T0* a11; /* clean */
	T0* a12; /* creation_procedure */
	T2 a13; /* case_insensitive */
	T2 a14; /* no_style_warning */
} T305;

/* GEANT_ISE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* exit_code_variable_name */
	T0* a7; /* system_name */
	T0* a8; /* clean */
	T0* a9; /* ace_filename */
	T2 a10; /* finalize_mode */
	T2 a11; /* finish_freezing */
} T306;

/* GEANT_VE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* exit_code_variable_name */
	T0* a8; /* esd_filename */
	T0* a9; /* xace_filename */
	T0* a10; /* clean */
	T0* a11; /* tuned_system */
	T2 a12; /* recursive_clean */
	T0* a13; /* tuning_level */
} T307;

/* GEANT_EXEC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* command_line */
	T0* a7; /* fileset */
	T0* a8; /* exit_code_variable_name */
	T2 a9; /* accept_errors */
} T308;

/* GEANT_FILESET_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* fileset */
	T0* a7; /* project */
	T0* a20; /* xml_element */
} T309;

/* GEANT_FILESET */
typedef struct {
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
	T2 a14; /* concat */
	T0* a15; /* single_includes */
	T0* a16; /* single_excludes */
	T2 a17; /* force */
	T2 a18; /* convert_to_filesystem */
	T0* a20; /* include_wc_string */
	T0* a25; /* exclude_wc_string */
	T0* a26; /* filename_variable_name */
	T0* a27; /* mapped_filename_variable_name */
} T310;

/* GEANT_LCC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* executable */
	T0* a5; /* source_filename */
} T311;

/* GEANT_SET_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
} T312;

/* GEANT_UNSET_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
} T313;

/* GEANT_GEXACE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T2 a9; /* validate_command */
	T0* a10; /* output_filename */
	T0* a11; /* system_command */
	T0* a12; /* library_command */
	T2 a13; /* verbose */
	T0* a14; /* xace_filename */
} T314;

/* GEANT_DEFINE_ELEMENT */
typedef struct {
	int id;
	T0* a7; /* project */
	T0* a10; /* xml_element */
} T315;

/* GEANT_GELEX_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T2 a5; /* full */
	T2 a6; /* meta_ecs */
	T0* a7; /* output_filename */
	T0* a8; /* size */
	T2 a9; /* ecs */
	T2 a10; /* backup */
	T2 a11; /* case_insensitive */
	T2 a12; /* no_default */
	T2 a13; /* no_warn */
	T2 a14; /* separate_actions */
} T316;

/* GEANT_GEYACC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T2 a6; /* separate_actions */
	T0* a7; /* verbose_filename */
	T2 a8; /* old_typing */
	T2 a9; /* new_typing */
	T0* a10; /* tokens_classname */
	T0* a11; /* tokens_filename */
} T317;

/* GEANT_GEPP_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T0* a7; /* input_filename */
	T0* a8; /* output_filename */
	T0* a9; /* fileset */
	T2 a10; /* empty_lines */
	T0* a11; /* to_directory */
	T2 a12; /* force */
} T318;

/* GEANT_GETEST_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* defines */
	T0* a4; /* project */
	T0* a5; /* config_filename */
	T2 a6; /* generation */
	T2 a7; /* compilation */
	T2 a8; /* execution */
	T2 a9; /* verbose */
	T0* a10; /* compile */
	T0* a11; /* class_regexp */
	T0* a12; /* feature_regexp */
	T2 a13; /* default_test_included */
	T2 a14; /* abort */
} T319;

/* GEANT_GEANT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* arguments */
	T0* a4; /* project */
	T0* a7; /* filename */
	T0* a8; /* start_target_name */
	T2 a9; /* reuse_variables */
	T2 a10; /* fork */
	T2 a11; /* has_fork_been_set */
	T0* a12; /* fileset */
} T320;

/* ST_SPLITTER */
typedef struct {
	int id;
	T2 a3; /* has_escape_character */
	T1 a4; /* escape_character */
	T0* a6; /* separator_codes */
	T0* a8; /* separators */
} T321;

/* GEANT_GEXMLSPLIT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
} T322;

/* GEANT_ECHO_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* message */
	T0* a5; /* to_file */
	T2 a6; /* append */
} T323;

/* GEANT_MKDIR_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* directory */
} T324;

/* GEANT_DELETE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a9; /* file */
	T0* a10; /* directory */
	T0* a11; /* fileset */
	T0* a12; /* directoryset */
} T325;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a13; /* xml_element */
} T326;

/* GEANT_DIRECTORYSET */
typedef struct {
	int id;
	T0* a4; /* directory_name */
	T0* a5; /* project */
	T0* a6; /* include_wildcard */
	T0* a7; /* exclude_wildcard */
	T0* a8; /* directory_names */
	T2 a9; /* convert_to_filesystem */
	T0* a10; /* single_includes */
	T0* a11; /* single_excludes */
	T0* a12; /* include_wc_string */
	T0* a14; /* exclude_wc_string */
	T2 a15; /* concat */
	T0* a16; /* directory_name_variable_name */
} T327;

/* GEANT_COPY_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a8; /* file */
	T0* a9; /* to_file */
	T0* a10; /* to_directory */
	T0* a11; /* fileset */
	T2 a12; /* force */
} T328;

/* GEANT_MOVE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* file */
	T0* a8; /* to_file */
	T0* a9; /* to_directory */
	T0* a10; /* fileset */
} T329;

/* GEANT_SETENV_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
} T330;

/* GEANT_XSLT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* parameters */
	T0* a4; /* project */
	T0* a5; /* input_filename */
	T0* a6; /* output_filename */
	T0* a7; /* stylesheet_filename */
	T4 a8; /* processor */
	T2 a13; /* force */
	T0* a14; /* indent */
	T0* a15; /* format */
	T0* a16; /* extdirs */
	T0* a17; /* classpath */
} T331;

/* DS_PAIR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T332;

/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T333;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* source_filename */
	T0* a7; /* target_filename */
	T0* a8; /* fileset */
	T0* a9; /* true_value */
	T0* a10; /* false_value */
	T0* a11; /* variable_name */
	T2 a14; /* is_out_of_date */
} T334;

/* GEANT_EXIT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T4 a4; /* code */
} T335;

/* GEANT_PRECURSOR_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* arguments */
	T0* a4; /* project */
	T0* a5; /* parent */
} T336;

/* GEANT_AVAILABLE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a5; /* resource_name */
	T0* a6; /* true_value */
	T0* a7; /* false_value */
	T0* a8; /* variable_name */
} T337;

/* SPECIAL [XM_NAMESPACE] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T338;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct {
	int id;
} T339;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T340;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct {
	int id;
} T341;

/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct {
	int id;
	T0* a1; /* area */
} T342;

/* TO_SPECIAL [GEANT_RENAME] */
typedef struct {
	int id;
	T0* a1; /* area */
} T343;

/* TO_SPECIAL [GEANT_REDEFINE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T344;

/* TO_SPECIAL [GEANT_SELECT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T345;

/* DP_SHELL_COMMAND */
typedef struct {
	int id;
	T4 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a4; /* command */
	T4 a5; /* return_code */
	T2 a7; /* is_system_code */
} T349;

/* GEANT_MAP_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a8; /* xml_element */
} T350;

/* GEANT_MAP */
typedef struct {
	int id;
	T0* a3; /* type */
	T0* a10; /* project */
	T0* a11; /* source_pattern */
	T0* a12; /* target_pattern */
	T0* a13; /* map */
} T351;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
	T0* a4; /* internal_cursor */
	T0* a10; /* items */
	T0* a11; /* equality_tester */
	T4 a12; /* position */
	T4 a14; /* last_position */
	T4 a15; /* capacity */
	T4 a18; /* slots_position */
	T4 a20; /* count */
	T4 a21; /* modulus */
	T4 a23; /* free_slot */
	T4 a29; /* found_position */
	T4 a30; /* clashes_previous_position */
	T0* a33; /* clashes */
	T0* a34; /* slots */
	T0* a36; /* special_item_routines */
} T354;

/* DS_HASH_SET [STRING] */
typedef struct {
	int id;
	T4 a2; /* capacity */
	T4 a3; /* modulus */
	T4 a5; /* last_position */
	T4 a6; /* free_slot */
	T4 a8; /* position */
	T0* a9; /* internal_cursor */
	T0* a10; /* equality_tester */
	T4 a13; /* slots_position */
	T4 a15; /* count */
	T0* a16; /* special_item_routines */
	T0* a17; /* items */
	T0* a18; /* clashes */
	T0* a20; /* slots */
	T4 a21; /* found_position */
	T4 a22; /* clashes_previous_position */
} T356;

/* DS_HASH_SET_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a5; /* next_cursor */
} T358;

/* LX_DFA_WILDCARD */
typedef struct {
	int id;
	T0* a3; /* yy_nxt */
	T0* a4; /* subject */
	T4 a5; /* subject_start */
	T4 a6; /* subject_end */
	T4 a8; /* match_count */
	T4 a9; /* matched_start */
	T4 a10; /* matched_end */
	T0* a11; /* yy_accept */
	T4 a12; /* yyNb_rows */
} T359;

/* GEANT_FILESET_ENTRY */
typedef struct {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
} T360;

/* KL_BOOLEAN_ROUTINES */
typedef struct {
	int id;
} T361;

/* ARRAY [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T362;

/* DS_HASH_SET [INTEGER] */
typedef struct {
	int id;
	T4 a2; /* position */
	T4 a4; /* capacity */
	T4 a5; /* modulus */
	T4 a7; /* last_position */
	T4 a8; /* free_slot */
	T0* a9; /* internal_cursor */
	T4 a13; /* slots_position */
	T4 a15; /* count */
	T4 a16; /* clashes_previous_position */
	T0* a20; /* special_item_routines */
	T0* a21; /* items */
	T0* a22; /* clashes */
	T0* a24; /* slots */
	T4 a25; /* found_position */
	T0* a26; /* equality_tester */
} T364;

/* KL_TEXT_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a14; /* file_pointer */
	T2 a16; /* descriptor_available */
} T365;

/* SPECIAL [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T366;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
} T367;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
	T0* a1; /* container */
} T368;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T369;

/* PLATFORM */
typedef struct {
	int id;
} T370;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct {
	int id;
	T0* a5; /* error_message */
	T4 a7; /* match_count */
	T0* a8; /* subject */
	T4 a9; /* subject_end */
	T4 a10; /* subject_start */
	T0* a11; /* offset_vector */
	T4 a13; /* offset_vector_count */
	T4 a14; /* brastart_capacity */
	T0* a15; /* brastart_vector */
	T4 a16; /* brastart_lower */
	T4 a17; /* brastart_count */
	T4 a18; /* eptr_capacity */
	T0* a19; /* eptr_vector */
	T4 a20; /* eptr_lower */
	T4 a21; /* eptr_upper */
	T0* a22; /* byte_code */
	T0* a23; /* pattern */
	T4 a27; /* subexpression_count */
	T4 a28; /* pattern_count */
	T4 a29; /* pattern_position */
	T4 a30; /* code_index */
	T4 a31; /* maxbackrefs */
	T4 a32; /* optchanged */
	T4 a34; /* first_character */
	T4 a35; /* required_character */
	T4 a36; /* regexp_countlits */
	T0* a37; /* start_bits */
	T2 a44; /* is_anchored */
	T0* a50; /* character_case_mapping */
	T0* a51; /* word_set */
	T4 a52; /* subject_next_start */
	T4 a54; /* error_code */
	T4 a55; /* error_position */
	T2 a66; /* is_startline */
	T2 a69; /* is_caseless */
	T2 a70; /* is_multiline */
	T2 a71; /* is_dotall */
	T2 a72; /* is_extended */
	T2 a73; /* is_empty_allowed */
	T2 a74; /* is_dollar_endonly */
	T2 a75; /* is_bol */
	T2 a76; /* is_eol */
	T2 a77; /* is_greedy */
	T2 a78; /* is_strict */
	T2 a79; /* is_ichanged */
	T4 a145; /* first_matched_index */
	T4 a224; /* eptr */
	T4 a225; /* offset_top */
	T2 a226; /* is_matching_caseless */
	T2 a227; /* is_matching_multiline */
	T2 a228; /* is_matching_dotall */
} T372;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T373;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T374;

/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
} T375;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
} T376;

/* LX_WILDCARD_PARSER */
typedef struct {
	int id;
	T2 a1; /* successful */
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
	T4 a23; /* line_nb */
	T0* a24; /* yyss */
	T0* a27; /* input_buffer */
	T4 a28; /* yy_end */
	T4 a29; /* yy_position */
	T4 a30; /* yy_line */
	T4 a31; /* yy_column */
	T4 a32; /* yy_parsing_status */
	T4 a34; /* yy_suspended_yystacksize */
	T4 a35; /* yy_suspended_yystate */
	T4 a36; /* yy_suspended_yyn */
	T4 a37; /* yy_suspended_yychar1 */
	T4 a38; /* yy_suspended_index */
	T4 a39; /* yy_suspended_yyss_top */
	T4 a40; /* yy_suspended_yy_goto */
	T4 a42; /* error_count */
	T2 a43; /* yy_lookahead_needed */
	T4 a44; /* yyerrstatus */
	T4 a45; /* yyssp */
	T0* a52; /* yypact */
	T4 a54; /* last_token */
	T0* a57; /* yytranslate */
	T0* a60; /* yycheck */
	T0* a61; /* yytable */
	T0* a63; /* yydefact */
	T0* a65; /* yyr1 */
	T0* a67; /* yypgoto */
	T0* a68; /* yydefgoto */
	T0* a72; /* yytypes1 */
	T0* a74; /* yytypes2 */
	T4 a82; /* yy_start */
	T4 a83; /* yyvsp1 */
	T4 a84; /* yyvsp2 */
	T4 a85; /* yyvsp3 */
	T4 a86; /* yyvsp4 */
	T4 a87; /* yyvsp5 */
	T2 a94; /* yy_more_flag */
	T4 a95; /* yy_more_len */
	T4 a96; /* line */
	T4 a97; /* column */
	T4 a98; /* position */
	T4 a99; /* yy_start_state */
	T0* a101; /* yy_state_stack */
	T4 a102; /* yy_state_count */
	T0* a103; /* yy_ec */
	T0* a104; /* yy_content_area */
	T0* a105; /* yy_content */
	T0* a106; /* yy_accept */
	T4 a107; /* yy_last_accepting_state */
	T4 a108; /* yy_last_accepting_cpos */
	T0* a109; /* yy_chk */
	T0* a110; /* yy_base */
	T0* a111; /* yy_def */
	T0* a112; /* yy_meta */
	T0* a114; /* yy_nxt */
	T4 a116; /* yy_lp */
	T0* a117; /* yy_acclist */
	T4 a120; /* yy_looking_for_trail_begin */
	T4 a122; /* yy_full_match */
	T4 a123; /* yy_full_state */
	T4 a124; /* yy_full_lp */
	T2 a130; /* yy_rejected */
	T4 a133; /* yyvsc1 */
	T0* a134; /* yyvs1 */
	T0* a135; /* yyspecial_routines1 */
	T0* a137; /* last_any_value */
	T4 a138; /* yyvsc2 */
	T0* a139; /* yyvs2 */
	T0* a140; /* yyspecial_routines2 */
	T4 a141; /* last_integer_value */
	T4 a142; /* yyvsc3 */
	T0* a143; /* yyvs3 */
	T0* a144; /* yyspecial_routines3 */
	T0* a145; /* last_lx_symbol_class_value */
	T4 a146; /* yyvsc4 */
	T0* a147; /* yyvs4 */
	T0* a148; /* yyspecial_routines4 */
	T0* a149; /* last_string_value */
	T2 a150; /* in_trail_context */
	T0* a151; /* rule */
	T0* a152; /* yyvs5 */
	T2 a153; /* has_trail_context */
	T4 a154; /* head_count */
	T4 a156; /* head_line */
	T4 a157; /* head_column */
	T4 a158; /* trail_count */
	T4 a160; /* yyvsc5 */
	T0* a161; /* yyspecial_routines5 */
	T0* a174; /* last_string */
	T4 a190; /* rule_line_nb */
} T377;

/* LX_DESCRIPTION */
typedef struct {
	int id;
	T0* a1; /* equiv_classes */
	T2 a2; /* equiv_classes_used */
	T2 a3; /* full_table */
	T2 a4; /* meta_equiv_classes_used */
	T2 a5; /* reject_used */
	T2 a6; /* variable_trail_context */
	T0* a7; /* rules */
	T0* a8; /* start_conditions */
	T4 a9; /* characters_count */
	T4 a10; /* array_size */
	T2 a11; /* line_pragma */
	T0* a13; /* eof_rules */
	T0* a15; /* eiffel_header */
	T2 a16; /* case_insensitive */
	T0* a17; /* input_filename */
	T2 a18; /* inspect_used */
	T2 a19; /* actions_separated */
	T0* a20; /* eiffel_code */
	T2 a21; /* bol_needed */
	T2 a22; /* pre_action_used */
	T2 a23; /* post_action_used */
	T2 a24; /* pre_eof_action_used */
	T2 a25; /* post_eof_action_used */
	T2 a26; /* line_used */
	T2 a27; /* position_used */
} T378;

/* LX_FULL_DFA */
typedef struct {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T4 a3; /* yyNb_rows */
	T0* a4; /* input_filename */
	T4 a6; /* characters_count */
	T4 a7; /* array_size */
	T2 a8; /* inspect_used */
	T2 a9; /* actions_separated */
	T0* a10; /* eiffel_code */
	T0* a11; /* eiffel_header */
	T2 a12; /* bol_needed */
	T2 a13; /* pre_action_used */
	T2 a14; /* post_action_used */
	T2 a15; /* pre_eof_action_used */
	T2 a16; /* post_eof_action_used */
	T2 a17; /* line_pragma */
	T0* a18; /* yy_start_conditions */
	T0* a19; /* yy_ec */
	T4 a20; /* yyNull_equiv_class */
	T4 a21; /* yyNb_rules */
	T0* a22; /* yy_rules */
	T4 a23; /* yyEnd_of_buffer */
	T2 a24; /* yyLine_used */
	T2 a25; /* yyPosition_used */
	T4 a26; /* minimum_symbol */
	T4 a27; /* maximum_symbol */
	T0* a28; /* states */
	T4 a29; /* backing_up_count */
	T0* a30; /* partitions */
	T4 a31; /* start_states_count */
	T2 a32; /* yyBacking_up */
	T0* a33; /* yy_eof_rules */
} T379;

/* DS_HASH_SET_CURSOR [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T381;

/* KL_EQUALITY_TESTER [INTEGER] */
typedef struct {
	int id;
} T382;

/* TO_SPECIAL [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T383;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct {
	int id;
	T0* a1; /* name */
} T384;

/* KL_BINARY_INPUT_FILE */
typedef struct {
	int id;
	T2 a2; /* end_of_file */
	T0* a3; /* last_string */
	T4 a5; /* mode */
	T0* a9; /* name */
	T0* a12; /* string_name */
	T0* a13; /* character_buffer */
	T14 a21; /* file_pointer */
	T2 a23; /* descriptor_available */
} T385;

/* KL_BINARY_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a14; /* file_pointer */
	T2 a16; /* descriptor_available */
} T386;

/* GE_HASH_TABLE [C_STRING, STRING] */
typedef struct {
	int id;
	T4 a1; /* capacity */
	T0* a3; /* content */
	T0* a4; /* keys */
	T0* a5; /* deleted_marks */
	T4 a6; /* iteration_position */
	T4 a9; /* deleted_position */
	T4 a11; /* position */
	T4 a12; /* used_slot_count */
	T4 a13; /* count */
	T0* a14; /* key_equality_tester */
	T0* a16; /* found_item */
	T2 a17; /* has_default */
	T4 a18; /* control */
} T387;

/* FILE_NAME */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a5; /* internal_hash_code */
	T0* a7; /* area */
} T389;

/* RAW_FILE */
typedef struct {
	int id;
	T0* a5; /* name */
	T4 a8; /* mode */
} T390;

/* DIRECTORY */
typedef struct {
	int id;
	T0* a1; /* lastentry */
	T0* a2; /* name */
	T4 a3; /* mode */
	T14 a6; /* directory_pointer */
} T391;

/* ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T4 a3; /* index */
	T4 a4; /* count */
	T0* a5; /* area */
	T4 a6; /* lower */
	T4 a7; /* upper */
} T392;

/* RX_BYTE_CODE */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a6; /* byte_code */
	T0* a7; /* character_sets */
	T4 a8; /* capacity */
	T4 a10; /* character_sets_count */
	T4 a11; /* character_sets_capacity */
} T394;

/* RX_CASE_MAPPING */
typedef struct {
	int id;
	T0* a3; /* lower_table */
	T0* a4; /* flip_table */
} T395;

/* RX_CHARACTER_SET */
typedef struct {
	int id;
	T0* a2; /* set */
} T396;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T398;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T399;

/* TO_SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T400;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T401;

/* LX_START_CONDITIONS */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a5; /* storage */
	T0* a6; /* special_routines */
	T4 a7; /* capacity */
	T0* a8; /* internal_cursor */
} T402;

/* LX_ACTION_FACTORY */
typedef struct {
	int id;
} T403;

/* DS_ARRAYED_STACK [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
} T404;

/* KL_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T405;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING] */
typedef struct {
	int id;
	T4 a4; /* position */
	T0* a7; /* items */
	T0* a8; /* key_equality_tester */
	T4 a9; /* count */
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
} T406;

/* LX_SYMBOL_CLASS */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T2 a9; /* sort_needed */
	T2 a10; /* negated */
	T4 a12; /* count */
	T0* a16; /* equality_tester */
} T407;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T408;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
} T409;

/* LX_NFA */
typedef struct {
	int id;
	T2 a1; /* in_trail_context */
	T0* a2; /* states */
} T410;

/* LX_EQUIVALENCE_CLASSES */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a6; /* storage */
} T411;

/* LX_RULE */
typedef struct {
	int id;
	T4 a1; /* id */
	T0* a2; /* pattern */
	T0* a4; /* action */
	T4 a6; /* head_count */
	T4 a7; /* trail_count */
	T4 a8; /* line_count */
	T4 a9; /* column_count */
	T4 a10; /* line_nb */
	T2 a11; /* has_trail_context */
	T2 a13; /* is_useful */
} T412;

/* SPECIAL [LX_NFA] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T413;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct {
	int id;
} T414;

/* UT_SYNTAX_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T415;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a5; /* next_cursor */
} T416;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T417;

/* LX_MISSING_QUOTE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T418;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T419;

/* LX_BAD_CHARACTER_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T420;

/* LX_FULL_AND_META_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T421;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T422;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T423;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T424;

/* SPECIAL [LX_RULE] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T425;

/* ARRAY [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T426;

/* LX_DFA_STATE */
typedef struct {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T4 a5; /* code */
	T4 a8; /* id */
} T427;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a6; /* storage */
	T0* a7; /* equality_tester */
	T0* a8; /* special_routines */
	T4 a9; /* capacity */
	T0* a10; /* internal_cursor */
} T428;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* capacity */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T0* a6; /* internal_cursor */
} T429;

/* LX_SYMBOL_PARTITIONS */
typedef struct {
	int id;
	T0* a2; /* symbols */
	T0* a5; /* storage */
	T4 a8; /* count */
} T430;

/* LX_START_CONDITION */
typedef struct {
	int id;
	T0* a1; /* name */
	T4 a2; /* id */
	T2 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
} T431;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T4 a6; /* count */
} T432;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a6; /* count */
} T433;

/* DS_HASH_TABLE [LX_NFA, INTEGER] */
typedef struct {
	int id;
	T4 a3; /* position */
	T0* a6; /* items */
	T0* a7; /* key_equality_tester */
	T4 a8; /* count */
	T4 a9; /* capacity */
	T4 a12; /* slots_position */
	T4 a13; /* free_slot */
	T4 a14; /* last_position */
	T4 a18; /* modulus */
	T4 a19; /* clashes_previous_position */
	T0* a21; /* equality_tester */
	T4 a22; /* found_position */
	T0* a25; /* clashes */
	T0* a26; /* slots */
	T0* a27; /* keys */
	T0* a28; /* internal_cursor */
	T0* a31; /* special_item_routines */
	T0* a32; /* special_key_routines */
} T434;

/* LX_NFA_STATE */
typedef struct {
	int id;
	T2 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T4 a4; /* id */
	T0* a7; /* accepted_rule */
} T435;

/* GE_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T436;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T438;

/* PRIMES */
typedef struct {
	int id;
} T440;

/* SPECIAL [C_STRING] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T441;

/* ARRAY [C_STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T442;

/* TYPED_POINTER [FILE_NAME] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T443;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct {
	int id;
} T444;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T445;

/* SPECIAL [LX_START_CONDITION] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T446;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct {
	int id;
} T447;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T448;

/* DS_ARRAYED_LIST_CURSOR [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
} T450;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
	T0* a1; /* area */
} T451;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
} T452;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* target */
} T454;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* label */
	T0* a2; /* target */
} T456;

/* DS_BILINKABLE [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T457;

/* SPECIAL [DS_BILINKABLE [INTEGER]] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T458;

/* ARRAY [DS_BILINKABLE [INTEGER]] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T459;

/* LX_ACTION */
typedef struct {
	int id;
	T0* a1; /* text */
} T461;

/* TO_SPECIAL [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* area */
} T462;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T463;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T465;

/* SPECIAL [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T467;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct {
	int id;
} T469;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a5; /* container */
} T470;

/* SPECIAL [LX_DFA_STATE] */
typedef struct {
	int id;
	T4 z1; /* count */
	T0* z2[1]; /* item */
} T472;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct {
	int id;
} T473;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* container */
} T474;

/* ARRAY [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T475;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct {
	int id;
} T476;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* container */
} T477;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T479;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct {
	int id;
} T482;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct {
	int id;
} T485;

/* TO_SPECIAL [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T488;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T489;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T490;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T491;

/* DS_SHELL_SORTER [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T492;

/* KL_COMPARABLE_COMPARATOR [INTEGER] */
typedef struct {
	int id;
} T494;

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern int geargc;
extern char** geargv;

/* Call to STRING.to_c */
extern T0* T16x1149(T0* C);
/* Call to STRING.area */
extern T0* T16x1208(T0* C);
/* Call to STRING.count */
extern T4 T16x1205(T0* C);
/* Call to ANY.same_type */
extern T2 T17x59(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T37x2893(T0* C);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T58x1648(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T58x1505(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T2 T58x1636(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].before_position */
extern T4 T58x1604(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T4 T92x5724(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T92x5599(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T2 T92x5729(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T92x5610(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T4 T92x5720(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T92x5608(T0* C);
/* Call to XM_NODE.parent */
extern T0* T154x4915(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T4 T237x7465(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T2 T237x1951(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T2 T237x7464(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T453x11980(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T453x11983(T0* C, T4 a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T58x1638(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T58x1637(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T71x4322(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T72x4339(T0* C, T0* a1, T0* a2, T2 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T72x4344(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T72x4340(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T72x4346(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T72x4345(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T72x4343(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T72x4347(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T72x4341(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T72x4342(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T72x4338(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T72x4337(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T92x5595(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T92x5594(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T92x5600(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T92x5591(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T92x5735(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T92x5593(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T154x4925(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T154x4923(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T237x7467(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T453x11984(T0* C, T0* a1);
/* GEANT.make */
extern T0* T19c22(void);
/* GEANT_PROJECT.build */
extern void T20f28(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T20f38(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T202f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T147f10(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T20f40(T0* C, T0* a1, T0* a2, T2 a3, T2 a4);
/* GEANT_TARGET.execute */
extern void T24f89(T0* C);
/* GEANT_TARGET.set_executed */
extern void T24f94(T0* C, T2 a1);
/* GEANT_TARGET.has_attribute */
extern T2 T24f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T153f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T74f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T74f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T153f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T74f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T153f14(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_ELEMENT.cursor_forth */
extern void T75f38(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T75f41(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T75f42(T0* C, T0* a1);
/* GEANT_TARGET.execute_task */
extern void T24f93(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern T0* T263c24(T0* a1, T0* a2);
/* GEANT_AVAILABLE_COMMAND.set_variable_name */
extern void T337f17(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.variable_attribute_name */
extern unsigned char ge98os8059;
extern T0* ge98ov8059;
extern T0* T263f15(T0* C);
/* GEANT_AVAILABLE_TASK.false_value_attribute_name */
extern unsigned char ge98os8061;
extern T0* ge98ov8061;
extern T0* T263f14(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_false_value */
extern void T337f16(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.true_value_attribute_name */
extern unsigned char ge98os8060;
extern T0* ge98ov8060;
extern T0* T263f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_true_value */
extern void T337f15(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_resource_name */
extern void T337f14(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.attribute_value */
extern T0* T263f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern unsigned char ge63os1314;
extern T0* ge63ov1314;
extern T0* T263f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T47c15(void);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T204f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T204c4(void);
/* GEANT_AVAILABLE_TASK.target_arguments_stack */
extern unsigned char ge63os1315;
extern T0* ge63ov1315;
extern T0* T263f20(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T202c8(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T282f1(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES].make_area */
extern T0* T342c2(T4 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T281c4(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T282c3(void);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T2 T263f8(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.resource_attribute_name */
extern unsigned char ge98os8058;
extern T0* ge98ov8058;
extern T0* T263f11(T0* C);
/* GEANT_AVAILABLE_TASK.task_make */
extern void T263f26(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T263f29(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T263f31(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T263f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T263f32(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T263f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T337c13(T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T337f19(T0* C, T0* a1);
/* GEANT_TARGET.available_task_name */
extern unsigned char ge130os1998;
extern T0* ge130ov1998;
extern T0* T24f71(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T262c26(T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T83f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T82f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T82f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T83f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T82f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T83f10(T0* C, T0* a1, T2 a2, T2 a3);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T315f5(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T315f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T315f6(T0* C);
/* GEANT_DEFINE_ELEMENT.target_arguments_stack */
extern T0* T315f15(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern unsigned char ge139os6730;
extern T0* ge139ov6730;
extern T0* T315f13(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T2 T32f35(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T32f47(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T4 T32f11(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T4 T32f6(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T4 T157f15(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T157f5(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T1 T159f2(T0* C, T4 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge157os3038;
extern T0* ge157ov3038;
extern T0* T157f21(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T159c4(void);
/* INTEGER.infix "<=" */
extern T2 T4f5(T4* C, T4 a1);
/* STRING.append_character */
extern void T16f33(T0* C, T1 a1);
/* STRING.resize */
extern void T16f32(T0* C, T4 a1);
/* SPECIAL [CHARACTER].aliased_resized_area */
extern T0* T15f3(T0* C, T4 a1);
/* INTEGER.infix ">=" */
extern T2 T4f6(T4* C, T4 a1);
/* STRING.additional_space */
extern T4 T16f13(T0* C);
/* INTEGER.max */
extern T4 T4f10(T4* C, T4 a1);
/* STRING.capacity */
extern T4 T16f12(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T1 T157f18(T0* C, T4 a1);
/* UC_UTF8_STRING.old_item */
extern T1 T157f29(T0* C, T4 a1);
/* UC_UTF8_STRING.set_count */
extern void T157f56(T0* C, T4 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T157f64(T0* C);
/* STRING.make */
extern void T16f28(T0* C, T4 a1);
/* STRING.make */
extern T0* T16c28(T4 a1);
/* STRING.make_area */
extern void T16f31(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c8(T4 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T4 T157f22(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T4 T211f3(T0* C, T1 a1);
/* CHARACTER.infix "<=" */
extern T2 T1f17(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f2(T1* C, T1 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge221os3907;
extern T0* ge221ov3907;
extern T0* T157f23(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T211c22(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge285os6873;
extern T4 ge285ov6873;
extern T4 T160f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T4 T160f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge211os3035;
extern T0* ge211ov3035;
extern T0* T157f20(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T160c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T4 T157f19(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T4 T211f4(T0* C, T1 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T4 T211f2(T0* C, T1 a1);
/* UC_UTF8_STRING.hash_code */
extern T4 T157f15p1(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f11(T4* C, T4 a1);
/* STRING.hash_code */
extern T4 T16f14(T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T2 T48f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge160os1320;
extern T0* ge160ov1320;
extern T0* T48f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T41c15(void);
/* GEANT_ARGUMENT_VARIABLES.keys_item */
extern T0* T32f17(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T4 T32f12(T0* C, T4 a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T315f4(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern unsigned char ge139os6729;
extern T0* ge139ov6729;
extern T0* T315f12(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T2 T315f2(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T2 T315f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T315c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T315f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T315f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T315f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T83f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T83f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T82f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T2 T82f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T82f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T83c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].forth */
extern void T231f9(T0* C);
/* DS_LINKED_LIST [STRING].cursor_forth */
extern void T185f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].add_traversing_cursor */
extern void T185f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T231f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].remove_traversing_cursor */
extern void T185f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set */
extern void T231f10(T0* C, T0* a1, T2 a2, T2 a3);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T32f63(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.keys_put */
extern void T32f52(T0* C, T0* a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T32f51(T0* C, T4 a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T32f50(T0* C, T4 a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T32f49(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T32f57(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T52f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T50f3(T0* C, T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T50c4(T4 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern unsigned char ge158os1671;
extern T0* ge158ov1671;
extern T0* T32f25(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T52c4(void);
/* GEANT_ARGUMENT_VARIABLES.keys_resize */
extern void T32f56(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T53f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T30f3(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T30c6(T4 a1);
/* GEANT_ARGUMENT_VARIABLES.items_resize */
extern void T32f55(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T32f54(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T4 T32f19(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T4 T32f5(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.items_put */
extern void T32f48(T0* C, T0* a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T32f46(T0* C);
/* INTEGER.out */
extern T0* T4f12(T4* C);
/* STRING.append_integer */
extern void T16f40(T0* C, T4 a1);
/* DS_LINKED_LIST_CURSOR [STRING].item */
extern T0* T231f4(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].start */
extern void T231f8(T0* C);
/* DS_LINKED_LIST [STRING].cursor_start */
extern void T185f10(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].cursor_off */
extern T2 T185f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].new_cursor */
extern T0* T185f2(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].make */
extern T0* T231c7(T0* a1);
/* ST_SPLITTER.split */
extern T0* T321f1(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T321f2(T0* C, T0* a1, T2 a2);
/* DS_LINKED_LIST [STRING].force_last */
extern void T185f9(T0* C, T0* a1);
/* DS_LINKABLE [STRING].put_right */
extern void T235f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING].make */
extern T0* T235c3(T0* a1);
/* DS_LINKED_LIST [STRING].is_empty */
extern T2 T185f3(T0* C);
/* DS_HASH_SET [INTEGER].has */
extern T2 T364f1(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].search_position */
extern void T364f31(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].clashes_item */
extern T4 T364f12(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].hash_position */
extern T4 T364f19(T0* C, T4 a1);
/* INTEGER.hash_code */
extern T4 T4f23(T4* C);
/* INTEGER.infix "&" */
extern T4 T4f25(T4* C, T4 a1);
/* DS_HASH_SET [INTEGER].keys_item */
extern T4 T364f18(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].items_item */
extern T4 T364f27(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].key_equality_tester */
extern T0* T364f17(T0* C);
/* DS_HASH_SET [INTEGER].slots_item */
extern T4 T364f14(T0* C, T4 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T41f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* UC_UTF8_STRING.append_character */
extern void T157f51(T0* C, T1 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T157f62(T0* C, T1 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T157f68(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_byte */
extern void T157f66(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.old_put */
extern void T157f61(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T157f60(T0* C, T4 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T157f58(T0* C, T4 a1);
/* UC_UTF8_STRING.resize */
extern void T157f67(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T4 T157f34(T0* C);
/* UC_UTF8_STRING.capacity */
extern T4 T157f34p1(T0* C);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T4 T211f5(T0* C, T1 a1);
/* UC_UTF8_STRING.item */
extern T1 T157f10(T0* C, T4 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T1 T157f25(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_index */
extern T4 T157f24(T0* C, T4 a1);
/* STRING.item */
extern T1 T16f6(T0* C, T4 a1);
/* UC_UTF8_STRING.append_string */
extern void T157f50(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge299os3850;
extern T0* ge299ov3850;
extern T0* T157f35(T0* C);
/* UC_STRING.make_empty */
extern T0* T60c8(void);
/* UC_STRING.make */
extern void T60f9(T0* C, T4 a1);
/* UC_STRING.old_set_count */
extern void T60f12(T0* C, T4 a1);
/* UC_STRING.set_count */
extern void T60f11(T0* C, T4 a1);
/* UC_STRING.byte_capacity */
extern T4 T60f2(T0* C);
/* UC_STRING.capacity */
extern T4 T60f2p1(T0* C);
/* UC_STRING.make */
extern void T60f9p1(T0* C, T4 a1);
/* UC_STRING.make_area */
extern void T60f13(T0* C, T4 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T60f10(T0* C);
/* UC_UTF8_STRING.append_string */
extern void T157f50p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T157f59(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.additional_space */
extern T4 T157f37(T0* C);
/* ISE_RUNTIME.check_assert */
extern T2 T212s1(T2 a1);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T4 T211f1(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T4 T211f6(T0* C, T4 a1);
/* UC_UTF8_STRING.shifted_byte_index */
extern T4 T157f47(T0* C, T4 a1, T4 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge233os7270;
extern T0* ge233ov7270;
extern T0* T211f12(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern unsigned char ge152os1522;
extern T0* ge152ov1522;
extern T0* T211f9(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T61c2(void);
/* KL_ANY_ROUTINES.same_types */
extern T2 T61f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.any_ */
extern T0* T157f32(T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T157f9(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern void T157f54(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern T0* T157c54(T4 a1);
/* UC_UTF8_STRING.make */
extern void T157f54p1(T0* C, T4 a1);
/* UC_UTF8_STRING.make_area */
extern void T157f65(T0* C, T4 a1);
/* UC_UTF8_STRING.append_substring */
extern void T157f52(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T157f63(T0* C, T0* a1, T4 a2, T4 a3, T4 a4, T4 a5);
/* UC_UTF8_STRING.cloned_string */
extern T0* T157f36(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T157f38(T0* C);
/* UC_UTF8_STRING.copy */
extern void T157f72(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T157f72p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f4(T0* C);
/* ST_SPLITTER.string_ */
extern T0* T321f5(T0* C);
/* UC_UTF8_STRING.substring */
extern T0* T157f11(T0* C, T4 a1, T4 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T157c55(T0* a1, T4 a2, T4 a3);
/* STRING.substring */
extern T0* T16f5(T0* C, T4 a1, T4 a2);
/* STRING.set_count */
extern void T16f30(T0* C, T4 a1);
/* STRING.new_string */
extern T0* T16f10(T0* C, T4 a1);
/* UC_UTF8_STRING.item_code */
extern T4 T157f14(T0* C, T4 a1);
/* STRING.item_code */
extern T4 T16f22(T0* C, T4 a1);
/* DS_LINKED_LIST [STRING].make */
extern T0* T185c8(void);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge63os1312;
extern T0* ge63ov1312;
extern T0* T262f16(T0* C);
/* ST_SPLITTER.set_separators */
extern void T321f10(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER].put */
extern void T364f30(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].slots_put */
extern void T364f39(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [INTEGER].clashes_put */
extern void T364f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [INTEGER].items_put */
extern void T364f37(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [INTEGER].unset_found_item */
extern void T364f36(T0* C);
/* DS_HASH_SET [INTEGER].make */
extern T0* T364c29(T4 a1);
/* DS_HASH_SET [INTEGER].new_cursor */
extern T0* T364f10(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER].make */
extern T0* T381c3(T0* a1);
/* DS_HASH_SET [INTEGER].make_slots */
extern void T364f35(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T52f2(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T78c2(T4 a1);
/* DS_HASH_SET [INTEGER].special_integer_ */
extern T0* T364f23(T0* C);
/* DS_HASH_SET [INTEGER].new_modulus */
extern T4 T364f6(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].make_clashes */
extern void T364f34(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].make_keys */
extern void T364f33(T0* C, T4 a1);
/* DS_HASH_SET [INTEGER].make_items */
extern void T364f32(T0* C, T4 a1);
/* ST_SPLITTER.make */
extern T0* T321c9(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T262f29(T0* C, T4 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T35f2(T0* C, T4 a1);
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
/* GEANT_PRECURSOR_TASK.exceptions */
extern unsigned char ge208os1322;
extern T0* ge208ov1322;
extern T0* T262f20(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T35c1(void);
/* KL_STDERR_FILE.put_line */
extern void T34f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T34f11(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T34f10(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T34f14(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T34f17(T0* C, T14 a1, T14 a2, T4 a3);
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
extern T14 T56f2(T56* C);
/* KL_STRING_ROUTINES.as_string */
extern T0* T41f2(T0* C, T0* a1);
/* STRING.string */
extern T0* T16f16(T0* C);
/* STRING.append */
extern void T16f29(T0* C, T0* a1);
/* UC_UTF8_STRING.as_string */
extern T0* T157f4(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T157f16(T0* C);
/* KL_STRING_ROUTINES.any_ */
extern T0* T41f7(T0* C);
/* KL_STDERR_FILE.string_ */
extern T0* T34f1(T0* C);
/* ARRAY [STRING].item */
extern T0* T31f4(T0* C, T4 a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge192os2122;
extern T0* ge192ov2122;
extern T0* T33f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T34c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T34f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T34f16(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T34f4(T0* C, T4 a1);
/* KL_STDERR_FILE.old_make */
extern void T34f15(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.std */
extern unsigned char ge190os1324;
extern T0* ge190ov1324;
extern T0* T262f19(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T33c3(void);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge117os8048;
extern T0* ge117ov8048;
extern T0* T262f15(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T262f14(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T82f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T162f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T162c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T2 T82f4(T0* C);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T262f22(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T82c8(void);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge117os8047;
extern T0* ge117ov8047;
extern T0* T262f13(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T336f7(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T262f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T262f5(T0* C);
/* GEANT_PRECURSOR_TASK.target_arguments_stack */
extern T0* T262f21(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T2 T262f8(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge117os8046;
extern T0* ge117ov8046;
extern T0* T262f11(T0* C);
/* GEANT_PRECURSOR_TASK.task_make */
extern void T262f28(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T262f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T262f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T262f32(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T262f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T262f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T336c6(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T336f6p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T336f9(T0* C, T0* a1);
/* GEANT_TARGET.precursor_task_name */
extern unsigned char ge130os1997;
extern T0* ge130ov1997;
extern T0* T24f70(T0* C);
/* GEANT_EXIT_TASK.make */
extern T0* T261c22(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T4 T157f41(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T80f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T80f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T80f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T80f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T161f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T216f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2071os5461;
extern T0* ge2071ov5461;
extern T0* T80f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T161c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f3(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f10(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T6f3(T6* C);
/* ARRAY [NATURAL_64].put */
extern void T216f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T216c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T216f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T215c2(T4 a1);
/* STRING.has */
extern T2 T16f26(T0* C, T1 a1);
/* CHARACTER.is_digit */
extern T2 T1f5(T1* C);
/* NATURAL_8.infix ">" */
extern T2 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER.character_types */
extern T8 T1f7(T1* C, T4 a1);
/* CHARACTER.internal_character_types */
extern unsigned char ge37os35;
extern T0* ge37ov35;
extern T0* T1f9(T1* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T201c2(T4 a1);
/* INTEGER.to_natural_64 */
extern T11 T4f18(T4* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T80f21(T0* C, T4 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T157f43(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T80f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T80f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T80f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c42(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T80f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T80c15(void);
/* STRING.to_integer */
extern T4 T16f17(T0* C);
/* STRING.ctoi_convertor */
extern T0* T16f21(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T335f6(T0* C, T4 a1);
/* KL_STRING_ROUTINES.is_integer */
extern T2 T41f5(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f3(T1* C, T1 a1);
/* GEANT_EXIT_TASK.string_ */
extern T0* T261f13(T0* C);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T261f12(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T261f5(T0* C);
/* GEANT_EXIT_TASK.target_arguments_stack */
extern T0* T261f18(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T2 T261f8(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge103os8038;
extern T0* ge103ov8038;
extern T0* T261f11(T0* C);
/* GEANT_EXIT_TASK.task_make */
extern void T261f24(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T261f27(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T261f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T261f28(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T261f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T261f26(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T335c5(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T335f8(T0* C, T0* a1);
/* GEANT_TARGET.exit_task_name */
extern unsigned char ge130os1996;
extern T0* ge130ov1996;
extern T0* T24f69(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T260c26(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T334f24(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T309c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T310f50(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T350c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T351f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge138os8503;
extern T0* ge138ov8503;
extern T0* T350f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T351f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge138os8502;
extern T0* ge138ov8502;
extern T0* T350f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T351f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge138os8501;
extern T0* ge138ov8501;
extern T0* T350f6(T0* C);
/* GEANT_MAP.set_type */
extern void T351f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T350f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T350f11(T0* C);
/* GEANT_MAP_ELEMENT.target_arguments_stack */
extern T0* T350f10(T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T2 T350f4(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge138os8500;
extern T0* ge138ov8500;
extern T0* T350f3(T0* C);
/* GEANT_MAP.make */
extern T0* T351c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge137os8516;
extern T0* ge137ov8516;
extern T0* T351f5(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T350f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T350f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T350f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T350f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge132os8346;
extern T0* ge132ov8346;
extern T0* T309f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T310f49(T0* C, T0* a1);
/* DS_HASH_SET [STRING].force_last */
extern void T356f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING].slots_put */
extern void T356f46(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [STRING].clashes_put */
extern void T356f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [STRING].slots_item */
extern T4 T356f14(T0* C, T4 a1);
/* DS_HASH_SET [STRING].hash_position */
extern T4 T356f12(T0* C, T0* a1);
/* DS_HASH_SET [STRING].resize */
extern void T356f44(T0* C, T4 a1);
/* DS_HASH_SET [STRING].clashes_resize */
extern void T356f50(T0* C, T4 a1);
/* DS_HASH_SET [STRING].special_integer_ */
extern T0* T356f19(T0* C);
/* DS_HASH_SET [STRING].keys_resize */
extern void T356f49(T0* C, T4 a1);
/* DS_HASH_SET [STRING].items_resize */
extern void T356f48(T0* C, T4 a1);
/* DS_HASH_SET [STRING].keys_item */
extern T0* T356f24(T0* C, T4 a1);
/* DS_HASH_SET [STRING].items_item */
extern T0* T356f30(T0* C, T4 a1);
/* DS_HASH_SET [STRING].clashes_item */
extern T4 T356f25(T0* C, T4 a1);
/* DS_HASH_SET [STRING].slots_resize */
extern void T356f47(T0* C, T4 a1);
/* DS_HASH_SET [STRING].new_modulus */
extern T4 T356f4(T0* C, T4 a1);
/* DS_HASH_SET [STRING].new_capacity */
extern T4 T356f11(T0* C, T4 a1);
/* DS_HASH_SET [STRING].items_put */
extern void T356f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [STRING].search_position */
extern void T356f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING].key_equality_tester */
extern T0* T356f23(T0* C);
/* DS_HASH_SET [STRING].unset_found_item */
extern void T356f41(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge132os8345;
extern T0* ge132ov8345;
extern T0* T309f19(T0* C);
/* GEANT_FILESET.add_single_include */
extern void T310f48(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T2 T315f1(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern unsigned char ge136os1957;
extern T0* ge136ov1957;
extern T0* T315f11(T0* C);
/* BOOLEAN.out */
extern T0* T2f6(T2* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T2 T47f7(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T47f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T47f17(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T47f14(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T47f13(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T2 T47f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T77f1(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T59f1(T0* C, T0* a1);
/* STRING.make_from_c */
extern T0* T16c38(T14 a1);
/* STRING.from_c */
extern void T16f41(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T141f7(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T141f9(T0* C, T0* a1, T4 a2, T4 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T207f2(T0* C, T4 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T283f3(T283* C, T14 a1, T4 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T283f4(T283* C, T14 a1, T14 a2, T4 a3);
#include <string.h>
/* C_STRING.share_from_pointer */
extern void T141f6(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T141f8(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T207f9(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T207c8(T14 a1, T4 a2);
/* C_STRING.c_strlen */
extern T4 T141f3(T0* C, T14 a1);
/* STRING.c_string_provider */
extern unsigned char ge6os1165;
extern T0* ge6ov1165;
extern T0* T16f25(T0* C);
/* C_STRING.make_empty */
extern void T141f5(T0* C, T4 a1);
/* C_STRING.make_empty */
extern T0* T141c5(T4 a1);
/* MANAGED_POINTER.make */
extern T0* T207c7(T4 a1);
/* EXCEPTIONS.raise */
extern void T284f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T284f4(T0* C, T14 a1, T4 a2);
/* EXCEPTIONS.default_create */
extern T0* T284c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T207f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T4 a1, T4 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T4 a1, T4 a2);
#include <stdlib.h>
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T59f3(T0* C, T14 a1);
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
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T77f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge264os5333;
extern T0* ge264ov5333;
extern T0* T77f2(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T59c6(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge209os1321;
extern T0* ge209ov1321;
extern T0* T47f5(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T77c7(void);
/* GEANT_PROJECT_VARIABLES.found */
extern T2 T23f42(T0* C);
/* GEANT_PROJECT_VARIABLES.search */
extern void T23f75(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T23f60(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T4 T23f20(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T4 T23f15(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.keys_item */
extern T0* T23f26(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T4 T23f21(T0* C, T4 a1);
/* GEANT_VARIABLES.found */
extern T2 T27f34(T0* C);
/* GEANT_VARIABLES.search */
extern void T27f65(T0* C, T0* a1);
/* GEANT_VARIABLES.search_position */
extern void T27f49(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T4 T27f11(T0* C, T4 a1);
/* GEANT_VARIABLES.hash_position */
extern T4 T27f6(T0* C, T0* a1);
/* GEANT_VARIABLES.keys_item */
extern T0* T27f17(T0* C, T4 a1);
/* GEANT_VARIABLES.slots_item */
extern T4 T27f12(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge63os1307;
extern T0* ge63ov1307;
extern T0* T47f3(T0* C);
/* GEANT_VARIABLES.make */
extern T0* T27c43(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T27f47(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T48c3(void);
/* GEANT_VARIABLES.make_map */
extern void T27f46(T0* C, T4 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T27f55(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_VARIABLES.make_sparse_container */
extern void T27f60(T0* C, T4 a1);
/* GEANT_VARIABLES.new_cursor */
extern T0* T27f29(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T51c7(T0* a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T27f48(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T27f64(T0* C, T4 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T27f25(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T4 T27f19(T0* C, T4 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T27f63(T0* C, T4 a1);
/* GEANT_VARIABLES.make_keys */
extern void T27f62(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T53f2(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T79c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T53c3(void);
/* GEANT_VARIABLES.make_items */
extern void T27f61(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T149f11(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_tokens */
extern T0* T47f9(T0* C, T0* a1, T1 a2);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T149f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T149f19(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T4 T149f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T2 T149f8(T0* C, T4 a1);
/* UC_UTF8_STRING.index_of */
extern T4 T157f42(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T4 T157f44(T0* C, T4 a1, T4 a2);
/* STRING.index_of */
extern T4 T16f7(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.keep_head */
extern void T157f71(T0* C, T4 a1);
/* STRING.keep_head */
extern void T16f44(T0* C, T4 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T157f70(T0* C, T4 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T157f74(T0* C, T4 a1, T4 a2);
/* STRING.keep_tail */
extern void T16f43(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T149c12(T4 a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T149f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T210c4(T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T41f1(T0* C, T0* a1);
/* STRING.twin */
extern T0* T16f15(T0* C);
/* STRING.copy */
extern void T16f36(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern unsigned char ge136os1956;
extern T0* ge136ov1956;
extern T0* T315f8(T0* C);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T309f18(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T309f26(T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge132os8344;
extern T0* ge132ov8344;
extern T0* T309f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T310f34(T0* C, T2 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge132os8342;
extern T0* ge132ov8342;
extern T0* T309f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T310f47(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T310f46(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T310f45(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge132os8340;
extern T0* ge132ov8340;
extern T0* T309f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T310f44(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge132os8339;
extern T0* ge132ov8339;
extern T0* T309f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T310f43(T0* C, T2 a1);
/* GEANT_FILESET.set_force */
extern void T310f42(T0* C, T2 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T2 T309f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T309f22(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern unsigned char ge129os1970;
extern T0* ge129ov1970;
extern T0* T309f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern unsigned char ge129os1969;
extern T0* ge129ov1969;
extern T0* T309f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge132os8337;
extern T0* ge132ov8337;
extern T0* T309f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T310f41(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T2 T359f1(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T359c14(T0* a1, T2 a2);
/* LX_FULL_DFA.make */
extern T0* T379c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T379f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T379f46(T0* C);
/* ARRAY [INTEGER].put */
extern void T155f8(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T401f11(T0* C);
/* ARRAY [INTEGER].make */
extern T0* T155c5(T4 a1, T4 a2);
/* ARRAY [INTEGER].make_area */
extern void T155f6(T0* C, T4 a1);
/* LX_FULL_DFA.build_nxt_table */
extern void T379f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T432f3(T0* C, T4 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T475f4(T0* C, T4 a1);
/* LX_DFA_STATE.is_accepting */
extern T2 T427f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T2 T401f10(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T379f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T432f8(T0* C, T0* a1, T4 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T475f7(T0* C, T0* a1, T4 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T4 T430f4(T0* C, T4 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].item */
extern T0* T459f4(T0* C, T4 a1);
/* LX_FULL_DFA.new_state */
extern T0* T379f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T427f17(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T429f9(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T2 T427f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T2 T428f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T428f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T427f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T427f9(T0* C, T4 a1);
/* LX_DFA_STATE.make */
extern T0* T427c16(T0* a1, T4 a2, T4 a3);
/* LX_RULE.set_useful */
extern void T412f22(T0* C, T2 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T401f16(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T465f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T465f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T465f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T401f21(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T2 T485f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T2 T412f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T401f2(T0* C, T4 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge302os10174;
extern T0* ge302ov10174;
extern T0* T427f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T465c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T485c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T428f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T463f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T463f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T463f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T428f26(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T2 T482f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T2 T435f8(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge302os10173;
extern T0* ge302ov10173;
extern T0* T427f6(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T463c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T482c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T428f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T2 T428f4(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T401f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T401f14(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T444f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_RULE].resized_area */
extern T0* T425f3(T0* C, T4 a1);
/* SPECIAL [LX_RULE].make */
extern T0* T425c4(T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T4 T401f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T2 T401f8(T0* C, T4 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T2 T435f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T2 T435f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T2 T435f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T2 T428f3(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T428f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T428f31(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T469f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_NFA_STATE].resized_area */
extern T0* T467f3(T0* C, T4 a1);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T467c4(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T4 T428f13(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T2 T428f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T401c12(T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T401f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T445c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T444f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T488c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T444c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T432c7(T4 a1, T4 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T476c1(void);
/* ARRAY [LX_DFA_STATE].make */
extern T0* T475c5(T4 a1, T4 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T475f6(T0* C, T4 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T472c4(T4 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T4 T427f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T4 T432f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T4 T427f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T4 T432f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T428f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T428f2(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T428c23(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T428f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T470c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T469f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T490c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T469c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T2 T430f3(T0* C, T4 a1);
/* ARRAY [BOOLEAN].item */
extern T2 T362f4(T0* C, T4 a1);
/* LX_DFA_STATE.partition */
extern void T427f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T430f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T362f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T115f6(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T430f10p1(T0* C);
/* DS_BILINKABLE [INTEGER].put_left */
extern void T457f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_right */
extern void T457f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].put */
extern void T457f5(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T4 T430f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T4 T430f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T379f49(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T429f10(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T473f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_DFA_STATE].resized_area */
extern T0* T472f3(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T4 T430f1(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER]].count */
extern T4 T459f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T429f2(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T430c9(T4 a1, T4 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T430f9p1(T0* C, T4 a1, T4 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].put */
extern void T459f7(T0* C, T0* a1, T4 a2);
/* DS_BILINKABLE [INTEGER].make */
extern T0* T457c4(T4 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].make */
extern T0* T459c6(T4 a1, T4 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].make_area */
extern void T459f8(T0* C, T4 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER]].make */
extern T0* T458c2(T4 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T362c5(T4 a1, T4 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T362f8(T0* C, T4 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T115c4(T4 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T379f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T401f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T401f17(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T401f20(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T445f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T401f19(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T401f18(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T412c14(T4 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge388os11785;
extern T0* ge388ov11785;
extern T0* T412f5(T0* C);
/* LX_ACTION.make */
extern T0* T461c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge388os11784;
extern T0* ge388ov11784;
extern T0* T412f3(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T410c12(T2 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T428f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T428f30(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T428f34(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T470f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T428f33(T0* C, T4 a1, T4 a2);
/* LX_NFA_STATE.set_transition */
extern void T435f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T454c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T435c10(T2 a1);
/* LX_FULL_DFA.initialize */
extern void T379f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T379f43(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T379f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T410f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T428f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T433f7(T0* C, T4 a1);
/* LX_START_CONDITIONS.item */
extern T0* T402f4(T0* C, T4 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T379f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T435f14(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].force */
extern void T434f35(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_put */
extern void T434f43(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_put */
extern void T434f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_put */
extern void T434f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_item */
extern T4 T434f17(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_item */
extern T4 T434f16(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].hash_position */
extern T4 T434f11(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].resize */
extern void T434f40(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_resize */
extern void T434f48(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].special_integer_ */
extern T0* T434f30(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_resize */
extern void T434f47(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_resize */
extern void T434f46(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T414f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_NFA].resized_area */
extern T0* T413f3(T0* C, T4 a1);
/* SPECIAL [LX_NFA].make */
extern T0* T413c4(T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_item */
extern T4 T434f20(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_resize */
extern void T434f45(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_modulus */
extern T4 T434f23(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_capacity */
extern T4 T434f10(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_put */
extern void T434f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].search_position */
extern void T434f36(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [INTEGER].test */
extern T2 T382f1(T0* C, T4 a1, T4 a2);
/* INTEGER.is_equal */
extern T2 T4f27(T4* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].unset_found_item */
extern void T434f38(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item */
extern T0* T434f2(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_item */
extern T0* T434f5(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].has */
extern T2 T434f1(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make */
extern T0* T434c34(T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_with_equality_testers */
extern void T434f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_sparse_container */
extern void T434f44(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_cursor */
extern T0* T434f29(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER].make */
extern T0* T479c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_slots */
extern void T434f52(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_clashes */
extern void T434f51(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_keys */
extern void T434f50(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_items */
extern void T434f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T414f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T462c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T414c3(void);
/* KL_EQUALITY_TESTER [INTEGER].default_create */
extern T0* T382c2(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T429c8(T4 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T429f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T474c2(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T473f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T491c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T473c3(void);
/* ARRAY [INTEGER].item */
extern T4 T155f4(T0* C, T4 a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T411f2(T0* C, T4 a1, T4 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T4 T411f5(T0* C);
/* INTEGER.min */
extern T4 T4f17(T4* C, T4 a1);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T4 T411f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T2 T411f1(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T379f42(T0* C, T0* a1, T4 a2, T4 a3);
/* ARRAY [LX_RULE].put */
extern void T426f5(T0* C, T0* a1, T4 a2);
/* ARRAY [LX_RULE].make */
extern T0* T426c4(T4 a1, T4 a2);
/* ARRAY [LX_RULE].make_area */
extern void T426f6(T0* C, T4 a1);
/* ARRAY [STRING].count */
extern T4 T31f11(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T379f41(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T402f2(T0* C);
/* ARRAY [STRING].put */
extern void T31f13(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T31c12(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T31f14(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.parse_string */
extern void T377f220(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T377f224(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T377f238(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T377f251(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T377f264(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T377f267(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T413f6(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T30f7(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T408f6(T0* C);
/* SPECIAL [INTEGER].clear_all */
extern void T50f10(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T101f6(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T377f237(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T377f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T102f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T101f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T101c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T102f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T179c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T102c3(void);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T377f235(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T377f170(T0* C, T4 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T377f216(T0* C, T4 a1);
/* LX_NFA.make_symbol */
extern T0* T410c13(T4 a1, T2 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T456c4(T4 a1, T0* a2);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T411f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].forget_right */
extern void T457f7(T0* C);
/* DS_BILINKABLE [INTEGER].forget_left */
extern void T457f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T362f6(T0* C, T2 a1, T4 a2);
/* DS_BILINKABLE [INTEGER].put_right */
extern void T457f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_left */
extern void T457f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T4 T407f14(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.put */
extern void T407f19(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T407f21(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T407f22(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T4 T407f13(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T2 T407f11(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.last */
extern T4 T407f8(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T2 T407f7(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T2 T407f6(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T2 T407f15(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T407c18(T4 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T407f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
extern T0* T450c2(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item */
extern T0* T406f2(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_item */
extern T0* T406f6(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].search_position */
extern void T406f42(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_item */
extern T4 T406f17(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].hash_position */
extern T4 T406f12(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T2 T405f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_item */
extern T0* T406f21(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_item */
extern T4 T406f18(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].has */
extern T2 T406f1(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T377f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T377f168(T0* C, T4 a1, T4 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T377f268(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T26f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T26f11(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T384f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T384f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T384f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T26f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T438c7(T0* a1, T4 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T377f189(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T409f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
extern T0* T408f2(T0* C, T4 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T408c4(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T409f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T451c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T409c3(void);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T377f167(T0* C, T4 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T377f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T407f20(T0* C, T2 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].force */
extern void T406f41(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_put */
extern void T406f49(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_put */
extern void T406f48(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_put */
extern void T406f47(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].resize */
extern void T406f46(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_resize */
extern void T406f54(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].special_integer_ */
extern T0* T406f30(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_resize */
extern void T406f53(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_resize */
extern void T406f52(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_resize */
extern void T406f51(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_modulus */
extern T4 T406f24(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_capacity */
extern T4 T406f11(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_put */
extern void T406f45(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].unset_found_item */
extern void T406f44(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T377f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T407f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T407f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort */
extern void T492f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort_with_comparator */
extern void T492f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER].subsort_with_comparator */
extern void T492f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T407f25(T0* C, T4 a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER].less_than */
extern T2 T494f1(T0* C, T4 a1, T4 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge307os11523;
extern T0* ge307ov11523;
extern T0* T407f17(T0* C);
/* DS_SHELL_SORTER [INTEGER].make */
extern T0* T492c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER].make */
extern T0* T494c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T377f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T410c6(T0* a1, T2 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T452c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T377f162(T0* C);
/* LX_NFA.build_optional */
extern void T410f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T435f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T410f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T410f10(T0* C);
/* LX_NFA.build_closure */
extern void T410f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T377f159(T0* C, T4 a1);
/* LX_NFA.build_concatenation */
extern void T410f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T428f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T428f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T470f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T428f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T428f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T470f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T428f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T470f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T428f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T2 T470f3(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T2 T428f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T470f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T428f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T2 T470f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T2 T428f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T2 T428f20(T0* C, T0* a1);
/* LX_NFA.build_union */
extern void T410f7(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T377f250(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T417c7(T0* a1, T4 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T377f249(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T402f11(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T431f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T433f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T433f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T4 T433f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T2 T433f8(T0* C, T4 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T402f13(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T2 T402f1(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T378f34(T0* C, T2 a1);
/* LX_RULE.set_column_count */
extern void T412f21(T0* C, T4 a1);
/* LX_RULE.set_line_count */
extern void T412f20(T0* C, T4 a1);
/* LX_RULE.set_trail_count */
extern void T412f19(T0* C, T4 a1);
/* LX_RULE.set_head_count */
extern void T412f18(T0* C, T4 a1);
/* LX_RULE.set_trail_context */
extern void T412f17(T0* C, T2 a1);
/* LX_RULE.set_line_nb */
extern void T412f16(T0* C, T4 a1);
/* LX_RULE.set_pattern */
extern void T412f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T410f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T435f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T378f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T411c9(T4 a1, T4 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T411f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T377f248(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T377f263(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T423c7(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T377f262(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T422c7(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T377f261(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T421c7(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T377f247(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].forth */
extern void T416f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_forth */
extern void T406f60(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].add_traversing_cursor */
extern void T406f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_next_cursor */
extern void T416f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].remove_traversing_cursor */
extern void T406f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_position */
extern void T416f9(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T407f23(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T4 T411f8(T0* C, T4 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T2 T411f7(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].item */
extern T0* T416f2(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_item */
extern T0* T406f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].after */
extern T2 T416f1(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_after */
extern T2 T406f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].start */
extern void T416f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_start */
extern void T406f59(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_off */
extern T2 T406f38(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].is_empty */
extern T2 T406f37(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_cursor */
extern T0* T406f3(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].make */
extern T0* T416c6(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T411f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T377f234(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T377f233(T0* C);
/* LX_WILDCARD_PARSER.abort */
extern void T377f232(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T377f231(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T377f246(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T415c7(T0* a1, T4 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T377f245(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T377f230(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T377f244(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T377f260(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T420c7(T0* a1, T4 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T377f259(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T419c7(T0* a1, T4 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T4 T377f184(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T377f258(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T4 T377f205(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T377f257(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T418c7(T0* a1, T4 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T377f256(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T377f266(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T424c7(T0* a1, T4 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T1 T377f181(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.less */
extern void T377f255(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T377f265(T0* C);
/* LX_WILDCARD_PARSER.text */
extern T0* T377f175(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T279f3(T0* C, T4 a1, T4 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T377f254(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T377f243(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T377f253(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T2 T377f129(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T377f242(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T377f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T4 T279f1(T0* C);
/* YY_BUFFER.fill */
extern void T167f15(T0* C);
/* YY_BUFFER.set_index */
extern void T167f13(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T4 T377f128(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T4 T377f127(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T377f241(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T34f18(T0* C, T1 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T34f19(T0* C, T1 a1);
/* KL_STDERR_FILE.console_pc */
extern void T34f20(T0* C, T14 a1, T1 a2);
/* LX_WILDCARD_PARSER.std */
extern T0* T377f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T1 T279f2(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T377f25(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T377f229(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T377f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T377f228(T0* C);
/* YY_BUFFER.set_position */
extern void T167f14(T0* C, T4 a1, T4 a2, T4 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T377f14(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T167c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T167f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T279f10(T0* C, T1 a1, T4 a2);
/* STRING.put */
extern void T16f46(T0* C, T1 a1, T4 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T279f9(T0* C, T0* a1, T4 a2);
/* STRING.subcopy */
extern void T16f48(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T167f9(T0* C, T4 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T279c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge282os2148;
extern T2 ge282ov2148;
extern T2 T39f6(T0* C);
/* PLATFORM.default_create */
extern T0* T370c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge210os1329;
extern T0* ge210ov1329;
extern T0* T279f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T39c7(void);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T377c219(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER].make */
extern T0* T404c4(T4 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T403c1(void);
/* LX_START_CONDITIONS.make */
extern void T402f10(T0* C, T4 a1);
/* LX_START_CONDITIONS.make */
extern T0* T402c10(T4 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T402f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T448c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T447f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T489c2(T4 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T446c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T447c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T377f222(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T377f227(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge366os9677;
extern T0* ge366ov9677;
extern T0* T377f81(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T377f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T52f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge366os9676;
extern T0* ge366ov9676;
extern T0* T377f80(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge366os9675;
extern T0* ge366ov9675;
extern T0* T377f79(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge366os9674;
extern T0* ge366ov9674;
extern T0* T377f78(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge366os9673;
extern T0* ge366ov9673;
extern T0* T377f77(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge366os9672;
extern T0* ge366ov9672;
extern T0* T377f76(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge366os9671;
extern T0* ge366ov9671;
extern T0* T377f75(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge366os9670;
extern T0* ge366ov9670;
extern T0* T377f73(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge366os9669;
extern T0* ge366ov9669;
extern T0* T377f71(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge366os9668;
extern T0* ge366ov9668;
extern T0* T377f70(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T377f226(T0* C);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T377f221(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].set_key_equality_tester */
extern void T406f40(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_map */
extern T0* T406c39(T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_with_equality_testers */
extern void T406f43(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_sparse_container */
extern void T406f50(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_slots */
extern void T406f58(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_clashes */
extern void T406f57(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_keys */
extern void T406f56(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_items */
extern void T406f55(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].set_key_equality_tester */
extern void T58f42(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge161os9834;
extern T0* ge161ov9834;
extern T0* T377f20(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T405c2(void);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern void T58f44(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern T0* T58c44(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T58f45(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T58f46(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T58f12(T0* C);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T58f51(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T58f50(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern T0* T58f18(T0* C);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T4 T58f6(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T58f49(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_keys */
extern void T58f48(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_items */
extern void T58f47(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T377f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T377f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T377f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge367os9846;
extern T0* ge367ov9846;
extern T0* T377f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T377f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge367os9845;
extern T0* ge367ov9845;
extern T0* T377f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge367os9844;
extern T0* ge367ov9844;
extern T0* T377f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge367os9843;
extern T0* ge367ov9843;
extern T0* T377f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge367os9842;
extern T0* ge367ov9842;
extern T0* T377f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge367os9841;
extern T0* ge367ov9841;
extern T0* T377f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge367os9840;
extern T0* ge367ov9840;
extern T0* T377f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge383os5750;
extern T0* ge383ov5750;
extern T0* T377f16(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T378f32(T0* C, T2 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T378f31(T0* C, T2 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T378f30(T0* C, T2 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T378f29(T0* C, T2 a1);
/* LX_DESCRIPTION.make */
extern T0* T378c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T402c12(T4 a1);
/* LX_START_CONDITIONS.put_first */
extern void T402f14(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T402f15(T0* C, T0* a1, T4 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T402f18(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T448f5(T0* C, T4 a1);
/* LX_START_CONDITIONS.move_right */
extern void T402f17(T0* C, T4 a1, T4 a2);
/* LX_START_CONDITIONS.put_last */
extern void T402f16(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T431c6(T0* a1, T4 a2, T2 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T433c10(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T433f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T477c2(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T26c12(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge191os2093;
extern T0* ge191ov2093;
extern T0* T26f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T384c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T359f15(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge132os8336;
extern T0* ge132ov8336;
extern T0* T309f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T310f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge132os8335;
extern T0* ge132ov8335;
extern T0* T309f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T310f39(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T310f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T309f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T309f25(T0* C);
/* GEANT_FILESET_ELEMENT.target_arguments_stack */
extern T0* T309f24(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern unsigned char ge136os1955;
extern T0* ge136ov1955;
extern T0* T309f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T310c33(T0* a1);
/* DS_HASH_SET [STRING].set_equality_tester */
extern void T356f35(T0* C, T0* a1);
/* DS_HASH_SET [STRING].make */
extern T0* T356c34(T4 a1);
/* DS_HASH_SET [STRING].new_cursor */
extern T0* T356f1(T0* C);
/* DS_HASH_SET_CURSOR [STRING].make */
extern T0* T358c6(T0* a1);
/* DS_HASH_SET [STRING].make_slots */
extern void T356f40(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_clashes */
extern void T356f39(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_keys */
extern void T356f38(T0* C, T4 a1);
/* DS_HASH_SET [STRING].make_items */
extern void T356f37(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T354c38(T4 a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T375c2(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T354f43(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T354f24(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T373c4(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T354f46(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T354f56(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T354f37(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T4 T354f22(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T354f55(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_keys */
extern void T354f54(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_items */
extern void T354f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T376f1(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_FILESET_ENTRY].make_area */
extern T0* T400c2(T4 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make */
extern T0* T374c4(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T376c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T309f30(T0* C, T4 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T309f23(T0* C);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge132os8343;
extern T0* ge132ov8343;
extern T0* T309f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge132os8341;
extern T0* ge132ov8341;
extern T0* T309f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge132os8334;
extern T0* ge132ov8334;
extern T0* T309f4(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T2 T309f3(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge132os8338;
extern T0* ge132ov8338;
extern T0* T309f2(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T309f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T309f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T309f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T309f33(T0* C, T0* a1);
/* XM_ELEMENT.element_by_name */
extern T0* T75f4(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T153f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T74f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T153f15(T0* C);
/* XM_DOCUMENT.cursor_off */
extern T2 T74f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T75f39(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T2 T75f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T2 T75f8(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T2 T75f11(T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T2 T268f1(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T268f3(T0* C);
/* XM_ELEMENT.has_namespace */
extern T2 T75f13(T0* C);
/* XM_ELEMENT.same_string */
extern T2 T75f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge223os1673;
extern T0* ge223ov1673;
extern T0* T75f12(T0* C);
/* XM_NODE_TYPER.is_element */
extern T2 T272f2(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T272c11(void);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge116os8017;
extern T0* ge116ov8017;
extern T0* T260f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T334f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge116os8014;
extern T0* ge116ov8014;
extern T0* T260f16(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge116os8016;
extern T0* ge116ov8016;
extern T0* T260f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T334f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge116os8015;
extern T0* ge116ov8015;
extern T0* T260f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T334f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T334f20(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge116os8013;
extern T0* ge116ov8013;
extern T0* T260f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T334f19(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T260f12(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T260f5(T0* C);
/* GEANT_OUTOFDATE_TASK.target_arguments_stack */
extern T0* T260f22(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T2 T260f8(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge116os8012;
extern T0* ge116ov8012;
extern T0* T260f11(T0* C);
/* GEANT_OUTOFDATE_TASK.task_make */
extern void T260f28(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T260f31(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T260f33(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T260f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T260f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T260f30(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T334c18(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T334f26(T0* C, T0* a1);
/* GEANT_TARGET.outofdate_task_name */
extern unsigned char ge130os1995;
extern T0* ge130ov1995;
extern T0* T24f68(T0* C);
/* GEANT_XSLT_TASK.make */
extern T0* T259c39(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T331f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge124os7972;
extern T0* ge124ov7972;
extern T0* T259f28(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T331f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge124os7971;
extern T0* ge124ov7971;
extern T0* T259f27(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T331f34(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge124os7969;
extern T0* ge124ov7969;
extern T0* T259f26(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].force_last */
extern void T333f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].resize */
extern void T333f12(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].resize */
extern T0* T367f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_PAIR [STRING, STRING]].resized_area */
extern T0* T366f3(T0* C, T4 a1);
/* SPECIAL [DS_PAIR [STRING, STRING]].make */
extern T0* T366c4(T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_capacity */
extern T4 T333f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].extendible */
extern T2 T333f8(T0* C, T4 a1);
/* DS_PAIR [STRING, STRING].make */
extern T0* T332c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T2 T315f3(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T259f25(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge124os7973;
extern T0* ge124ov7973;
extern T0* T259f24(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T331f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge124os7970;
extern T0* ge124ov7970;
extern T0* T259f23(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T331f32(T0* C, T2 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T2 T259f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T259f31(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T259f35(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T259f34(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge124os7963;
extern T0* ge124ov7963;
extern T0* T259f21(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T331f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge124os7962;
extern T0* ge124ov7962;
extern T0* T259f20(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T331f30(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge124os7961;
extern T0* ge124ov7961;
extern T0* T259f19(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T331f29(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge124os7960;
extern T0* ge124ov7960;
extern T0* T259f18(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T331f28(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T331f39(T0* C, T4 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge124os7968;
extern T0* ge124ov7968;
extern T0* T259f17(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T331f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge124os7967;
extern T0* ge124ov7967;
extern T0* T259f16(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T331f26(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge124os7966;
extern T0* ge124ov7966;
extern T0* T259f15(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T331f25(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge124os7965;
extern T0* ge124ov7965;
extern T0* T259f14(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T259f13(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T259f12(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T259f5(T0* C);
/* GEANT_XSLT_TASK.target_arguments_stack */
extern T0* T259f33(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T2 T259f8(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge124os7964;
extern T0* ge124ov7964;
extern T0* T259f11(T0* C);
/* GEANT_XSLT_TASK.task_make */
extern void T259f41(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T259f44(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T259f46(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T259f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T259f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T259f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T331c24(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].make */
extern T0* T333c10(T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_cursor */
extern T0* T333f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]].make */
extern T0* T368c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].make */
extern T0* T367f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_PAIR [STRING, STRING]].make_area */
extern T0* T383c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].default_create */
extern T0* T367c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T331f24p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T331f38(T0* C, T0* a1);
/* GEANT_TARGET.xslt_task_name */
extern unsigned char ge130os1994;
extern T0* ge130ov1994;
extern T0* T24f67(T0* C);
/* GEANT_SETENV_TASK.make */
extern T0* T258c22(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T330f9(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge118os7950;
extern T0* ge118ov7950;
extern T0* T258f13(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T330f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T258f12(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T258f5(T0* C);
/* GEANT_SETENV_TASK.target_arguments_stack */
extern T0* T258f18(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T2 T258f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge118os7949;
extern T0* ge118ov7949;
extern T0* T258f11(T0* C);
/* GEANT_SETENV_TASK.task_make */
extern void T258f24(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T258f27(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T258f29(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T258f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T258f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T258f26(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T330c7(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T330f11(T0* C, T0* a1);
/* GEANT_TARGET.setenv_task_name */
extern unsigned char ge130os1993;
extern T0* ge130ov1993;
extern T0* T24f66(T0* C);
/* GEANT_MOVE_TASK.make */
extern T0* T257c24(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T329f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge115os7931;
extern T0* ge115ov7931;
extern T0* T257f15(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T329f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge115os7930;
extern T0* ge115ov7930;
extern T0* T257f14(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T329f17(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge115os7929;
extern T0* ge115ov7929;
extern T0* T257f13(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T329f16(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T257f12(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T257f5(T0* C);
/* GEANT_MOVE_TASK.target_arguments_stack */
extern T0* T257f20(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T2 T257f8(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge115os7928;
extern T0* ge115ov7928;
extern T0* T257f11(T0* C);
/* GEANT_MOVE_TASK.task_make */
extern void T257f26(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T257f29(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T257f31(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T257f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T257f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T257f28(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T329c15(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T329f21(T0* C, T0* a1);
/* GEANT_TARGET.move_task_name */
extern unsigned char ge130os1992;
extern T0* ge130ov1992;
extern T0* T24f65(T0* C);
/* GEANT_COPY_TASK.make */
extern T0* T256c29(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T328f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge99os7908;
extern T0* ge99ov7908;
extern T0* T256f17(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T328f22(T0* C, T2 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T2 T256f16(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T256f20(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T256f25(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T256f24(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T256f23(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge99os7907;
extern T0* ge99ov7907;
extern T0* T256f15(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T328f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge99os7906;
extern T0* ge99ov7906;
extern T0* T256f14(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T328f20(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge99os7905;
extern T0* ge99ov7905;
extern T0* T256f13(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T328f19(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T256f12(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T256f5(T0* C);
/* GEANT_COPY_TASK.target_arguments_stack */
extern T0* T256f22(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T2 T256f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge99os7904;
extern T0* ge99ov7904;
extern T0* T256f11(T0* C);
/* GEANT_COPY_TASK.task_make */
extern void T256f31(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T256f34(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T256f36(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T256f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T256f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T256f33(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T328c18(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T328f25(T0* C, T0* a1);
/* GEANT_TARGET.copy_task_name */
extern unsigned char ge130os1991;
extern T0* ge130ov1991;
extern T0* T24f64(T0* C);
/* GEANT_DELETE_TASK.make */
extern T0* T255c24(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T325f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T326c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T327f30(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge128os8434;
extern T0* ge128ov8434;
extern T0* T326f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T327f29(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T326f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T326f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge128os8433;
extern T0* ge128ov8433;
extern T0* T326f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T327f28(T0* C, T2 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T2 T326f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T326f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T326f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T326f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge128os8432;
extern T0* ge128ov8432;
extern T0* T326f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T327f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge128os8431;
extern T0* ge128ov8431;
extern T0* T326f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T327f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge128os8430;
extern T0* ge128ov8430;
extern T0* T326f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T327f25(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T326f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T326f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.target_arguments_stack */
extern T0* T326f14(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T2 T326f4(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge128os8429;
extern T0* ge128ov8429;
extern T0* T326f3(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T327c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T327f31(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T326f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T326f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T326f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T326f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge100os7886;
extern T0* ge100ov7886;
extern T0* T255f15(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T325f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge100os7885;
extern T0* ge100ov7885;
extern T0* T255f14(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T325f19(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge100os7884;
extern T0* ge100ov7884;
extern T0* T255f13(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T325f18(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T255f12(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T255f5(T0* C);
/* GEANT_DELETE_TASK.target_arguments_stack */
extern T0* T255f20(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T2 T255f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge100os7883;
extern T0* ge100ov7883;
extern T0* T255f11(T0* C);
/* GEANT_DELETE_TASK.task_make */
extern void T255f26(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T255f29(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T255f31(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T255f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T255f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T255f28(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T325c17(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T325f23(T0* C, T0* a1);
/* GEANT_TARGET.delete_task_name */
extern unsigned char ge130os1990;
extern T0* ge130ov1990;
extern T0* T24f63(T0* C);
/* GEANT_MKDIR_TASK.make */
extern T0* T254c21(T0* a1, T0* a2);
/* GEANT_MKDIR_COMMAND.set_directory */
extern void T324f10(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.attribute_value */
extern T0* T254f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T254f5(T0* C);
/* GEANT_MKDIR_TASK.target_arguments_stack */
extern T0* T254f17(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T2 T254f8(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.directory_attribute_name */
extern unsigned char ge114os7875;
extern T0* ge114ov7875;
extern T0* T254f11(T0* C);
/* GEANT_MKDIR_TASK.task_make */
extern void T254f23(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T254f26(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T254f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T254f27(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T254f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T254f25(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T324c9(T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T324f12(T0* C, T0* a1);
/* GEANT_TARGET.mkdir_task_name */
extern unsigned char ge130os1989;
extern T0* ge130ov1989;
extern T0* T24f62(T0* C);
/* GEANT_ECHO_TASK.make */
extern T0* T253c27(T0* a1, T0* a2);
/* GEANT_ECHO_COMMAND.set_append */
extern void T323f10(T0* C, T2 a1);
/* GEANT_ECHO_TASK.boolean_value */
extern T2 T253f15(T0* C, T0* a1);
/* GEANT_ECHO_TASK.std */
extern T0* T253f18(T0* C);
/* GEANT_ECHO_TASK.false_attribute_value */
extern T0* T253f23(T0* C);
/* GEANT_ECHO_TASK.true_attribute_value */
extern T0* T253f22(T0* C);
/* GEANT_ECHO_TASK.string_ */
extern T0* T253f21(T0* C);
/* GEANT_ECHO_TASK.append_attribute_name */
extern unsigned char ge101os7863;
extern T0* ge101ov7863;
extern T0* T253f14(T0* C);
/* GEANT_ECHO_COMMAND.set_to_file */
extern void T323f9(T0* C, T0* a1);
/* GEANT_ECHO_TASK.to_file_attribute_name */
extern unsigned char ge101os7862;
extern T0* ge101ov7862;
extern T0* T253f13(T0* C);
/* GEANT_ECHO_COMMAND.set_message */
extern void T323f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.attribute_value */
extern T0* T253f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T253f5(T0* C);
/* GEANT_ECHO_TASK.target_arguments_stack */
extern T0* T253f20(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T253f30(T0* C, T4 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T253f19(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T2 T253f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.message_attribute_name */
extern unsigned char ge101os7861;
extern T0* ge101ov7861;
extern T0* T253f11(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T2 T157f46(T0* C);
/* STRING.is_empty */
extern T2 T16f27(T0* C);
/* XM_ELEMENT.text */
extern T0* T75f26(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T41f6(T0* C, T0* a1, T0* a2);
/* STRING.append_string */
extern void T16f35(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T41f9(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T157f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T157f7(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T75f27(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T2 T272f10(T0* C);
/* GEANT_ECHO_TASK.task_make */
extern void T253f29(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T253f32(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T253f34(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T253f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T253f35(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T253f31(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T323c7(T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T323f12(T0* C, T0* a1);
/* GEANT_TARGET.echo_task_name */
extern unsigned char ge130os1988;
extern T0* ge130ov1988;
extern T0* T24f61(T0* C);
/* GEANT_GEXMLSPLIT_TASK.make */
extern T0* T252c21(T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_COMMAND.set_input_filename */
extern void T322f11(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.attribute_value */
extern T0* T252f12(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.project_variables_resolver */
extern T0* T252f5(T0* C);
/* GEANT_GEXMLSPLIT_TASK.target_arguments_stack */
extern T0* T252f17(T0* C);
/* GEANT_GEXMLSPLIT_TASK.has_attribute */
extern T2 T252f8(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.input_filename_attribute_name */
extern unsigned char ge110os7852;
extern T0* ge110ov7852;
extern T0* T252f11(T0* C);
/* GEANT_GEXMLSPLIT_TASK.task_make */
extern void T252f23(T0* C, T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.interpreting_element_make */
extern void T252f26(T0* C, T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.set_project */
extern void T252f28(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.element_make */
extern void T252f27(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.set_xml_element */
extern void T252f29(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.set_command */
extern void T252f25(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.make */
extern T0* T322c10(T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.make */
extern void T322f10p1(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.set_project */
extern void T322f13(T0* C, T0* a1);
/* GEANT_TARGET.gexmlsplit_task_name */
extern unsigned char ge130os1987;
extern T0* ge130ov1987;
extern T0* T24f60(T0* C);
/* GEANT_GEANT_TASK.make */
extern T0* T251c33(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T251f21(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T251f36(T0* C, T4 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T251f25(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T251f24(T0* C);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge104os7825;
extern T0* ge104ov7825;
extern T0* T251f20(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T251f19(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T251f27(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge104os7824;
extern T0* ge104ov7824;
extern T0* T251f18(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge104os7822;
extern T0* ge104ov7822;
extern T0* T251f17(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T320f28(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge104os7823;
extern T0* ge104ov7823;
extern T0* T251f16(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T320f27(T0* C, T2 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T320f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge104os7819;
extern T0* ge104ov7819;
extern T0* T251f15(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T320f25(T0* C, T2 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T2 T251f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T251f29(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T251f28(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge104os7821;
extern T0* ge104ov7821;
extern T0* T251f13(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T320f24(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T251f12(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T251f5(T0* C);
/* GEANT_GEANT_TASK.target_arguments_stack */
extern T0* T251f26(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T2 T251f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge104os7820;
extern T0* ge104ov7820;
extern T0* T251f11(T0* C);
/* GEANT_GEANT_TASK.task_make */
extern void T251f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T251f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T251f40(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T251f39(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T251f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T251f37(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T320c23(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T320f23p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T320f30(T0* C, T0* a1);
/* GEANT_TARGET.geant_task_name */
extern unsigned char ge130os1986;
extern T0* ge130ov1986;
extern T0* T24f59(T0* C);
/* GEANT_GETEST_TASK.make */
extern T0* T250c37(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force */
extern void T58f68(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].keys_put */
extern void T58f60(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T58f58(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T58f57(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T4 T58f35(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T4 T58f33(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T4 T58f34(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T58f56(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T58f66(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_resize */
extern void T58f65(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_resize */
extern void T58f64(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_item */
extern T0* T58f29(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T58f63(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T4 T58f31(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_put */
extern void T58f59(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T58f55(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge108os7790;
extern T0* ge108ov7790;
extern T0* T250f27(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T250f26(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T250f25(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T250f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge108os7789;
extern T0* ge108ov7789;
extern T0* T250f23(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T319f30(T0* C, T2 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge108os7788;
extern T0* ge108ov7788;
extern T0* T250f22(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T319f29(T0* C, T2 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge108os7787;
extern T0* ge108ov7787;
extern T0* T250f21(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T319f28(T0* C, T2 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge108os7786;
extern T0* ge108ov7786;
extern T0* T250f20(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T319f27(T0* C, T2 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge108os7785;
extern T0* ge108ov7785;
extern T0* T250f19(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T319f26(T0* C, T2 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge108os7784;
extern T0* ge108ov7784;
extern T0* T250f18(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T319f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge108os7783;
extern T0* ge108ov7783;
extern T0* T250f17(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T319f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge108os7782;
extern T0* ge108ov7782;
extern T0* T250f16(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T319f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge108os7781;
extern T0* ge108ov7781;
extern T0* T250f15(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T319f22(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T250f14(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T250f5(T0* C);
/* GEANT_GETEST_TASK.target_arguments_stack */
extern T0* T250f33(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge108os7780;
extern T0* ge108ov7780;
extern T0* T250f13(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T319f21(T0* C, T2 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T2 T250f12(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T250f30(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T250f32(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T2 T250f8(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge108os7779;
extern T0* ge108ov7779;
extern T0* T250f11(T0* C);
/* GEANT_GETEST_TASK.task_make */
extern void T250f39(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T250f42(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T250f44(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T250f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T250f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T250f41(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T319c20(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T319f20p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T319f32(T0* C, T0* a1);
/* GEANT_TARGET.getest_task_name */
extern unsigned char ge130os1985;
extern T0* ge130ov1985;
extern T0* T24f58(T0* C);
/* GEANT_GEPP_TASK.make */
extern T0* T249c32(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T318f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge107os7754;
extern T0* ge107ov7754;
extern T0* T249f20(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T318f24(T0* C, T2 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge107os7753;
extern T0* ge107ov7753;
extern T0* T249f19(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T318f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge107os7752;
extern T0* ge107ov7752;
extern T0* T249f18(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T249f17(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T249f26(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge107os7751;
extern T0* ge107ov7751;
extern T0* T249f16(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T318f22(T0* C, T2 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T2 T249f15(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T249f23(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T249f28(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T249f27(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge107os7750;
extern T0* ge107ov7750;
extern T0* T249f14(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T318f21(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge107os7749;
extern T0* ge107ov7749;
extern T0* T249f13(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T318f20(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T249f12(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T249f5(T0* C);
/* GEANT_GEPP_TASK.target_arguments_stack */
extern T0* T249f25(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T2 T249f8(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge107os7748;
extern T0* ge107ov7748;
extern T0* T249f11(T0* C);
/* GEANT_GEPP_TASK.task_make */
extern void T249f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T249f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T249f39(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T249f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T249f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T249f36(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T318c19(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T318f19p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T318f27(T0* C, T0* a1);
/* GEANT_TARGET.gepp_task_name */
extern unsigned char ge130os1984;
extern T0* ge130ov1984;
extern T0* T24f57(T0* C);
/* GEANT_GEYACC_TASK.make */
extern T0* T248c32(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T317f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge111os7723;
extern T0* ge111ov7723;
extern T0* T248f20(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T317f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge111os7722;
extern T0* ge111ov7722;
extern T0* T248f19(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T317f23(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge111os7721;
extern T0* ge111ov7721;
extern T0* T248f18(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T317f22(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge111os7720;
extern T0* ge111ov7720;
extern T0* T248f17(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T317f21(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge111os7725;
extern T0* ge111ov7725;
extern T0* T248f16(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T317f20(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge111os7724;
extern T0* ge111ov7724;
extern T0* T248f15(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T317f19(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T248f14(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T248f5(T0* C);
/* GEANT_GEYACC_TASK.target_arguments_stack */
extern T0* T248f28(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge111os7719;
extern T0* ge111ov7719;
extern T0* T248f13(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T317f18(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T2 T248f12(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T248f23(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T248f27(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T248f26(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T248f25(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T2 T248f8(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge111os7718;
extern T0* ge111ov7718;
extern T0* T248f11(T0* C);
/* GEANT_GEYACC_TASK.task_make */
extern void T248f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T248f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T248f39(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T248f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T248f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T248f36(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T317c17(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T317f17p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T317f27(T0* C, T0* a1);
/* GEANT_TARGET.geyacc_task_name */
extern unsigned char ge130os1983;
extern T0* ge130ov1983;
extern T0* T24f56(T0* C);
/* GEANT_GELEX_TASK.make */
extern T0* T247c35(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T316f31(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge106os7689;
extern T0* ge106ov7689;
extern T0* T247f24(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T316f30(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge106os7688;
extern T0* ge106ov7688;
extern T0* T247f23(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T316f29(T0* C, T2 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge106os7687;
extern T0* ge106ov7687;
extern T0* T247f22(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T316f28(T0* C, T2 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge106os7686;
extern T0* ge106ov7686;
extern T0* T247f21(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T316f27(T0* C, T2 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge106os7685;
extern T0* ge106ov7685;
extern T0* T247f20(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T316f26(T0* C, T2 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge106os7684;
extern T0* ge106ov7684;
extern T0* T247f19(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T316f25(T0* C, T2 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge106os7683;
extern T0* ge106ov7683;
extern T0* T247f18(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T316f24(T0* C, T2 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge106os7682;
extern T0* ge106ov7682;
extern T0* T247f17(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T316f23(T0* C, T2 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge106os7681;
extern T0* ge106ov7681;
extern T0* T247f16(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T316f22(T0* C, T2 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T2 T247f15(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T247f27(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T247f31(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T247f30(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge106os7680;
extern T0* ge106ov7680;
extern T0* T247f14(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T316f21(T0* C, T0* a1);
/* GEANT_GELEX_TASK.string_ */
extern T0* T247f13(T0* C);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T247f12(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T247f5(T0* C);
/* GEANT_GELEX_TASK.target_arguments_stack */
extern T0* T247f29(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T2 T247f8(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge106os7679;
extern T0* ge106ov7679;
extern T0* T247f11(T0* C);
/* GEANT_GELEX_TASK.task_make */
extern void T247f37(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T247f40(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T247f42(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T247f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T247f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T247f39(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T316c20(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T316f20p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T316f33(T0* C, T0* a1);
/* GEANT_TARGET.gelex_task_name */
extern unsigned char ge130os1982;
extern T0* ge130ov1982;
extern T0* T24f55(T0* C);
/* GEANT_GEXACE_TASK.make */
extern T0* T246c33(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_last */
extern void T58f67(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T246f21(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T246f26(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge109os7655;
extern T0* ge109ov7655;
extern T0* T246f20(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T314f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge109os7654;
extern T0* ge109ov7654;
extern T0* T246f19(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T314f25(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge109os7653;
extern T0* ge109ov7653;
extern T0* T246f18(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T314f24(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge109os7652;
extern T0* ge109ov7652;
extern T0* T246f17(T0* C);
/* GEANT_GEXACE_TASK.cluster_attribute_name */
extern unsigned char ge109os7651;
extern T0* ge109ov7651;
extern T0* T246f16(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T314f23(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T246f15(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T246f5(T0* C);
/* GEANT_GEXACE_TASK.target_arguments_stack */
extern T0* T246f29(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge109os7650;
extern T0* ge109ov7650;
extern T0* T246f14(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T314f22(T0* C, T2 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge109os7649;
extern T0* ge109ov7649;
extern T0* T246f13(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T314f21(T0* C, T2 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T2 T246f12(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T246f24(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T246f28(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T246f27(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T2 T246f8(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge109os7648;
extern T0* ge109ov7648;
extern T0* T246f11(T0* C);
/* GEANT_GEXACE_TASK.task_make */
extern void T246f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T246f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T246f40(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T246f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T246f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T246f37(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T314c20(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T314f20p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T314f28(T0* C, T0* a1);
/* GEANT_TARGET.gexace_task_name */
extern unsigned char ge130os1981;
extern T0* ge130ov1981;
extern T0* T24f54(T0* C);
/* GEANT_UNSET_TASK.make */
extern T0* T245c21(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T313f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T245f12(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T245f5(T0* C);
/* GEANT_UNSET_TASK.target_arguments_stack */
extern T0* T245f17(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T2 T245f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge122os7640;
extern T0* ge122ov7640;
extern T0* T245f11(T0* C);
/* GEANT_UNSET_TASK.task_make */
extern void T245f23(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T245f26(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T245f28(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T245f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T245f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T245f25(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T313c5(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T313f8(T0* C, T0* a1);
/* GEANT_TARGET.unset_task_name */
extern unsigned char ge130os1980;
extern T0* ge130ov1980;
extern T0* T24f53(T0* C);
/* GEANT_SET_TASK.make */
extern T0* T244c22(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T312f8(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge119os7630;
extern T0* ge119ov7630;
extern T0* T244f13(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T312f7(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T244f12(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T244f5(T0* C);
/* GEANT_SET_TASK.target_arguments_stack */
extern T0* T244f18(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T2 T244f8(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge119os7629;
extern T0* ge119ov7629;
extern T0* T244f11(T0* C);
/* GEANT_SET_TASK.task_make */
extern void T244f24(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T244f27(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T244f29(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T244f28(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T244f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T244f26(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T312c6(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T312f10(T0* C, T0* a1);
/* GEANT_TARGET.set_task_name */
extern unsigned char ge130os1979;
extern T0* ge130ov1979;
extern T0* T24f52(T0* C);
/* GEANT_LCC_TASK.make */
extern T0* T243c22(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T311f13(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge113os7619;
extern T0* ge113ov7619;
extern T0* T243f13(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T311f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T243f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T243f5(T0* C);
/* GEANT_LCC_TASK.target_arguments_stack */
extern T0* T243f18(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T2 T243f8(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge113os7618;
extern T0* ge113ov7618;
extern T0* T243f11(T0* C);
/* GEANT_LCC_TASK.task_make */
extern void T243f24(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T243f27(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T243f29(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T243f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T243f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T243f26(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T311c11(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T311f15(T0* C, T0* a1);
/* GEANT_TARGET.lcc_task_name */
extern unsigned char ge130os1978;
extern T0* ge130ov1978;
extern T0* T24f51(T0* C);
/* GEANT_EXEC_TASK.make */
extern T0* T242c28(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T308f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge102os7602;
extern T0* ge102ov7602;
extern T0* T242f16(T0* C);
/* GEANT_EXEC_COMMAND.set_accept_errors */
extern void T308f14(T0* C, T2 a1);
/* GEANT_EXEC_TASK.boolean_value */
extern T2 T242f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.std */
extern T0* T242f19(T0* C);
/* GEANT_EXEC_TASK.false_attribute_value */
extern T0* T242f24(T0* C);
/* GEANT_EXEC_TASK.true_attribute_value */
extern T0* T242f23(T0* C);
/* GEANT_EXEC_TASK.string_ */
extern T0* T242f22(T0* C);
/* GEANT_EXEC_TASK.accept_errors_attribute_name */
extern unsigned char ge102os7600;
extern T0* ge102ov7600;
extern T0* T242f14(T0* C);
/* GEANT_EXEC_COMMAND.set_exit_code_variable_name */
extern void T308f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge102os7601;
extern T0* ge102ov7601;
extern T0* T242f13(T0* C);
/* GEANT_EXEC_COMMAND.set_command_line */
extern void T308f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.attribute_value */
extern T0* T242f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T242f5(T0* C);
/* GEANT_EXEC_TASK.target_arguments_stack */
extern T0* T242f21(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T2 T242f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.executable_attribute_name */
extern unsigned char ge102os7599;
extern T0* ge102ov7599;
extern T0* T242f11(T0* C);
/* GEANT_EXEC_TASK.task_make */
extern void T242f30(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T242f33(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T242f35(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T242f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T242f36(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T242f32(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T308c11(T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T308f17(T0* C, T0* a1);
/* GEANT_TARGET.exec_task_name */
extern unsigned char ge130os1977;
extern T0* ge130ov1977;
extern T0* T24f50(T0* C);
/* GEANT_VE_TASK.make */
extern T0* T241c32(T0* a1, T0* a2);
/* GEANT_VE_COMMAND.set_exit_code_variable_name */
extern void T307f26(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value */
extern T0* T241f20(T0* C, T0* a1);
/* GEANT_VE_TASK.project_variables_resolver */
extern T0* T241f5(T0* C);
/* GEANT_VE_TASK.target_arguments_stack */
extern T0* T241f28(T0* C);
/* GEANT_VE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge123os7574;
extern T0* ge123ov7574;
extern T0* T241f19(T0* C);
/* GEANT_VE_COMMAND.set_tuning_level */
extern void T307f25(T0* C, T0* a1);
/* GEANT_VE_TASK.level_attribute_name */
extern unsigned char ge123os7573;
extern T0* ge123ov7573;
extern T0* T241f18(T0* C);
/* GEANT_VE_COMMAND.set_tuned_system */
extern void T307f24(T0* C, T0* a1);
/* GEANT_VE_TASK.tune_attribute_name */
extern unsigned char ge123os7572;
extern T0* ge123ov7572;
extern T0* T241f17(T0* C);
/* GEANT_VE_COMMAND.set_recursive_clean */
extern void T307f23(T0* C, T2 a1);
/* GEANT_VE_TASK.boolean_value */
extern T2 T241f16(T0* C, T0* a1);
/* GEANT_VE_TASK.std */
extern T0* T241f23(T0* C);
/* GEANT_VE_TASK.false_attribute_value */
extern T0* T241f27(T0* C);
/* GEANT_VE_TASK.true_attribute_value */
extern T0* T241f26(T0* C);
/* GEANT_VE_TASK.string_ */
extern T0* T241f25(T0* C);
/* GEANT_VE_TASK.recursive_attribute_name */
extern unsigned char ge123os7571;
extern T0* ge123ov7571;
extern T0* T241f15(T0* C);
/* GEANT_VE_COMMAND.set_clean */
extern void T307f22(T0* C, T0* a1);
/* GEANT_VE_TASK.clean_attribute_name */
extern unsigned char ge123os7570;
extern T0* ge123ov7570;
extern T0* T241f14(T0* C);
/* GEANT_VE_COMMAND.set_xace_filename */
extern void T307f21(T0* C, T0* a1);
/* GEANT_VE_TASK.xace_attribute_name */
extern unsigned char ge123os7569;
extern T0* ge123ov7569;
extern T0* T241f13(T0* C);
/* GEANT_VE_COMMAND.set_esd_filename */
extern void T307f20(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value_or_default */
extern T0* T241f12(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.has_attribute */
extern T2 T241f8(T0* C, T0* a1);
/* GEANT_VE_TASK.esd_attribute_name */
extern unsigned char ge123os7568;
extern T0* ge123ov7568;
extern T0* T241f11(T0* C);
/* GEANT_VE_TASK.task_make */
extern void T241f34(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.interpreting_element_make */
extern void T241f37(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.set_project */
extern void T241f39(T0* C, T0* a1);
/* GEANT_VE_TASK.element_make */
extern void T241f38(T0* C, T0* a1);
/* GEANT_VE_TASK.set_xml_element */
extern void T241f40(T0* C, T0* a1);
/* GEANT_VE_TASK.set_command */
extern void T241f36(T0* C, T0* a1);
/* GEANT_VE_COMMAND.make */
extern T0* T307c19(T0* a1);
/* GEANT_VE_COMMAND.set_project */
extern void T307f28(T0* C, T0* a1);
/* GEANT_TARGET.ve_task_name */
extern unsigned char ge130os1976;
extern T0* ge130ov1976;
extern T0* T24f49(T0* C);
/* GEANT_ISE_TASK.make */
extern T0* T240c31(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T306f23(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T240f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T240f5(T0* C);
/* GEANT_ISE_TASK.target_arguments_stack */
extern T0* T240f27(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge112os7546;
extern T0* ge112ov7546;
extern T0* T240f18(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T306f22(T0* C, T2 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge112os7544;
extern T0* ge112ov7544;
extern T0* T240f17(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T306f21(T0* C, T2 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T2 T240f16(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T240f22(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T240f26(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T240f25(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T240f24(T0* C);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge112os7543;
extern T0* ge112ov7543;
extern T0* T240f15(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T306f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge112os7545;
extern T0* ge112ov7545;
extern T0* T240f14(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T306f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge112os7542;
extern T0* ge112ov7542;
extern T0* T240f13(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T306f18(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T240f12(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T2 T240f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge112os7541;
extern T0* ge112ov7541;
extern T0* T240f11(T0* C);
/* GEANT_ISE_TASK.task_make */
extern void T240f33(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T240f36(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T240f38(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T240f37(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T240f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T240f35(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T306c17(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T306f25(T0* C, T0* a1);
/* GEANT_TARGET.ise_task_name */
extern unsigned char ge130os1975;
extern T0* ge130ov1975;
extern T0* T24f48(T0* C);
/* GEANT_SE_TASK.make */
extern T0* T239c33(T0* a1, T0* a2);
/* GEANT_SE_COMMAND.set_exit_code_variable_name */
extern void T305f31(T0* C, T0* a1);
/* GEANT_SE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge120os7513;
extern T0* ge120ov7513;
extern T0* T239f21(T0* C);
/* GEANT_SE_COMMAND.set_no_style_warning */
extern void T305f30(T0* C, T2 a1);
/* GEANT_SE_TASK.no_style_warning_attribute_name */
extern unsigned char ge120os7511;
extern T0* ge120ov7511;
extern T0* T239f20(T0* C);
/* GEANT_SE_COMMAND.set_case_insensitive */
extern void T305f29(T0* C, T2 a1);
/* GEANT_SE_TASK.boolean_value */
extern T2 T239f19(T0* C, T0* a1);
/* GEANT_SE_TASK.std */
extern T0* T239f24(T0* C);
/* GEANT_SE_TASK.false_attribute_value */
extern T0* T239f29(T0* C);
/* GEANT_SE_TASK.true_attribute_value */
extern T0* T239f28(T0* C);
/* GEANT_SE_TASK.string_ */
extern T0* T239f27(T0* C);
/* GEANT_SE_TASK.case_insensitive_attribute_name */
extern unsigned char ge120os7510;
extern T0* ge120ov7510;
extern T0* T239f18(T0* C);
/* GEANT_SE_COMMAND.set_executable */
extern void T305f28(T0* C, T0* a1);
/* GEANT_SE_TASK.executable_attribute_name */
extern unsigned char ge120os7509;
extern T0* ge120ov7509;
extern T0* T239f17(T0* C);
/* GEANT_SE_COMMAND.set_creation_procedure */
extern void T305f27(T0* C, T0* a1);
/* GEANT_SE_TASK.creation_procedure_attribute_name */
extern unsigned char ge120os7508;
extern T0* ge120ov7508;
extern T0* T239f16(T0* C);
/* GEANT_SE_COMMAND.set_root_class */
extern void T305f26(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value */
extern T0* T239f15(T0* C, T0* a1);
/* GEANT_SE_TASK.project_variables_resolver */
extern T0* T239f5(T0* C);
/* GEANT_SE_TASK.target_arguments_stack */
extern T0* T239f26(T0* C);
/* GEANT_SE_TASK.root_class_attribute_name */
extern unsigned char ge120os7507;
extern T0* ge120ov7507;
extern T0* T239f14(T0* C);
/* GEANT_SE_COMMAND.set_clean */
extern void T305f25(T0* C, T0* a1);
/* GEANT_SE_TASK.clean_attribute_name */
extern unsigned char ge120os7512;
extern T0* ge120ov7512;
extern T0* T239f13(T0* C);
/* GEANT_SE_COMMAND.set_ace_filename */
extern void T305f24(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value_or_default */
extern T0* T239f12(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.has_attribute */
extern T2 T239f8(T0* C, T0* a1);
/* GEANT_SE_TASK.ace_attribute_name */
extern unsigned char ge120os7506;
extern T0* ge120ov7506;
extern T0* T239f11(T0* C);
/* GEANT_SE_TASK.task_make */
extern void T239f35(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.interpreting_element_make */
extern void T239f38(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.set_project */
extern void T239f40(T0* C, T0* a1);
/* GEANT_SE_TASK.element_make */
extern void T239f39(T0* C, T0* a1);
/* GEANT_SE_TASK.set_xml_element */
extern void T239f41(T0* C, T0* a1);
/* GEANT_SE_TASK.set_command */
extern void T239f37(T0* C, T0* a1);
/* GEANT_SE_COMMAND.make */
extern T0* T305c23(T0* a1);
/* GEANT_SE_COMMAND.set_project */
extern void T305f33(T0* C, T0* a1);
/* GEANT_TARGET.se_task_name */
extern unsigned char ge130os1974;
extern T0* ge130ov1974;
extern T0* T24f47(T0* C);
/* GEANT_GEC_TASK.make */
extern T0* T238c31(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T304f24(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T238f19(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T238f5(T0* C);
/* GEANT_GEC_TASK.target_arguments_stack */
extern T0* T238f27(T0* C);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge105os7475;
extern T0* ge105ov7475;
extern T0* T238f18(T0* C);
/* GEANT_GEC_COMMAND.set_cat_mode */
extern void T304f23(T0* C, T2 a1);
/* GEANT_GEC_TASK.cat_attribute_name */
extern unsigned char ge105os7473;
extern T0* ge105ov7473;
extern T0* T238f17(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T304f22(T0* C, T2 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge105os7476;
extern T0* ge105ov7476;
extern T0* T238f16(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T304f21(T0* C, T2 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T2 T238f15(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T238f22(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T238f26(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T238f25(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T238f24(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge105os7472;
extern T0* ge105ov7472;
extern T0* T238f14(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T304f20(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge105os7474;
extern T0* ge105ov7474;
extern T0* T238f13(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T304f19(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T238f12(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T2 T238f8(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge105os7471;
extern T0* ge105ov7471;
extern T0* T238f11(T0* C);
/* GEANT_GEC_TASK.task_make */
extern void T238f33(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T238f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T238f38(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T238f37(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T238f39(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T238f35(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T304c18(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T304f18p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T304f26(T0* C, T0* a1);
/* GEANT_TARGET.gec_task_name */
extern unsigned char ge130os1973;
extern T0* ge130ov1973;
extern T0* T24f46(T0* C);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge65os1942;
extern T0* ge65ov1942;
extern T0* T24f4(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge65os1943;
extern T0* ge65ov1943;
extern T0* T24f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T2 T41f10(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T2 T41f11(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T2 T157f13(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T4 T157f27(T0* C, T0* a1, T4 a2);
/* STRING.same_string */
extern T2 T16f23(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T2 T157f12(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T4 T157f26(T0* C, T0* a1, T4 a2);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge129os1968;
extern T0* ge129ov1968;
extern T0* T24f5(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T24f23(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T153f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T153f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T74f23(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T75f37(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T75f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T153c9(T0* a1);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T24f45(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T2 T32f31(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].forth */
extern void T51f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].key */
extern T0* T51f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].after */
extern T2 T51f3(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].start */
extern void T51f8(T0* C);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T32f29(T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T24f77(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].item */
extern T0* T51f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T2 T32f34(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T202f2(T0* C);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T24f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T43f33(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T59f7(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T4 T59f5(T0* C, T14 a1);
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
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge266os2931;
extern T0* ge266ov2931;
extern T0* T43f18(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T43f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T42f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T42f20(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T42f12(T0* C);
/* GEANT_TARGET.exit_application */
extern void T24f80(T0* C, T4 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T24f18(T0* C);
/* GEANT_TARGET.std */
extern T0* T24f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T2 T43f24(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T2 T302f1(T0* C);
/* KL_DIRECTORY.old_exists */
extern T2 T302f3(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T2 T302f4(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T302f36(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T302f35(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T302c35(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T302f37(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T302f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge266os2929;
extern T0* ge266ov2929;
extern T0* T43f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T2 T42f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T42f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T43f23(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T59f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T42f26(T0* C);
/* GEANT_TARGET.file_system */
extern unsigned char ge189os1325;
extern T0* ge189ov1325;
extern T0* T24f44(T0* C);
/* GEANT_TARGET.unix_file_system */
extern unsigned char ge189os1328;
extern T0* ge189ov1328;
extern T0* T24f76(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T43c32(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge282os2147;
extern T2 ge282ov2147;
extern T2 T39f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T39f4(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge282os2151;
extern T0* ge282ov2151;
extern T0* T39f5(T0* C);
/* STRING.is_equal */
extern T2 T16f4(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f9(T0* C, T0* a1, T0* a2, T4 a3);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T39f3(T0* C, T0* a1);
/* GEANT_TARGET.windows_file_system */
extern unsigned char ge189os1326;
extern T0* ge189ov1326;
extern T0* T24f75(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T42c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge282os2146;
extern T2 ge282ov2146;
extern T2 T39f1(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T24f74(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T203f1(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T203f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T203f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T47f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T23f49(T0* C);
/* GEANT_PROJECT_VARIABLES.items_item */
extern T0* T23f51(T0* C, T4 a1);
/* GEANT_VARIABLES.found_item */
extern T0* T27f41(T0* C);
/* GEANT_VARIABLES.items_item */
extern T0* T27f33(T0* C, T4 a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T43f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T42f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T47f8(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T47f12(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T47f11(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T47f10(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T204f2(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item */
extern T0* T32f41(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.items_item */
extern T0* T32f40(T0* C, T4 a1);
/* GEANT_VARIABLES.item */
extern T0* T27f32(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T2 T204f1(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T2 T27f31(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T203f4(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T41f16(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T41f3(T0* C, T0* a1, T4 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T157f69(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T157f73(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T157f69p1(T0* C);
/* STRING.wipe_out */
extern void T16f34(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T203f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T157f45(T0* C);
/* UC_UTF8_STRING.unicode */
extern unsigned char ge218os3039;
extern T0* ge218ov3039;
extern T0* T157f48(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T226c27(void);
/* STRING.out */
extern T0* T16f3(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T75f7(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T2 T75f9(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T2 T272f3(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T203f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T47f16(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T24f28(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T203c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T2 T75f6(T0* C, T0* a1);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T24f43(T0* C);
/* GEANT_PROJECT.log */
extern void T20f41(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T55f18(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T55f19(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T55f20(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T55f13(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T55f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T55f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T55f17(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T55f3(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T20f20(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].forth */
extern void T88f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_forth */
extern void T29f64(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].add_traversing_cursor */
extern void T29f69(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_next_cursor */
extern void T88f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_traversing_cursor */
extern void T29f68(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_position */
extern void T88f14(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_item */
extern T4 T29f18(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].go_after */
extern void T88f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_go_after */
extern void T29f74(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_off */
extern T2 T29f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].key */
extern T0* T88f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_key */
extern T0* T29f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_item */
extern T0* T29f17(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].item */
extern T0* T88f2(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_item */
extern T0* T29f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_item */
extern T0* T29f5(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].after */
extern T2 T88f1(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_after */
extern T2 T29f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].start */
extern void T88f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_start */
extern void T29f63(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].is_empty */
extern T2 T29f38(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_cursor */
extern T0* T29f28(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].make */
extern T0* T88c8(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T2 T24f42(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T24f73(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T24f72(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T24f32(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T20f31(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T147f2(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T32c42(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T32f45(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T32f44(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T32f53(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T32f58(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T32f62(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T32f61(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_keys */
extern void T32f60(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_items */
extern void T32f59(T0* C, T4 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T20f39(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T24f36(T0* C);
/* GEANT_TARGET.show_dependent_targets */
extern void T24f92(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T55f10(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge192os2121;
extern T0* ge192ov2121;
extern T0* T33f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T55c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T55f11(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T55f15(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T55f2(T0* C, T4 a1);
/* KL_STDOUT_FILE.old_make */
extern void T55f14(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T24f7(T0* C, T0* a1, T1 a2);
/* GEANT_TARGET.dependencies */
extern T0* T24f40(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge65os1945;
extern T0* ge65ov1945;
extern T0* T24f41(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T2 T24f39(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T147f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T147f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T89f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_TARGET].resized_area */
extern T0* T86f3(T0* C, T4 a1);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T86c4(T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T4 T147f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T2 T147f6(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T147c8(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T89f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_TARGET].make_area */
extern T0* T165c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T89c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T202f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T202f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].resize */
extern T0* T282f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].resized_area */
extern T0* T281f3(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T4 T202f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T2 T202f6(T0* C, T4 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T20f18(T0* C);
/* GEANT_PROJECT.trace */
extern void T20f24(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge63os1308;
extern T0* ge63ov1308;
extern T0* T19f11(T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T20f3(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T20f35(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T20f17(T0* C);
/* GEANT_PROJECT.std */
extern T0* T20f10(T0* C);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T20f7(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T20f5(T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T20f27(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T20f26(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T24f30(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T2 T24f29(T0* C);
/* DS_ARRAYED_LIST [STRING].has */
extern T2 T149f10(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge65os1948;
extern T0* ge65ov1948;
extern T0* T24f8(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item */
extern T0* T29f2(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].search_position */
extern void T29f45(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].hash_position */
extern T4 T29f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_item */
extern T4 T29f13(T0* C, T4 a1);
/* GEANT.exit_application */
extern void T19f24(T0* C, T4 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T19f14(T0* C);
/* GEANT.std */
extern T0* T19f13(T0* C);
/* STRING.infix "+" */
extern T0* T16f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has */
extern T2 T29f1(T0* C, T0* a1);
/* INTEGER.infix ">" */
extern T2 T4f1(T4* C, T4 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T20f25(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T24f91(T0* C);
/* ARRAY [STRING].force */
extern void T31f15(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].auto_resize */
extern void T31f16(T0* C, T4 a1, T4 a2);
/* SPECIAL [STRING].fill_with */
extern void T30f9(T0* C, T0* a1, T4 a2, T4 a3);
/* SPECIAL [STRING].move_data */
extern void T30f8(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].overlapping_move */
extern void T30f11(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].non_overlapping_move */
extern void T30f10(T0* C, T4 a1, T4 a2, T4 a3);
/* ARRAY [STRING].capacity */
extern T4 T31f8(T0* C);
/* SPECIAL [STRING].aliased_resized_area */
extern T0* T30f4(T0* C, T4 a1);
/* ARRAY [STRING].additional_space */
extern T4 T31f7(T0* C);
/* ARRAY [STRING].empty_area */
extern T2 T31f6(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T85f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T85f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].back */
extern void T88f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_back */
extern void T29f66(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T85f15(T0* C, T4 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T85f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T85f4(T0* C);
/* GEANT_TARGET.conflicts_with */
extern T2 T24f34(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T24f38(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].before */
extern T2 T88f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_before */
extern T2 T29f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].finish */
extern void T88f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_finish */
extern void T29f65(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T85f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove */
extern void T29f62(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_position */
extern void T29f67(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_put */
extern void T29f52(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_put */
extern void T29f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_put */
extern void T29f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_put */
extern void T29f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_forth */
extern void T29f71(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_all_cursors */
extern void T29f73(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_after */
extern void T29f72(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].internal_set_key_equality_tester */
extern void T29f70(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].unset_found_item */
extern void T29f47(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T24f95(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T85f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T85f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T85f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].force_last */
extern void T29f44(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].resize */
extern void T29f49(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_resize */
extern void T29f57(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].special_integer_ */
extern T0* T29f29(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_resize */
extern void T29f56(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_resize */
extern void T29f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_resize */
extern void T29f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_modulus */
extern T4 T29f21(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_capacity */
extern T4 T29f10(T0* C, T4 a1);
/* GEANT_INHERIT.string_ */
extern T0* T85f3(T0* C);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T85f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T85f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T24f90(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T2 T24f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T146f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T145f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T146f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T145f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T146f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T145f22(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T143f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T143f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].forth */
extern void T297f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_forth */
extern void T225f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].add_traversing_cursor */
extern void T225f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_next_cursor */
extern void T297f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].remove_traversing_cursor */
extern void T225f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_position */
extern void T297f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_item */
extern T4 T225f16(T0* C, T4 a1);
/* GEANT_PARENT.exit_application */
extern void T143f20(T0* C, T4 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T143f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T143f10(T0* C);
/* GEANT_SELECT.is_executable */
extern T2 T224f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].item */
extern T0* T297f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_item */
extern T0* T225f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_item */
extern T0* T225f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].after */
extern T2 T297f3(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_after */
extern T2 T225f30(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].start */
extern void T297f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_start */
extern void T225f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_off */
extern T2 T225f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].is_empty */
extern T2 T225f34(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_cursor */
extern T0* T225f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].make */
extern T0* T297c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T143f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T143f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has_item */
extern T2 T29f41(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T143f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].forth */
extern void T293f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_forth */
extern void T223f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].add_traversing_cursor */
extern void T223f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_next_cursor */
extern void T293f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].remove_traversing_cursor */
extern void T223f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_position */
extern void T293f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_item */
extern T4 T223f16(T0* C, T4 a1);
/* GEANT_REDEFINE.is_executable */
extern T2 T222f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].item */
extern T0* T293f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_item */
extern T0* T223f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_item */
extern T0* T223f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].after */
extern T2 T293f3(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_after */
extern T2 T223f30(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].start */
extern void T293f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_start */
extern void T223f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_off */
extern T2 T223f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].is_empty */
extern T2 T223f34(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_cursor */
extern T0* T223f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].make */
extern T0* T293c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T143f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].back */
extern void T289f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_back */
extern void T221f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].add_traversing_cursor */
extern void T221f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_next_cursor */
extern void T289f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].remove_traversing_cursor */
extern void T221f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_position */
extern void T289f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_item */
extern T4 T221f16(T0* C, T4 a1);
/* GEANT_RENAME.is_executable */
extern T2 T220f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T220f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].item */
extern T0* T289f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_item */
extern T0* T221f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_item */
extern T0* T221f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].before */
extern T2 T289f3(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_before */
extern T2 T221f31(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].finish */
extern void T289f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_finish */
extern void T221f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_off */
extern T2 T221f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].is_empty */
extern T2 T221f34(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_cursor */
extern T0* T221f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].make */
extern T0* T289c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T146f2(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T145f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T145f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T2 T146f1(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T2 T145f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T146f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T145f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T2 T145f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T2 T146f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T2 T145f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T2 T145f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T145f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T146c7(T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T21f10(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T21f11(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T21f6(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T42f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T42f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T2 T42f19(T0* C, T1 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T42f11(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T2 T42f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T2 T42f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T43f4(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T43f11(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T2 T43f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T42f3(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T42f7(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T63f8(T0* C, T4 a1);
/* KL_PATHNAME.is_parent */
extern T2 T63f7(T0* C, T4 a1);
/* KL_PATHNAME.is_current */
extern T2 T63f6(T0* C, T4 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge197os2970;
extern T0* ge197ov2970;
extern T0* T42f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T43f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T63f17(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T63f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T63f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T63f14(T0* C, T2 a1);
/* KL_PATHNAME.make */
extern T0* T63c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T42f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T43f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T43f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge195os2970;
extern T0* ge195ov2970;
extern T0* T43f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T43f7(T0* C);
/* GEANT_PROJECT_LOADER.unix_file_system */
extern T0* T21f4(T0* C);
/* GEANT_PROJECT_LOADER.file_system */
extern T0* T21f3(T0* C);
/* GEANT_PROJECT_LOADER.windows_file_system */
extern T0* T21f8(T0* C);
/* GEANT_PROJECT_LOADER.operating_system */
extern T0* T21f7(T0* C);
/* GEANT_PROJECT_LOADER.std */
extern T0* T21f5(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T44f57(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T44f62(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T44f63(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T45f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T69f2(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T69f7(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T69f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T2 T69f14(T0* C, T1 a1);
/* CHARACTER.infix ">=" */
extern T2 T1f4(T1* C, T1 a1);
/* STRING.make_empty */
extern T0* T16c39(void);
/* XM_EIFFEL_PARSER.position */
extern T0* T69f4(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T95f1(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T69f11(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T69f17(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T96f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T96f2(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T2 T96f1(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T95f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T172f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T172f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T172c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T2 T95f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T95c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T95f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T173c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T96f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T174f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T174c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T96c5(void);
/* KL_STDERR_FILE.flush */
extern void T34f21(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T34f22(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T34f23(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T70f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T45f7(T0* C);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T28c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T28f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T84c10(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T84f12(T0* C, T4 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T84f6(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T84f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T145f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T145f18(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T208f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_PARENT].resized_area */
extern T0* T209f2(T0* C, T4 a1);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T209c4(T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T4 T145f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T2 T145f6(T0* C, T4 a1);
/* GEANT_PARENT.is_executable */
extern T2 T143f1(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T163c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].force_last */
extern void T225f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_put */
extern void T225f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_put */
extern void T225f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_put */
extern void T225f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_item */
extern T4 T225f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].hash_position */
extern T4 T225f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].resize */
extern void T225f43(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_resize */
extern void T225f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].special_integer_ */
extern T0* T225f26(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_resize */
extern void T225f50(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_resize */
extern void T225f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T298f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_SELECT].resized_area */
extern T0* T296f2(T0* C, T4 a1);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T296c4(T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_item */
extern T0* T225f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_resize */
extern void T225f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_modulus */
extern T4 T225f18(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_capacity */
extern T4 T225f6(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_put */
extern void T225f42(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].search_position */
extern void T225f41(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].unset_found_item */
extern void T225f40(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T219c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T224f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T219f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T219f8(T0* C);
/* GEANT_SELECT_ELEMENT.target_arguments_stack */
extern T0* T219f7(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T2 T219f3(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge149os7365;
extern T0* ge149ov7365;
extern T0* T219f2(T0* C);
/* GEANT_SELECT.make */
extern T0* T224c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T219f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T219f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T219f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T219f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge141os6973;
extern T0* ge141ov6973;
extern T0* T163f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].force_last */
extern void T223f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_put */
extern void T223f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_put */
extern void T223f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_put */
extern void T223f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_item */
extern T4 T223f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].hash_position */
extern T4 T223f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].resize */
extern void T223f43(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_resize */
extern void T223f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].special_integer_ */
extern T0* T223f26(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_resize */
extern void T223f50(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_resize */
extern void T223f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T294f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_REDEFINE].resized_area */
extern T0* T292f2(T0* C, T4 a1);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T292c4(T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_item */
extern T0* T223f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_resize */
extern void T223f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_modulus */
extern T4 T223f18(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_capacity */
extern T4 T223f6(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_put */
extern void T223f42(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].search_position */
extern void T223f41(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].unset_found_item */
extern void T223f40(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T218c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T222f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T218f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T218f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.target_arguments_stack */
extern T0* T218f7(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T2 T218f3(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge145os7361;
extern T0* ge145ov7361;
extern T0* T218f2(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T222c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T218f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T218f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T218f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T218f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge141os6972;
extern T0* ge141ov6972;
extern T0* T163f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].force_last */
extern void T221f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_put */
extern void T221f47(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_put */
extern void T221f46(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_put */
extern void T221f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_item */
extern T4 T221f10(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].hash_position */
extern T4 T221f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].resize */
extern void T221f44(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_resize */
extern void T221f52(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].special_integer_ */
extern T0* T221f27(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_resize */
extern void T221f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_resize */
extern void T221f50(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T290f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_RENAME].resized_area */
extern T0* T288f2(T0* C, T4 a1);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T288c4(T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_item */
extern T0* T221f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_resize */
extern void T221f49(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_modulus */
extern T4 T221f19(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_capacity */
extern T4 T221f7(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_put */
extern void T221f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].search_position */
extern void T221f40(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].unset_found_item */
extern void T221f42(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T163f20(T0* C, T4 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T163f12(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T163f11(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].has */
extern T2 T221f1(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T217c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T220f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge147os7357;
extern T0* ge147ov7357;
extern T0* T217f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T220f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T217f4(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T217f9(T0* C);
/* GEANT_RENAME_ELEMENT.target_arguments_stack */
extern T0* T217f8(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T2 T217f3(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge147os7356;
extern T0* ge147ov7356;
extern T0* T217f2(T0* C);
/* GEANT_RENAME.make */
extern T0* T220c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T217f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T217f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T217f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T217f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T163f8(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T163f16(T0* C);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge141os6971;
extern T0* ge141ov6971;
extern T0* T163f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T143f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T163f3(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T163f15(T0* C);
/* GEANT_PARENT_ELEMENT.target_arguments_stack */
extern T0* T163f14(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T2 T163f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge141os6969;
extern T0* ge141ov6969;
extern T0* T163f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T143c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].set_key_equality_tester */
extern void T225f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_map_equal */
extern T0* T225c36(T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_with_equality_testers */
extern void T225f39(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_sparse_container */
extern void T225f47(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_slots */
extern void T225f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_clashes */
extern void T225f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_keys */
extern void T225f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_items */
extern void T225f52(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T298f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_SELECT].make_area */
extern T0* T345c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T298c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T295c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].set_key_equality_tester */
extern void T223f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_map_equal */
extern T0* T223c36(T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_with_equality_testers */
extern void T223f39(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_sparse_container */
extern void T223f47(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_slots */
extern void T223f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_clashes */
extern void T223f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_keys */
extern void T223f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_items */
extern void T223f52(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T294f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_REDEFINE].make_area */
extern T0* T344c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T294c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T291c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].set_key_equality_tester */
extern void T221f39(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_map_equal */
extern T0* T221c37(T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_with_equality_testers */
extern void T221f41(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_sparse_container */
extern void T221f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_slots */
extern void T221f56(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_clashes */
extern void T221f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_keys */
extern void T221f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_items */
extern void T221f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T290f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_RENAME].make_area */
extern T0* T343c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T290c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T287c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T163f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T163f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T163f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T163f23(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T84f4(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T84f8(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge135os5510;
extern T0* ge135ov5510;
extern T0* T84f3(T0* C);
/* GEANT_INHERIT.make */
extern T0* T85c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T145c16(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T208f1(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_PARENT].make_area */
extern T0* T285c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T208c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T84f11(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T84f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T84f13(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T84f15(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge142os2102;
extern T0* ge142ov2102;
extern T0* T28f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T20f34(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T84c9(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T163c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge141os6970;
extern T0* ge141ov6970;
extern T0* T163f2(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T20f33(T0* C, T2 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T2 T28f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge142os2101;
extern T0* ge142ov2101;
extern T0* T28f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T20f32(T0* C, T0* a1);
/* GEANT_TARGET.make */
extern T0* T24c79(T0* a1, T0* a2);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T150f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T150f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T150f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T2 T150f1(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T2 T150f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T150c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T150f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T24f15(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge63os1310;
extern T0* ge63ov1310;
extern T0* T24f13(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T24f85(T0* C, T2 a1);
/* GEANT_TARGET.boolean_value */
extern T2 T24f11(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern T0* T24f26(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern T0* T24f25(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T24f24(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge65os1947;
extern T0* ge65ov1947;
extern T0* T24f9(T0* C);
/* GEANT_TARGET.set_exports */
extern void T24f84(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].set_equality_tester */
extern void T149f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].put */
extern void T149f13(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].move_cursors_right */
extern void T149f18(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_position */
extern void T210f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].move_right */
extern void T149f17(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].put_last */
extern void T149f16(T0* C, T0* a1);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge65os1946;
extern T0* ge65ov1946;
extern T0* T24f6(T0* C);
/* GEANT_TARGET.set_description */
extern void T24f83(T0* C, T0* a1);
/* GEANT_TARGET.set_obsolete_message */
extern void T24f82(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T24f81(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge65os1944;
extern T0* ge65ov1944;
extern T0* T24f2(T0* C);
/* GEANT_TARGET.make */
extern void T24f79p1(T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T24f87(T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T24f86(T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T24f88(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].set_key_equality_tester */
extern void T29f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_map */
extern T0* T29c42(T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_with_equality_testers */
extern void T29f46(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_sparse_container */
extern void T29f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_slots */
extern void T29f61(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_clashes */
extern void T29f60(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_keys */
extern void T29f59(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_items */
extern void T29f58(T0* C, T4 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T28f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T28f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge142os2104;
extern T0* ge142ov2104;
extern T0* T28f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T20f30(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge142os2100;
extern T0* ge142ov2100;
extern T0* T28f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T42f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T2 T42f25(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T43f21(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T2 T43f22(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T23f54(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T23f57(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.keys_put */
extern void T23f65(T0* C, T0* a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T23f64(T0* C, T4 a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T23f63(T0* C, T4 a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T23f62(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T23f70(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T23f35(T0* C);
/* GEANT_PROJECT_VARIABLES.keys_resize */
extern void T23f69(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.items_resize */
extern void T23f68(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T23f67(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T4 T23f28(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T4 T23f14(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.items_put */
extern void T23f61(T0* C, T0* a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T23f59(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T42f23(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T43f20(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T28f8(T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T28f7(T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T28f18(T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T28f17(T0* C);
/* GEANT_PROJECT.set_description */
extern void T20f29(T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T2 T75f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T28f6(T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T28f4(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T28f22(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T28f13(T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T28f12(T0* C);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T2 T28f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge142os2099;
extern T0* ge142ov2099;
extern T0* T28f2(T0* C);
/* GEANT_PROJECT.make */
extern T0* T20c23(T0* a1, T0* a2, T0* a3);
/* GEANT_PROJECT.set_options */
extern void T20f37(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T20f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T28f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T28f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T70f4(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T2 T69f1(T0* C);
/* XM_EIFFEL_PARSER.syntax_error */
extern T2 T69f3(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T69f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T69f207(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T69f213(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T69f212(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T69f223(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T69f251(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T69f257(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T69f258(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T113f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING]].clear_all */
extern void T128f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T123f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T125f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T120f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T116f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T118f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T111f6(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T69f222(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T69f221(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T69f220(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T69f250(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T133f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T105f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T131f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T116f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T116c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T131f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T196c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T131c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T105f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T69f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T105c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T69f249(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].force */
extern void T98f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_put */
extern void T98f52(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_put */
extern void T98f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_put */
extern void T98f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_item */
extern T4 T98f17(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_item */
extern T4 T98f16(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].hash_position */
extern T4 T98f13(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].resize */
extern void T98f49(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_resize */
extern void T98f57(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].special_integer_ */
extern T0* T98f31(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_resize */
extern void T98f56(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_resize */
extern void T98f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T178f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T175f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T175c4(T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_item */
extern T0* T98f21(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_resize */
extern void T98f54(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_modulus */
extern T4 T98f28(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_capacity */
extern T4 T98f12(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_put */
extern void T98f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].search_position */
extern void T98f40(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].unset_found_item */
extern void T98f43(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].has */
extern T2 T98f1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T136c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T136f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T100c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T136f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T136f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T136f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T136f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T136f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER].make */
extern T0* T171c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T136f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T136f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T136f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T136f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T136f32(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T136f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T136f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1301os5558;
extern T0* ge1301ov5558;
extern T0* T136f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T136f53(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1301os5557;
extern T0* ge1301ov5557;
extern T0* T136f48(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1301os5556;
extern T0* ge1301ov5556;
extern T0* T136f46(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1301os5555;
extern T0* ge1301ov5555;
extern T0* T136f44(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1301os5554;
extern T0* ge1301ov5554;
extern T0* T136f42(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1301os5551;
extern T0* ge1301ov5551;
extern T0* T136f40(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T136f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T136f223(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
extern void T206f2(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* ARRAY [INTEGER].subcopy */
extern void T155f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].copy_data */
extern void T50f6(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].move_data */
extern void T50f7(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T50f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T50f8(T0* C, T4 a1, T4 a2, T4 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge153os2897;
extern T0* ge153ov2897;
extern T0* T136f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T206c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T136f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1301os5548;
extern T0* ge1301ov5548;
extern T0* T136f38(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T136f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T136f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T136f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T166c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T136f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T2 T130f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T69f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T130c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T130f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T130f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T130f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T130f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T130f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T130f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T130f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T130f32(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T130f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T130f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T130f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T130f52(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T130f46(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T130f44(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T130f42(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T130f40(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T130f38(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T130f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T130f219(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T130f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T130f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T130f36(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T130f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T130f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T130f6(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T69f248(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T133f7(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T69f247(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T69f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T130c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T109f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T109f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T109f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T109f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].resize */
extern T0* T129f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING]].resized_area */
extern T0* T128f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING]].make */
extern T0* T128c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].make */
extern T0* T129f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING]].make_area */
extern T0* T195c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].default_create */
extern T0* T129c3(void);
/* DS_BILINKED_LIST [STRING].force_last */
extern void T110f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].put_right */
extern void T187f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].attach_left */
extern void T187f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].make */
extern T0* T187c4(T0* a1);
/* DS_BILINKED_LIST [STRING].is_empty */
extern T2 T110f3(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T69f162(T0* C);
/* DS_BILINKED_LIST [STRING].set_equality_tester */
extern void T110f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T69f180(T0* C);
/* DS_BILINKED_LIST [STRING].make */
extern T0* T110c11(void);
/* DS_BILINKED_LIST [STRING].new_cursor */
extern T0* T110f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].make */
extern T0* T186c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T109f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T109f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1213os6421;
extern T0* ge1213ov6421;
extern T0* T109f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T109f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T109f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T109f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T109f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T109f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T109f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T109f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T69f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T109c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T127f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T125f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T125c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T127f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T194c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T127c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T109f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T2 T109f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T2 T109f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T2 T109f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T2 T109f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T109f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T126f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T123f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T123c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T126f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T193c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T126c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T108f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T184f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T184f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T184c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T2 T108f3(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T69f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T108c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T108f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T183c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T69f246(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T183f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T108f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T108f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T183f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T108f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T183f10(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T69f256(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T133f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T183f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T183f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T108f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T2 T108f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T107f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T107c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T107f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T107f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T107f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T107f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T107f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T107f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T182c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T182f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T229c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T107c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T182f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T230f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T230f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T230c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T2 T182f3(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T107c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T182f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T69f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T107c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T69f245(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T107f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T107f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T107c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T107f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T121f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T120f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T120c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T121f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T192c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T121c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T107c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T107f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T69f244(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T133f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T69f243(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T2 T106f1(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T106f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T4 T106f11(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T4 T106f12(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T4 T103f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T103f13(T0* C, T4 a1);
/* DS_BILINKED_LIST [STRING].item */
extern T0* T110f8(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T2 T180f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_item */
extern T0* T106f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_item */
extern T0* T106f29(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T106f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T4 T106f13(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T119f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T118f2(T0* C, T4 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T118c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T119f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T191c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T119c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T106f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_put */
extern void T106f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T106f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T106f37(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T106f36(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T106f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T106f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_resize */
extern void T106f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_resize */
extern void T106f45(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T106f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T4 T106f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T4 T106f7(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T106f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T69f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T106c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T180c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T106f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T106f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T181c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T106f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T106f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_keys */
extern void T106f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_items */
extern void T106f40(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T69f242(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T69f241(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T103f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].forth */
extern void T186f9(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_forth */
extern void T110f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].add_traversing_cursor */
extern void T110f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T186f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].remove_traversing_cursor */
extern void T110f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set */
extern void T186f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [STRING].item */
extern T0* T186f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].start */
extern void T186f8(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_start */
extern void T110f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].cursor_off */
extern T2 T110f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T103f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T103f16(T0* C);
/* DS_BILINKED_LIST [STRING].last */
extern T0* T110f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T103f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T2 T103f15(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T69f240(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T2 T103f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T2 T103f14(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T103f8(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T117f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T115f3(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T117f1(T0* C, T4 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T190c2(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T117c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T69f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T100f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1299os4202;
extern T0* ge1299ov4202;
extern T0* T69f25(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T134c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T134f205(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T134f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T134f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T134f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T134f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T134f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T134f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T134f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T134f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T134f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T134f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T134f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T134f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T134f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T134f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T134f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T134f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T134f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T134f226(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T134f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T134f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T134f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T134f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T134f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T134f16(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T96f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T2 T100f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T69f255(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T100f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T100f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T2 T105f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T69f238(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T133f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T69f237(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T133f4(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T133c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T104f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T104f8(T0* C, T2 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T104f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T114f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T113f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T113c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T114f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T189c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T114c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T104c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T104f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T69f259(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T69f236(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T69f235(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T69f234(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T133f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T69f233(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T69f232(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T133f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T69f231(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T69f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T69f192(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T69f198(T0* C, T0* a1);
/* STRING.remove */
extern void T16f45(T0* C, T4 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T100f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T158f28(T0* C, T4 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T1 T158f13(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].item */
extern T1 T213f2(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T2 T158f12(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T44f27(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T158f30(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].remove */
extern void T213f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].wipe_out */
extern void T213f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T158f32(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T158f34(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T158f35(T0* C, T4 a1);
/* DS_LINKED_QUEUE [CHARACTER].force */
extern void T213f8(T0* C, T1 a1);
/* DS_LINKABLE [CHARACTER].put_right */
extern void T286f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].is_empty */
extern T2 T213f4(T0* C);
/* DS_LINKABLE [CHARACTER].make */
extern T0* T286c3(T1 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T211f23(T0* C, T0* a1, T4 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T211f20(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T158f21(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T41f17(T0* C, T0* a1);
/* UC_UTF8_STRING.old_clear_all */
extern void T157f78(T0* C);
/* STRING.clear_all */
extern void T16f47(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T158f3(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1294os6817;
extern T0* ge1294ov6817;
extern T0* T158f24(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T4 T214f7(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T2 T214f6(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T4 T214f5(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T2 T214f4(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T2 T214f3(T0* C, T4 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge219os3040;
extern T0* ge219ov3040;
extern T0* T158f17(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T214c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T4 T158f23(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T4 T158f22(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T158f33(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T303f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T44f64(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T44f65(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T44f30(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T44f29(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T44f31(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T158f31(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T2 T211f8(T0* C, T1 a1, T1 a2, T1 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T2 T211f7(T0* C, T1 a1, T1 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T2 T214f2(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T2 T214f1(T0* C, T4 a1, T4 a2);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge285os6875;
extern T4 ge285ov6875;
extern T4 T160f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T4 T160f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T159f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T69f199(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T158c27(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].make */
extern T0* T213c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T100f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T2 T130f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T2 T136f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T2 T136f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item */
extern T0* T98f2(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_item */
extern T0* T98f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T69f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T69f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T69f254(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T69f253(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T69f97(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T4 T69f188(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T2 T69f187(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T69f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T157c49(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T157f57(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T2 T69f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T69f95(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T2 T69f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T69f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1299os4269;
extern T0* ge1299ov4269;
extern T0* T69f191(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1299os4270;
extern T0* ge1299ov4270;
extern T0* T69f190(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T69f197(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T157c53(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T112f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T111f2(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T111c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T112f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T188c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T112c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T69f229(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T103f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T103f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T2 T103f1(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T69f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T103f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T103c20(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T103c18(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T69f219(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T69f218(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T69f217(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T69f216(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T69f227(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T69f215(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T69f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T69f252(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T130f221(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T136f225(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T2 T130f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T2 T136f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T130f220(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T303c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T211f21(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T130f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T130f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T136f224(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T136f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T136f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T69f225(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T69f224(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T69f31(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T69f214(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T69f211(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T97c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T69f210(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T69f206(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].wipe_out */
extern void T98f37(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_wipe_out */
extern void T98f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_wipe_out */
extern void T98f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_wipe_out */
extern void T98f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_wipe_out */
extern void T98f44(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].move_all_cursors_after */
extern void T98f42(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_next_cursor */
extern void T177f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_position */
extern void T177f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T69f204(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T92c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T92f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T92f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T92f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T92f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T92f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T92f182(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T92f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T92f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T92f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T92f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T92f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T92f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T92f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T92f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T92f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T92f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T92f224(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T92f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T92f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T92f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T92f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T92f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T92f15(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T45c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T73f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T140c2(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T200c7(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T200f2(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T236c3(T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T69f202(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T70c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T70f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T139f4(T0* C, T4 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T73c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T70f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T76c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T70f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T137c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T69f201(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T69c200(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T69f22(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].set_key_equality_tester */
extern void T98f39(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map_default */
extern T0* T98c36(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map */
extern void T98f41(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_with_equality_testers */
extern void T98f53(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_sparse_container */
extern void T98f58(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_cursor */
extern T0* T98f34(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T177c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_slots */
extern void T98f62(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_clashes */
extern void T98f61(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_keys */
extern void T98f60(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_items */
extern void T98f59(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T178f2(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T228c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T178c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].default_capacity */
extern T4 T98f7(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T69f205(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T69f209(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1295os4149;
extern T0* ge1295ov4149;
extern T0* T69f52(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T69f182(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1295os4148;
extern T0* ge1295ov4148;
extern T0* T69f50(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1295os4147;
extern T0* ge1295ov4147;
extern T0* T69f48(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1295os4146;
extern T0* ge1295ov4146;
extern T0* T69f46(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1295os4145;
extern T0* ge1295ov4145;
extern T0* T69f44(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1295os4144;
extern T0* ge1295ov4144;
extern T0* T69f42(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1295os4143;
extern T0* ge1295ov4143;
extern T0* T69f40(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1295os4142;
extern T0* ge1295ov4142;
extern T0* T69f38(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1295os4141;
extern T0* ge1295ov4141;
extern T0* T69f36(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1295os4140;
extern T0* ge1295ov4140;
extern T0* T69f34(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T69f208(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T67f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T2 T67f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T67c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T44f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T44f3(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T44f56(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T44f19(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T44f25(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T44f61(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T44f22(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T44f61p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T44f24(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T44f7(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T64f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T64f3(T0* C, T14 a1, T4 a2);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T90f2(T90* C);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2051os2400;
extern T0* ge2051ov2400;
extern T0* T44f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T64c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T64f16(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T64f5(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T44f59(T0* C);
/* UNIX_FILE_INFO.update */
extern void T64f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T64f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T44f6(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T44f13(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T44f55(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T44c55(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T44f60(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T44f16(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T21c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T2 T42f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T2 T44f2(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T2 T44f8(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T2 T64f2(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T4 T64f4(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.reset */
extern void T44f58(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge266os2928;
extern T0* ge266ov2928;
extern T0* T42f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T2 T43f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T43f6(T0* C);
/* GEANT.default_build_filename */
extern unsigned char ge56os1305;
extern T0* ge56ov1305;
extern T0* T19f8(T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T22f7(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T22f6(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T22f5(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T22c4(void);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T23c53(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge61os1439;
extern T0* ge61ov1439;
extern T0* T23f8(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge61os1438;
extern T0* ge61ov1438;
extern T0* T23f7(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge61os1437;
extern T0* ge61ov1437;
extern T0* T23f6(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge61os1436;
extern T0* ge61ov1436;
extern T0* T23f5(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge61os1435;
extern T0* ge61ov1435;
extern T0* T23f4(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T27f30(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge63os1311;
extern T0* ge63ov1311;
extern T0* T23f3(T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T23f39(T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T23f41(T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T23f40(T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T23f38(T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge61os1434;
extern T0* ge61ov1434;
extern T0* T23f2(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T23f1(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T23f53p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T23f56(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T23f55(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T23f58(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T23f66(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T23f34(T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T23f74(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T23f73(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_keys */
extern void T23f72(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_items */
extern void T23f71(T0* C, T4 a1);
/* GEANT_VARIABLES.set_variable_value */
extern void T27f44(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force */
extern void T27f45(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.keys_put */
extern void T27f54(T0* C, T0* a1, T4 a2);
/* GEANT_VARIABLES.slots_put */
extern void T27f53(T0* C, T4 a1, T4 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T27f52(T0* C, T4 a1, T4 a2);
/* GEANT_VARIABLES.resize */
extern void T27f51(T0* C, T4 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T27f59(T0* C, T4 a1);
/* GEANT_VARIABLES.keys_resize */
extern void T27f58(T0* C, T4 a1);
/* GEANT_VARIABLES.items_resize */
extern void T27f57(T0* C, T4 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T27f56(T0* C, T4 a1);
/* GEANT_VARIABLES.new_capacity */
extern T4 T27f5(T0* C, T4 a1);
/* GEANT_VARIABLES.items_put */
extern void T27f50(T0* C, T0* a1, T4 a2);
/* GEANT.default_builtin_variables */
extern T0* T19f4(T0* C);
/* GEANT.file_system */
extern T0* T19f18(T0* C);
/* GEANT.unix_file_system */
extern T0* T19f21(T0* C);
/* GEANT.windows_file_system */
extern T0* T19f20(T0* C);
/* GEANT.operating_system */
extern T0* T19f17(T0* C);
/* GEANT.read_command_line */
extern void T19f23(T0* C);
/* GEANT.commandline_variables */
extern T0* T19f12(T0* C);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T32f43(T0* C, T0* a1, T0* a2);
/* GEANT.report_usage_error */
extern void T19f31(T0* C);
/* GEANT.usage_message */
extern unsigned char ge56os1304;
extern T0* ge56ov1304;
extern T0* T19f16(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T38c7(T0* a1);
/* GEANT.string_ */
extern T0* T19f19(T0* C);
/* GEANT.report_usage_message */
extern void T19f30(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T26f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T26f10(T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T19f29(T0* C, T2 a1);
/* GEANT.set_debug_mode */
extern void T19f28(T0* C, T2 a1);
/* GEANT.set_no_exec */
extern void T19f27(T0* C, T2 a1);
/* GEANT.set_verbose */
extern void T19f26(T0* C, T2 a1);
/* GEANT.report_version_number */
extern void T19f25(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T36c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T25f2(T0* C, T4 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T26c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T26f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T25f5(T0* C, T0* a1);
/* GEANT.arguments */
extern unsigned char ge206os1330;
extern T0* ge206ov1330;
extern T0* T19f1(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T25c4(void);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T456f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T430f12(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T430f12p1(T0* C, T4 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T454f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T452f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T430f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T430f11p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.execute */
extern void T263f25(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T337f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T2 T42f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T2 T44f38(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T2 T43f26(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T337f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T337f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T337f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T337f11(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T263f27(T0* C, T4 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T263f19(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T263f18(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T263f17(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T263f16(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T263f23(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T263f22(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T263f21(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T262f27(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T336f8(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T262f18(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T262f17(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T262f25(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T262f24(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T262f23(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T261f23(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T335f7(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T261f25(T0* C, T4 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T261f17(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T261f16(T0* C);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T261f15(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T261f14(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T261f21(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T261f20(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T261f19(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T260f27(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T334f25(T0* C);
/* GEANT_FILESET.forth */
extern void T310f37(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T310f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T310f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T23f80(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T23f82(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T23f84(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T23f86(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_position */
extern void T51f10(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T23f85(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_next_cursor */
extern void T51f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T23f83(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T2 T310f24(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T2 T354f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T2 T354f7(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T354f40(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T354f45(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T354f58(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T373f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T354f57(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T373f5(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T4 T354f26(T0* C, T4 a1);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T310f23(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T360f7(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T360f9(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T360f8(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T360f11(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T360f10(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T354f2(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T354f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].items_item */
extern T0* T354f9(T0* C, T4 a1);
/* GEANT_FILESET.item_filename */
extern T0* T310f22(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T360f6(T0* C);
/* GEANT_FILESET.after */
extern T2 T310f2(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T2 T354f1(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T2 T354f5(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T310f36(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T354f39(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T354f44(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T2 T354f25(T0* C);
/* GEANT_FILESET.execute */
extern void T310f35(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T310f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T354f42(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T354f52(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].keys_put */
extern void T354f65(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].items_put */
extern void T354f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T354f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T354f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T354f64(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T354f67(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T354f66(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T354f63(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T354f31(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T4 T354f19(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T4 T354f17(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T4 T360f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].keys_item */
extern T0* T354f32(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T354f47(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T2 T375f1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T2 T360f4(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T360f5(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T360c12(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING].forth */
extern void T358f8(T0* C);
/* DS_HASH_SET [STRING].cursor_forth */
extern void T356f52(T0* C, T0* a1);
/* DS_HASH_SET [STRING].add_traversing_cursor */
extern void T356f54(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_next_cursor */
extern void T358f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING].remove_traversing_cursor */
extern void T356f53(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].set_position */
extern void T358f9(T0* C, T4 a1);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T310f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T354f41(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T354f49(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T354f62(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].keys_resize */
extern void T354f61(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].items_resize */
extern void T354f60(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].resize */
extern T0* T376f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].resized_area */
extern T0* T374f3(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T354f59(T0* C, T4 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T4 T354f16(T0* C, T4 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T2 T310f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T4 T42f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T4 T44f39(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T4 T44f41(T0* C);
/* UNIX_FILE_INFO.date */
extern T4 T64f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T4 T43f30(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T351f2(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T157f77(T0* C, T4 a1);
/* STRING.remove_tail */
extern void T16f50(T0* C, T4 a1);
/* UC_UTF8_STRING.remove_head */
extern void T157f76(T0* C, T4 a1);
/* STRING.remove_head */
extern void T16f49(T0* C, T4 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T351f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T351f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T372f3(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T372f299(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T372f310(T0* C, T0* a1, T4 a2, T4 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T372f325(T0* C, T0* a1, T4 a2, T4 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T2 T372f147(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T4 T372f229(T0* C, T4 a1, T2 a2, T2 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T4 T372f293(T0* C, T4 a1, T4 a2, T4 a3, T2 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T4 T372f292(T0* C, T4 a1, T4 a2, T4 a3, T2 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge473os9101;
extern T4 ge473ov9101;
extern T4 T372f56(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T372f192(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T4 T372f291(T0* C, T4 a1, T4 a2, T4 a3, T2 a4);
/* RX_BYTE_CODE.character_item */
extern T4 T394f4(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T4 T372f290(T0* C, T4 a1);
/* RX_BYTE_CODE.character_set_has */
extern T2 T394f5(T0* C, T4 a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T4 T372f289(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T4 T372f295(T0* C, T4 a1, T4 a2, T4 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge479os9268;
extern T0* ge479ov9268;
extern T0* T372f148(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T396c4(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T396f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T396f9(T0* C, T4 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T396f5(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T396c5(void);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge158os1669;
extern T0* ge158ov1669;
extern T0* T396f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge479os9260;
extern T0* ge479ov9260;
extern T0* T372f164(T0* C);
/* RX_CHARACTER_SET.has */
extern T2 T396f1(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T372f323(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T2 T372f82(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T2 T372f81(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T2 T372f80(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T372f332(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T372f331(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T4 T372f288(T0* C, T4 a1, T2 a2, T2 a3);
/* RX_BYTE_CODE.integer_item */
extern T4 T394f2(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T4 T372f286(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T4 T372f267(T0* C, T4 a1, T4 a2);
/* RX_BYTE_CODE.opcode_item */
extern T4 T394f3(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T372f12(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T4 T395f2(T0* C, T4 a1);
/* RX_CASE_MAPPING.to_lower */
extern T4 T395f1(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T4 T372f49(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T372f311(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T372f326(T0* C, T0* a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T4 T372f48(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T372f4(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T2 T372f2(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T372f298(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T2 T372f1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T372f297(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T372f297p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T372f309(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T2 T372f47(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T4 T372f187(T0* C, T4 a1, T4 a2, T2 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T4 T372f46(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T372f308(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T2 T372f45(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T4 T372f43(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T4 T372f128(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T4 T372f126(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T4 T372f124(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T372f307(T0* C, T4 a1, T2 a2, T2 a3, T4 a4);
/* RX_BYTE_CODE.set_count */
extern void T394f18(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T4 T372f61(T0* C, T4 a1);
/* RX_BYTE_CODE.put_integer */
extern void T394f17(T0* C, T4 a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T372f324(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge479os9269;
extern T0* ge479ov9269;
extern T0* T372f144(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge473os9102;
extern T4 ge473ov9102;
extern T4 T372f143(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T394f19(T0* C, T4 a1);
/* RX_BYTE_CODE.put_character */
extern void T394f25(T0* C, T4 a1, T4 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T394f24(T0* C, T4 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T394f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T4 T372f138(T0* C, T4 a1, T2 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T4 T372f219(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge479os9262;
extern T0* ge479ov9262;
extern T0* T372f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T4 T372f218(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T4 T372f214(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T4 T372f131(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T372f322(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T4 T372f129(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T4 T372f127(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T4 T372f125(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T4 T372f106(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T372f329(T0* C, T4 a1, T4 a2, T4 a3, T4 a4, T4 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T394f23(T0* C, T4 a1, T4 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T394f22(T0* C, T4 a1, T4 a2);
/* RX_BYTE_CODE.move_right */
extern void T394f21(T0* C, T4 a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T372f330(T0* C, T4 a1, T4 a2, T4 a3, T4 a4, T4 a5, T4 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T372f328(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T394f20(T0* C, T0* a1, T2 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T394f26(T0* C, T4 a1);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T394f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T396f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T396f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T399f4(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge479os9271;
extern T0* ge479ov9271;
extern T0* T372f156(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge479os9256;
extern T0* ge479ov9256;
extern T0* T372f26(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge479os9266;
extern T0* ge479ov9266;
extern T0* T372f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge479os9265;
extern T0* ge479ov9265;
extern T0* T372f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge479os9264;
extern T0* ge479ov9264;
extern T0* T372f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge479os9263;
extern T0* ge479ov9263;
extern T0* T372f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge479os9267;
extern T0* ge479ov9267;
extern T0* T372f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge479os9261;
extern T0* ge479ov9261;
extern T0* T372f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge479os9257;
extern T0* ge479ov9257;
extern T0* T372f234(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge479os9258;
extern T0* ge479ov9258;
extern T0* T372f233(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge479os9259;
extern T0* ge479ov9259;
extern T0* T372f231(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T4 T372f154(T0* C, T4 a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge479os9270;
extern T0* ge479ov9270;
extern T0* T372f232(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T4 T372f152(T0* C, T4 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T396f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge473os9100;
extern T0* ge473ov9100;
extern T0* T372f149(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T2 T372f84(T0* C, T4 a1, T4 a2, T4 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T372f327(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T2 T372f58(T0* C, T4 a1);
/* RX_BYTE_CODE.append_integer */
extern void T394f16(T0* C, T4 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T394f15(T0* C, T4 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T372f306(T0* C, T0* a1, T4 a2, T4 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T372f305(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T394f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T372f304(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T372f304p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T372c296(void);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T372f296p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T372f303(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T372f321(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T372f320(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T372f319(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T372f318(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T372f317(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T372f316(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T372f315(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T372f314(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T372f313(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T372f312(T0* C, T2 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T372f302(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T372f301(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge479os9255;
extern T0* ge479ov9255;
extern T0* T372f25(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T395c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T395f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T395f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T395f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T395f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T372f300(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T372f300p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern */
extern unsigned char ge473os9099;
extern T0* ge473ov9099;
extern T0* T372f24(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T394c13(T4 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge137os8520;
extern T0* ge137ov8520;
extern T0* T351f8(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge137os8518;
extern T0* ge137ov8518;
extern T0* T351f7(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T351f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge137os8517;
extern T0* ge137ov8517;
extern T0* T351f6(T0* C);
/* GEANT_MAP.string_ */
extern T0* T351f4(T0* C);
/* GEANT_MAP.is_executable */
extern T2 T351f1(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge137os8519;
extern T0* ge137ov8519;
extern T0* T351f9(T0* C);
/* DS_HASH_SET_CURSOR [STRING].item */
extern T0* T358f2(T0* C);
/* DS_HASH_SET [STRING].cursor_item */
extern T0* T356f28(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].after */
extern T2 T358f1(T0* C);
/* DS_HASH_SET [STRING].cursor_after */
extern T2 T356f27(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING].start */
extern void T358f7(T0* C);
/* DS_HASH_SET [STRING].cursor_start */
extern void T356f51(T0* C, T0* a1);
/* DS_HASH_SET [STRING].cursor_off */
extern T2 T356f33(T0* C, T0* a1);
/* DS_HASH_SET [STRING].is_empty */
extern T2 T356f32(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T310f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T302f40(T0* C);
/* KL_DIRECTORY.old_close */
extern void T302f43(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T302f22(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T302f44(T0* C, T14 a1);
/* LX_DFA_WILDCARD.recognizes */
extern T2 T359f2(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T4 T359f7(T0* C, T0* a1, T4 a2);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T2 T310f3(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T2 T42f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T2 T302f24(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T2 T302f14(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T2 T302f25(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T2 T43f29(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T310f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T302f39(T0* C);
/* KL_DIRECTORY.readentry */
extern void T302f42(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T302f21(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T2 T302f17(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T2 T302f9(T0* C);
/* KL_DIRECTORY.is_closed */
extern T2 T302f12(T0* C);
/* KL_DIRECTORY.open_read */
extern void T302f38(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T302f41(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T302f19(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T43f28(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T63f18(T0* C);
/* GEANT_FILESET.unix_file_system */
extern T0* T310f21(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T310f19(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T310f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T310f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T2 T310f1(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T2 T310f4(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T2 T334f15(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T334f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T334f12(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T334f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T334f16(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T2 T334f4(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T260f29(T0* C, T4 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T260f21(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T260f20(T0* C);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T260f19(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T260f18(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T260f25(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T260f24(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T260f23(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T259f40(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T331f37(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T331f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T331f44(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T349f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T349f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T349f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T4 T349f9(T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2187os3718;
extern T0* ge2187ov3718;
extern T0* T349f8(T0* C);
/* DP_SHELL_COMMAND.get */
extern T0* T349f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T349f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T349c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T349f3(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].item */
extern T0* T333f2(T0* C, T4 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T331f21(T0* C);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T331f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T331f41(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T331f40(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T2 T331f20(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T27f70(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T331f19(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T331f18(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T331f23(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T331f22(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T259f42(T0* C, T4 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T259f32(T0* C);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T259f30(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T259f29(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T259f38(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T259f37(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T259f36(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T258f23(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T330f10(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T77f8(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.put */
extern void T77f9(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.eif_putenv */
extern T4 T77f6(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T141f4(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].force */
extern void T387f26(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].set_default */
extern void T387f32(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].set_not_deleted */
extern void T387f31(T0* C, T4 a1);
/* GE_HASH_TABLE [C_STRING, STRING].internal_search */
extern void T387f30(T0* C, T0* a1);
/* GE_STRING_EQUALITY_TESTER.test */
extern T2 T436f1(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].add_space */
extern void T387f29(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].accommodate */
extern void T387f33(T0* C, T4 a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_deleted_marks */
extern void T387f37(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_keys */
extern void T387f36(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_content */
extern void T387f35(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].put */
extern void T387f34(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].set_inserted */
extern void T387f40(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].put_at_position */
extern void T387f39(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING].set_conflict */
extern void T387f38(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].found */
extern T2 T387f15(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].occupied */
extern T2 T387f21(T0* C, T4 a1);
/* GE_HASH_TABLE [C_STRING, STRING].set_key_equality_tester */
extern void T387f27(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING].make_map */
extern T0* T387c25(T4 a1);
/* GE_HASH_TABLE [C_STRING, STRING].make */
extern void T387f25p1(T0* C, T4 a1);
/* ARRAY [C_STRING].make */
extern T0* T442c4(T4 a1, T4 a2);
/* ARRAY [C_STRING].make_area */
extern void T442f5(T0* C, T4 a1);
/* SPECIAL [C_STRING].make */
extern T0* T441c2(T4 a1);
/* PRIMES.higher_prime */
extern T4 T440f1(T0* C, T4 a1);
/* PRIMES.is_prime */
extern T2 T440f3(T0* C, T4 a1);
/* PRIMES.default_create */
extern T0* T440c5(void);
/* GE_HASH_TABLE [C_STRING, STRING].soon_full */
extern T2 T387f8(T0* C);
/* REAL.infix ">=" */
extern T2 T12f2(T12* C, T12 a1);
/* GE_HASH_TABLE [C_STRING, STRING].not_found */
extern T2 T387f7(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING].search */
extern void T387f28(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2037os3727;
extern T0* ge2037ov3727;
extern T0* T77f4(T0* C);
/* GE_STRING_EQUALITY_TESTER.default_create */
extern T0* T436c2(void);
/* C_STRING.make */
extern T0* T141c10(T0* a1);
/* C_STRING.set_string */
extern void T141f11(T0* C, T0* a1);
/* MANAGED_POINTER.put_natural_8 */
extern void T207f11(T0* C, T8 a1, T4 a2);
/* POINTER.memory_copy */
extern void T14f8(T14* C, T14 a1, T4 a2);
/* POINTER.c_memcpy */
extern void T14f10(T14* C, T14 a1, T14 a2, T4 a3);
/* TYPED_POINTER [NATURAL_8].to_pointer */
extern T14 T283f2(T283* C);
/* INTEGER.to_natural_8 */
extern T8 T4f22(T4* C);
/* MANAGED_POINTER.resize */
extern void T207f10(T0* C, T4 a1);
/* POINTER.memory_set */
extern void T14f7(T14* C, T4 a1, T4 a2);
/* POINTER.c_memset */
extern void T14f9(T14* C, T14 a1, T4 a2, T4 a3);
/* POINTER.memory_realloc */
extern T14 T14f4(T14* C, T4 a1);
/* POINTER.c_realloc */
extern T14 T14f6(T14* C, T14 a1, T4 a2);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T330f6(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T258f25(T0* C, T4 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T258f17(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T258f16(T0* C);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T258f15(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T258f14(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T258f21(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T258f20(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T258f19(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T257f25(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T329f20(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T329f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T42f42(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T302f47(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T42f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T42f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T63f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T63f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T63f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T302f26(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T302f30(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T302f29(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T302f28(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T302f50(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T302f53(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T302f54(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T43f38(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T329f12(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T329f14(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T329f13(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T2 T329f4(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T329f23(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T2 T42f33(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T2 T44f40(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T44f69(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T44f71(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T44f45(T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T44f50(T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T44f49(T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T44f48(T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T4 T44f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T4 T44f47(T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T4 T44f52(T0* C, T14 a1);
/* UNIX_FILE_INFO.size */
extern T4 T64f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T2 T44f51(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T4 T44f43(T0* C);
/* UNIX_FILE_INFO.inode */
extern T4 T64f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge265os3174;
extern T0* ge265ov3174;
extern T0* T44f42(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T2 T43f31(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T42f44(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T44f68(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T43f40(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T329f11(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T329f22(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T2 T329f5(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T257f27(T0* C, T4 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T257f19(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T257f18(T0* C);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T257f17(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T257f16(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T257f23(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T257f22(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T257f21(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T256f30(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T328f24(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T328f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T328f14(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T328f17(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T328f16(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T2 T328f5(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T328f27(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T42f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T44f67(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T385f36(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T385f39(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T385f40(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T386f22(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T386f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T386f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T386f21(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T386f25(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T386f27(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T386f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T385f35(T0* C, T4 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T4 T385f19(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge276os3154;
extern T0* ge276ov3154;
extern T0* T385f32(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T385f30(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T4 T385f18(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T4 T385f29(T0* C, T14 a1, T14 a2, T4 a3);
/* SPECIAL [CHARACTER].item_address */
extern T14 T15f5(T0* C, T4 a1);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T2 T385f17(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T2 T385f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T2 T386f1(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T2 T386f2(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T386f20(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T2 T386f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T2 T386f18(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T386f24(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T386f15(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T386f24p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T386f17(T0* C, T14 a1, T4 a2);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T386c19(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T386f23(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T2 T385f1(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T2 T385f4(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T385f34(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T2 T385f16(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T2 T385f27(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T385f38(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T385f22(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T385f38p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T385f24(T0* C, T14 a1, T4 a2);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T2 T385f15(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T385f26(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T385f41(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T2 T385f14(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T2 T385f25(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T385c33(T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T385f37(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T385f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T43f39(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T2 T328f15(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T328f13(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T328f26(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T2 T328f6(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T256f32(T0* C, T4 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T256f21(T0* C);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T256f19(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T256f18(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T256f28(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T256f27(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T256f26(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T255f25(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T325f22(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T327f24(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T327f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T327f3(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T2 T327f2(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T327f23(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T327f22(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T327f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T327f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T327f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T327f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T327f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T327f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T327f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T327f13(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T2 T327f1(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T2 T325f8(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T2 T325f7(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T42f38(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T44f66(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T44f70(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T44f72(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T43f34(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T2 T325f5(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T42f40(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T302f45(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T302f48(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T302f49(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T302f52(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T2 T302f32(T0* C);
/* KL_DIRECTORY.count */
extern T4 T302f34(T0* C);
/* DIRECTORY.close */
extern void T391f18(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T391f8(T0* C);
/* DIRECTORY.dir_close */
extern void T391f23(T0* C, T14 a1);
/* DIRECTORY.readentry */
extern void T391f17(T0* C);
/* DIRECTORY.dir_next */
extern T0* T391f7(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T391f16(T0* C);
/* DIRECTORY.dir_rewind */
extern void T391f22(T0* C, T14 a1);
/* DIRECTORY.make_open_read */
extern T0* T391c15(T0* a1);
/* DIRECTORY.open_read */
extern void T391f21(T0* C);
/* DIRECTORY.dir_open */
extern T14 T391f10(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T391f13(T0* C, T0* a1);
/* DIRECTORY.make */
extern T0* T391c13(T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T302f51(T0* C);
/* ARRAYED_LIST [STRING].forth */
extern void T392f15(T0* C);
/* RAW_FILE.delete */
extern void T390f11(T0* C);
/* RAW_FILE.file_unlink */
extern void T390f13(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T2 T390f4(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T2 T64f13(T0* C);
/* RAW_FILE.buffered_file_info */
extern T0* T390f7(T0* C);
/* RAW_FILE.set_buffer */
extern void T390f12(T0* C);
/* DIRECTORY.recursive_delete */
extern void T391f14(T0* C);
/* DIRECTORY.delete */
extern void T391f20(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T391f24(T0* C, T14 a1);
/* DIRECTORY.is_empty */
extern T2 T391f5(T0* C);
/* DIRECTORY.count */
extern T4 T391f12(T0* C);
/* DIRECTORY.delete_content */
extern void T391f19(T0* C);
/* DIRECTORY.linear_representation */
extern T0* T391f9(T0* C);
/* ARRAYED_LIST [STRING].extend */
extern void T392f16(T0* C, T0* a1);
/* ARRAYED_LIST [STRING].force_i_th */
extern void T392f19(T0* C, T0* a1, T4 a2);
/* ARRAYED_LIST [STRING].put_i_th */
extern void T392f22(T0* C, T0* a1, T4 a2);
/* ARRAYED_LIST [STRING].auto_resize */
extern void T392f21(T0* C, T4 a1, T4 a2);
/* ARRAYED_LIST [STRING].capacity */
extern T4 T392f10(T0* C);
/* ARRAYED_LIST [STRING].make_area */
extern void T392f20(T0* C, T4 a1);
/* ARRAYED_LIST [STRING].additional_space */
extern T4 T392f9(T0* C);
/* ARRAYED_LIST [STRING].empty_area */
extern T2 T392f8(T0* C);
/* ARRAYED_LIST [STRING].set_count */
extern void T392f17(T0* C, T4 a1);
/* ARRAYED_LIST [STRING].make */
extern T0* T392c13(T4 a1);
/* ARRAYED_LIST [STRING].array_make */
extern void T392f18(T0* C, T4 a1, T4 a2);
/* RAW_FILE.is_directory */
extern T2 T390f3(T0* C);
/* UNIX_FILE_INFO.is_directory */
extern T2 T64f12(T0* C);
/* RAW_FILE.is_symlink */
extern T2 T390f2(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T2 T64f11(T0* C);
/* RAW_FILE.exists */
extern T2 T390f1(T0* C);
/* RAW_FILE.file_exists */
extern T2 T390f6(T0* C, T14 a1);
/* RAW_FILE.make */
extern T0* T390c10(T0* a1);
/* FILE_NAME.set_file_name */
extern void T389f11(T0* C, T0* a1);
/* FILE_NAME.set_count */
extern void T389f16(T0* C, T4 a1);
/* FILE_NAME.c_strlen */
extern T4 T389f4(T0* C, T14 a1);
/* FILE_NAME.eif_append_file_name */
extern void T389f15(T0* C, T14 a1, T14 a2, T14 a3);
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

#endif
/* TYPED_POINTER [FILE_NAME].to_pointer */
extern T14 T443f2(T443* C);
/* FILE_NAME.resize */
extern void T389f14(T0* C, T4 a1);
/* FILE_NAME.capacity */
extern T4 T389f2(T0* C);
/* FILE_NAME.make_from_string */
extern T0* T389c10(T0* a1);
/* FILE_NAME.append */
extern void T389f13(T0* C, T0* a1);
/* FILE_NAME.additional_space */
extern T4 T389f6(T0* C);
/* FILE_NAME.string_make */
extern void T389f12(T0* C, T4 a1);
/* FILE_NAME.make_area */
extern void T389f17(T0* C, T4 a1);
/* ARRAYED_LIST [STRING].item */
extern T0* T392f2(T0* C);
/* ARRAYED_LIST [STRING].after */
extern T2 T392f1(T0* C);
/* ARRAYED_LIST [STRING].start */
extern void T392f14(T0* C);
/* KL_DIRECTORY.linear_representation */
extern T0* T302f33(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T43f36(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T325f14(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T325f13(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T325f16(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T325f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T2 T325f6(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T255f27(T0* C, T4 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T255f19(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T255f18(T0* C);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T255f17(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T255f16(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T255f23(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T255f22(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T255f21(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T254f22(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T324f11(T0* C);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T324f6(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T324f5(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T324f8(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T324f7(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T254f24(T0* C, T4 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T254f16(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T254f15(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T254f14(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T254f13(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T254f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T254f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T254f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T253f28(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T323f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T365f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T365f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T365f32(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T365f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T365f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T365f28(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T365f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T365f33(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T365f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T2 T365f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T2 T365f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T365f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T2 T365f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T2 T365f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T365f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T365f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T365f27p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T365f17(T0* C, T14 a1, T4 a2);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T365f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T365f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T365f26p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T365c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T365f25(T0* C, T0* a1);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T253f17(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T253f16(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T253f26(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T253f25(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T253f24(T0* C);
/* GEANT_GEXMLSPLIT_TASK.execute */
extern void T252f22(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.execute */
extern void T322f12(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.execute_shell */
extern void T322f14(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.string_ */
extern T0* T322f7(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.unix_file_system */
extern T0* T322f6(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.file_system */
extern T0* T322f5(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.windows_file_system */
extern T0* T322f9(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.operating_system */
extern T0* T322f8(T0* C);
/* GEANT_GEXMLSPLIT_TASK.exit_application */
extern void T252f24(T0* C, T4 a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.exceptions */
extern T0* T252f16(T0* C);
/* GEANT_GEXMLSPLIT_TASK.std */
extern T0* T252f15(T0* C);
/* GEANT_GEXMLSPLIT_TASK.dir_attribute_name */
extern T0* T252f14(T0* C);
/* GEANT_GEXMLSPLIT_TASK.file_system */
extern T0* T252f13(T0* C);
/* GEANT_GEXMLSPLIT_TASK.unix_file_system */
extern T0* T252f20(T0* C);
/* GEANT_GEXMLSPLIT_TASK.windows_file_system */
extern T0* T252f19(T0* C);
/* GEANT_GEXMLSPLIT_TASK.operating_system */
extern T0* T252f18(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T251f34(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T320f29(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T320f34(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T2 T320f18(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T320f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T23f52(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T320f16(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T320f32(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T2 T24f78(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T2 T20f21(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T20f22(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T320f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T320f20(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T320f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T320f31(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T320f36(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T320f17(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T23f81(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T320f15(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T320f14(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T320f13(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T320f22(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T320f21(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T2 T320f5(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T251f23(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T251f22(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T251f32(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T251f31(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T251f30(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T250f38(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T319f31(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T319f33(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T319f17(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T319f16(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T319f19(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T319f18(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T319f15(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T250f40(T0* C, T4 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T250f31(T0* C);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T250f29(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T250f28(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T250f36(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T250f35(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T250f34(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T249f33(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T318f26(T0* C);
/* GEANT_FILESET.has_map */
extern T2 T310f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T318f29(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T2 T318f16(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T318f15(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T318f14(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T318f18(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T318f17(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T2 T318f5(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T318f28(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T318f13(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T249f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T249f24(T0* C);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T249f22(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T249f21(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T249f31(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T249f30(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T249f29(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T248f33(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T317f26(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T317f28(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T317f14(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T317f13(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T317f12(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T317f16(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T317f15(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T248f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T248f24(T0* C);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T248f22(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T248f21(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T248f31(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T248f30(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T248f29(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T247f36(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T316f32(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T316f34(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T316f17(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T316f16(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T316f19(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T316f18(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T316f15(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T247f38(T0* C, T4 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T247f28(T0* C);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T247f26(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T247f25(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T247f34(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T247f33(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T247f32(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T246f34(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T314f27(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T314f29(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T314f17(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T314f16(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T314f19(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T314f18(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T2 T314f8(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T2 T314f7(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T2 T314f6(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T314f15(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T246f36(T0* C, T4 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T246f25(T0* C);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T246f23(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T246f22(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T246f32(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T246f31(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T246f30(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T245f22(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T313f7(T0* C);
/* GEANT_UNSET_TASK.exit_application */
extern void T245f24(T0* C, T4 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T245f16(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T245f15(T0* C);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T245f14(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T245f13(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T245f20(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T245f19(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T245f18(T0* C);
/* GEANT_SET_TASK.execute */
extern void T244f23(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T312f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T244f25(T0* C, T4 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T244f17(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T244f16(T0* C);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T244f15(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T244f14(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T244f21(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T244f20(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T244f19(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T243f23(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T311f14(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T311f16(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T311f8(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T311f7(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T311f6(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T311f10(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T311f9(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T243f25(T0* C, T4 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T243f17(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T243f16(T0* C);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T243f15(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T243f14(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T243f21(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T243f20(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T243f19(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T242f29(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T308f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T308f10(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T308f18(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.is_commandline_executable */
extern T2 T308f4(T0* C);
/* GEANT_EXEC_TASK.exit_application */
extern void T242f31(T0* C, T4 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T242f20(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T242f18(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T242f17(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T242f27(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T242f26(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T242f25(T0* C);
/* GEANT_VE_TASK.execute */
extern void T241f33(T0* C);
/* GEANT_VE_COMMAND.execute */
extern void T307f27(T0* C);
/* GEANT_VE_COMMAND.execute_clean */
extern void T307f31(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T42f39(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T43f35(T0* C, T0* a1);
/* GEANT_VE_COMMAND.execute_tuner */
extern void T307f30(T0* C);
/* GEANT_VE_COMMAND.operating_system */
extern T0* T307f17(T0* C);
/* GEANT_VE_COMMAND.is_tunable */
extern T2 T307f6(T0* C);
/* GEANT_VE_COMMAND.execute_shell */
extern void T307f29(T0* C, T0* a1);
/* GEANT_VE_COMMAND.string_ */
extern T0* T307f16(T0* C);
/* GEANT_VE_COMMAND.unix_file_system */
extern T0* T307f15(T0* C);
/* GEANT_VE_COMMAND.file_system */
extern T0* T307f14(T0* C);
/* GEANT_VE_COMMAND.windows_file_system */
extern T0* T307f18(T0* C);
/* GEANT_VE_COMMAND.is_compilable */
extern T2 T307f4(T0* C);
/* GEANT_VE_TASK.exit_application */
extern void T241f35(T0* C, T4 a1, T0* a2);
/* GEANT_VE_TASK.exceptions */
extern T0* T241f24(T0* C);
/* GEANT_VE_TASK.dir_attribute_name */
extern T0* T241f22(T0* C);
/* GEANT_VE_TASK.file_system */
extern T0* T241f21(T0* C);
/* GEANT_VE_TASK.unix_file_system */
extern T0* T241f31(T0* C);
/* GEANT_VE_TASK.windows_file_system */
extern T0* T241f30(T0* C);
/* GEANT_VE_TASK.operating_system */
extern T0* T241f29(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T240f32(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T306f24(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T306f27(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T42f41(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T302f46(T0* C);
/* KL_DIRECTORY.is_empty */
extern T2 T302f23(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge261os8169;
extern T0* ge261ov8169;
extern T0* T302f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T43f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T2 T42f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T2 T43f27(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T306f12(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T306f13(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T306f16(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T306f15(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T306f26(T0* C);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T306f28(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T306f14(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T2 T306f4(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T240f34(T0* C, T4 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T240f23(T0* C);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T240f21(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T240f20(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T240f30(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T240f29(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T240f28(T0* C);
/* GEANT_SE_TASK.execute */
extern void T239f34(T0* C);
/* GEANT_SE_COMMAND.execute */
extern void T305f32(T0* C);
/* GEANT_SE_COMMAND.new_traditional_cmdline */
extern T0* T305f18(T0* C);
/* GEANT_SE_COMMAND.unix_file_system */
extern T0* T305f22(T0* C);
/* GEANT_SE_COMMAND.string_ */
extern T0* T305f19(T0* C);
/* GEANT_SE_COMMAND.new_ace_cmdline */
extern T0* T305f17(T0* C);
/* GEANT_SE_COMMAND.is_ace_configuration */
extern T2 T305f4(T0* C);
/* GEANT_SE_COMMAND.execute_shell */
extern void T305f34(T0* C, T0* a1);
/* GEANT_SE_COMMAND.file_system */
extern T0* T305f16(T0* C);
/* GEANT_SE_COMMAND.windows_file_system */
extern T0* T305f21(T0* C);
/* GEANT_SE_COMMAND.operating_system */
extern T0* T305f20(T0* C);
/* GEANT_SE_COMMAND.new_clean_cmdline */
extern T0* T305f15(T0* C);
/* GEANT_SE_COMMAND.is_cleanable */
extern T2 T305f6(T0* C);
/* GEANT_SE_TASK.exit_application */
extern void T239f36(T0* C, T4 a1, T0* a2);
/* GEANT_SE_TASK.exceptions */
extern T0* T239f25(T0* C);
/* GEANT_SE_TASK.dir_attribute_name */
extern T0* T239f23(T0* C);
/* GEANT_SE_TASK.file_system */
extern T0* T239f22(T0* C);
/* GEANT_SE_TASK.unix_file_system */
extern T0* T239f32(T0* C);
/* GEANT_SE_TASK.windows_file_system */
extern T0* T239f31(T0* C);
/* GEANT_SE_TASK.operating_system */
extern T0* T239f30(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T238f32(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T304f25(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T304f27(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T304f13(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T304f17(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T304f16(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T2 T304f4(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T304f12(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T304f15(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T304f14(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T2 T304f5(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T238f34(T0* C, T4 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T238f23(T0* C);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T238f21(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T238f20(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T238f30(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T238f29(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T238f28(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T267f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T266f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T265f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T152f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T75f31(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T267f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T272f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T272f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T266f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T272f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T265f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T272f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T152f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T272f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T75f36(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T272f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T136f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T136f233(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T168f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T158f25(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge193os3128;
extern T0* ge193ov3128;
extern T0* T303f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T136f233p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T168f19(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_index */
extern void T168f18(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T136f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T168c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T168f21(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T168f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T168f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T168f16(T0* C, T4 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge378os7010;
extern T4 ge378ov7010;
extern T4 T168f11(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T134f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T134f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T134f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T134f19(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T130f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T130f229(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T130f229p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T130f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T92f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T92f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T92f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T92f18(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T136f227(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T136f227p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T136f227p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T136f237(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T166f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T4 T41f14(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T166f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T166f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T166f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T2 T166f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T2 T166f1(T0* C);
/* UC_UNICODE_ROUTINES.valid_code */
extern T2 T226f1(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T166f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T166f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T2 T136f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T136f181(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T4 T136f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T136f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T1 T136f207(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T136f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1303os5617;
extern T0* ge1303ov5617;
extern T0* T136f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T136f241(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T136f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T136f240(T0* C);
/* DS_LINKED_STACK [INTEGER].remove */
extern void T171f7(T0* C);
/* DS_LINKED_STACK [INTEGER].item */
extern T4 T171f2(T0* C);
/* DS_LINKED_STACK [INTEGER].is_empty */
extern T2 T171f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T136f238(T0* C, T4 a1);
/* DS_LINKED_STACK [INTEGER].force */
extern void T171f6(T0* C, T4 a1);
/* DS_LINKABLE [INTEGER].put_right */
extern void T227f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER].make */
extern T0* T227c3(T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T136f239(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T136f236(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T2 T136f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T136f235(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T168f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T279f5(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T158f26(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T158f26p1(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T4 T303f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T44f32(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T44f36(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T44f35(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T44f37(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T44f33(T0* C);
/* YY_FILE_BUFFER.compact_left */
extern void T168f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T279f11(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.resize */
extern void T168f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T279f12(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T4 T136f98(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T4 T136f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T136f234(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T134f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T134f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T134f214(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T2 T134f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T134f159(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T4 T134f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T134f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T1 T134f194(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T134f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T134f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T134f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T134f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T134f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T134f213(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T2 T134f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T134f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T4 T134f66(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T4 T134f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T134f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T134f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T134f209(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T130f223(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T130f223p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T130f232(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T2 T130f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T130f178(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T4 T130f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T130f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T1 T130f205(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T130f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T130f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T130f237(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T130f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T130f236(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T130f233(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T130f235(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T130f231(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T130f234(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T2 T130f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T130f230(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T4 T130f95(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T4 T130f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T92f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T92f209(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T2 T92f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T92f157(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T4 T92f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T92f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T1 T92f192(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T92f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T92f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T92f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T92f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T92f218(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T92f210(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T92f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T92f208(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T92f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T2 T92f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T92f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T4 T92f61(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T4 T92f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T92f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T136f229(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T134f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T130f225(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T92f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T136f230(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T158f29(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T2 T41f12(T0* C, T0* a1, T0* a2);
/* CHARACTER.lower */
extern T1 T1f19(T1* C);
/* CHARACTER.is_upper */
extern T2 T1f20(T1* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T4 T226f2(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge236os7411;
extern T0* ge236ov7411;
extern T0* T226f5(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge236os7410;
extern T0* ge236ov7410;
extern T0* T226f8(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge236os7399;
extern T0* ge236ov7399;
extern T0* T226f15(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T4 T159f3(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T226f24(T0* C);
/* SPECIAL [ARRAY [INTEGER]].make */
extern T0* T299c2(T4 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge236os7409;
extern T0* ge236ov7409;
extern T0* T226f7(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge236os7408;
extern T0* ge236ov7408;
extern T0* T226f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge236os7407;
extern T0* ge236ov7407;
extern T0* T226f6(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge236os7406;
extern T0* ge236ov7406;
extern T0* T226f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge236os7405;
extern T0* ge236ov7405;
extern T0* T226f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge236os7404;
extern T0* ge236ov7404;
extern T0* T226f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge236os7403;
extern T0* ge236ov7403;
extern T0* T226f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge236os7402;
extern T0* ge236ov7402;
extern T0* T226f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge236os7401;
extern T0* ge236ov7401;
extern T0* T226f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge236os7400;
extern T0* ge236ov7400;
extern T0* T226f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge236os7398;
extern T0* ge236ov7398;
extern T0* T226f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge236os7397;
extern T0* ge236ov7397;
extern T0* T226f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge236os7396;
extern T0* ge236ov7396;
extern T0* T226f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge236os7395;
extern T0* ge236ov7395;
extern T0* T226f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge236os7394;
extern T0* ge236ov7394;
extern T0* T226f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge236os7393;
extern T0* ge236ov7393;
extern T0* T226f9(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER]]].make */
extern T0* T300c2(T4 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T41f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T134f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T130f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T92f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T136f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T134f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T130f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T92f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T136f228(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T303f10(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T2 T303f4(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T2 T44f26(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T134f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T130f224(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T92f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T137f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T137f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T137f12(T0* C);
/* DS_LINKED_QUEUE [STRING].make */
extern T0* T199c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T197c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T233c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].new_cursor */
extern T0* T233f1(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T234c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T97f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T76f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T76f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T73f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T264c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T339c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T264f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T264f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T340c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T264f35(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T264f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T264f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T4 T264f20(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T264f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_keys */
extern void T264f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_items */
extern void T264f40(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T341f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T369c2(T4 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T338c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T341c3(void);
/* XM_DOCUMENT.make */
extern T0* T74c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T74f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T74f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T74f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T271f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T271c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T2 T74f6(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T74f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T75f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T153f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T74f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T74f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T153f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T271f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T74f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T271f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T74f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T74f36(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T74f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T74f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T2 T153f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T2 T74f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T2 T75f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T74f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T74f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T2 T153f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T2 T74f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T2 T75f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T75f40(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T75f46(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T75f45(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T75f44(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T75f49(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T75f47(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T75f50(T0* C);
/* XM_ELEMENT.remove_first */
extern void T75f43(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T75f48(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T74f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T74f5(T0* C);
/* XM_DOCUMENT.list_make */
extern void T74f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T75c30(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T75f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1255os4924;
extern T0* ge1255ov4924;
extern T0* T74f3(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T268c8(void);
/* XM_NAMESPACE.make */
extern void T268f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T268c7(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T137f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T97f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T76f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T76f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T73f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T137f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T97f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T76f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T76f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T73f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T73f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T140f3(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T200f8(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T280f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T280c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T2 T200f3(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T278c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T2 T73f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T265c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T75f33(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T75f33p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T75f33p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T75f34(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T75f18(T0* C);
/* XM_ELEMENT.is_empty */
extern T2 T75f17(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T265c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T137f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T97f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T76f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T76f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T73f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T266c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T266c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T137f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T97f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T76f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T76f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T73f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T267c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T137f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T197f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].force_last */
extern void T233f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].put_right */
extern void T301f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].attach_left */
extern void T301f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T301c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].is_empty */
extern T2 T233f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T197f8(T0* C);
/* DS_HASH_TABLE [STRING, STRING].set_equality_tester */
extern void T58f43(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T197f9(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_map_default */
extern T0* T58c41(void);
/* DS_HASH_TABLE [STRING, STRING].default_capacity */
extern T4 T58f1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T97f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T76f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T76f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T73f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T75c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T75c28(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T74f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T74f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T73f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T264f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T264f39(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T264f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T4 T264f13(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T4 T264f11(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T4 T268f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T264f37(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T264f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_resize */
extern void T264f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_resize */
extern void T264f45(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T341f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T338f3(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_item */
extern T0* T264f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_item */
extern T0* T264f5(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T4 T264f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T264f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T4 T264f10(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_put */
extern void T264f36(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T264f33(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T2 T339f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T264f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T2 T268f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T264f2(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T2 T264f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T137f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T137f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T197f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1229os7070;
extern T0* ge1229ov7070;
extern T0* T197f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T137f6(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T137f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T137f39(T0* C);
/* DS_LINKED_QUEUE [STRING].remove */
extern void T199f8(T0* C);
/* DS_LINKED_QUEUE [STRING].wipe_out */
extern void T199f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T137f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1196os6051;
extern T0* ge1196ov6051;
extern T0* T137f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1196os6059;
extern T0* ge1196ov6059;
extern T0* T137f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T2 T137f8(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T2 T137f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T137f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1196os6052;
extern T0* ge1196ov6052;
extern T0* T137f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1196os6058;
extern T0* ge1196ov6058;
extern T0* T137f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T2 T137f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1196os6053;
extern T0* ge1196ov6053;
extern T0* T137f22(T0* C);
/* DS_LINKED_QUEUE [STRING].item */
extern T0* T199f1(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T2 T137f15(T0* C);
/* DS_LINKED_QUEUE [STRING].is_empty */
extern T2 T199f2(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T197f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].back */
extern void T234f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_back */
extern void T233f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].add_traversing_cursor */
extern void T233f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_next_cursor */
extern void T234f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_traversing_cursor */
extern void T233f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set */
extern void T234f13(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].go_before */
extern void T234f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_go_before */
extern void T233f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_before */
extern void T234f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_off */
extern T2 T233f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].item */
extern T0* T58f22(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].items_item */
extern T0* T58f27(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T2 T58f21(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].item */
extern T0* T234f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].finish */
extern void T234f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_finish */
extern void T233f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1229os7071;
extern T0* ge1229ov7071;
extern T0* T197f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T2 T197f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T2 T137f4(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T97f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T76f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T76f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T73f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T137f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T197f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_last */
extern void T233f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].set_last_cell */
extern void T233f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].forget_right */
extern void T301f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_last_cursors_after */
extern void T233f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_after */
extern void T234f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].wipe_out */
extern void T233f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_all_cursors_after */
extern void T233f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T137f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T97f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T76f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T76f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T73f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T75f2(T0* C);
/* XM_DOCUMENT.process */
extern void T74f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T272f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T2 T75f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T2 T74f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T137f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T97f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T76f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T76f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T73f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T137f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T197f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_new */
extern void T58f52(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].last */
extern T0* T233f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T2 T197f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T137f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING].force */
extern void T199f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T197f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T97f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T76f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T76f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T73f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T152c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T137f41(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T97f12(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T76f16(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T73f23(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T137f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T76f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T73f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T58f53(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].add_traversing_cursor */
extern void T58f62(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].remove_traversing_cursor */
extern void T58f61(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_off */
extern T2 T58f37(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].is_empty */
extern T2 T58f36(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T32f64(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T32f67(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T32f66(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T2 T32f38(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T2 T32f37(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T27f66(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T27f69(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T27f68(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T2 T27f40(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T2 T27f39(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T23f76(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T23f79(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T23f78(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T2 T23f48(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T2 T23f47(T0* C);
/* DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T58f54(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T32f65(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T27f67(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T23f77(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T456f3(T0* C, T4 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T454f2(T0* C, T4 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T452f3(T0* C, T4 a1);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T2 T263f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T2 T337f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_file_executable */
extern T2 T337f4(T0* C);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T2 T262f1(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T2 T336f1(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T2 T261f1(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T2 T335f1(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T2 T260f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T2 T334f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T2 T334f5(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T2 T259f1(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T2 T331f1(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T2 T258f1(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T2 T330f1(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T2 T257f1(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T2 T329f1(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T2 T329f6(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T2 T256f1(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T2 T328f1(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T2 T361f1(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T2 T328f7(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern unsigned char ge154os4319;
extern T0* ge154ov4319;
extern T0* T328f4(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T361c2(void);
/* GEANT_DELETE_TASK.is_executable */
extern T2 T255f1(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T2 T325f1(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T325f4(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T2 T254f1(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T2 T324f1(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T2 T253f1(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T2 T323f1(T0* C);
/* GEANT_GEXMLSPLIT_TASK.is_executable */
extern T2 T252f1(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.is_executable */
extern T2 T322f1(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T2 T251f1(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T2 T320f1(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T2 T320f6(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T2 T250f1(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T2 T319f1(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T2 T249f1(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T2 T318f1(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T2 T318f6(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T2 T248f1(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T2 T317f1(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T2 T247f1(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T2 T316f1(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T2 T246f1(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T2 T314f1(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T314f5(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T2 T245f1(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T2 T313f1(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T2 T244f1(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T2 T312f1(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T2 T243f1(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T2 T311f1(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T2 T242f1(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T2 T308f1(T0* C);
/* GEANT_EXEC_COMMAND.is_fileset_executable */
extern T2 T308f5(T0* C);
/* GEANT_VE_TASK.is_executable */
extern T2 T241f1(T0* C);
/* GEANT_VE_COMMAND.is_executable */
extern T2 T307f1(T0* C);
/* GEANT_VE_COMMAND.is_cleanable */
extern T2 T307f5(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T2 T240f1(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T2 T306f1(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T2 T306f5(T0* C);
/* GEANT_SE_TASK.is_executable */
extern T2 T239f1(T0* C);
/* GEANT_SE_COMMAND.is_executable */
extern T2 T305f1(T0* C);
/* GEANT_SE_COMMAND.is_traditional_configuration */
extern T2 T305f5(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T2 T238f1(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T2 T304f1(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T2 T263f2(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T263f10(T0* C);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T263f7(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T2 T262f2(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T262f10(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T262f7(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T2 T261f2(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T261f10(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T261f7(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T2 T260f2(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T260f10(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T260f7(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T2 T259f2(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T259f10(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T259f7(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T2 T258f2(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T258f10(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T258f7(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T2 T257f2(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T257f10(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T257f7(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T2 T256f2(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T256f10(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T256f7(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T2 T255f2(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T255f10(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T255f7(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T2 T254f2(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T254f10(T0* C);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T254f7(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T2 T253f2(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T253f10(T0* C);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T253f7(T0* C);
/* GEANT_GEXMLSPLIT_TASK.is_enabled */
extern T2 T252f2(T0* C);
/* GEANT_GEXMLSPLIT_TASK.unless_attribute_name */
extern T0* T252f10(T0* C);
/* GEANT_GEXMLSPLIT_TASK.if_attribute_name */
extern T0* T252f7(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T2 T251f2(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T251f10(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T251f7(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T2 T250f2(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T250f10(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T250f7(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T2 T249f2(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T249f10(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T249f7(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T2 T248f2(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T248f10(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T248f7(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T2 T247f2(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T247f10(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T247f7(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T2 T246f2(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T246f10(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T246f7(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T2 T245f2(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T245f10(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T245f7(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T2 T244f2(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T244f10(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T244f7(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T2 T243f2(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T243f10(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T243f7(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T2 T242f2(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T242f10(T0* C);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T242f7(T0* C);
/* GEANT_VE_TASK.is_enabled */
extern T2 T241f2(T0* C);
/* GEANT_VE_TASK.unless_attribute_name */
extern T0* T241f10(T0* C);
/* GEANT_VE_TASK.if_attribute_name */
extern T0* T241f7(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T2 T240f2(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T240f10(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T240f7(T0* C);
/* GEANT_SE_TASK.is_enabled */
extern T2 T239f2(T0* C);
/* GEANT_SE_TASK.unless_attribute_name */
extern T0* T239f10(T0* C);
/* GEANT_SE_TASK.if_attribute_name */
extern T0* T239f7(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T2 T238f2(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T238f10(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T238f7(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T4 T263f3(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T4 T262f3(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T4 T261f3(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T4 T260f3(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T4 T259f3(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T4 T258f3(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T4 T257f3(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T4 T256f3(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T4 T255f3(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T4 T254f3(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T4 T253f3(T0* C);
/* GEANT_GEXMLSPLIT_TASK.exit_code */
extern T4 T252f3(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T4 T251f3(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T4 T250f3(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T4 T249f3(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T4 T248f3(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T4 T247f3(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T4 T246f3(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T4 T245f3(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T4 T244f3(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T4 T243f3(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T4 T242f3(T0* C);
/* GEANT_VE_TASK.exit_code */
extern T4 T241f3(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T4 T240f3(T0* C);
/* GEANT_SE_TASK.exit_code */
extern T4 T239f3(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T4 T238f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T136f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T93c5(T0* a1, T4 a2, T4 a3, T4 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T134f1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T130f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T92f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T2 T136f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T2 T134f4(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T2 T130f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T2 T92f4(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_valid_encoding */
extern T2 T136f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T2 T158f2(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_valid_encoding */
extern T2 T134f5(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_valid_encoding */
extern T2 T130f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T92f5(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T4 T136f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T4 T134f6(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T4 T130f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T4 T92f6(T0* C);
/* DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T2 T58f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T2 T32f32(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T2 T27f36(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T2 T23f44(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T58f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T32f33(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T27f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T23f45(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T58f26(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T32f39(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T27f42(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T23f50(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T438f1(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T438f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T438f6(T0* C);
/* ARRAY [STRING].valid_index */
extern T2 T31f5(T0* C, T4 a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T438f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T424f1(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T424f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T424f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T424f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T423f1(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T423f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T423f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T423f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T422f1(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T422f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T422f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T422f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T421f1(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T421f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T421f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T421f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T420f1(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T420f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T420f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T420f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T419f1(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T419f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T419f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T419f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T418f1(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T418f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T418f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T418f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T417f1(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T417f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T417f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T417f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T415f1(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T415f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T415f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T415f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T38f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T38f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T38f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T38f5(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T36f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T36f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T36f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T36f5(T0* C);
/* FILE_NAME.to_c */
extern T0* T389f3(T0* C);
/* UC_UTF8_STRING.to_c */
extern T0* T157f3(T0* C);
/* STRING.to_c */
extern T0* T16f18(T0* C);
extern T0* gema31(T4 c, ...);
extern T0* gema155(T4 c, ...);
extern T0* gema139(T4 c, ...);
extern T0* gema399(T4 c, ...);
extern T0* gema362(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge299ov3849;
extern T0* ge233ov7269;
extern T0* ge498ov8411;
extern T0* ge288ov2131;
extern T0* ge292ov3034;
extern T0* ge347ov10119;
extern T0* ge185ov2131;
extern T0* ge470ov8563;
extern T0* ge266ov2930;
extern T0* ge290ov2131;
extern T0* ge197ov2968;
extern T0* ge197ov2969;
extern T0* ge186ov3282;
extern T0* ge186ov3281;
extern T0* ge195ov2968;
extern T0* ge195ov2969;
extern T0* ge1289ov4303;
extern T0* ge1289ov4302;
extern T0* ge1296ov4597;
extern T0* ge1296ov4559;
extern T0* ge1296ov4557;
extern T0* ge1296ov4598;
extern T0* ge1296ov4570;
extern T0* ge1296ov4569;
extern T0* ge1296ov4580;
extern T0* ge1296ov4574;
extern T0* ge1296ov4573;
extern T0* ge1296ov4572;
extern T0* ge1296ov4578;
extern T0* ge1296ov4577;
extern T0* ge1296ov4579;
extern T0* ge1296ov4556;
extern T0* ge1296ov4582;
extern T0* ge1296ov4591;
extern T0* ge1299ov4244;
extern T0* ge1299ov4242;
extern T0* ge1299ov4243;
extern T0* ge1296ov4592;
extern T0* ge1296ov4593;
extern T0* ge1296ov4596;
extern T0* ge1296ov4594;
extern T0* ge1296ov4595;
extern T0* ge1296ov4589;
extern T0* ge1292ov6123;
extern T0* ge1292ov6124;
extern T0* ge1296ov4562;
extern T0* ge1296ov4585;
extern T0* ge1296ov4605;
extern T0* ge1296ov4606;
extern T0* ge1296ov4600;
extern T0* ge1296ov4583;
extern T0* ge1296ov4584;
extern T0* ge1296ov4586;
extern T0* ge1296ov4590;
extern T0* ge265ov3173;
extern T0* ge197ov2979;
extern T0* ge195ov2979;
extern T0* ge203ov1306;
extern T0* ge474ov9177;
extern T0* ge474ov9214;
extern T0* ge474ov9199;
extern T0* ge474ov9192;
extern T0* ge474ov9202;
extern T0* ge474ov9195;
extern T0* ge474ov9203;
extern T0* ge474ov9212;
extern T0* ge474ov9205;
extern T0* ge474ov9201;
extern T0* ge474ov9189;
extern T0* ge474ov9190;
extern T0* ge474ov9204;
extern T0* ge474ov9191;
extern T0* ge474ov9178;
extern T0* ge474ov9179;
extern T0* ge474ov9180;
extern T0* ge474ov9186;
extern T0* ge474ov9188;
extern T0* ge474ov9183;
extern T0* ge474ov9208;
extern T0* ge474ov9207;
extern T0* ge474ov9184;
extern T0* ge474ov9185;
extern T0* ge474ov9182;
extern T0* ge474ov9181;
extern T0* ge261ov8171;
extern T0* ge265ov3175;
extern T0* ge276ov3153;
extern T0* ge295ov2131;
extern T0* ge261ov8170;
extern T0* ge1303ov5619;
extern T0* ge1303ov5620;
extern T0* ge1294ov6788;
extern T0* ge1294ov6790;
extern T0* ge1247ov4890;
extern T0* ge1228ov6494;
extern T0* ge1228ov6495;
extern T0* ge1294ov6787;
extern T0* ge1294ov6789;
extern T0* ge332ov2894;
extern T0* ge319ov2894;
extern T0* ge325ov2894;
extern T0* ge324ov2894;
extern T0* ge323ov2894;
extern T0* ge314ov2894;
extern T0* ge313ov2894;
extern T0* ge329ov2894;
extern T0* ge342ov2894;
extern T0* ge1154ov2894;
extern T0* ge1157ov2894;
extern T0* ge1158ov2894;
extern EIF_TYPE getypes[];

