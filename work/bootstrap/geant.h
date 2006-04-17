/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
	T4 a11; /* internal_hash_code */
} T16;

/* GEANT */
typedef struct {
	int id;
	T0* a2; /* error_handler */
	T2 a3; /* verbose */
	T2 a6; /* debug_mode */
	T2 a7; /* no_exec */
	T0* a8; /* build_filename */
	T0* a10; /* start_target_name */
	T2 a11; /* show_target_info */
} T19;

/* GEANT_PROJECT */
typedef struct {
	int id;
	T0* a1; /* targets */
	T0* a2; /* name */
	T2 a3; /* build_successful */
	T0* a4; /* output_file */
	T0* a6; /* variables */
	T0* a7; /* selected_targets */
	T0* a8; /* options */
	T0* a9; /* inherit_clause */
	T0* a10; /* start_target_name */
	T0* a12; /* description */
	T0* a13; /* default_target_name */
	T2 a14; /* old_inherit */
	T0* a15; /* current_target */
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
	T2 a33; /* is_executed */
	T0* a35; /* precursor_target */
	T0* a38; /* redefining_target */
} T24;

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
} T25;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a3; /* program_name */
} T26;

/* UT_ERROR_HANDLER */
typedef struct {
	int id;
	T0* a1; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
} T27;

/* GEANT_PROJECT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* project */
	T0* a5; /* xml_element */
} T29;

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
} T30;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T31;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
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

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T4 a5; /* count */
} T41;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T42;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct {
	int id;
	T1 a21; /* secondary_directory_separator */
} T43;

/* KL_UNIX_FILE_SYSTEM */
typedef struct {
	int id;
} T44;

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
} T45;

/* GEANT_PROJECT_PARSER */
typedef struct {
	int id;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
} T46;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct {
	int id;
	T0* a4; /* variables */
} T48;

/* UC_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T49;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2[1]; /* item */
} T51;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T52;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T53;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T54;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a1; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T56;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T57;

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
	T4 a29; /* count */
	T4 a38; /* slots_position */
	T4 a39; /* clashes_previous_position */
} T59;

/* EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
	T4 a4; /* return_code */
} T60;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct {
	int id;
} T61;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T62;

/* UC_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* byte_count */
	T4 a4; /* internal_hash_code */
	T4 a5; /* last_byte_index_input */
	T4 a6; /* last_byte_index_result */
	T0* a7; /* area */
} T63;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T64;

/* KL_PATHNAME */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T2 a5; /* is_relative */
	T0* a11; /* components */
} T66;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a6; /* file_name */
	T0* a7; /* buffered_file_info */
} T67;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct {
	int id;
} T70;

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
} T72;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a8; /* last */
} T73;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct {
	int id;
	T0* a1; /* document */
	T0* a2; /* next */
	T0* a3; /* source_parser */
	T0* a4; /* last_position_table */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
} T76;

/* XM_DOCUMENT */
typedef struct {
	int id;
	T0* a1; /* root_element */
	T0* a4; /* internal_cursor */
	T0* a7; /* first_cell */
	T0* a8; /* last_cell */
	T4 a9; /* count */
	T0* a11; /* parent */
} T77;

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
} T78;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct {
	int id;
	T2 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
} T79;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
	T4 a5; /* return_code */
} T80;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T81;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T82;

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
} T83;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
} T85;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T86;

/* GEANT_INHERIT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a7; /* xml_element */
} T87;

/* GEANT_INHERIT */
typedef struct {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
} T88;

/* SPECIAL [GEANT_TARGET] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T89;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING] */
typedef struct {
	int id;
	T0* a5; /* container */
	T4 a6; /* position */
	T0* a7; /* next_cursor */
} T91;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct {
	int id;
} T92;

/* TO_SPECIAL [GEANT_VARIABLES] */
typedef struct {
	int id;
	T0* a1; /* area */
} T93;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T94;

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
} T96;

/* XM_DEFAULT_POSITION */
typedef struct {
	int id;
	T0* a1; /* source_name */
	T4 a2; /* row */
	T4 a3; /* column */
	T4 a4; /* byte_index */
} T97;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct {
	int id;
	T0* a2; /* first_cell */
	T0* a3; /* internal_cursor */
	T0* a6; /* last_cell */
	T4 a7; /* count */
} T99;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T100;

/* XM_CALLBACKS_NULL */
typedef struct {
	int id;
} T101;

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
} T102;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct {
	int id;
} T104;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T105;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T106;

/* XM_EIFFEL_PARSER_NAME */
typedef struct {
	int id;
	T2 a2; /* use_namespaces */
	T4 a3; /* count */
	T0* a4; /* first */
	T0* a5; /* second */
	T0* a6; /* tail */
} T107;

/* XM_EIFFEL_DECLARATION */
typedef struct {
	int id;
	T0* a1; /* version */
	T0* a3; /* encoding */
	T2 a5; /* stand_alone */
} T108;

/* XM_DTD_EXTERNAL_ID */
typedef struct {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
} T109;

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
} T110;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct {
	int id;
	T0* a1; /* items */
	T1 a2; /* repetition */
	T0* a3; /* name */
	T1 a4; /* type */
	T2 a5; /* is_character_data_allowed */
} T111;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T112;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct {
	int id;
	T0* a1; /* name */
	T1 a2; /* type */
	T2 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T1 a5; /* value */
	T0* a6; /* default_value */
} T113;

/* DS_BILINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
	T0* a7; /* equality_tester */
} T114;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T115;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T116;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T117;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
} T118;

/* SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T2 a2[1]; /* item */
} T119;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T120;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct {
	int id;
} T121;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T122;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
} T123;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T124;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
} T125;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T127;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T129;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
} T130;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
} T131;

/* SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T132;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
} T133;

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
} T134;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
} T135;

/* XM_DTD_CALLBACKS_NULL */
typedef struct {
	int id;
} T137;

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
} T138;

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
} T140;

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
} T141;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T142;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T143;

/* XM_POSITION_TABLE */
typedef struct {
	int id;
	T0* a1; /* table */
} T144;

/* C_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* managed_data */
} T145;

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
} T147;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T4 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T4 a7; /* count */
} T149;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a6; /* next_cursor */
} T150;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T151;

/* DS_ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a6; /* count */
	T0* a7; /* equality_tester */
} T152;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct {
	int id;
	T0* a6; /* xml_element */
} T153;

/* XM_ATTRIBUTE */
typedef struct {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
} T155;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct {
	int id;
	T4 a1; /* position */
	T4 a3; /* last_position */
	T4 a4; /* capacity */
	T4 a7; /* slots_position */
	T4 a9; /* count */
	T0* a10; /* key_equality_tester */
	T4 a11; /* found_position */
	T4 a12; /* modulus */
	T4 a13; /* clashes_previous_position */
	T0* a16; /* items */
	T0* a19; /* clashes */
	T0* a20; /* slots */
	T0* a21; /* keys */
	T0* a22; /* equality_tester */
	T0* a24; /* special_item_routines */
	T0* a25; /* special_key_routines */
	T4 a26; /* free_slot */
	T0* a27; /* internal_cursor */
} T156;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a8; /* next_cursor */
} T157;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T159;

/* UC_UTF8_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* area */
	T4 a17; /* byte_count */
	T4 a28; /* internal_hash_code */
	T4 a30; /* last_byte_index_input */
	T4 a31; /* last_byte_index_result */
} T161;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct {
	int id;
	T0* a1; /* last_string */
	T0* a8; /* impl */
	T0* a9; /* utf_queue */
	T4 a10; /* encoding */
} T162;

/* KL_INTEGER_ROUTINES */
typedef struct {
	int id;
} T163;

/* KL_PLATFORM */
typedef struct {
	int id;
} T164;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T165;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T166;

/* GEANT_PARENT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* parent */
	T0* a4; /* project */
	T0* a13; /* xml_element */
} T167;

/* TO_SPECIAL [GEANT_TARGET] */
typedef struct {
	int id;
	T0* a1; /* area */
} T169;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct {
	int id;
	T4 a5; /* code */
} T170;

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
} T171;

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
} T172;

/* DS_LINKED_STACK [INTEGER] */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a4; /* first_cell */
} T175;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T176;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T177;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T178;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T179;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T181;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
} T182;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T183;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
} T184;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T185;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T186;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T187;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T188;

/* DS_LINKED_LIST [STRING] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T189;

/* DS_BILINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T190;

/* DS_BILINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T191;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct {
	int id;
	T0* a1; /* area */
} T192;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T193;

/* TO_SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
} T194;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T195;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T196;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T197;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T198;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T199;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct {
	int id;
	T0* a1; /* area */
} T200;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct {
	int id;
	T0* a5; /* context */
} T201;

/* DS_LINKED_QUEUE [STRING] */
typedef struct {
	int id;
	T0* a3; /* first_cell */
	T4 a4; /* count */
	T0* a5; /* last_cell */
} T203;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T204;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 a1; /* count */
	T8 a2[1]; /* item */
} T205;

/* GEANT_STRING_INTERPRETER */
typedef struct {
	int id;
	T0* a5; /* variable_resolver */
} T206;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct {
	int id;
	T0* a3; /* variables */
} T207;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T209;

/* MANAGED_POINTER */
typedef struct {
	int id;
	T2 a1; /* is_shared */
	T14 a3; /* item */
	T4 a6; /* count */
} T210;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct {
	int id;
} T211;

/* SPECIAL [GEANT_PARENT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T212;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T213;

/* UC_UTF8_ROUTINES */
typedef struct {
	int id;
} T214;

/* DS_LINKED_QUEUE [CHARACTER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* first_cell */
	T0* a5; /* last_cell */
} T216;

/* UC_UTF16_ROUTINES */
typedef struct {
	int id;
} T217;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 a1; /* count */
	T11 a2[1]; /* item */
} T218;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T219;

/* GEANT_RENAME_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* rename_clause */
	T0* a6; /* project */
	T0* a7; /* xml_element */
} T220;

/* GEANT_REDEFINE_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* redefine_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
} T221;

/* GEANT_SELECT_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* select_clause */
	T0* a5; /* project */
	T0* a6; /* xml_element */
} T222;

/* GEANT_RENAME */
typedef struct {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
} T223;

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
} T224;

/* GEANT_REDEFINE */
typedef struct {
	int id;
	T0* a1; /* name */
} T225;

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
} T226;

/* GEANT_SELECT */
typedef struct {
	int id;
	T0* a1; /* name */
} T227;

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
} T228;

/* UC_UNICODE_ROUTINES */
typedef struct {
	int id;
} T229;

/* DS_LINKABLE [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* item */
	T0* a2; /* right */
} T230;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct {
	int id;
	T0* a1; /* area */
} T231;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T232;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
} T233;

/* DS_LINKED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T234;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a4; /* last_cell */
	T0* a5; /* internal_cursor */
	T0* a7; /* first_cell */
} T236;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T2 a1; /* before */
	T0* a3; /* current_cell */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
	T2 a6; /* after */
} T237;

/* DS_LINKABLE [STRING] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T238;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
} T239;

/* GEANT_GEC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T241;

/* GEANT_SE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T242;

/* GEANT_ISE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T243;

/* GEANT_VE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T244;

/* GEANT_EXEC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T245;

/* GEANT_LCC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T246;

/* GEANT_SET_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T247;

/* GEANT_UNSET_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T248;

/* GEANT_GEXACE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T249;

/* GEANT_GELEX_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T250;

/* GEANT_GEYACC_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T251;

/* GEANT_GEPP_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T252;

/* GEANT_GETEST_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T253;

/* GEANT_GEANT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T254;

/* GEANT_GEXMLSPLIT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T255;

/* GEANT_ECHO_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T256;

/* GEANT_MKDIR_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T257;

/* GEANT_DELETE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T258;

/* GEANT_COPY_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T259;

/* GEANT_MOVE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T260;

/* GEANT_SETENV_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T261;

/* GEANT_XSLT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T262;

/* GEANT_OUTOFDATE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T263;

/* GEANT_EXIT_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T264;

/* GEANT_PRECURSOR_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T265;

/* GEANT_AVAILABLE_TASK */
typedef struct {
	int id;
	T0* a4; /* command */
	T0* a6; /* project */
	T0* a9; /* xml_element */
} T266;

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
} T267;

/* XM_COMMENT */
typedef struct {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
} T268;

/* XM_PROCESSING_INSTRUCTION */
typedef struct {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
} T269;

/* XM_CHARACTER_DATA */
typedef struct {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
} T270;

/* XM_NAMESPACE */
typedef struct {
	int id;
	T0* a2; /* uri */
	T0* a4; /* ns_prefix */
} T271;

/* DS_LINKABLE [XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
} T274;

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
} T275;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T281;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a4; /* as_special */
	T0* a6; /* area */
} T282;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T283;

/* TYPED_POINTER [NATURAL_8] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T284;

/* EXCEPTIONS */
typedef struct {
	int id;
} T285;

/* TO_SPECIAL [GEANT_PARENT] */
typedef struct {
	int id;
	T0* a1; /* area */
} T286;

/* DS_LINKABLE [CHARACTER] */
typedef struct {
	int id;
	T1 a1; /* item */
	T0* a2; /* right */
} T287;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct {
	int id;
} T288;

/* SPECIAL [GEANT_RENAME] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T289;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T290;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct {
	int id;
} T291;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct {
	int id;
} T292;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T293;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T294;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct {
	int id;
} T295;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct {
	int id;
} T296;

/* SPECIAL [GEANT_SELECT] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T297;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
	T0* a5; /* next_cursor */
} T298;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct {
	int id;
} T299;

/* SPECIAL [ARRAY [INTEGER]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T300;

/* SPECIAL [SPECIAL [ARRAY [INTEGER]]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T301;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T302;

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
} T303;

/* KL_STRING_INPUT_STREAM */
typedef struct {
	int id;
	T2 a1; /* end_of_input */
	T1 a2; /* last_character */
	T0* a6; /* string */
	T4 a7; /* location */
} T304;

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
} T305;

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
} T306;

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
} T307;

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
} T308;

/* GEANT_EXEC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a6; /* command_line */
	T0* a7; /* fileset */
	T0* a8; /* exit_code_variable_name */
	T2 a9; /* accept_errors */
} T309;

/* GEANT_FILESET_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* fileset */
	T0* a7; /* project */
	T0* a20; /* xml_element */
} T310;

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
} T311;

/* GEANT_LCC_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* executable */
	T0* a5; /* source_filename */
} T312;

/* GEANT_SET_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
} T313;

/* GEANT_UNSET_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
} T314;

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
} T315;

/* GEANT_DEFINE_ELEMENT */
typedef struct {
	int id;
	T0* a7; /* project */
	T0* a10; /* xml_element */
} T316;

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
} T317;

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
} T318;

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
} T319;

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
} T320;

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
} T321;

/* ST_SPLITTER */
typedef struct {
	int id;
	T2 a3; /* has_escape_character */
	T1 a4; /* escape_character */
	T0* a6; /* separator_codes */
	T0* a8; /* separators */
} T322;

/* GEANT_GEXMLSPLIT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* input_filename */
} T323;

/* GEANT_ECHO_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* message */
	T0* a5; /* to_file */
	T2 a6; /* append */
} T324;

/* GEANT_MKDIR_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* directory */
} T325;

/* GEANT_DELETE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a9; /* file */
	T0* a10; /* directory */
	T0* a11; /* fileset */
	T0* a12; /* directoryset */
} T326;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a13; /* xml_element */
} T327;

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
} T328;

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
} T329;

/* GEANT_MOVE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a7; /* file */
	T0* a8; /* to_file */
	T0* a9; /* to_directory */
	T0* a10; /* fileset */
} T330;

/* GEANT_SETENV_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a4; /* name */
	T0* a5; /* value */
} T331;

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
} T332;

/* DS_PAIR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T333;

/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T334;

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
} T335;

/* GEANT_EXIT_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T4 a4; /* code */
} T336;

/* GEANT_PRECURSOR_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* arguments */
	T0* a4; /* project */
	T0* a5; /* parent */
} T337;

/* GEANT_AVAILABLE_COMMAND */
typedef struct {
	int id;
	T4 a2; /* exit_code */
	T0* a3; /* project */
	T0* a5; /* resource_name */
	T0* a6; /* true_value */
	T0* a7; /* false_value */
	T0* a8; /* variable_name */
} T338;

/* SPECIAL [XM_NAMESPACE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T339;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct {
	int id;
} T340;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T341;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct {
	int id;
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T0* a25; /* pattern */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
	T4 a1; /* count */
	T0* a2[1]; /* item */
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
extern T0* T37x2901(T0* C);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T59x1644(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T59x1501(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T2 T59x1632(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].before_position */
extern T4 T59x1600(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T4 T96x5642(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T96x5517(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T2 T96x5647(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T96x5528(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T4 T96x5638(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T96x5526(T0* C);
/* Call to XM_NODE.parent */
extern T0* T158x4839(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T4 T240x7347(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T2 T240x1946(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T2 T240x7346(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T453x11858(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T453x11861(T0* C, T4 a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T59x1634(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T59x1633(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T74x4246(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T75x4263(T0* C, T0* a1, T0* a2, T2 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T75x4268(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T75x4264(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T75x4270(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T75x4269(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T75x4267(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T75x4271(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T75x4265(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T75x4266(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T75x4262(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T75x4261(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T96x5513(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T96x5512(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T96x5518(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T96x5509(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T96x5653(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T96x5511(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T158x4849(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T158x4847(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T240x7349(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T453x11862(T0* C, T0* a1);
/* GEANT.make */
extern T0* T19c22(void);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T41f10(T0* C);
/* GEANT_PROJECT.build */
extern void T20f29(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T20f38(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T151f10(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T20f40(T0* C, T0* a1, T0* a2, T2 a3, T2 a4);
/* GEANT_TARGET.execute */
extern void T24f91(T0* C);
/* GEANT_TARGET.set_executed */
extern void T24f94(T0* C, T2 a1);
/* GEANT_TARGET.has_attribute */
extern T2 T24f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T157f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T77f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T77f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T157f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T77f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T157f14(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_ELEMENT.cursor_forth */
extern void T78f38(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T78f41(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T78f42(T0* C, T0* a1);
/* GEANT_TARGET.execute_task */
extern void T24f93(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern T0* T266c24(T0* a1, T0* a2);
/* GEANT_AVAILABLE_COMMAND.set_variable_name */
extern void T338f17(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.variable_attribute_name */
extern unsigned char ge98os7941;
extern T0* ge98ov7941;
extern T0* T266f15(T0* C);
/* GEANT_AVAILABLE_TASK.false_value_attribute_name */
extern unsigned char ge98os7943;
extern T0* ge98ov7943;
extern T0* T266f14(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_false_value */
extern void T338f16(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.true_value_attribute_name */
extern unsigned char ge98os7942;
extern T0* ge98ov7942;
extern T0* T266f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_true_value */
extern void T338f15(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_resource_name */
extern void T338f14(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.attribute_value */
extern T0* T266f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern unsigned char ge63os1313;
extern T0* ge63ov1313;
extern T0* T266f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T48c15(void);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T207f5(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T41f7(T0* C);
/* GEANT_AVAILABLE_TASK.target_arguments_stack */
extern unsigned char ge63os1314;
extern T0* ge63ov1314;
extern T0* T266f20(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T41c8(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T61f1(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_VARIABLES].make_area */
extern T0* T93c2(T4 a1);
/* SPECIAL [GEANT_VARIABLES].make */
extern T0* T62c4(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T61c3(void);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T207c4(void);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T2 T266f8(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.resource_attribute_name */
extern unsigned char ge98os7940;
extern T0* ge98ov7940;
extern T0* T266f11(T0* C);
/* GEANT_AVAILABLE_TASK.task_make */
extern void T266f26(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T266f29(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T266f31(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T266f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T266f32(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T266f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T338c13(T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T338f19(T0* C, T0* a1);
/* GEANT_TARGET.available_task_name */
extern unsigned char ge130os1993;
extern T0* ge130ov1993;
extern T0* T24f70(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T265c26(T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T86f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T85f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T85f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T86f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T85f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T86f10(T0* C, T0* a1, T2 a2, T2 a3);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T316f5(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T316f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T316f6(T0* C);
/* GEANT_DEFINE_ELEMENT.target_arguments_stack */
extern T0* T316f15(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern unsigned char ge139os6611;
extern T0* ge139ov6611;
extern T0* T316f13(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T2 T156f36(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T156f46(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T4 T156f15(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T4 T156f6(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T4 T161f15(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T161f5(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T1 T163f2(T0* C, T4 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge157os3069;
extern T0* ge157ov3069;
extern T0* T161f21(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T163c4(void);
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
extern T1 T161f18(T0* C, T4 a1);
/* UC_UTF8_STRING.old_item */
extern T1 T161f29(T0* C, T4 a1);
/* UC_UTF8_STRING.set_count */
extern void T161f56(T0* C, T4 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T161f64(T0* C);
/* STRING.make */
extern void T16f28(T0* C, T4 a1);
/* STRING.make */
extern T0* T16c28(T4 a1);
/* STRING.make_area */
extern void T16f31(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c8(T4 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T4 T161f22(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T4 T214f3(T0* C, T1 a1);
/* CHARACTER.infix "<=" */
extern T2 T1f17(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f2(T1* C, T1 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge221os3937;
extern T0* ge221ov3937;
extern T0* T161f23(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T214c22(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge284os6755;
extern T4 ge284ov6755;
extern T4 T164f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T4 T164f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge211os3066;
extern T0* ge211ov3066;
extern T0* T161f20(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T164c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T4 T161f19(T0* C, T4 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T4 T214f4(T0* C, T1 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T4 T214f2(T0* C, T1 a1);
/* UC_UTF8_STRING.hash_code */
extern T4 T161f15p1(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f11(T4* C, T4 a1);
/* STRING.hash_code */
extern T4 T16f14(T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T2 T49f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge160os1319;
extern T0* ge160ov1319;
extern T0* T49f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T42c15(void);
/* GEANT_ARGUMENT_VARIABLES.keys_item */
extern T0* T156f14(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T4 T156f8(T0* C, T4 a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T316f4(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern unsigned char ge139os6610;
extern T0* ge139ov6610;
extern T0* T316f12(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T2 T316f2(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T2 T316f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T316c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T316f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T316f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T316f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T86f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T86f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T85f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T2 T85f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T85f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T86c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].forth */
extern void T234f9(T0* C);
/* DS_LINKED_LIST [STRING].cursor_forth */
extern void T189f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].add_traversing_cursor */
extern void T189f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T234f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].remove_traversing_cursor */
extern void T189f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING].set */
extern void T234f10(T0* C, T0* a1, T2 a2, T2 a3);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T156f42(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.keys_put */
extern void T156f51(T0* C, T0* a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T156f50(T0* C, T4 a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T156f49(T0* C, T4 a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T156f48(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T156f56(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T53f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T51f3(T0* C, T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T51c4(T4 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern unsigned char ge158os1667;
extern T0* ge158ov1667;
extern T0* T156f23(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T53c4(void);
/* GEANT_ARGUMENT_VARIABLES.keys_resize */
extern void T156f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T54f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T31f3(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T31c6(T4 a1);
/* GEANT_ARGUMENT_VARIABLES.items_resize */
extern void T156f54(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T156f53(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T4 T156f17(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T4 T156f5(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.items_put */
extern void T156f47(T0* C, T0* a1, T4 a2);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T156f45(T0* C);
/* INTEGER.out */
extern T0* T4f12(T4* C);
/* STRING.append_integer */
extern void T16f40(T0* C, T4 a1);
/* DS_LINKED_LIST_CURSOR [STRING].item */
extern T0* T234f4(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].start */
extern void T234f8(T0* C);
/* DS_LINKED_LIST [STRING].cursor_start */
extern void T189f10(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].cursor_off */
extern T2 T189f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING].new_cursor */
extern T0* T189f2(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING].make */
extern T0* T234c7(T0* a1);
/* ST_SPLITTER.split */
extern T0* T322f1(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T322f2(T0* C, T0* a1, T2 a2);
/* DS_LINKED_LIST [STRING].force_last */
extern void T189f9(T0* C, T0* a1);
/* DS_LINKABLE [STRING].put_right */
extern void T238f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING].make */
extern T0* T238c3(T0* a1);
/* DS_LINKED_LIST [STRING].is_empty */
extern T2 T189f3(T0* C);
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
extern T0* T42f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* UC_UTF8_STRING.append_character */
extern void T161f51(T0* C, T1 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T161f62(T0* C, T1 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T161f68(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_byte */
extern void T161f66(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.old_put */
extern void T161f61(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T161f60(T0* C, T4 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T161f58(T0* C, T4 a1);
/* UC_UTF8_STRING.resize */
extern void T161f67(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T4 T161f34(T0* C);
/* UC_UTF8_STRING.capacity */
extern T4 T161f34p1(T0* C);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T4 T214f5(T0* C, T1 a1);
/* UC_UTF8_STRING.item */
extern T1 T161f10(T0* C, T4 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T1 T161f25(T0* C, T4 a1);
/* UC_UTF8_STRING.byte_index */
extern T4 T161f24(T0* C, T4 a1);
/* STRING.item */
extern T1 T16f6(T0* C, T4 a1);
/* UC_UTF8_STRING.append_string */
extern void T161f50(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge298os3880;
extern T0* ge298ov3880;
extern T0* T161f35(T0* C);
/* UC_STRING.make_empty */
extern T0* T63c8(void);
/* UC_STRING.make */
extern void T63f9(T0* C, T4 a1);
/* UC_STRING.old_set_count */
extern void T63f12(T0* C, T4 a1);
/* UC_STRING.set_count */
extern void T63f11(T0* C, T4 a1);
/* UC_STRING.byte_capacity */
extern T4 T63f2(T0* C);
/* UC_STRING.capacity */
extern T4 T63f2p1(T0* C);
/* UC_STRING.make */
extern void T63f9p1(T0* C, T4 a1);
/* UC_STRING.make_area */
extern void T63f13(T0* C, T4 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T63f10(T0* C);
/* UC_UTF8_STRING.append_string */
extern void T161f50p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T161f59(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.additional_space */
extern T4 T161f37(T0* C);
/* ISE_RUNTIME.check_assert */
extern T2 T215s1(T2 a1);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T4 T214f1(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T4 T214f6(T0* C, T4 a1);
/* UC_UTF8_STRING.shifted_byte_index */
extern T4 T161f47(T0* C, T4 a1, T4 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge233os7152;
extern T0* ge233ov7152;
extern T0* T214f12(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern unsigned char ge152os1518;
extern T0* ge152ov1518;
extern T0* T214f9(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T64c2(void);
/* KL_ANY_ROUTINES.same_types */
extern T2 T64f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.any_ */
extern T0* T161f32(T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T161f9(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern void T161f54(T0* C, T4 a1);
/* UC_UTF8_STRING.make */
extern T0* T161c54(T4 a1);
/* UC_UTF8_STRING.make */
extern void T161f54p1(T0* C, T4 a1);
/* UC_UTF8_STRING.make_area */
extern void T161f65(T0* C, T4 a1);
/* UC_UTF8_STRING.append_substring */
extern void T161f52(T0* C, T0* a1, T4 a2, T4 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T161f63(T0* C, T0* a1, T4 a2, T4 a3, T4 a4, T4 a5);
/* UC_UTF8_STRING.cloned_string */
extern T0* T161f36(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T161f38(T0* C);
/* UC_UTF8_STRING.copy */
extern void T161f72(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T161f72p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f4(T0* C);
/* ST_SPLITTER.string_ */
extern T0* T322f5(T0* C);
/* UC_UTF8_STRING.substring */
extern T0* T161f11(T0* C, T4 a1, T4 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T161c55(T0* a1, T4 a2, T4 a3);
/* STRING.substring */
extern T0* T16f5(T0* C, T4 a1, T4 a2);
/* STRING.set_count */
extern void T16f30(T0* C, T4 a1);
/* STRING.new_string */
extern T0* T16f10(T0* C, T4 a1);
/* UC_UTF8_STRING.item_code */
extern T4 T161f14(T0* C, T4 a1);
/* STRING.item_code */
extern T4 T16f22(T0* C, T4 a1);
/* DS_LINKED_LIST [STRING].make */
extern T0* T189c8(void);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge63os1311;
extern T0* ge63ov1311;
extern T0* T265f16(T0* C);
/* ST_SPLITTER.set_separators */
extern void T322f10(T0* C, T0* a1);
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
extern T0* T53f2(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T81c2(T4 a1);
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
extern T0* T322c9(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T265f29(T0* C, T4 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T35f2(T0* C, T4 a1);
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
extern unsigned char ge208os1321;
extern T0* ge208ov1321;
extern T0* T265f20(T0* C);
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
	license: "Eiffel Forum License v2 (see forum.txt)"
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
	license: "Eiffel Forum License v2 (see forum.txt)"
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
extern T14 T57f2(T57* C);
/* KL_STRING_ROUTINES.as_string */
extern T0* T42f2(T0* C, T0* a1);
/* STRING.string */
extern T0* T16f16(T0* C);
/* STRING.append */
extern void T16f29(T0* C, T0* a1);
/* UC_UTF8_STRING.as_string */
extern T0* T161f4(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T161f16(T0* C);
/* KL_STRING_ROUTINES.any_ */
extern T0* T42f7(T0* C);
/* KL_STDERR_FILE.string_ */
extern T0* T34f1(T0* C);
/* ARRAY [STRING].item */
extern T0* T32f4(T0* C, T4 a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge192os2130;
extern T0* ge192ov2130;
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
extern unsigned char ge190os1323;
extern T0* ge190ov1323;
extern T0* T265f19(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T33c3(void);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge117os7930;
extern T0* ge117ov7930;
extern T0* T265f15(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T265f14(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T85f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T166f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T166c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T2 T85f4(T0* C);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T265f22(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T85c8(void);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge117os7929;
extern T0* ge117ov7929;
extern T0* T265f13(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T337f7(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T265f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T265f5(T0* C);
/* GEANT_PRECURSOR_TASK.target_arguments_stack */
extern T0* T265f21(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T2 T265f8(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge117os7928;
extern T0* ge117ov7928;
extern T0* T265f11(T0* C);
/* GEANT_PRECURSOR_TASK.task_make */
extern void T265f28(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T265f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T265f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T265f32(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T265f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T265f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T337c6(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T156c41(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T156f44(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T49c3(void);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T156f43(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T156f52(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T156f57(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T156f28(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T52c7(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T156f61(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T156f60(T0* C, T4 a1);
/* GEANT_ARGUMENT_VARIABLES.make_keys */
extern void T156f59(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T54f2(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T82c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T54c3(void);
/* GEANT_ARGUMENT_VARIABLES.make_items */
extern void T156f58(T0* C, T4 a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T337f6p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T337f9(T0* C, T0* a1);
/* GEANT_TARGET.precursor_task_name */
extern unsigned char ge130os1992;
extern T0* ge130ov1992;
extern T0* T24f69(T0* C);
/* GEANT_EXIT_TASK.make */
extern T0* T264c22(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T4 T161f41(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T83f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T83f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T83f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T83f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T165f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T219f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2062os5380;
extern T0* ge2062ov5380;
extern T0* T83f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T165c13(void);
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
extern void T219f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T219c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T219f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T218c2(T4 a1);
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
extern T0* T205c2(T4 a1);
/* INTEGER.to_natural_64 */
extern T11 T4f18(T4* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T83f21(T0* C, T4 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T161f43(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T83f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T83f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T83f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c42(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T83f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T83c15(void);
/* STRING.to_integer */
extern T4 T16f17(T0* C);
/* STRING.ctoi_convertor */
extern T0* T16f21(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T336f6(T0* C, T4 a1);
/* KL_STRING_ROUTINES.is_integer */
extern T2 T42f5(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f3(T1* C, T1 a1);
/* GEANT_EXIT_TASK.string_ */
extern T0* T264f13(T0* C);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T264f12(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T264f5(T0* C);
/* GEANT_EXIT_TASK.target_arguments_stack */
extern T0* T264f18(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T2 T264f8(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge103os7920;
extern T0* ge103ov7920;
extern T0* T264f11(T0* C);
/* GEANT_EXIT_TASK.task_make */
extern void T264f24(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T264f27(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T264f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T264f28(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T264f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T264f26(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T336c5(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T336f8(T0* C, T0* a1);
/* GEANT_TARGET.exit_task_name */
extern unsigned char ge130os1991;
extern T0* ge130ov1991;
extern T0* T24f68(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T263c26(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T335f24(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T310c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T311f50(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T350c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T351f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge138os8382;
extern T0* ge138ov8382;
extern T0* T350f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T351f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge138os8381;
extern T0* ge138ov8381;
extern T0* T350f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T351f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge138os8380;
extern T0* ge138ov8380;
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
extern unsigned char ge138os8379;
extern T0* ge138ov8379;
extern T0* T350f3(T0* C);
/* GEANT_MAP.make */
extern T0* T351c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge137os8395;
extern T0* ge137ov8395;
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
extern unsigned char ge132os8225;
extern T0* ge132ov8225;
extern T0* T310f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T311f49(T0* C, T0* a1);
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
extern unsigned char ge132os8224;
extern T0* ge132ov8224;
extern T0* T310f19(T0* C);
/* GEANT_FILESET.add_single_include */
extern void T311f48(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T2 T316f1(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern unsigned char ge136os1952;
extern T0* ge136ov1952;
extern T0* T316f11(T0* C);
/* BOOLEAN.out */
extern T0* T2f6(T2* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T2 T48f7(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T48f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T48f17(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T48f14(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T48f13(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T2 T48f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T80f1(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T60f1(T0* C, T0* a1);
/* STRING.make_from_c */
extern T0* T16c38(T14 a1);
/* STRING.from_c */
extern void T16f41(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T145f7(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T145f9(T0* C, T0* a1, T4 a2, T4 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T210f2(T0* C, T4 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T284f3(T284* C, T14 a1, T4 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T284f4(T284* C, T14 a1, T14 a2, T4 a3);
#include <string.h>
/* C_STRING.share_from_pointer */
extern void T145f6(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T145f8(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T210f9(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T210c8(T14 a1, T4 a2);
/* C_STRING.c_strlen */
extern T4 T145f3(T0* C, T14 a1);
/* STRING.c_string_provider */
extern unsigned char ge6os1165;
extern T0* ge6ov1165;
extern T0* T16f25(T0* C);
/* C_STRING.make_empty */
extern void T145f5(T0* C, T4 a1);
/* C_STRING.make_empty */
extern T0* T145c5(T4 a1);
/* MANAGED_POINTER.make */
extern T0* T210c7(T4 a1);
/* EXCEPTIONS.raise */
extern void T285f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T285f4(T0* C, T14 a1, T4 a2);
/* EXCEPTIONS.default_create */
extern T0* T285c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T210f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T4 a1, T4 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T4 a1, T4 a2);
#include <stdlib.h>
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T60f3(T0* C, T14 a1);
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
extern T0* T80f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge263os5252;
extern T0* ge263ov5252;
extern T0* T80f2(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T60c6(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge209os1320;
extern T0* ge209ov1320;
extern T0* T48f5(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T80c7(void);
/* GEANT_PROJECT_VARIABLES.found */
extern T2 T23f42(T0* C);
/* GEANT_PROJECT_VARIABLES.search */
extern void T23f77(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T23f62(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T4 T23f20(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T4 T23f15(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.keys_item */
extern T0* T23f26(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T4 T23f21(T0* C, T4 a1);
/* GEANT_VARIABLES.found */
extern T2 T25f34(T0* C);
/* GEANT_VARIABLES.search */
extern void T25f65(T0* C, T0* a1);
/* GEANT_VARIABLES.search_position */
extern void T25f49(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T4 T25f11(T0* C, T4 a1);
/* GEANT_VARIABLES.hash_position */
extern T4 T25f6(T0* C, T0* a1);
/* GEANT_VARIABLES.keys_item */
extern T0* T25f17(T0* C, T4 a1);
/* GEANT_VARIABLES.slots_item */
extern T4 T25f12(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge63os1307;
extern T0* ge63ov1307;
extern T0* T48f3(T0* C);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T152f11(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_tokens */
extern T0* T48f9(T0* C, T0* a1, T1 a2);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T152f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T152f19(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T4 T152f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T2 T152f8(T0* C, T4 a1);
/* UC_UTF8_STRING.index_of */
extern T4 T161f42(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T4 T161f44(T0* C, T4 a1, T4 a2);
/* STRING.index_of */
extern T4 T16f7(T0* C, T1 a1, T4 a2);
/* UC_UTF8_STRING.keep_head */
extern void T161f71(T0* C, T4 a1);
/* STRING.keep_head */
extern void T16f44(T0* C, T4 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T161f70(T0* C, T4 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T161f74(T0* C, T4 a1, T4 a2);
/* STRING.keep_tail */
extern void T16f43(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T152c12(T4 a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T152f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T213c4(T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T42f1(T0* C, T0* a1);
/* STRING.twin */
extern T0* T16f15(T0* C);
/* STRING.copy */
extern void T16f36(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern unsigned char ge136os1951;
extern T0* ge136ov1951;
extern T0* T316f8(T0* C);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T310f18(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T310f26(T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge132os8223;
extern T0* ge132ov8223;
extern T0* T310f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T311f34(T0* C, T2 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge132os8221;
extern T0* ge132ov8221;
extern T0* T310f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T311f47(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T311f46(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T311f45(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge132os8219;
extern T0* ge132ov8219;
extern T0* T310f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T311f44(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge132os8218;
extern T0* ge132ov8218;
extern T0* T310f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T311f43(T0* C, T2 a1);
/* GEANT_FILESET.set_force */
extern void T311f42(T0* C, T2 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T2 T310f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T310f22(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern unsigned char ge129os1965;
extern T0* ge129ov1965;
extern T0* T310f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern unsigned char ge129os1964;
extern T0* ge129ov1964;
extern T0* T310f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge132os8216;
extern T0* ge132ov8216;
extern T0* T310f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T311f41(T0* C, T0* a1);
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
extern void T159f8(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T401f11(T0* C);
/* ARRAY [INTEGER].make */
extern T0* T159c5(T4 a1, T4 a2);
/* ARRAY [INTEGER].make_area */
extern void T159f6(T0* C, T4 a1);
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
extern unsigned char ge301os10052;
extern T0* ge301ov10052;
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
extern unsigned char ge301os10051;
extern T0* ge301ov10051;
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
extern void T119f6(T0* C);
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
extern T0* T119c4(T4 a1);
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
extern unsigned char ge387os11663;
extern T0* ge387ov11663;
extern T0* T412f5(T0* C);
/* LX_ACTION.make */
extern T0* T461c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge387os11662;
extern T0* ge387ov11662;
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
extern T4 T159f4(T0* C, T4 a1);
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
extern T4 T32f11(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T379f41(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T402f2(T0* C);
/* ARRAY [STRING].put */
extern void T32f13(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T32c12(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T32f14(T0* C, T4 a1);
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
extern void T31f7(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T408f6(T0* C);
/* SPECIAL [INTEGER].clear_all */
extern void T51f10(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T105f6(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T377f237(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T377f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T106f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T105f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T105c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T106f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T183c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T106c3(void);
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
extern void T27f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T27f11(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T384f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T384f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T384f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T27f5(T0* C, T0* a1);
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
extern unsigned char ge306os11401;
extern T0* ge306ov11401;
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
extern T0* T282f3(T0* C, T4 a1, T4 a2);
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
extern T4 T282f1(T0* C);
/* YY_BUFFER.fill */
extern void T171f15(T0* C);
/* YY_BUFFER.set_index */
extern void T171f13(T0* C, T4 a1);
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
extern T1 T282f2(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T377f25(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T377f229(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T377f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T377f228(T0* C);
/* YY_BUFFER.set_position */
extern void T171f14(T0* C, T4 a1, T4 a2, T4 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T377f14(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T171c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T171f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T282f10(T0* C, T1 a1, T4 a2);
/* STRING.put */
extern void T16f46(T0* C, T1 a1, T4 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T282f9(T0* C, T0* a1, T4 a2);
/* STRING.subcopy */
extern void T16f48(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T171f9(T0* C, T4 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T282c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge281os2156;
extern T2 ge281ov2156;
extern T2 T39f6(T0* C);
/* PLATFORM.default_create */
extern T0* T370c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge210os1328;
extern T0* ge210ov1328;
extern T0* T282f7(T0* C);
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
extern unsigned char ge365os9555;
extern T0* ge365ov9555;
extern T0* T377f81(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T377f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T53f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge365os9554;
extern T0* ge365ov9554;
extern T0* T377f80(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge365os9553;
extern T0* ge365ov9553;
extern T0* T377f79(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge365os9552;
extern T0* ge365ov9552;
extern T0* T377f78(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge365os9551;
extern T0* ge365ov9551;
extern T0* T377f77(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge365os9550;
extern T0* ge365ov9550;
extern T0* T377f76(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge365os9549;
extern T0* ge365ov9549;
extern T0* T377f75(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge365os9548;
extern T0* ge365ov9548;
extern T0* T377f73(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge365os9547;
extern T0* ge365ov9547;
extern T0* T377f71(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge365os9546;
extern T0* ge365ov9546;
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
extern void T59f42(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge161os9712;
extern T0* ge161ov9712;
extern T0* T377f20(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T405c2(void);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern void T59f44(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern T0* T59c44(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T59f45(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T59f46(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T59f12(T0* C);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T59f51(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T59f50(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern T0* T59f18(T0* C);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T4 T59f6(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T59f49(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_keys */
extern void T59f48(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_items */
extern void T59f47(T0* C, T4 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T377f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T377f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T377f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge366os9724;
extern T0* ge366ov9724;
extern T0* T377f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T377f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge366os9723;
extern T0* ge366ov9723;
extern T0* T377f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge366os9722;
extern T0* ge366ov9722;
extern T0* T377f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge366os9721;
extern T0* ge366ov9721;
extern T0* T377f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge366os9720;
extern T0* ge366ov9720;
extern T0* T377f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge366os9719;
extern T0* ge366ov9719;
extern T0* T377f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge366os9718;
extern T0* ge366ov9718;
extern T0* T377f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge382os5668;
extern T0* ge382ov5668;
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
extern T0* T27c12(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge191os2087;
extern T0* ge191ov2087;
extern T0* T27f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T384c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T359f15(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge132os8215;
extern T0* ge132ov8215;
extern T0* T310f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T311f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge132os8214;
extern T0* ge132ov8214;
extern T0* T310f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T311f39(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T311f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T310f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T310f25(T0* C);
/* GEANT_FILESET_ELEMENT.target_arguments_stack */
extern T0* T310f24(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern unsigned char ge136os1950;
extern T0* ge136ov1950;
extern T0* T310f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T311c33(T0* a1);
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
extern void T310f30(T0* C, T4 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T310f23(T0* C);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge132os8222;
extern T0* ge132ov8222;
extern T0* T310f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge132os8220;
extern T0* ge132ov8220;
extern T0* T310f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge132os8213;
extern T0* ge132ov8213;
extern T0* T310f4(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T2 T310f3(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge132os8217;
extern T0* ge132ov8217;
extern T0* T310f2(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T310f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T310f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T310f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T310f33(T0* C, T0* a1);
/* XM_ELEMENT.element_by_name */
extern T0* T78f4(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T157f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T77f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T157f15(T0* C);
/* XM_DOCUMENT.cursor_off */
extern T2 T77f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T78f39(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T2 T78f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T2 T78f8(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T2 T78f11(T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T2 T271f1(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T271f3(T0* C);
/* XM_ELEMENT.has_namespace */
extern T2 T78f13(T0* C);
/* XM_ELEMENT.same_string */
extern T2 T78f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge223os1669;
extern T0* ge223ov1669;
extern T0* T78f12(T0* C);
/* XM_NODE_TYPER.is_element */
extern T2 T275f2(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T275c11(void);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge116os7899;
extern T0* ge116ov7899;
extern T0* T263f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T335f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge116os7896;
extern T0* ge116ov7896;
extern T0* T263f16(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge116os7898;
extern T0* ge116ov7898;
extern T0* T263f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T335f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge116os7897;
extern T0* ge116ov7897;
extern T0* T263f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T335f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T335f20(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge116os7895;
extern T0* ge116ov7895;
extern T0* T263f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T335f19(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T263f12(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T263f5(T0* C);
/* GEANT_OUTOFDATE_TASK.target_arguments_stack */
extern T0* T263f22(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T2 T263f8(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge116os7894;
extern T0* ge116ov7894;
extern T0* T263f11(T0* C);
/* GEANT_OUTOFDATE_TASK.task_make */
extern void T263f28(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T263f31(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T263f33(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T263f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T263f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T263f30(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T335c18(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T335f26(T0* C, T0* a1);
/* GEANT_TARGET.outofdate_task_name */
extern unsigned char ge130os1990;
extern T0* ge130ov1990;
extern T0* T24f67(T0* C);
/* GEANT_XSLT_TASK.make */
extern T0* T262c39(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T332f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge124os7854;
extern T0* ge124ov7854;
extern T0* T262f28(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T332f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge124os7853;
extern T0* ge124ov7853;
extern T0* T262f27(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T332f34(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge124os7851;
extern T0* ge124ov7851;
extern T0* T262f26(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].force_last */
extern void T334f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].resize */
extern void T334f12(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].resize */
extern T0* T367f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_PAIR [STRING, STRING]].resized_area */
extern T0* T366f3(T0* C, T4 a1);
/* SPECIAL [DS_PAIR [STRING, STRING]].make */
extern T0* T366c4(T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_capacity */
extern T4 T334f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].extendible */
extern T2 T334f8(T0* C, T4 a1);
/* DS_PAIR [STRING, STRING].make */
extern T0* T333c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T2 T316f3(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T262f25(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge124os7855;
extern T0* ge124ov7855;
extern T0* T262f24(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T332f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge124os7852;
extern T0* ge124ov7852;
extern T0* T262f23(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T332f32(T0* C, T2 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T2 T262f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T262f31(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T262f35(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T262f34(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge124os7845;
extern T0* ge124ov7845;
extern T0* T262f21(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T332f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge124os7844;
extern T0* ge124ov7844;
extern T0* T262f20(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T332f30(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge124os7843;
extern T0* ge124ov7843;
extern T0* T262f19(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T332f29(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge124os7842;
extern T0* ge124ov7842;
extern T0* T262f18(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T332f28(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T332f39(T0* C, T4 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge124os7850;
extern T0* ge124ov7850;
extern T0* T262f17(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T332f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge124os7849;
extern T0* ge124ov7849;
extern T0* T262f16(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T332f26(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge124os7848;
extern T0* ge124ov7848;
extern T0* T262f15(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T332f25(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge124os7847;
extern T0* ge124ov7847;
extern T0* T262f14(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T262f13(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T262f12(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T262f5(T0* C);
/* GEANT_XSLT_TASK.target_arguments_stack */
extern T0* T262f33(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T2 T262f8(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge124os7846;
extern T0* ge124ov7846;
extern T0* T262f11(T0* C);
/* GEANT_XSLT_TASK.task_make */
extern void T262f41(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T262f44(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T262f46(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T262f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T262f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T262f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T332c24(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].make */
extern T0* T334c10(T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING, STRING]].new_cursor */
extern T0* T334f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING, STRING]].make */
extern T0* T368c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].make */
extern T0* T367f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_PAIR [STRING, STRING]].make_area */
extern T0* T383c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING, STRING]].default_create */
extern T0* T367c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T332f24p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T332f38(T0* C, T0* a1);
/* GEANT_TARGET.xslt_task_name */
extern unsigned char ge130os1989;
extern T0* ge130ov1989;
extern T0* T24f66(T0* C);
/* GEANT_SETENV_TASK.make */
extern T0* T261c22(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T331f9(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge118os7832;
extern T0* ge118ov7832;
extern T0* T261f13(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T331f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T261f12(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T261f5(T0* C);
/* GEANT_SETENV_TASK.target_arguments_stack */
extern T0* T261f18(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T2 T261f8(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge118os7831;
extern T0* ge118ov7831;
extern T0* T261f11(T0* C);
/* GEANT_SETENV_TASK.task_make */
extern void T261f24(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T261f27(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T261f29(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T261f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T261f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T261f26(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T331c7(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T331f11(T0* C, T0* a1);
/* GEANT_TARGET.setenv_task_name */
extern unsigned char ge130os1988;
extern T0* ge130ov1988;
extern T0* T24f65(T0* C);
/* GEANT_MOVE_TASK.make */
extern T0* T260c24(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T330f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge115os7813;
extern T0* ge115ov7813;
extern T0* T260f15(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T330f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge115os7812;
extern T0* ge115ov7812;
extern T0* T260f14(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T330f17(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge115os7811;
extern T0* ge115ov7811;
extern T0* T260f13(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T330f16(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T260f12(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T260f5(T0* C);
/* GEANT_MOVE_TASK.target_arguments_stack */
extern T0* T260f20(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T2 T260f8(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge115os7810;
extern T0* ge115ov7810;
extern T0* T260f11(T0* C);
/* GEANT_MOVE_TASK.task_make */
extern void T260f26(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T260f29(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T260f31(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T260f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T260f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T260f28(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T330c15(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T330f21(T0* C, T0* a1);
/* GEANT_TARGET.move_task_name */
extern unsigned char ge130os1987;
extern T0* ge130ov1987;
extern T0* T24f64(T0* C);
/* GEANT_COPY_TASK.make */
extern T0* T259c29(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T329f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge99os7790;
extern T0* ge99ov7790;
extern T0* T259f17(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T329f22(T0* C, T2 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T2 T259f16(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T259f20(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T259f25(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T259f24(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T259f23(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge99os7789;
extern T0* ge99ov7789;
extern T0* T259f15(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T329f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge99os7788;
extern T0* ge99ov7788;
extern T0* T259f14(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T329f20(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge99os7787;
extern T0* ge99ov7787;
extern T0* T259f13(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T329f19(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T259f12(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T259f5(T0* C);
/* GEANT_COPY_TASK.target_arguments_stack */
extern T0* T259f22(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T2 T259f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge99os7786;
extern T0* ge99ov7786;
extern T0* T259f11(T0* C);
/* GEANT_COPY_TASK.task_make */
extern void T259f31(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T259f34(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T259f36(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T259f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T259f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T259f33(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T329c18(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T329f25(T0* C, T0* a1);
/* GEANT_TARGET.copy_task_name */
extern unsigned char ge130os1986;
extern T0* ge130ov1986;
extern T0* T24f63(T0* C);
/* GEANT_DELETE_TASK.make */
extern T0* T258c24(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T326f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T327c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T328f30(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge128os8313;
extern T0* ge128ov8313;
extern T0* T327f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T328f29(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T327f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T327f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge128os8312;
extern T0* ge128ov8312;
extern T0* T327f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T328f28(T0* C, T2 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T2 T327f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T327f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T327f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T327f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge128os8311;
extern T0* ge128ov8311;
extern T0* T327f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T328f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge128os8310;
extern T0* ge128ov8310;
extern T0* T327f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T328f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge128os8309;
extern T0* ge128ov8309;
extern T0* T327f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T328f25(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T327f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T327f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.target_arguments_stack */
extern T0* T327f14(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T2 T327f4(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge128os8308;
extern T0* ge128ov8308;
extern T0* T327f3(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T328c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T328f31(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T327f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T327f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T327f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T327f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge100os7768;
extern T0* ge100ov7768;
extern T0* T258f15(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T326f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge100os7767;
extern T0* ge100ov7767;
extern T0* T258f14(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T326f19(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge100os7766;
extern T0* ge100ov7766;
extern T0* T258f13(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T326f18(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T258f12(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T258f5(T0* C);
/* GEANT_DELETE_TASK.target_arguments_stack */
extern T0* T258f20(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T2 T258f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge100os7765;
extern T0* ge100ov7765;
extern T0* T258f11(T0* C);
/* GEANT_DELETE_TASK.task_make */
extern void T258f26(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T258f29(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T258f31(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T258f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T258f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T258f28(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T326c17(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T326f23(T0* C, T0* a1);
/* GEANT_TARGET.delete_task_name */
extern unsigned char ge130os1985;
extern T0* ge130ov1985;
extern T0* T24f62(T0* C);
/* GEANT_MKDIR_TASK.make */
extern T0* T257c21(T0* a1, T0* a2);
/* GEANT_MKDIR_COMMAND.set_directory */
extern void T325f10(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.attribute_value */
extern T0* T257f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T257f5(T0* C);
/* GEANT_MKDIR_TASK.target_arguments_stack */
extern T0* T257f17(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T2 T257f8(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.directory_attribute_name */
extern unsigned char ge114os7757;
extern T0* ge114ov7757;
extern T0* T257f11(T0* C);
/* GEANT_MKDIR_TASK.task_make */
extern void T257f23(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T257f26(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T257f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T257f27(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T257f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T257f25(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T325c9(T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T325f12(T0* C, T0* a1);
/* GEANT_TARGET.mkdir_task_name */
extern unsigned char ge130os1984;
extern T0* ge130ov1984;
extern T0* T24f61(T0* C);
/* GEANT_ECHO_TASK.make */
extern T0* T256c27(T0* a1, T0* a2);
/* GEANT_ECHO_COMMAND.set_append */
extern void T324f10(T0* C, T2 a1);
/* GEANT_ECHO_TASK.boolean_value */
extern T2 T256f15(T0* C, T0* a1);
/* GEANT_ECHO_TASK.std */
extern T0* T256f18(T0* C);
/* GEANT_ECHO_TASK.false_attribute_value */
extern T0* T256f23(T0* C);
/* GEANT_ECHO_TASK.true_attribute_value */
extern T0* T256f22(T0* C);
/* GEANT_ECHO_TASK.string_ */
extern T0* T256f21(T0* C);
/* GEANT_ECHO_TASK.append_attribute_name */
extern unsigned char ge101os7745;
extern T0* ge101ov7745;
extern T0* T256f14(T0* C);
/* GEANT_ECHO_COMMAND.set_to_file */
extern void T324f9(T0* C, T0* a1);
/* GEANT_ECHO_TASK.to_file_attribute_name */
extern unsigned char ge101os7744;
extern T0* ge101ov7744;
extern T0* T256f13(T0* C);
/* GEANT_ECHO_COMMAND.set_message */
extern void T324f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.attribute_value */
extern T0* T256f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T256f5(T0* C);
/* GEANT_ECHO_TASK.target_arguments_stack */
extern T0* T256f20(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T256f30(T0* C, T4 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T256f19(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T2 T256f8(T0* C, T0* a1);
/* GEANT_ECHO_TASK.message_attribute_name */
extern unsigned char ge101os7743;
extern T0* ge101ov7743;
extern T0* T256f11(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T2 T161f46(T0* C);
/* STRING.is_empty */
extern T2 T16f27(T0* C);
/* XM_ELEMENT.text */
extern T0* T78f26(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T42f6(T0* C, T0* a1, T0* a2);
/* STRING.append_string */
extern void T16f35(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T42f9(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T161f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T161f7(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T78f27(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T2 T275f10(T0* C);
/* GEANT_ECHO_TASK.task_make */
extern void T256f29(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T256f32(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T256f34(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T256f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T256f35(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T256f31(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T324c7(T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T324f12(T0* C, T0* a1);
/* GEANT_TARGET.echo_task_name */
extern unsigned char ge130os1983;
extern T0* ge130ov1983;
extern T0* T24f60(T0* C);
/* GEANT_GEXMLSPLIT_TASK.make */
extern T0* T255c21(T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_COMMAND.set_input_filename */
extern void T323f11(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.attribute_value */
extern T0* T255f12(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.project_variables_resolver */
extern T0* T255f5(T0* C);
/* GEANT_GEXMLSPLIT_TASK.target_arguments_stack */
extern T0* T255f17(T0* C);
/* GEANT_GEXMLSPLIT_TASK.has_attribute */
extern T2 T255f8(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.input_filename_attribute_name */
extern unsigned char ge110os7734;
extern T0* ge110ov7734;
extern T0* T255f11(T0* C);
/* GEANT_GEXMLSPLIT_TASK.task_make */
extern void T255f23(T0* C, T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.interpreting_element_make */
extern void T255f26(T0* C, T0* a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.set_project */
extern void T255f28(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.element_make */
extern void T255f27(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.set_xml_element */
extern void T255f29(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_TASK.set_command */
extern void T255f25(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.make */
extern T0* T323c10(T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.make */
extern void T323f10p1(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.set_project */
extern void T323f13(T0* C, T0* a1);
/* GEANT_TARGET.gexmlsplit_task_name */
extern unsigned char ge130os1982;
extern T0* ge130ov1982;
extern T0* T24f59(T0* C);
/* GEANT_GEANT_TASK.make */
extern T0* T254c33(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T254f21(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T254f36(T0* C, T4 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T254f25(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T254f24(T0* C);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge104os7707;
extern T0* ge104ov7707;
extern T0* T254f20(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T254f19(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T254f27(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge104os7706;
extern T0* ge104ov7706;
extern T0* T254f18(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge104os7704;
extern T0* ge104ov7704;
extern T0* T254f17(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T321f28(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge104os7705;
extern T0* ge104ov7705;
extern T0* T254f16(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T321f27(T0* C, T2 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T321f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge104os7701;
extern T0* ge104ov7701;
extern T0* T254f15(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T321f25(T0* C, T2 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T2 T254f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T254f29(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T254f28(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge104os7703;
extern T0* ge104ov7703;
extern T0* T254f13(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T321f24(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T254f12(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T254f5(T0* C);
/* GEANT_GEANT_TASK.target_arguments_stack */
extern T0* T254f26(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T2 T254f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge104os7702;
extern T0* ge104ov7702;
extern T0* T254f11(T0* C);
/* GEANT_GEANT_TASK.task_make */
extern void T254f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T254f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T254f40(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T254f39(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T254f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T254f37(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T321c23(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T321f23p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T321f30(T0* C, T0* a1);
/* GEANT_TARGET.geant_task_name */
extern unsigned char ge130os1981;
extern T0* ge130ov1981;
extern T0* T24f58(T0* C);
/* GEANT_GETEST_TASK.make */
extern T0* T253c37(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force */
extern void T59f68(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].keys_put */
extern void T59f60(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T59f58(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T59f57(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T4 T59f34(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T4 T59f32(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T4 T59f33(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T59f56(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T59f66(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_resize */
extern void T59f65(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_resize */
extern void T59f64(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_item */
extern T0* T59f28(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T59f63(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T4 T59f30(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_put */
extern void T59f59(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T59f55(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge108os7672;
extern T0* ge108ov7672;
extern T0* T253f27(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T253f26(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T253f25(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T253f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge108os7671;
extern T0* ge108ov7671;
extern T0* T253f23(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T320f30(T0* C, T2 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge108os7670;
extern T0* ge108ov7670;
extern T0* T253f22(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T320f29(T0* C, T2 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge108os7669;
extern T0* ge108ov7669;
extern T0* T253f21(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T320f28(T0* C, T2 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge108os7668;
extern T0* ge108ov7668;
extern T0* T253f20(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T320f27(T0* C, T2 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge108os7667;
extern T0* ge108ov7667;
extern T0* T253f19(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T320f26(T0* C, T2 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge108os7666;
extern T0* ge108ov7666;
extern T0* T253f18(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T320f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge108os7665;
extern T0* ge108ov7665;
extern T0* T253f17(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T320f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge108os7664;
extern T0* ge108ov7664;
extern T0* T253f16(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T320f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge108os7663;
extern T0* ge108ov7663;
extern T0* T253f15(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T320f22(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T253f14(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T253f5(T0* C);
/* GEANT_GETEST_TASK.target_arguments_stack */
extern T0* T253f33(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge108os7662;
extern T0* ge108ov7662;
extern T0* T253f13(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T320f21(T0* C, T2 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T2 T253f12(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T253f30(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T253f32(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T2 T253f8(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge108os7661;
extern T0* ge108ov7661;
extern T0* T253f11(T0* C);
/* GEANT_GETEST_TASK.task_make */
extern void T253f39(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T253f42(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T253f44(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T253f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T253f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T253f41(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T320c20(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T320f20p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T320f32(T0* C, T0* a1);
/* GEANT_TARGET.getest_task_name */
extern unsigned char ge130os1980;
extern T0* ge130ov1980;
extern T0* T24f57(T0* C);
/* GEANT_GEPP_TASK.make */
extern T0* T252c32(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T319f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge107os7636;
extern T0* ge107ov7636;
extern T0* T252f20(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T319f24(T0* C, T2 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge107os7635;
extern T0* ge107ov7635;
extern T0* T252f19(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T319f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge107os7634;
extern T0* ge107ov7634;
extern T0* T252f18(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T252f17(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T252f26(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge107os7633;
extern T0* ge107ov7633;
extern T0* T252f16(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T319f22(T0* C, T2 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T2 T252f15(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T252f23(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T252f28(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T252f27(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge107os7632;
extern T0* ge107ov7632;
extern T0* T252f14(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T319f21(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge107os7631;
extern T0* ge107ov7631;
extern T0* T252f13(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T319f20(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T252f12(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T252f5(T0* C);
/* GEANT_GEPP_TASK.target_arguments_stack */
extern T0* T252f25(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T2 T252f8(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge107os7630;
extern T0* ge107ov7630;
extern T0* T252f11(T0* C);
/* GEANT_GEPP_TASK.task_make */
extern void T252f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T252f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T252f39(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T252f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T252f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T252f36(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T319c19(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T319f19p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T319f27(T0* C, T0* a1);
/* GEANT_TARGET.gepp_task_name */
extern unsigned char ge130os1979;
extern T0* ge130ov1979;
extern T0* T24f56(T0* C);
/* GEANT_GEYACC_TASK.make */
extern T0* T251c32(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T318f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge111os7605;
extern T0* ge111ov7605;
extern T0* T251f20(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T318f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge111os7604;
extern T0* ge111ov7604;
extern T0* T251f19(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T318f23(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge111os7603;
extern T0* ge111ov7603;
extern T0* T251f18(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T318f22(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge111os7602;
extern T0* ge111ov7602;
extern T0* T251f17(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T318f21(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge111os7607;
extern T0* ge111ov7607;
extern T0* T251f16(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T318f20(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge111os7606;
extern T0* ge111ov7606;
extern T0* T251f15(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T318f19(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T251f14(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T251f5(T0* C);
/* GEANT_GEYACC_TASK.target_arguments_stack */
extern T0* T251f28(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge111os7601;
extern T0* ge111ov7601;
extern T0* T251f13(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T318f18(T0* C, T2 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T2 T251f12(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T251f23(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T251f27(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T251f26(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T251f25(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T2 T251f8(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge111os7600;
extern T0* ge111ov7600;
extern T0* T251f11(T0* C);
/* GEANT_GEYACC_TASK.task_make */
extern void T251f34(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T251f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T251f39(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T251f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T251f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T251f36(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T318c17(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T318f17p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T318f27(T0* C, T0* a1);
/* GEANT_TARGET.geyacc_task_name */
extern unsigned char ge130os1978;
extern T0* ge130ov1978;
extern T0* T24f55(T0* C);
/* GEANT_GELEX_TASK.make */
extern T0* T250c35(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T317f31(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge106os7571;
extern T0* ge106ov7571;
extern T0* T250f24(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T317f30(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge106os7570;
extern T0* ge106ov7570;
extern T0* T250f23(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T317f29(T0* C, T2 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge106os7569;
extern T0* ge106ov7569;
extern T0* T250f22(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T317f28(T0* C, T2 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge106os7568;
extern T0* ge106ov7568;
extern T0* T250f21(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T317f27(T0* C, T2 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge106os7567;
extern T0* ge106ov7567;
extern T0* T250f20(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T317f26(T0* C, T2 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge106os7566;
extern T0* ge106ov7566;
extern T0* T250f19(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T317f25(T0* C, T2 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge106os7565;
extern T0* ge106ov7565;
extern T0* T250f18(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T317f24(T0* C, T2 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge106os7564;
extern T0* ge106ov7564;
extern T0* T250f17(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T317f23(T0* C, T2 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge106os7563;
extern T0* ge106ov7563;
extern T0* T250f16(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T317f22(T0* C, T2 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T2 T250f15(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T250f27(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T250f31(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T250f30(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge106os7562;
extern T0* ge106ov7562;
extern T0* T250f14(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T317f21(T0* C, T0* a1);
/* GEANT_GELEX_TASK.string_ */
extern T0* T250f13(T0* C);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T250f12(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T250f5(T0* C);
/* GEANT_GELEX_TASK.target_arguments_stack */
extern T0* T250f29(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T2 T250f8(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge106os7561;
extern T0* ge106ov7561;
extern T0* T250f11(T0* C);
/* GEANT_GELEX_TASK.task_make */
extern void T250f37(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T250f40(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T250f42(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T250f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T250f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T250f39(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T317c20(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T317f20p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T317f33(T0* C, T0* a1);
/* GEANT_TARGET.gelex_task_name */
extern unsigned char ge130os1977;
extern T0* ge130ov1977;
extern T0* T24f54(T0* C);
/* GEANT_GEXACE_TASK.make */
extern T0* T249c33(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_last */
extern void T59f67(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T249f21(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T249f26(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge109os7537;
extern T0* ge109ov7537;
extern T0* T249f20(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T315f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge109os7536;
extern T0* ge109ov7536;
extern T0* T249f19(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T315f25(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge109os7535;
extern T0* ge109ov7535;
extern T0* T249f18(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T315f24(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge109os7534;
extern T0* ge109ov7534;
extern T0* T249f17(T0* C);
/* GEANT_GEXACE_TASK.cluster_attribute_name */
extern unsigned char ge109os7533;
extern T0* ge109ov7533;
extern T0* T249f16(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T315f23(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T249f15(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T249f5(T0* C);
/* GEANT_GEXACE_TASK.target_arguments_stack */
extern T0* T249f29(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge109os7532;
extern T0* ge109ov7532;
extern T0* T249f14(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T315f22(T0* C, T2 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge109os7531;
extern T0* ge109ov7531;
extern T0* T249f13(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T315f21(T0* C, T2 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T2 T249f12(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T249f24(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T249f28(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T249f27(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T2 T249f8(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge109os7530;
extern T0* ge109ov7530;
extern T0* T249f11(T0* C);
/* GEANT_GEXACE_TASK.task_make */
extern void T249f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T249f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T249f40(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T249f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T249f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T249f37(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T315c20(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T315f20p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T315f28(T0* C, T0* a1);
/* GEANT_TARGET.gexace_task_name */
extern unsigned char ge130os1976;
extern T0* ge130ov1976;
extern T0* T24f53(T0* C);
/* GEANT_UNSET_TASK.make */
extern T0* T248c21(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T314f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T248f12(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T248f5(T0* C);
/* GEANT_UNSET_TASK.target_arguments_stack */
extern T0* T248f17(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T2 T248f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge122os7522;
extern T0* ge122ov7522;
extern T0* T248f11(T0* C);
/* GEANT_UNSET_TASK.task_make */
extern void T248f23(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T248f26(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T248f28(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T248f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T248f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T248f25(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T314c5(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T314f8(T0* C, T0* a1);
/* GEANT_TARGET.unset_task_name */
extern unsigned char ge130os1975;
extern T0* ge130ov1975;
extern T0* T24f52(T0* C);
/* GEANT_SET_TASK.make */
extern T0* T247c22(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T313f8(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge119os7512;
extern T0* ge119ov7512;
extern T0* T247f13(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T313f7(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T247f12(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T247f5(T0* C);
/* GEANT_SET_TASK.target_arguments_stack */
extern T0* T247f18(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T2 T247f8(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge119os7511;
extern T0* ge119ov7511;
extern T0* T247f11(T0* C);
/* GEANT_SET_TASK.task_make */
extern void T247f24(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T247f27(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T247f29(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T247f28(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T247f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T247f26(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T313c6(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T313f10(T0* C, T0* a1);
/* GEANT_TARGET.set_task_name */
extern unsigned char ge130os1974;
extern T0* ge130ov1974;
extern T0* T24f51(T0* C);
/* GEANT_LCC_TASK.make */
extern T0* T246c22(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T312f13(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge113os7501;
extern T0* ge113ov7501;
extern T0* T246f13(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T312f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T246f12(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T246f5(T0* C);
/* GEANT_LCC_TASK.target_arguments_stack */
extern T0* T246f18(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T2 T246f8(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge113os7500;
extern T0* ge113ov7500;
extern T0* T246f11(T0* C);
/* GEANT_LCC_TASK.task_make */
extern void T246f24(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T246f27(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T246f29(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T246f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T246f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T246f26(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T312c11(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T312f15(T0* C, T0* a1);
/* GEANT_TARGET.lcc_task_name */
extern unsigned char ge130os1973;
extern T0* ge130ov1973;
extern T0* T24f50(T0* C);
/* GEANT_EXEC_TASK.make */
extern T0* T245c28(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T309f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge102os7484;
extern T0* ge102ov7484;
extern T0* T245f16(T0* C);
/* GEANT_EXEC_COMMAND.set_accept_errors */
extern void T309f14(T0* C, T2 a1);
/* GEANT_EXEC_TASK.boolean_value */
extern T2 T245f15(T0* C, T0* a1);
/* GEANT_EXEC_TASK.std */
extern T0* T245f19(T0* C);
/* GEANT_EXEC_TASK.false_attribute_value */
extern T0* T245f24(T0* C);
/* GEANT_EXEC_TASK.true_attribute_value */
extern T0* T245f23(T0* C);
/* GEANT_EXEC_TASK.string_ */
extern T0* T245f22(T0* C);
/* GEANT_EXEC_TASK.accept_errors_attribute_name */
extern unsigned char ge102os7482;
extern T0* ge102ov7482;
extern T0* T245f14(T0* C);
/* GEANT_EXEC_COMMAND.set_exit_code_variable_name */
extern void T309f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge102os7483;
extern T0* ge102ov7483;
extern T0* T245f13(T0* C);
/* GEANT_EXEC_COMMAND.set_command_line */
extern void T309f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.attribute_value */
extern T0* T245f12(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T245f5(T0* C);
/* GEANT_EXEC_TASK.target_arguments_stack */
extern T0* T245f21(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T2 T245f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.executable_attribute_name */
extern unsigned char ge102os7481;
extern T0* ge102ov7481;
extern T0* T245f11(T0* C);
/* GEANT_EXEC_TASK.task_make */
extern void T245f30(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T245f33(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T245f35(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T245f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T245f36(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T245f32(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T309c11(T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T309f17(T0* C, T0* a1);
/* GEANT_TARGET.exec_task_name */
extern unsigned char ge130os1972;
extern T0* ge130ov1972;
extern T0* T24f49(T0* C);
/* GEANT_VE_TASK.make */
extern T0* T244c32(T0* a1, T0* a2);
/* GEANT_VE_COMMAND.set_exit_code_variable_name */
extern void T308f26(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value */
extern T0* T244f20(T0* C, T0* a1);
/* GEANT_VE_TASK.project_variables_resolver */
extern T0* T244f5(T0* C);
/* GEANT_VE_TASK.target_arguments_stack */
extern T0* T244f28(T0* C);
/* GEANT_VE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge123os7456;
extern T0* ge123ov7456;
extern T0* T244f19(T0* C);
/* GEANT_VE_COMMAND.set_tuning_level */
extern void T308f25(T0* C, T0* a1);
/* GEANT_VE_TASK.level_attribute_name */
extern unsigned char ge123os7455;
extern T0* ge123ov7455;
extern T0* T244f18(T0* C);
/* GEANT_VE_COMMAND.set_tuned_system */
extern void T308f24(T0* C, T0* a1);
/* GEANT_VE_TASK.tune_attribute_name */
extern unsigned char ge123os7454;
extern T0* ge123ov7454;
extern T0* T244f17(T0* C);
/* GEANT_VE_COMMAND.set_recursive_clean */
extern void T308f23(T0* C, T2 a1);
/* GEANT_VE_TASK.boolean_value */
extern T2 T244f16(T0* C, T0* a1);
/* GEANT_VE_TASK.std */
extern T0* T244f23(T0* C);
/* GEANT_VE_TASK.false_attribute_value */
extern T0* T244f27(T0* C);
/* GEANT_VE_TASK.true_attribute_value */
extern T0* T244f26(T0* C);
/* GEANT_VE_TASK.string_ */
extern T0* T244f25(T0* C);
/* GEANT_VE_TASK.recursive_attribute_name */
extern unsigned char ge123os7453;
extern T0* ge123ov7453;
extern T0* T244f15(T0* C);
/* GEANT_VE_COMMAND.set_clean */
extern void T308f22(T0* C, T0* a1);
/* GEANT_VE_TASK.clean_attribute_name */
extern unsigned char ge123os7452;
extern T0* ge123ov7452;
extern T0* T244f14(T0* C);
/* GEANT_VE_COMMAND.set_xace_filename */
extern void T308f21(T0* C, T0* a1);
/* GEANT_VE_TASK.xace_attribute_name */
extern unsigned char ge123os7451;
extern T0* ge123ov7451;
extern T0* T244f13(T0* C);
/* GEANT_VE_COMMAND.set_esd_filename */
extern void T308f20(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value_or_default */
extern T0* T244f12(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.has_attribute */
extern T2 T244f8(T0* C, T0* a1);
/* GEANT_VE_TASK.esd_attribute_name */
extern unsigned char ge123os7450;
extern T0* ge123ov7450;
extern T0* T244f11(T0* C);
/* GEANT_VE_TASK.task_make */
extern void T244f34(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.interpreting_element_make */
extern void T244f37(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.set_project */
extern void T244f39(T0* C, T0* a1);
/* GEANT_VE_TASK.element_make */
extern void T244f38(T0* C, T0* a1);
/* GEANT_VE_TASK.set_xml_element */
extern void T244f40(T0* C, T0* a1);
/* GEANT_VE_TASK.set_command */
extern void T244f36(T0* C, T0* a1);
/* GEANT_VE_COMMAND.make */
extern T0* T308c19(T0* a1);
/* GEANT_VE_COMMAND.set_project */
extern void T308f28(T0* C, T0* a1);
/* GEANT_TARGET.ve_task_name */
extern unsigned char ge130os1971;
extern T0* ge130ov1971;
extern T0* T24f48(T0* C);
/* GEANT_ISE_TASK.make */
extern T0* T243c31(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T307f23(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T243f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T243f5(T0* C);
/* GEANT_ISE_TASK.target_arguments_stack */
extern T0* T243f27(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge112os7428;
extern T0* ge112ov7428;
extern T0* T243f18(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T307f22(T0* C, T2 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge112os7426;
extern T0* ge112ov7426;
extern T0* T243f17(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T307f21(T0* C, T2 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T2 T243f16(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T243f22(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T243f26(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T243f25(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T243f24(T0* C);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge112os7425;
extern T0* ge112ov7425;
extern T0* T243f15(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T307f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge112os7427;
extern T0* ge112ov7427;
extern T0* T243f14(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T307f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge112os7424;
extern T0* ge112ov7424;
extern T0* T243f13(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T307f18(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T243f12(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T2 T243f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge112os7423;
extern T0* ge112ov7423;
extern T0* T243f11(T0* C);
/* GEANT_ISE_TASK.task_make */
extern void T243f33(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T243f36(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T243f38(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T243f37(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T243f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T243f35(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T307c17(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T307f25(T0* C, T0* a1);
/* GEANT_TARGET.ise_task_name */
extern unsigned char ge130os1970;
extern T0* ge130ov1970;
extern T0* T24f47(T0* C);
/* GEANT_SE_TASK.make */
extern T0* T242c33(T0* a1, T0* a2);
/* GEANT_SE_COMMAND.set_exit_code_variable_name */
extern void T306f31(T0* C, T0* a1);
/* GEANT_SE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge120os7395;
extern T0* ge120ov7395;
extern T0* T242f21(T0* C);
/* GEANT_SE_COMMAND.set_no_style_warning */
extern void T306f30(T0* C, T2 a1);
/* GEANT_SE_TASK.no_style_warning_attribute_name */
extern unsigned char ge120os7393;
extern T0* ge120ov7393;
extern T0* T242f20(T0* C);
/* GEANT_SE_COMMAND.set_case_insensitive */
extern void T306f29(T0* C, T2 a1);
/* GEANT_SE_TASK.boolean_value */
extern T2 T242f19(T0* C, T0* a1);
/* GEANT_SE_TASK.std */
extern T0* T242f24(T0* C);
/* GEANT_SE_TASK.false_attribute_value */
extern T0* T242f29(T0* C);
/* GEANT_SE_TASK.true_attribute_value */
extern T0* T242f28(T0* C);
/* GEANT_SE_TASK.string_ */
extern T0* T242f27(T0* C);
/* GEANT_SE_TASK.case_insensitive_attribute_name */
extern unsigned char ge120os7392;
extern T0* ge120ov7392;
extern T0* T242f18(T0* C);
/* GEANT_SE_COMMAND.set_executable */
extern void T306f28(T0* C, T0* a1);
/* GEANT_SE_TASK.executable_attribute_name */
extern unsigned char ge120os7391;
extern T0* ge120ov7391;
extern T0* T242f17(T0* C);
/* GEANT_SE_COMMAND.set_creation_procedure */
extern void T306f27(T0* C, T0* a1);
/* GEANT_SE_TASK.creation_procedure_attribute_name */
extern unsigned char ge120os7390;
extern T0* ge120ov7390;
extern T0* T242f16(T0* C);
/* GEANT_SE_COMMAND.set_root_class */
extern void T306f26(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value */
extern T0* T242f15(T0* C, T0* a1);
/* GEANT_SE_TASK.project_variables_resolver */
extern T0* T242f5(T0* C);
/* GEANT_SE_TASK.target_arguments_stack */
extern T0* T242f26(T0* C);
/* GEANT_SE_TASK.root_class_attribute_name */
extern unsigned char ge120os7389;
extern T0* ge120ov7389;
extern T0* T242f14(T0* C);
/* GEANT_SE_COMMAND.set_clean */
extern void T306f25(T0* C, T0* a1);
/* GEANT_SE_TASK.clean_attribute_name */
extern unsigned char ge120os7394;
extern T0* ge120ov7394;
extern T0* T242f13(T0* C);
/* GEANT_SE_COMMAND.set_ace_filename */
extern void T306f24(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value_or_default */
extern T0* T242f12(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.has_attribute */
extern T2 T242f8(T0* C, T0* a1);
/* GEANT_SE_TASK.ace_attribute_name */
extern unsigned char ge120os7388;
extern T0* ge120ov7388;
extern T0* T242f11(T0* C);
/* GEANT_SE_TASK.task_make */
extern void T242f35(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.interpreting_element_make */
extern void T242f38(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.set_project */
extern void T242f40(T0* C, T0* a1);
/* GEANT_SE_TASK.element_make */
extern void T242f39(T0* C, T0* a1);
/* GEANT_SE_TASK.set_xml_element */
extern void T242f41(T0* C, T0* a1);
/* GEANT_SE_TASK.set_command */
extern void T242f37(T0* C, T0* a1);
/* GEANT_SE_COMMAND.make */
extern T0* T306c23(T0* a1);
/* GEANT_SE_COMMAND.set_project */
extern void T306f33(T0* C, T0* a1);
/* GEANT_TARGET.se_task_name */
extern unsigned char ge130os1969;
extern T0* ge130ov1969;
extern T0* T24f46(T0* C);
/* GEANT_GEC_TASK.make */
extern T0* T241c31(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T305f24(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T241f19(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T241f5(T0* C);
/* GEANT_GEC_TASK.target_arguments_stack */
extern T0* T241f27(T0* C);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge105os7357;
extern T0* ge105ov7357;
extern T0* T241f18(T0* C);
/* GEANT_GEC_COMMAND.set_cat_mode */
extern void T305f23(T0* C, T2 a1);
/* GEANT_GEC_TASK.cat_attribute_name */
extern unsigned char ge105os7355;
extern T0* ge105ov7355;
extern T0* T241f17(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T305f22(T0* C, T2 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge105os7358;
extern T0* ge105ov7358;
extern T0* T241f16(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T305f21(T0* C, T2 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T2 T241f15(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T241f22(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T241f26(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T241f25(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T241f24(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge105os7354;
extern T0* ge105ov7354;
extern T0* T241f14(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T305f20(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge105os7356;
extern T0* ge105ov7356;
extern T0* T241f13(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T305f19(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T241f12(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T2 T241f8(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge105os7353;
extern T0* ge105ov7353;
extern T0* T241f11(T0* C);
/* GEANT_GEC_TASK.task_make */
extern void T241f33(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T241f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T241f38(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T241f37(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T241f39(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T241f35(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T305c18(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T305f18p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T305f26(T0* C, T0* a1);
/* GEANT_TARGET.gec_task_name */
extern unsigned char ge130os1968;
extern T0* ge130ov1968;
extern T0* T24f45(T0* C);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge65os1937;
extern T0* ge65ov1937;
extern T0* T24f4(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge65os1938;
extern T0* ge65ov1938;
extern T0* T24f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T2 T42f10(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T2 T42f11(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T2 T161f13(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T4 T161f27(T0* C, T0* a1, T4 a2);
/* STRING.same_string */
extern T2 T16f23(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T2 T161f12(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T4 T161f26(T0* C, T0* a1, T4 a2);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge129os1963;
extern T0* ge129ov1963;
extern T0* T24f5(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T24f23(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T157f2(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T157f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T77f23(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T78f37(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T78f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T157c9(T0* a1);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T44f32(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T60f7(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T4 T60f5(T0* C, T14 a1);
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
extern unsigned char ge265os2938;
extern T0* ge265ov2938;
extern T0* T44f18(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T44f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T43f36(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T43f20(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T43f12(T0* C);
/* GEANT_TARGET.exit_application */
extern void T24f80(T0* C, T4 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T24f18(T0* C);
/* GEANT_TARGET.std */
extern T0* T24f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T2 T44f24(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T2 T303f1(T0* C);
/* KL_DIRECTORY.old_exists */
extern T2 T303f3(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T2 T303f4(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T303f33(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T303f32(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T303c32(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T303f34(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T303f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge265os2936;
extern T0* ge265ov2936;
extern T0* T44f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T2 T43f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T43f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T44f23(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T60f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T43f26(T0* C);
/* GEANT_TARGET.file_system */
extern unsigned char ge189os1324;
extern T0* ge189ov1324;
extern T0* T24f44(T0* C);
/* GEANT_TARGET.unix_file_system */
extern unsigned char ge189os1327;
extern T0* ge189ov1327;
extern T0* T24f75(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T44c31(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge281os2155;
extern T2 ge281ov2155;
extern T2 T39f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T39f4(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge281os2159;
extern T0* ge281ov2159;
extern T0* T39f5(T0* C);
/* STRING.is_equal */
extern T2 T16f4(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f9(T0* C, T0* a1, T0* a2, T4 a3);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T39f3(T0* C, T0* a1);
/* GEANT_TARGET.windows_file_system */
extern unsigned char ge189os1325;
extern T0* ge189ov1325;
extern T0* T24f74(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T43c35(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge281os2154;
extern T2 ge281ov2154;
extern T2 T39f1(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T24f73(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T206f1(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T206f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T206f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T48f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T23f44(T0* C);
/* GEANT_PROJECT_VARIABLES.items_item */
extern T0* T23f47(T0* C, T4 a1);
/* GEANT_VARIABLES.found_item */
extern T0* T25f36(T0* C);
/* GEANT_VARIABLES.items_item */
extern T0* T25f33(T0* C, T4 a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T44f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T43f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T48f8(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T48f12(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T48f11(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T48f10(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T207f2(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item */
extern T0* T156f37(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.items_item */
extern T0* T156f40(T0* C, T4 a1);
/* GEANT_VARIABLES.item */
extern T0* T25f32(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T2 T207f1(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T2 T25f31(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T206f4(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T42f16(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T42f3(T0* C, T0* a1, T4 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T161f69(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T161f73(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T161f69p1(T0* C);
/* STRING.wipe_out */
extern void T16f34(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T206f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T161f45(T0* C);
/* UC_UTF8_STRING.unicode */
extern unsigned char ge218os3070;
extern T0* ge218ov3070;
extern T0* T161f48(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T229c27(void);
/* STRING.out */
extern T0* T16f3(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T78f7(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T2 T78f9(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T2 T275f3(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T206f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T48f16(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T24f28(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T206c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T2 T78f6(T0* C, T0* a1);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T24f43(T0* C);
/* GEANT_PROJECT.log */
extern void T20f42(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T56f18(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T56f19(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T56f20(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T56f13(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T56f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T56f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T56f17(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T56f3(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T20f17(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].forth */
extern void T91f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_forth */
extern void T30f64(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].add_traversing_cursor */
extern void T30f69(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_next_cursor */
extern void T91f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_traversing_cursor */
extern void T30f68(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].set_position */
extern void T91f14(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_item */
extern T4 T30f18(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].go_after */
extern void T91f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_go_after */
extern void T30f74(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_off */
extern T2 T30f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].key */
extern T0* T91f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_key */
extern T0* T30f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_item */
extern T0* T30f17(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].item */
extern T0* T91f2(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_item */
extern T0* T30f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_item */
extern T0* T30f5(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].after */
extern T2 T91f1(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_after */
extern T2 T30f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].start */
extern void T91f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_start */
extern void T30f63(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].is_empty */
extern T2 T30f38(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_cursor */
extern T0* T30f28(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].make */
extern T0* T91c8(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T2 T24f42(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T24f72(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T24f71(T0* C);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T20f16(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T24f34(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T20f32(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T151f2(T0* C);
/* GEANT_PROJECT.calculate_depend_order */
extern void T20f39(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T24f36(T0* C);
/* GEANT_TARGET.show_dependent_targets */
extern void T24f92(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T56f10(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge192os2129;
extern T0* ge192ov2129;
extern T0* T33f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T56c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T56f11(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T56f15(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T56f2(T0* C, T4 a1);
/* KL_STDOUT_FILE.old_make */
extern void T56f14(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T24f7(T0* C, T0* a1, T1 a2);
/* GEANT_TARGET.dependencies */
extern T0* T24f40(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge65os1940;
extern T0* ge65ov1940;
extern T0* T24f41(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T2 T24f39(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T151f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T151f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T92f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_TARGET].resized_area */
extern T0* T89f3(T0* C, T4 a1);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T89c4(T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T4 T151f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T2 T151f6(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T151c8(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T92f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_TARGET].make_area */
extern T0* T169c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T92c3(void);
/* GEANT_PROJECT.start_target */
extern T0* T20f11(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T20f41(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T20f20(T0* C);
/* GEANT_PROJECT.std */
extern T0* T20f5(T0* C);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T20f19(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T20f18(T0* C);
/* GEANT_PROJECT.trace */
extern void T20f25(T0* C, T0* a1);
/* GEANT_PROJECT.show_target_info */
extern void T20f28(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T20f27(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T24f30(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T2 T24f29(T0* C);
/* DS_ARRAYED_LIST [STRING].has */
extern T2 T152f10(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge65os1943;
extern T0* ge65ov1943;
extern T0* T24f8(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].item */
extern T0* T30f2(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].search_position */
extern void T30f45(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].hash_position */
extern T4 T30f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_item */
extern T4 T30f13(T0* C, T4 a1);
/* GEANT.exit_application */
extern void T19f24(T0* C, T4 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T19f14(T0* C);
/* GEANT.std */
extern T0* T19f13(T0* C);
/* STRING.infix "+" */
extern T0* T16f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has */
extern T2 T30f1(T0* C, T0* a1);
/* INTEGER.infix ">" */
extern T2 T4f1(T4* C, T4 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T20f26(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T24f90(T0* C);
/* ARRAY [STRING].force */
extern void T32f15(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].auto_resize */
extern void T32f16(T0* C, T4 a1, T4 a2);
/* SPECIAL [STRING].fill_with */
extern void T31f9(T0* C, T0* a1, T4 a2, T4 a3);
/* SPECIAL [STRING].move_data */
extern void T31f8(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].overlapping_move */
extern void T31f11(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].non_overlapping_move */
extern void T31f10(T0* C, T4 a1, T4 a2, T4 a3);
/* ARRAY [STRING].capacity */
extern T4 T32f8(T0* C);
/* SPECIAL [STRING].aliased_resized_area */
extern T0* T31f4(T0* C, T4 a1);
/* ARRAY [STRING].additional_space */
extern T4 T32f7(T0* C);
/* ARRAY [STRING].empty_area */
extern T2 T32f6(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T88f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T88f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].back */
extern void T91f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_back */
extern void T30f66(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T88f15(T0* C, T4 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T88f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T88f4(T0* C);
/* GEANT_TARGET.conflicts_with */
extern T2 T24f32(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T24f37(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].before */
extern T2 T91f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_before */
extern T2 T30f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING].finish */
extern void T91f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].cursor_finish */
extern void T30f65(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T88f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove */
extern void T30f62(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].remove_position */
extern void T30f67(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_put */
extern void T30f52(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_put */
extern void T30f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_put */
extern void T30f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_put */
extern void T30f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_forth */
extern void T30f71(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_all_cursors */
extern void T30f73(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].move_cursors_after */
extern void T30f72(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].internal_set_key_equality_tester */
extern void T30f70(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].unset_found_item */
extern void T30f47(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T24f95(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T88f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T88f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T88f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].force_last */
extern void T30f44(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].resize */
extern void T30f49(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].clashes_resize */
extern void T30f57(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].special_integer_ */
extern T0* T30f29(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].keys_resize */
extern void T30f56(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].items_resize */
extern void T30f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].slots_resize */
extern void T30f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_modulus */
extern T4 T30f21(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].new_capacity */
extern T4 T30f10(T0* C, T4 a1);
/* GEANT_INHERIT.string_ */
extern T0* T88f3(T0* C);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T88f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T88f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T24f89(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T2 T24f31(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T2 T156f29(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].forth */
extern void T52f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].key */
extern T0* T52f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].after */
extern T2 T52f3(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].start */
extern void T52f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T150f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T149f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T150f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T149f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T150f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T149f22(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T147f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T147f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].forth */
extern void T298f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_forth */
extern void T228f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].add_traversing_cursor */
extern void T228f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_next_cursor */
extern void T298f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].remove_traversing_cursor */
extern void T228f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].set_position */
extern void T298f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_item */
extern T4 T228f16(T0* C, T4 a1);
/* GEANT_PARENT.exit_application */
extern void T147f20(T0* C, T4 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T147f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T147f10(T0* C);
/* GEANT_SELECT.is_executable */
extern T2 T227f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].item */
extern T0* T298f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_item */
extern T0* T228f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_item */
extern T0* T228f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].after */
extern T2 T298f3(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_after */
extern T2 T228f30(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].start */
extern void T298f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_start */
extern void T228f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].cursor_off */
extern T2 T228f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].is_empty */
extern T2 T228f34(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_cursor */
extern T0* T228f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING].make */
extern T0* T298c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T147f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T147f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].has_item */
extern T2 T30f41(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T147f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].forth */
extern void T294f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_forth */
extern void T226f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].add_traversing_cursor */
extern void T226f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_next_cursor */
extern void T294f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].remove_traversing_cursor */
extern void T226f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].set_position */
extern void T294f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_item */
extern T4 T226f16(T0* C, T4 a1);
/* GEANT_REDEFINE.is_executable */
extern T2 T225f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].item */
extern T0* T294f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_item */
extern T0* T226f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_item */
extern T0* T226f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].after */
extern T2 T294f3(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_after */
extern T2 T226f30(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].start */
extern void T294f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_start */
extern void T226f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].cursor_off */
extern T2 T226f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].is_empty */
extern T2 T226f34(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_cursor */
extern T0* T226f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING].make */
extern T0* T294c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T147f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].back */
extern void T290f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_back */
extern void T224f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].add_traversing_cursor */
extern void T224f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_next_cursor */
extern void T290f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].remove_traversing_cursor */
extern void T224f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].set_position */
extern void T290f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_item */
extern T4 T224f16(T0* C, T4 a1);
/* GEANT_RENAME.is_executable */
extern T2 T223f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T223f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].item */
extern T0* T290f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_item */
extern T0* T224f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_item */
extern T0* T224f33(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].before */
extern T2 T290f3(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_before */
extern T2 T224f31(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].finish */
extern void T290f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_finish */
extern void T224f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].cursor_off */
extern T2 T224f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].is_empty */
extern T2 T224f34(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_cursor */
extern T0* T224f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING].make */
extern T0* T290c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T150f2(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T149f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T149f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T2 T150f1(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T2 T149f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T150f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T149f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T2 T149f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T2 T150f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T2 T149f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T2 T149f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T149f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T150c7(T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T21f10(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T21f11(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T21f6(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T43f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T43f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T2 T43f19(T0* C, T1 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T43f11(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T2 T43f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T2 T43f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T44f4(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T44f11(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T2 T44f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T43f3(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T43f7(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T66f8(T0* C, T4 a1);
/* KL_PATHNAME.is_parent */
extern T2 T66f7(T0* C, T4 a1);
/* KL_PATHNAME.is_current */
extern T2 T66f6(T0* C, T4 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge197os2976;
extern T0* ge197ov2976;
extern T0* T43f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T44f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T66f17(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T66f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T66f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T66f14(T0* C, T2 a1);
/* KL_PATHNAME.make */
extern T0* T66c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T43f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T44f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T44f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge195os2976;
extern T0* ge195ov2976;
extern T0* T44f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T44f7(T0* C);
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
extern void T45f57(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T45f62(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T45f63(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T46f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T72f2(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T72f7(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T72f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T2 T72f14(T0* C, T1 a1);
/* CHARACTER.infix ">=" */
extern T2 T1f4(T1* C, T1 a1);
/* STRING.make_empty */
extern T0* T16c39(void);
/* XM_EIFFEL_PARSER.position */
extern T0* T72f4(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T99f1(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T72f11(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T72f17(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T100f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T100f2(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T2 T100f1(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T99f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T176f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T176f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T176c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T2 T99f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T99c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T99f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T177c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T100f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T178f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T178c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T100c5(void);
/* KL_STDERR_FILE.flush */
extern void T34f21(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T34f22(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T34f23(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T73f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T46f7(T0* C);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T29c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T29f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T87c10(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T87f12(T0* C, T4 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T87f6(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T87f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T149f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T149f18(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T211f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_PARENT].resized_area */
extern T0* T212f2(T0* C, T4 a1);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T212c4(T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T4 T149f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T2 T149f6(T0* C, T4 a1);
/* GEANT_PARENT.is_executable */
extern T2 T147f1(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T167c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].force_last */
extern void T228f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_put */
extern void T228f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_put */
extern void T228f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_put */
extern void T228f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_item */
extern T4 T228f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].hash_position */
extern T4 T228f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].resize */
extern void T228f43(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].clashes_resize */
extern void T228f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].special_integer_ */
extern T0* T228f26(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_resize */
extern void T228f50(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_resize */
extern void T228f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T299f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_SELECT].resized_area */
extern T0* T297f2(T0* C, T4 a1);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T297c4(T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].keys_item */
extern T0* T228f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].slots_resize */
extern void T228f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_modulus */
extern T4 T228f18(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].new_capacity */
extern T4 T228f6(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].items_put */
extern void T228f42(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].search_position */
extern void T228f41(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].unset_found_item */
extern void T228f40(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T222c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T227f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T222f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T222f8(T0* C);
/* GEANT_SELECT_ELEMENT.target_arguments_stack */
extern T0* T222f7(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T2 T222f3(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge149os7247;
extern T0* ge149ov7247;
extern T0* T222f2(T0* C);
/* GEANT_SELECT.make */
extern T0* T227c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T222f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T222f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T222f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T222f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge141os6855;
extern T0* ge141ov6855;
extern T0* T167f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].force_last */
extern void T226f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_put */
extern void T226f46(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_put */
extern void T226f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_put */
extern void T226f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_item */
extern T4 T226f9(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].hash_position */
extern T4 T226f7(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].resize */
extern void T226f43(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].clashes_resize */
extern void T226f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].special_integer_ */
extern T0* T226f26(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_resize */
extern void T226f50(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_resize */
extern void T226f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T295f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_REDEFINE].resized_area */
extern T0* T293f2(T0* C, T4 a1);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T293c4(T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].keys_item */
extern T0* T226f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].slots_resize */
extern void T226f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_modulus */
extern T4 T226f18(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].new_capacity */
extern T4 T226f6(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].items_put */
extern void T226f42(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].search_position */
extern void T226f41(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].unset_found_item */
extern void T226f40(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T221c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T225f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T221f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T221f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.target_arguments_stack */
extern T0* T221f7(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T2 T221f3(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge145os7243;
extern T0* ge145ov7243;
extern T0* T221f2(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T225c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T221f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T221f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T221f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T221f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge141os6854;
extern T0* ge141ov6854;
extern T0* T167f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].force_last */
extern void T224f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_put */
extern void T224f47(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_put */
extern void T224f46(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_put */
extern void T224f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_item */
extern T4 T224f10(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].hash_position */
extern T4 T224f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].resize */
extern void T224f44(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].clashes_resize */
extern void T224f52(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].special_integer_ */
extern T0* T224f27(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_resize */
extern void T224f51(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_resize */
extern void T224f50(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T291f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_RENAME].resized_area */
extern T0* T289f2(T0* C, T4 a1);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T289c4(T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].keys_item */
extern T0* T224f15(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].slots_resize */
extern void T224f49(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_modulus */
extern T4 T224f19(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].new_capacity */
extern T4 T224f7(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].items_put */
extern void T224f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].search_position */
extern void T224f40(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].unset_found_item */
extern void T224f42(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T167f20(T0* C, T4 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T167f12(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T167f11(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].has */
extern T2 T224f1(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T220c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T223f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge147os7239;
extern T0* ge147ov7239;
extern T0* T220f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T223f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T220f4(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T220f9(T0* C);
/* GEANT_RENAME_ELEMENT.target_arguments_stack */
extern T0* T220f8(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T2 T220f3(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge147os7238;
extern T0* ge147ov7238;
extern T0* T220f2(T0* C);
/* GEANT_RENAME.make */
extern T0* T223c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T220f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T220f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T220f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T220f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T167f8(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T167f16(T0* C);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge141os6853;
extern T0* ge141ov6853;
extern T0* T167f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T147f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T167f3(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T167f15(T0* C);
/* GEANT_PARENT_ELEMENT.target_arguments_stack */
extern T0* T167f14(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T2 T167f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge141os6851;
extern T0* ge141ov6851;
extern T0* T167f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T147c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].set_key_equality_tester */
extern void T228f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_map_equal */
extern T0* T228c36(T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_with_equality_testers */
extern void T228f39(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_sparse_container */
extern void T228f47(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_slots */
extern void T228f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_clashes */
extern void T228f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_keys */
extern void T228f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING].make_items */
extern void T228f52(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T299f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_SELECT].make_area */
extern T0* T345c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T299c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T296c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].set_key_equality_tester */
extern void T226f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_map_equal */
extern T0* T226c36(T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_with_equality_testers */
extern void T226f39(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_sparse_container */
extern void T226f47(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_slots */
extern void T226f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_clashes */
extern void T226f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_keys */
extern void T226f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING].make_items */
extern void T226f52(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T295f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_REDEFINE].make_area */
extern T0* T344c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T295c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T292c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].set_key_equality_tester */
extern void T224f39(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_map_equal */
extern T0* T224c37(T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_with_equality_testers */
extern void T224f41(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_sparse_container */
extern void T224f48(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_slots */
extern void T224f56(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_clashes */
extern void T224f55(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_keys */
extern void T224f54(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING].make_items */
extern void T224f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T291f2(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_RENAME].make_area */
extern T0* T343c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T291c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T288c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T167f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T167f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T167f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T167f23(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T87f4(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T87f8(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge135os5429;
extern T0* ge135ov5429;
extern T0* T87f3(T0* C);
/* GEANT_INHERIT.make */
extern T0* T88c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T149c16(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T211f1(T0* C, T4 a1);
/* TO_SPECIAL [GEANT_PARENT].make_area */
extern T0* T286c2(T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T211c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T87f11(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T87f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T87f13(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T87f15(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge142os2112;
extern T0* ge142ov2112;
extern T0* T29f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T20f35(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T87c9(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T167c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge141os6852;
extern T0* ge141ov6852;
extern T0* T167f2(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T20f34(T0* C, T2 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T2 T29f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge142os2111;
extern T0* ge142ov2111;
extern T0* T29f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T20f33(T0* C, T0* a1);
/* GEANT_TARGET.make */
extern T0* T24c79(T0* a1, T0* a2);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T153f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T153f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T153f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T2 T153f1(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T2 T153f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T153c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T153f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T24f15(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge63os1309;
extern T0* ge63ov1309;
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
/* GEANT_TARGET.target_arguments_stack */
extern T0* T24f27(T0* C);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge65os1942;
extern T0* ge65ov1942;
extern T0* T24f9(T0* C);
/* GEANT_TARGET.set_exports */
extern void T24f84(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].set_equality_tester */
extern void T152f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].put */
extern void T152f13(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].move_cursors_right */
extern void T152f18(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [STRING].set_position */
extern void T213f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].move_right */
extern void T152f17(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].put_last */
extern void T152f16(T0* C, T0* a1);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge65os1941;
extern T0* ge65ov1941;
extern T0* T24f6(T0* C);
/* GEANT_TARGET.set_description */
extern void T24f83(T0* C, T0* a1);
/* GEANT_TARGET.set_obsolete_message */
extern void T24f82(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T24f81(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge65os1939;
extern T0* ge65ov1939;
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
extern void T30f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_map */
extern T0* T30c42(T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_with_equality_testers */
extern void T30f46(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_sparse_container */
extern void T30f53(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_slots */
extern void T30f61(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_clashes */
extern void T30f60(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_keys */
extern void T30f59(T0* C, T4 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING].make_items */
extern void T30f58(T0* C, T4 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T29f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T29f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge142os2114;
extern T0* ge142ov2114;
extern T0* T29f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T20f31(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge142os2110;
extern T0* ge142ov2110;
extern T0* T29f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T43f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T2 T43f25(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T44f21(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T2 T44f22(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T23f56(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T23f59(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.keys_put */
extern void T23f67(T0* C, T0* a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T23f66(T0* C, T4 a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T23f65(T0* C, T4 a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T23f64(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T23f72(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T23f35(T0* C);
/* GEANT_PROJECT_VARIABLES.keys_resize */
extern void T23f71(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.items_resize */
extern void T23f70(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T23f69(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T4 T23f28(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T4 T23f14(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.items_put */
extern void T23f63(T0* C, T0* a1, T4 a2);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T23f61(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T43f23(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T44f20(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T29f8(T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T29f7(T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T29f18(T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T29f17(T0* C);
/* GEANT_PROJECT.set_description */
extern void T20f30(T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T2 T78f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T29f6(T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T29f4(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T29f22(T0* C, T4 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T29f13(T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T29f12(T0* C);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T2 T29f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge142os2109;
extern T0* ge142ov2109;
extern T0* T29f2(T0* C);
/* GEANT_PROJECT.make */
extern T0* T20c24(T0* a1, T0* a2, T0* a3);
/* GEANT_PROJECT.set_options */
extern void T20f37(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T20f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T29f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T29f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T73f4(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T2 T72f1(T0* C);
/* XM_EIFFEL_PARSER.syntax_error */
extern T2 T72f3(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T72f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T72f207(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T72f213(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T72f212(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T72f223(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T72f251(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T72f257(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T72f258(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T117f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING]].clear_all */
extern void T132f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T127f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T129f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T124f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T120f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T122f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T115f6(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T72f222(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T72f221(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T72f220(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T72f250(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T137f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T109f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T135f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T120f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T120c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T135f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T200c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T135c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T109f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T72f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T109c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T72f249(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].force */
extern void T102f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_put */
extern void T102f52(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_put */
extern void T102f51(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_put */
extern void T102f50(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_item */
extern T4 T102f17(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_item */
extern T4 T102f16(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].hash_position */
extern T4 T102f13(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].resize */
extern void T102f49(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_resize */
extern void T102f57(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].special_integer_ */
extern T0* T102f31(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_resize */
extern void T102f56(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_resize */
extern void T102f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T182f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T179f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T179c4(T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_item */
extern T0* T102f21(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_resize */
extern void T102f54(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_modulus */
extern T4 T102f28(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_capacity */
extern T4 T102f12(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_put */
extern void T102f48(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].search_position */
extern void T102f40(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].unset_found_item */
extern void T102f43(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].has */
extern T2 T102f1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T140c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T140f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T104c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T140f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T140f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T140f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T140f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T140f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER].make */
extern T0* T175c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T140f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T140f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T140f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T140f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T140f32(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T140f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T140f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1295os5476;
extern T0* ge1295ov5476;
extern T0* T140f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T140f53(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1295os5475;
extern T0* ge1295ov5475;
extern T0* T140f48(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1295os5474;
extern T0* ge1295ov5474;
extern T0* T140f46(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1295os5473;
extern T0* ge1295ov5473;
extern T0* T140f44(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1295os5472;
extern T0* ge1295ov5472;
extern T0* T140f42(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1295os5469;
extern T0* ge1295ov5469;
extern T0* T140f40(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T140f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T140f223(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
extern void T209f2(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* ARRAY [INTEGER].subcopy */
extern void T159f7(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].copy_data */
extern void T51f6(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].move_data */
extern void T51f7(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T51f9(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T51f8(T0* C, T4 a1, T4 a2, T4 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge153os2905;
extern T0* ge153ov2905;
extern T0* T140f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T209c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T140f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1295os5466;
extern T0* ge1295ov5466;
extern T0* T140f38(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T140f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T140f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T140f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T170c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T140f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T2 T134f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T72f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T134c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T134f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T134f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T134f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T134f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T134f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T134f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T134f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T134f32(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T134f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T134f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T134f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T134f52(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T134f46(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T134f44(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T134f42(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T134f40(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T134f38(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T134f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T134f219(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T134f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T134f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T134f36(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T134f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T134f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T134f6(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T72f248(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T137f7(T0* C, T0* a1, T2 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T72f247(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T72f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T134c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T113f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T113f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T113f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T113f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].resize */
extern T0* T133f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING]].resized_area */
extern T0* T132f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING]].make */
extern T0* T132c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].make */
extern T0* T133f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING]].make_area */
extern T0* T199c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING]].default_create */
extern T0* T133c3(void);
/* DS_BILINKED_LIST [STRING].force_last */
extern void T114f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].put_right */
extern void T191f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].attach_left */
extern void T191f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING].make */
extern T0* T191c4(T0* a1);
/* DS_BILINKED_LIST [STRING].is_empty */
extern T2 T114f3(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T72f162(T0* C);
/* DS_BILINKED_LIST [STRING].set_equality_tester */
extern void T114f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T72f180(T0* C);
/* DS_BILINKED_LIST [STRING].make */
extern T0* T114c11(void);
/* DS_BILINKED_LIST [STRING].new_cursor */
extern T0* T114f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].make */
extern T0* T190c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T113f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T113f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1207os6328;
extern T0* ge1207ov6328;
extern T0* T113f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T113f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T113f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T113f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T113f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T113f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T113f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T113f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T72f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T113c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T131f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T129f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T129c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T131f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T198c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T131c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T113f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T2 T113f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T2 T113f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T2 T113f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T2 T113f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T113f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T130f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T127f3(T0* C, T4 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T127c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T130f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T197c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T130c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T112f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T188f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T188f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T188c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T2 T112f3(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T72f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T112c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T112f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T187c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T72f246(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T187f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T112f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T112f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T187f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T112f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T187f10(T0* C, T0* a1, T2 a2, T2 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T72f256(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T137f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T187f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T187f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T112f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T2 T112f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T111f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T111c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T111f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T111f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T111f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T111f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T111f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T111f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T186c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T186f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T232c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T111c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T186f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T233f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T233f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T233c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T2 T186f3(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T111c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T186f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T72f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T111c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T72f245(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T111f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T111f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T111c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T111f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T125f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T124f3(T0* C, T4 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T124c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T125f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T196c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T125c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T111c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T111f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T72f244(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T137f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T72f243(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T2 T110f1(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T110f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T4 T110f11(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T4 T110f12(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T4 T107f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T107f13(T0* C, T4 a1);
/* DS_BILINKED_LIST [STRING].item */
extern T0* T114f8(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T2 T184f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_item */
extern T0* T110f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_item */
extern T0* T110f29(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T110f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T4 T110f13(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T123f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T122f2(T0* C, T4 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T122c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T123f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T195c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T123c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T110f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_put */
extern void T110f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T110f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T110f37(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T110f36(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T110f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T110f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].keys_resize */
extern void T110f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].items_resize */
extern void T110f45(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T110f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T4 T110f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T4 T110f7(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T110f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T72f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T110c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T184c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T110f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T110f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T185c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T110f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T110f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_keys */
extern void T110f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_items */
extern void T110f40(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T72f242(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T72f241(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T107f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].forth */
extern void T190f9(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_forth */
extern void T114f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].add_traversing_cursor */
extern void T114f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set_next_cursor */
extern void T190f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].remove_traversing_cursor */
extern void T114f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING].set */
extern void T190f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [STRING].item */
extern T0* T190f4(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING].start */
extern void T190f8(T0* C);
/* DS_BILINKED_LIST [STRING].cursor_start */
extern void T114f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING].cursor_off */
extern T2 T114f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T107f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T107f16(T0* C);
/* DS_BILINKED_LIST [STRING].last */
extern T0* T114f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T107f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T2 T107f15(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T72f240(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T2 T107f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T2 T107f14(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T107f8(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T121f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T119f3(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T121f1(T0* C, T4 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T194c2(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T121c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T72f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T104f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1293os4126;
extern T0* ge1293ov4126;
extern T0* T72f25(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T138c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T138f205(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T138f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T138f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T138f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T138f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T138f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T138f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T138f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T138f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T138f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T138f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T138f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T138f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T138f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T138f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T138f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T138f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T138f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T138f226(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T138f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T138f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T138f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T138f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T138f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T138f16(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T100f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T2 T104f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T72f255(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T104f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T104f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T2 T109f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T72f238(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T137f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T72f237(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T137f4(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T137c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T108f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T108f8(T0* C, T2 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T108f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T118f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T117f3(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T117c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T118f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T193c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T118c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T108c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T108f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T72f259(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T72f236(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T72f235(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T72f234(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T137f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T72f233(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T72f232(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T137f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T72f231(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T72f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T72f192(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T72f198(T0* C, T0* a1);
/* STRING.remove */
extern void T16f45(T0* C, T4 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T104f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T162f28(T0* C, T4 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T1 T162f13(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].item */
extern T1 T216f2(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T2 T162f12(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T45f27(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T162f30(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].remove */
extern void T216f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER].wipe_out */
extern void T216f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T162f32(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T162f34(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T162f35(T0* C, T4 a1);
/* DS_LINKED_QUEUE [CHARACTER].force */
extern void T216f8(T0* C, T1 a1);
/* DS_LINKABLE [CHARACTER].put_right */
extern void T287f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].is_empty */
extern T2 T216f4(T0* C);
/* DS_LINKABLE [CHARACTER].make */
extern T0* T287c3(T1 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T214f23(T0* C, T0* a1, T4 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T214f20(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T162f21(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T42f17(T0* C, T0* a1);
/* UC_UTF8_STRING.old_clear_all */
extern void T161f78(T0* C);
/* STRING.clear_all */
extern void T16f47(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T162f3(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1288os6699;
extern T0* ge1288ov6699;
extern T0* T162f24(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T4 T217f7(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T2 T217f6(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T4 T217f5(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T2 T217f4(T0* C, T4 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T2 T217f3(T0* C, T4 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge219os3071;
extern T0* ge219ov3071;
extern T0* T162f17(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T217c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T4 T162f23(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T4 T162f22(T0* C, T1 a1, T1 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T162f33(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T304f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T45f64(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T45f65(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T45f30(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T45f29(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T45f31(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T162f31(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T2 T214f8(T0* C, T1 a1, T1 a2, T1 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T2 T214f7(T0* C, T1 a1, T1 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T2 T217f2(T0* C, T4 a1, T4 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T2 T217f1(T0* C, T4 a1, T4 a2);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge284os6757;
extern T4 ge284ov6757;
extern T4 T164f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T4 T164f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T163f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T72f199(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T162c27(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER].make */
extern T0* T216c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T104f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T2 T134f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T2 T140f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T2 T140f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].item */
extern T0* T102f2(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_item */
extern T0* T102f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T72f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T72f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T72f254(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T72f253(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T72f97(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T4 T72f188(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T2 T72f187(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T72f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T161c49(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T161f57(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T2 T72f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T72f95(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T2 T72f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T72f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1293os4193;
extern T0* ge1293ov4193;
extern T0* T72f191(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1293os4194;
extern T0* ge1293ov4194;
extern T0* T72f190(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T72f197(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T161c53(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T116f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T115f2(T0* C, T4 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T115c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T116f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T192c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T116c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T72f229(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T107f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T107f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T2 T107f1(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T72f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T107f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T107c20(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T107c18(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T72f219(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T72f218(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T72f217(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T72f216(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T72f227(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T72f215(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T72f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T72f252(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T134f221(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T140f225(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T2 T134f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T2 T140f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T134f220(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T304c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T214f21(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T134f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T134f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T140f224(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T140f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T140f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T72f225(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T72f224(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T72f31(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T72f214(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T72f211(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T101c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T72f210(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T72f206(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].wipe_out */
extern void T102f37(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].slots_wipe_out */
extern void T102f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].clashes_wipe_out */
extern void T102f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].keys_wipe_out */
extern void T102f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].items_wipe_out */
extern void T102f44(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].move_all_cursors_after */
extern void T102f42(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_next_cursor */
extern void T181f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].set_position */
extern void T181f5(T0* C, T4 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T72f204(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T96c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T96f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T96f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T96f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T96f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T96f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T96f182(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T96f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T96f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T96f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T96f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T96f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T96f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T96f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T96f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T96f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T96f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T96f224(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T96f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T96f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T96f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T96f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T96f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T96f15(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T46c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T76f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T144c2(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T204c7(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T204f2(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T239c3(T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T72f202(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T73c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T73f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T143f4(T0* C, T4 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T76c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T73f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T79c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T73f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T141c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T72f201(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T72c200(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T72f22(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].set_key_equality_tester */
extern void T102f39(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map_default */
extern T0* T102c36(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_map */
extern void T102f41(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_with_equality_testers */
extern void T102f53(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_sparse_container */
extern void T102f58(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].new_cursor */
extern T0* T102f34(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING].make */
extern T0* T181c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_slots */
extern void T102f62(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_clashes */
extern void T102f61(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_keys */
extern void T102f60(T0* C, T4 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].make_items */
extern void T102f59(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T182f2(T0* C, T4 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T231c2(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T182c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING].default_capacity */
extern T4 T102f7(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T72f205(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T72f209(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1289os4073;
extern T0* ge1289ov4073;
extern T0* T72f52(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T72f182(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1289os4072;
extern T0* ge1289ov4072;
extern T0* T72f50(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1289os4071;
extern T0* ge1289ov4071;
extern T0* T72f48(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1289os4070;
extern T0* ge1289ov4070;
extern T0* T72f46(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1289os4069;
extern T0* ge1289ov4069;
extern T0* T72f44(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1289os4068;
extern T0* ge1289ov4068;
extern T0* T72f42(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1289os4067;
extern T0* ge1289ov4067;
extern T0* T72f40(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1289os4066;
extern T0* ge1289ov4066;
extern T0* T72f38(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1289os4065;
extern T0* ge1289ov4065;
extern T0* T72f36(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1289os4064;
extern T0* ge1289ov4064;
extern T0* T72f34(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T72f208(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T70f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T2 T70f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T70c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T45f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T45f3(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T45f56(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T45f19(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T45f25(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T45f61(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T45f22(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T45f61p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T45f24(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T45f7(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T67f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T67f3(T0* C, T14 a1, T4 a2);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T94f2(T94* C);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2042os2408;
extern T0* ge2042ov2408;
extern T0* T45f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T67c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T67f16(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T67f5(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T45f59(T0* C);
/* UNIX_FILE_INFO.update */
extern void T67f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T67f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T45f6(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T45f13(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T45f55(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T45c55(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T45f60(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T45f16(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T21c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T2 T43f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T2 T45f2(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T2 T45f8(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T2 T67f2(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T4 T67f4(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.reset */
extern void T45f58(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge265os2935;
extern T0* ge265ov2935;
extern T0* T43f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T2 T44f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T44f6(T0* C);
/* GEANT.default_build_filename */
extern unsigned char ge56os1305;
extern T0* ge56ov1305;
extern T0* T19f9(T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T22f7(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T22f6(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T22f5(T0* C, T2 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T22c4(void);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T41f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T41f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].resize */
extern T0* T61f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [GEANT_VARIABLES].resized_area */
extern T0* T62f2(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T4 T41f6(T0* C, T4 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T2 T41f4(T0* C, T4 a1);
/* GEANT.target_arguments_stack */
extern T0* T19f5(T0* C);
/* GEANT_VARIABLES.make */
extern T0* T25c43(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T25f47(T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T25f46(T0* C, T4 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T25f55(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_VARIABLES.make_sparse_container */
extern void T25f60(T0* C, T4 a1);
/* GEANT_VARIABLES.new_cursor */
extern T0* T25f29(T0* C);
/* GEANT_VARIABLES.unset_found_item */
extern void T25f48(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T25f64(T0* C, T4 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T25f25(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T4 T25f19(T0* C, T4 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T25f63(T0* C, T4 a1);
/* GEANT_VARIABLES.make_keys */
extern void T25f62(T0* C, T4 a1);
/* GEANT_VARIABLES.make_items */
extern void T25f61(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T23c55(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge61os1435;
extern T0* ge61ov1435;
extern T0* T23f8(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge61os1434;
extern T0* ge61ov1434;
extern T0* T23f7(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge61os1433;
extern T0* ge61ov1433;
extern T0* T23f6(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge61os1432;
extern T0* ge61ov1432;
extern T0* T23f5(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge61os1431;
extern T0* ge61ov1431;
extern T0* T23f4(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T25f30(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge63os1310;
extern T0* ge63ov1310;
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
extern unsigned char ge61os1430;
extern T0* ge61ov1430;
extern T0* T23f2(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T23f1(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T23f55p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T23f58(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T23f57(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T23f60(T0* C, T4 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T23f68(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T23f34(T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T23f76(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T23f75(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_keys */
extern void T23f74(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.make_items */
extern void T23f73(T0* C, T4 a1);
/* GEANT_VARIABLES.set_variable_value */
extern void T25f44(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force */
extern void T25f45(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.keys_put */
extern void T25f54(T0* C, T0* a1, T4 a2);
/* GEANT_VARIABLES.slots_put */
extern void T25f53(T0* C, T4 a1, T4 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T25f52(T0* C, T4 a1, T4 a2);
/* GEANT_VARIABLES.resize */
extern void T25f51(T0* C, T4 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T25f59(T0* C, T4 a1);
/* GEANT_VARIABLES.keys_resize */
extern void T25f58(T0* C, T4 a1);
/* GEANT_VARIABLES.items_resize */
extern void T25f57(T0* C, T4 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T25f56(T0* C, T4 a1);
/* GEANT_VARIABLES.new_capacity */
extern T4 T25f5(T0* C, T4 a1);
/* GEANT_VARIABLES.items_put */
extern void T25f50(T0* C, T0* a1, T4 a2);
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
extern void T27f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T27f10(T0* C, T0* a1);
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
extern T0* T26f2(T0* C, T4 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T27c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T27f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T26f5(T0* C, T0* a1);
/* GEANT.arguments */
extern unsigned char ge206os1329;
extern T0* ge206ov1329;
extern T0* T19f1(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T26c4(void);
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
extern void T266f25(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T338f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T2 T43f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T2 T45f38(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T2 T44f26(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T338f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T338f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T338f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T338f11(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T266f27(T0* C, T4 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T266f19(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T266f18(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T266f17(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T266f16(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T266f23(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T266f22(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T266f21(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T265f27(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T337f8(T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T24f77(T0* C, T0* a1);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T24f78(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].item */
extern T0* T52f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T2 T156f38(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T265f18(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T265f17(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T265f25(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T265f24(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T265f23(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T264f23(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T336f7(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T264f25(T0* C, T4 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T264f17(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T264f16(T0* C);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T264f15(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T264f14(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T264f21(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T264f20(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T264f19(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T263f27(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T335f25(T0* C);
/* GEANT_FILESET.forth */
extern void T311f37(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T311f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T311f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T23f82(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T23f84(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T23f86(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T23f88(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_position */
extern void T52f10(T0* C, T4 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T23f87(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_next_cursor */
extern void T52f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T23f85(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T2 T311f24(T0* C);
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
extern T0* T311f23(T0* C);
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
extern T0* T311f22(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T360f6(T0* C);
/* GEANT_FILESET.after */
extern T2 T311f2(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T2 T354f1(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T2 T354f5(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T311f36(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T354f39(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T354f44(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T2 T354f25(T0* C);
/* GEANT_FILESET.execute */
extern void T311f35(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T311f54(T0* C, T0* a1);
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
extern void T311f53(T0* C, T0* a1);
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
extern T2 T311f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T4 T43f31(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T4 T45f39(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T4 T45f41(T0* C);
/* UNIX_FILE_INFO.date */
extern T4 T67f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T4 T44f29(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T351f2(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T161f77(T0* C, T4 a1);
/* STRING.remove_tail */
extern void T16f50(T0* C, T4 a1);
/* UC_UTF8_STRING.remove_head */
extern void T161f76(T0* C, T4 a1);
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
extern unsigned char ge472os8979;
extern T4 ge472ov8979;
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
extern unsigned char ge478os9146;
extern T0* ge478ov9146;
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
extern unsigned char ge158os1665;
extern T0* ge158ov1665;
extern T0* T396f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge478os9138;
extern T0* ge478ov9138;
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
extern unsigned char ge478os9147;
extern T0* ge478ov9147;
extern T0* T372f144(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge472os8980;
extern T4 ge472ov8980;
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
extern unsigned char ge478os9140;
extern T0* ge478ov9140;
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
extern unsigned char ge478os9149;
extern T0* ge478ov9149;
extern T0* T372f156(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge478os9134;
extern T0* ge478ov9134;
extern T0* T372f24(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge478os9144;
extern T0* ge478ov9144;
extern T0* T372f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge478os9143;
extern T0* ge478ov9143;
extern T0* T372f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge478os9142;
extern T0* ge478ov9142;
extern T0* T372f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge478os9141;
extern T0* ge478ov9141;
extern T0* T372f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge478os9145;
extern T0* ge478ov9145;
extern T0* T372f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge478os9139;
extern T0* ge478ov9139;
extern T0* T372f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge478os9135;
extern T0* ge478ov9135;
extern T0* T372f234(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge478os9136;
extern T0* ge478ov9136;
extern T0* T372f233(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge478os9137;
extern T0* ge478ov9137;
extern T0* T372f231(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T4 T372f154(T0* C, T4 a1, T4 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge478os9148;
extern T0* ge478ov9148;
extern T0* T372f232(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T4 T372f152(T0* C, T4 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T396f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge472os8978;
extern T0* ge472ov8978;
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
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T372f302(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T372f302p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern */
extern unsigned char ge472os8977;
extern T0* ge472ov8977;
extern T0* T372f26(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T372f301(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T372f300(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge478os9133;
extern T0* ge478ov9133;
extern T0* T372f23(T0* C);
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
/* RX_BYTE_CODE.make */
extern T0* T394c13(T4 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge137os8399;
extern T0* ge137ov8399;
extern T0* T351f8(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge137os8397;
extern T0* ge137ov8397;
extern T0* T351f7(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T351f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge137os8396;
extern T0* ge137ov8396;
extern T0* T351f6(T0* C);
/* GEANT_MAP.string_ */
extern T0* T351f4(T0* C);
/* GEANT_MAP.is_executable */
extern T2 T351f1(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge137os8398;
extern T0* ge137ov8398;
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
extern void T311f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T303f37(T0* C);
/* KL_DIRECTORY.old_close */
extern void T303f40(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T303f22(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T303f41(T0* C, T14 a1);
/* LX_DFA_WILDCARD.recognizes */
extern T2 T359f2(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T4 T359f7(T0* C, T0* a1, T4 a2);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T2 T311f3(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T2 T43f30(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T2 T303f23(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T2 T303f14(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T2 T303f24(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T2 T44f28(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T311f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T303f36(T0* C);
/* KL_DIRECTORY.readentry */
extern void T303f39(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T303f21(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T2 T303f17(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T2 T303f9(T0* C);
/* KL_DIRECTORY.is_closed */
extern T2 T303f12(T0* C);
/* KL_DIRECTORY.open_read */
extern void T303f35(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T303f38(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T303f19(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T44f27(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T66f18(T0* C);
/* GEANT_FILESET.unix_file_system */
extern T0* T311f21(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T311f19(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T311f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T311f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T2 T311f1(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T2 T311f4(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T2 T335f15(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T335f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T335f12(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T335f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T335f16(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T2 T335f4(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T263f29(T0* C, T4 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T263f21(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T263f20(T0* C);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T263f19(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T263f18(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T263f25(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T263f24(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T263f23(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T262f40(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T332f37(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T332f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T332f44(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T349f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T349f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T349f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T4 T349f9(T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2178os3748;
extern T0* ge2178ov3748;
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
extern T0* T334f2(T0* C, T4 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T332f21(T0* C);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T332f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T332f41(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T332f40(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T2 T332f20(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T25f70(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T332f19(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T332f18(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T332f23(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T332f22(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T262f42(T0* C, T4 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T262f32(T0* C);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T262f30(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T262f29(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T262f38(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T262f37(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T262f36(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T261f23(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T331f10(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T80f8(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.put */
extern void T80f9(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.eif_putenv */
extern T4 T80f6(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T145f4(T0* C);
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
extern unsigned char ge2028os3757;
extern T0* ge2028ov3757;
extern T0* T80f4(T0* C);
/* GE_STRING_EQUALITY_TESTER.default_create */
extern T0* T436c2(void);
/* C_STRING.make */
extern T0* T145c10(T0* a1);
/* C_STRING.set_string */
extern void T145f11(T0* C, T0* a1);
/* MANAGED_POINTER.put_natural_8 */
extern void T210f11(T0* C, T8 a1, T4 a2);
/* POINTER.memory_copy */
extern void T14f8(T14* C, T14 a1, T4 a2);
/* POINTER.c_memcpy */
extern void T14f10(T14* C, T14 a1, T14 a2, T4 a3);
/* TYPED_POINTER [NATURAL_8].to_pointer */
extern T14 T284f2(T284* C);
/* INTEGER.to_natural_8 */
extern T8 T4f22(T4* C);
/* MANAGED_POINTER.resize */
extern void T210f10(T0* C, T4 a1);
/* POINTER.memory_set */
extern void T14f7(T14* C, T4 a1, T4 a2);
/* POINTER.c_memset */
extern void T14f9(T14* C, T14 a1, T4 a2, T4 a3);
/* POINTER.memory_realloc */
extern T14 T14f4(T14* C, T4 a1);
/* POINTER.c_realloc */
extern T14 T14f6(T14* C, T14 a1, T4 a2);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T331f6(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T261f25(T0* C, T4 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T261f17(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T261f16(T0* C);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T261f15(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T261f14(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T261f21(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T261f20(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T261f19(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T260f25(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T330f20(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T330f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T43f40(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T303f43(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T43f33(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T43f34(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T66f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T66f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T66f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T303f25(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T303f30(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T303f29(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T303f28(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T303f45(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T303f48(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T303f50(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T44f36(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T330f12(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T330f14(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T330f13(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T2 T330f4(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T330f23(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T2 T43f32(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T2 T45f40(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T45f69(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T45f71(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T45f45(T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T45f50(T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T45f49(T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T45f48(T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T4 T45f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T4 T45f47(T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T4 T45f52(T0* C, T14 a1);
/* UNIX_FILE_INFO.size */
extern T4 T67f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T2 T45f51(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T4 T45f43(T0* C);
/* UNIX_FILE_INFO.inode */
extern T4 T67f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge264os3205;
extern T0* ge264ov3205;
extern T0* T45f42(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T2 T44f30(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T43f42(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T45f68(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T44f38(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T330f11(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T330f22(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T2 T330f5(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T260f27(T0* C, T4 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T260f19(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T260f18(T0* C);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T260f17(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T260f16(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T260f23(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T260f22(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T260f21(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T259f30(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T329f24(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T329f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T329f14(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T329f17(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T329f16(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T2 T329f5(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T329f27(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T43f41(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T45f67(T0* C, T0* a1);
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
extern unsigned char ge275os3185;
extern T0* ge275ov3185;
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
extern void T44f37(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T2 T329f15(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T329f13(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T329f26(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T2 T329f6(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T259f32(T0* C, T4 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T259f21(T0* C);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T259f19(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T259f18(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T259f28(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T259f27(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T259f26(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T258f25(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T326f22(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T328f24(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T328f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T328f3(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T2 T328f2(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T328f23(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T328f22(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T328f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T328f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T328f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T328f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T328f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T328f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T328f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T328f13(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T2 T328f1(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T2 T326f8(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T2 T326f7(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T43f37(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T45f66(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T45f70(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T45f72(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T44f33(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T2 T326f5(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T43f39(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T303f42(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T303f44(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T303f47(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T303f49(T0* C, T14 a1);
/* KL_DIRECTORY.is_empty */
extern T2 T303f26(T0* C);
/* KL_DIRECTORY.count */
extern T4 T303f31(T0* C);
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
extern void T303f46(T0* C);
/* ARRAYED_LIST [STRING].forth */
extern void T392f15(T0* C);
/* RAW_FILE.delete */
extern void T390f11(T0* C);
/* RAW_FILE.file_unlink */
extern void T390f13(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T2 T390f4(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T2 T67f13(T0* C);
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
extern T2 T67f12(T0* C);
/* RAW_FILE.is_symlink */
extern T2 T390f2(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T2 T67f11(T0* C);
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
	license: "Eiffel Forum License v2 (see forum.txt)"
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
extern T0* T303f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T44f35(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T326f14(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T326f13(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T326f16(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T326f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T2 T326f6(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T258f27(T0* C, T4 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T258f19(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T258f18(T0* C);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T258f17(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T258f16(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T258f23(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T258f22(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T258f21(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T257f22(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T325f11(T0* C);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T325f6(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T325f5(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T325f8(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T325f7(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T257f24(T0* C, T4 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T257f16(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T257f15(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T257f14(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T257f13(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T257f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T257f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T257f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T256f28(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T324f11(T0* C);
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
extern T0* T256f17(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T256f16(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T256f26(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T256f25(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T256f24(T0* C);
/* GEANT_GEXMLSPLIT_TASK.execute */
extern void T255f22(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.execute */
extern void T323f12(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.execute_shell */
extern void T323f14(T0* C, T0* a1);
/* GEANT_GEXMLSPLIT_COMMAND.string_ */
extern T0* T323f7(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.unix_file_system */
extern T0* T323f6(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.file_system */
extern T0* T323f5(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.windows_file_system */
extern T0* T323f9(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.operating_system */
extern T0* T323f8(T0* C);
/* GEANT_GEXMLSPLIT_TASK.exit_application */
extern void T255f24(T0* C, T4 a1, T0* a2);
/* GEANT_GEXMLSPLIT_TASK.exceptions */
extern T0* T255f16(T0* C);
/* GEANT_GEXMLSPLIT_TASK.std */
extern T0* T255f15(T0* C);
/* GEANT_GEXMLSPLIT_TASK.dir_attribute_name */
extern T0* T255f14(T0* C);
/* GEANT_GEXMLSPLIT_TASK.file_system */
extern T0* T255f13(T0* C);
/* GEANT_GEXMLSPLIT_TASK.unix_file_system */
extern T0* T255f20(T0* C);
/* GEANT_GEXMLSPLIT_TASK.windows_file_system */
extern T0* T255f19(T0* C);
/* GEANT_GEXMLSPLIT_TASK.operating_system */
extern T0* T255f18(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T254f34(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T321f29(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T321f34(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T2 T321f18(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T321f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T23f51(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T321f16(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T321f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T321f20(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T321f19(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T23f83(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T321f15(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T321f32(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T2 T24f76(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T2 T20f21(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T20f23(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T321f31(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T321f36(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_variables_for_cmdline */
extern T0* T321f17(T0* C);
/* GEANT_PROJECT.is_builtin_variable_name */
extern T2 T20f22(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_builtin_variable_name */
extern T2 T23f53(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.string_ */
extern T0* T23f54(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T321f14(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T321f13(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T321f22(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T321f21(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T2 T321f5(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T254f23(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T254f22(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T254f32(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T254f31(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T254f30(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T253f38(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T320f31(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T320f33(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T320f17(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T320f16(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T320f19(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T320f18(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T320f15(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T253f40(T0* C, T4 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T253f31(T0* C);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T253f29(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T253f28(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T253f36(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T253f35(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T253f34(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T252f33(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T319f26(T0* C);
/* GEANT_FILESET.has_map */
extern T2 T311f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T319f29(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T2 T319f16(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T319f15(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T319f14(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T319f18(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T319f17(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T2 T319f5(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T319f28(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T319f13(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T252f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T252f24(T0* C);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T252f22(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T252f21(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T252f31(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T252f30(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T252f29(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T251f33(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T318f26(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T318f28(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T318f14(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T318f13(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T318f12(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T318f16(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T318f15(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T251f35(T0* C, T4 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T251f24(T0* C);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T251f22(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T251f21(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T251f31(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T251f30(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T251f29(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T250f36(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T317f32(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T317f34(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T317f17(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T317f16(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T317f19(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T317f18(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T317f15(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T250f38(T0* C, T4 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T250f28(T0* C);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T250f26(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T250f25(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T250f34(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T250f33(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T250f32(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T249f34(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T315f27(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T315f29(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T315f17(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T315f16(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T315f19(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T315f18(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T2 T315f8(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T2 T315f7(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T2 T315f6(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T315f15(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T249f36(T0* C, T4 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T249f25(T0* C);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T249f23(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T249f22(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T249f32(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T249f31(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T249f30(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T248f22(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T314f7(T0* C);
/* GEANT_UNSET_TASK.exit_application */
extern void T248f24(T0* C, T4 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T248f16(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T248f15(T0* C);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T248f14(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T248f13(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T248f20(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T248f19(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T248f18(T0* C);
/* GEANT_SET_TASK.execute */
extern void T247f23(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T313f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T247f25(T0* C, T4 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T247f17(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T247f16(T0* C);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T247f15(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T247f14(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T247f21(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T247f20(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T247f19(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T246f23(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T312f14(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T312f16(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T312f8(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T312f7(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T312f6(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T312f10(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T312f9(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T246f25(T0* C, T4 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T246f17(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T246f16(T0* C);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T246f15(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T246f14(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T246f21(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T246f20(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T246f19(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T245f29(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T309f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T309f10(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T309f18(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.is_commandline_executable */
extern T2 T309f4(T0* C);
/* GEANT_EXEC_TASK.exit_application */
extern void T245f31(T0* C, T4 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T245f20(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T245f18(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T245f17(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T245f27(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T245f26(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T245f25(T0* C);
/* GEANT_VE_TASK.execute */
extern void T244f33(T0* C);
/* GEANT_VE_COMMAND.execute */
extern void T308f27(T0* C);
/* GEANT_VE_COMMAND.execute_clean */
extern void T308f31(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T43f38(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T44f34(T0* C, T0* a1);
/* GEANT_VE_COMMAND.execute_tuner */
extern void T308f30(T0* C);
/* GEANT_VE_COMMAND.operating_system */
extern T0* T308f17(T0* C);
/* GEANT_VE_COMMAND.is_tunable */
extern T2 T308f6(T0* C);
/* GEANT_VE_COMMAND.execute_shell */
extern void T308f29(T0* C, T0* a1);
/* GEANT_VE_COMMAND.string_ */
extern T0* T308f16(T0* C);
/* GEANT_VE_COMMAND.unix_file_system */
extern T0* T308f15(T0* C);
/* GEANT_VE_COMMAND.file_system */
extern T0* T308f14(T0* C);
/* GEANT_VE_COMMAND.windows_file_system */
extern T0* T308f18(T0* C);
/* GEANT_VE_COMMAND.is_compilable */
extern T2 T308f4(T0* C);
/* GEANT_VE_TASK.exit_application */
extern void T244f35(T0* C, T4 a1, T0* a2);
/* GEANT_VE_TASK.exceptions */
extern T0* T244f24(T0* C);
/* GEANT_VE_TASK.dir_attribute_name */
extern T0* T244f22(T0* C);
/* GEANT_VE_TASK.file_system */
extern T0* T244f21(T0* C);
/* GEANT_VE_TASK.unix_file_system */
extern T0* T244f31(T0* C);
/* GEANT_VE_TASK.windows_file_system */
extern T0* T244f30(T0* C);
/* GEANT_VE_TASK.operating_system */
extern T0* T244f29(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T243f32(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T307f24(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T307f27(T0* C);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T307f12(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T307f13(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T307f16(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T307f15(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T307f26(T0* C);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T307f28(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T307f14(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T2 T307f4(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T243f34(T0* C, T4 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T243f23(T0* C);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T243f21(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T243f20(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T243f30(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T243f29(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T243f28(T0* C);
/* GEANT_SE_TASK.execute */
extern void T242f34(T0* C);
/* GEANT_SE_COMMAND.execute */
extern void T306f32(T0* C);
/* GEANT_SE_COMMAND.new_traditional_cmdline */
extern T0* T306f18(T0* C);
/* GEANT_SE_COMMAND.unix_file_system */
extern T0* T306f22(T0* C);
/* GEANT_SE_COMMAND.string_ */
extern T0* T306f19(T0* C);
/* GEANT_SE_COMMAND.new_ace_cmdline */
extern T0* T306f17(T0* C);
/* GEANT_SE_COMMAND.is_ace_configuration */
extern T2 T306f4(T0* C);
/* GEANT_SE_COMMAND.execute_shell */
extern void T306f34(T0* C, T0* a1);
/* GEANT_SE_COMMAND.file_system */
extern T0* T306f16(T0* C);
/* GEANT_SE_COMMAND.windows_file_system */
extern T0* T306f21(T0* C);
/* GEANT_SE_COMMAND.operating_system */
extern T0* T306f20(T0* C);
/* GEANT_SE_COMMAND.new_clean_cmdline */
extern T0* T306f15(T0* C);
/* GEANT_SE_COMMAND.is_cleanable */
extern T2 T306f6(T0* C);
/* GEANT_SE_TASK.exit_application */
extern void T242f36(T0* C, T4 a1, T0* a2);
/* GEANT_SE_TASK.exceptions */
extern T0* T242f25(T0* C);
/* GEANT_SE_TASK.dir_attribute_name */
extern T0* T242f23(T0* C);
/* GEANT_SE_TASK.file_system */
extern T0* T242f22(T0* C);
/* GEANT_SE_TASK.unix_file_system */
extern T0* T242f32(T0* C);
/* GEANT_SE_TASK.windows_file_system */
extern T0* T242f31(T0* C);
/* GEANT_SE_TASK.operating_system */
extern T0* T242f30(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T241f32(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T305f25(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T305f27(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T305f13(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T305f17(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T305f16(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T2 T305f4(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T305f12(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T305f15(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T305f14(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T2 T305f5(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T241f34(T0* C, T4 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T241f23(T0* C);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T241f21(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T241f20(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T241f30(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T241f29(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T241f28(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T270f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T269f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T268f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T155f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T78f31(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T270f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T275f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T275f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T269f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T275f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T268f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T275f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T155f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T275f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T78f36(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T275f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T140f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T140f233(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T172f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T162f25(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge193os3159;
extern T0* ge193ov3159;
extern T0* T304f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T140f233p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T172f19(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_index */
extern void T172f18(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T140f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T172c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T172f21(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T172f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T172f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T172f16(T0* C, T4 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge377os6892;
extern T4 ge377ov6892;
extern T4 T172f11(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T138f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T138f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T138f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T138f19(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T134f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T134f229(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T134f229p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T134f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T96f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T96f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T96f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T96f18(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T140f227(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T140f227p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T140f227p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T140f237(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T170f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T4 T42f14(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T170f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T170f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T170f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T2 T170f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T2 T170f1(T0* C);
/* UC_UNICODE_ROUTINES.valid_code */
extern T2 T229f1(T0* C, T4 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T170f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T170f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T2 T140f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T140f181(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T4 T140f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T140f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T1 T140f207(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T140f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1297os5535;
extern T0* ge1297ov5535;
extern T0* T140f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T140f241(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T140f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T140f240(T0* C);
/* DS_LINKED_STACK [INTEGER].remove */
extern void T175f7(T0* C);
/* DS_LINKED_STACK [INTEGER].item */
extern T4 T175f2(T0* C);
/* DS_LINKED_STACK [INTEGER].is_empty */
extern T2 T175f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T140f238(T0* C, T4 a1);
/* DS_LINKED_STACK [INTEGER].force */
extern void T175f6(T0* C, T4 a1);
/* DS_LINKABLE [INTEGER].put_right */
extern void T230f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER].make */
extern T0* T230c3(T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T140f239(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T140f236(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T2 T140f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T140f235(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T172f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T282f5(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T162f26(T0* C, T0* a1, T4 a2, T4 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T4 T162f26p1(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T4 T304f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T45f32(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T45f36(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T45f35(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T45f37(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T45f33(T0* C);
/* YY_FILE_BUFFER.compact_left */
extern void T172f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T282f11(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.resize */
extern void T172f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T282f12(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T4 T140f98(T0* C, T4 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T4 T140f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T140f234(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T138f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T138f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T138f214(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T2 T138f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T138f159(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T4 T138f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T138f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T1 T138f194(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T138f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T138f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T138f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T138f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T138f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T138f213(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T2 T138f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T138f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T4 T138f66(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T4 T138f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T138f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T138f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T138f209(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T134f223(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T134f223p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T134f232(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T2 T134f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T134f178(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T4 T134f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T134f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T1 T134f205(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T134f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T134f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T134f237(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T134f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T134f236(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T134f233(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T134f235(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T134f231(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T134f234(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T2 T134f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T134f230(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T4 T134f95(T0* C, T4 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T4 T134f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T96f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T96f209(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T2 T96f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T96f157(T0* C, T4 a1, T4 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T4 T96f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T96f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T1 T96f192(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T96f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T96f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T96f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T96f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T96f218(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T96f210(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T96f215(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T96f208(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T96f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T2 T96f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T96f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T4 T96f61(T0* C, T4 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T4 T96f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T96f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T140f229(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T138f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T134f225(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T96f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T140f230(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T162f29(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T2 T42f12(T0* C, T0* a1, T0* a2);
/* CHARACTER.lower */
extern T1 T1f19(T1* C);
/* CHARACTER.is_upper */
extern T2 T1f20(T1* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T4 T229f2(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge236os7293;
extern T0* ge236ov7293;
extern T0* T229f5(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge236os7292;
extern T0* ge236ov7292;
extern T0* T229f8(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge236os7281;
extern T0* ge236ov7281;
extern T0* T229f15(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T4 T163f3(T0* C, T4 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T229f24(T0* C);
/* SPECIAL [ARRAY [INTEGER]].make */
extern T0* T300c2(T4 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge236os7291;
extern T0* ge236ov7291;
extern T0* T229f7(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge236os7290;
extern T0* ge236ov7290;
extern T0* T229f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge236os7289;
extern T0* ge236ov7289;
extern T0* T229f6(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge236os7288;
extern T0* ge236ov7288;
extern T0* T229f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge236os7287;
extern T0* ge236ov7287;
extern T0* T229f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge236os7286;
extern T0* ge236ov7286;
extern T0* T229f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge236os7285;
extern T0* ge236ov7285;
extern T0* T229f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge236os7284;
extern T0* ge236ov7284;
extern T0* T229f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge236os7283;
extern T0* ge236ov7283;
extern T0* T229f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge236os7282;
extern T0* ge236ov7282;
extern T0* T229f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge236os7280;
extern T0* ge236ov7280;
extern T0* T229f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge236os7279;
extern T0* ge236ov7279;
extern T0* T229f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge236os7278;
extern T0* ge236ov7278;
extern T0* T229f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge236os7277;
extern T0* ge236ov7277;
extern T0* T229f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge236os7276;
extern T0* ge236ov7276;
extern T0* T229f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge236os7275;
extern T0* ge236ov7275;
extern T0* T229f9(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER]]].make */
extern T0* T301c2(T4 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T42f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T138f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T134f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T96f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T140f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T138f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T134f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T96f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T140f228(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T304f10(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T2 T304f4(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T2 T45f26(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T138f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T134f224(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T96f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T141f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T141f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T141f12(T0* C);
/* DS_LINKED_QUEUE [STRING].make */
extern T0* T203c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T201c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T236c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].new_cursor */
extern T0* T236f1(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T237c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T101f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T79f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T79f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T76f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T267c31(T4 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T340c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T267f34(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T267f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T341c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T267f35(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T267f43(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T267f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T4 T267f20(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T267f42(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_keys */
extern void T267f41(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_items */
extern void T267f40(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T342f1(T0* C, T4 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T369c2(T4 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T339c4(T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T342c3(void);
/* XM_DOCUMENT.make */
extern T0* T77c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T77f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T77f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T77f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T274f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T274c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T2 T77f6(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T77f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T78f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T157f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T77f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T77f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T157f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T274f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T77f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T274f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T77f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T77f36(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T77f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T77f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T2 T157f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T2 T77f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T2 T78f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T77f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T77f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T2 T157f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T2 T77f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T2 T78f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T78f40(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T78f46(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T78f45(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T78f44(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T78f49(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T78f47(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T78f50(T0* C);
/* XM_ELEMENT.remove_first */
extern void T78f43(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T78f48(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T77f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T77f5(T0* C);
/* XM_DOCUMENT.list_make */
extern void T77f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T78c30(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T78f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1249os4848;
extern T0* ge1249ov4848;
extern T0* T77f3(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T271c8(void);
/* XM_NAMESPACE.make */
extern void T271f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T271c7(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T141f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T101f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T79f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T79f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T76f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T141f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T101f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T79f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T79f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T76f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T76f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T144f3(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T204f8(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T283f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T283c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T2 T204f3(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T281c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T2 T76f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T268c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T78f33(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T78f33p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T78f33p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T78f34(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T78f18(T0* C);
/* XM_ELEMENT.is_empty */
extern T2 T78f17(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T268c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T141f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T101f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T79f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T79f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T76f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T269c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T269c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T141f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T101f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T79f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T79f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T76f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T270c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T141f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T201f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].force_last */
extern void T236f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].put_right */
extern void T302f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].attach_left */
extern void T302f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].make */
extern T0* T302c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].is_empty */
extern T2 T236f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T201f8(T0* C);
/* DS_HASH_TABLE [STRING, STRING].set_equality_tester */
extern void T59f43(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T201f9(T0* C);
/* DS_HASH_TABLE [STRING, STRING].make_map_default */
extern T0* T59c41(void);
/* DS_HASH_TABLE [STRING, STRING].default_capacity */
extern T4 T59f1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T101f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T79f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T79f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T76f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T78c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T78c28(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T77f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T77f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T76f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T267f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T267f39(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T267f38(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T4 T267f13(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T4 T267f11(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T4 T271f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T267f37(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T267f47(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_resize */
extern void T267f46(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_resize */
extern void T267f45(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T342f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T339f3(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].keys_item */
extern T0* T267f18(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_item */
extern T0* T267f5(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T4 T267f19(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T267f44(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T4 T267f10(T0* C, T4 a1);
/* DS_HASH_SET [XM_NAMESPACE].items_put */
extern void T267f36(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T267f33(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T2 T340f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T267f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T2 T271f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T267f2(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T2 T267f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T141f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T141f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T201f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1223os6952;
extern T0* ge1223ov6952;
extern T0* T201f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T141f6(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T141f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T141f39(T0* C);
/* DS_LINKED_QUEUE [STRING].remove */
extern void T203f8(T0* C);
/* DS_LINKED_QUEUE [STRING].wipe_out */
extern void T203f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T141f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1190os5958;
extern T0* ge1190ov5958;
extern T0* T141f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1190os5966;
extern T0* ge1190ov5966;
extern T0* T141f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T2 T141f8(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T2 T141f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T141f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1190os5959;
extern T0* ge1190ov5959;
extern T0* T141f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1190os5965;
extern T0* ge1190ov5965;
extern T0* T141f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T2 T141f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1190os5960;
extern T0* ge1190ov5960;
extern T0* T141f22(T0* C);
/* DS_LINKED_QUEUE [STRING].item */
extern T0* T203f1(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T2 T141f15(T0* C);
/* DS_LINKED_QUEUE [STRING].is_empty */
extern T2 T203f2(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T201f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].back */
extern void T237f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_back */
extern void T236f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].add_traversing_cursor */
extern void T236f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_next_cursor */
extern void T237f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_traversing_cursor */
extern void T236f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set */
extern void T237f13(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].go_before */
extern void T237f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_go_before */
extern void T236f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_before */
extern void T237f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_off */
extern T2 T236f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].item */
extern T0* T59f22(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].items_item */
extern T0* T59f26(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T2 T59f21(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].item */
extern T0* T237f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].finish */
extern void T237f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].cursor_finish */
extern void T236f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1223os6953;
extern T0* ge1223ov6953;
extern T0* T201f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T2 T201f1(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T2 T141f4(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T101f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T79f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T79f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T76f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T141f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T201f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].remove_last */
extern void T236f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].set_last_cell */
extern void T236f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING, STRING]].forget_right */
extern void T302f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_last_cursors_after */
extern void T236f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING, STRING]].set_after */
extern void T237f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].wipe_out */
extern void T236f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].move_all_cursors_after */
extern void T236f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T141f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T101f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T79f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T79f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T76f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T78f2(T0* C);
/* XM_DOCUMENT.process */
extern void T77f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T275f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T2 T78f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T2 T77f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T141f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T101f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T79f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T79f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T76f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T141f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T201f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force_new */
extern void T59f52(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING, STRING]].last */
extern T0* T236f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T2 T201f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T141f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING].force */
extern void T203f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T201f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T101f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T79f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T79f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T76f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T155c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T141f41(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T101f12(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T79f16(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T76f23(T0* C, T0* a1, T0* a2, T2 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T141f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T79f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T76f11(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T156f62(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T156f65(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T156f64(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T2 T156f35(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T2 T156f34(T0* C);
/* DS_HASH_TABLE [STRING, STRING].cursor_start */
extern void T59f53(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].add_traversing_cursor */
extern void T59f62(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].remove_traversing_cursor */
extern void T59f61(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_off */
extern T2 T59f36(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].is_empty */
extern T2 T59f35(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T25f66(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T25f69(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T25f68(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T2 T25f41(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T2 T25f40(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T23f78(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T23f81(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T23f80(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T2 T23f50(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T2 T23f49(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T156f63(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_forth */
extern void T59f54(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T25f67(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T23f79(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T456f3(T0* C, T4 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T454f2(T0* C, T4 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T452f3(T0* C, T4 a1);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T2 T266f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T2 T338f1(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_file_executable */
extern T2 T338f4(T0* C);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T2 T265f1(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T2 T337f1(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T2 T264f1(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T2 T336f1(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T2 T263f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T2 T335f1(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T2 T335f5(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T2 T262f1(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T2 T332f1(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T2 T261f1(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T2 T331f1(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T2 T260f1(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T2 T330f1(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T2 T330f6(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T2 T259f1(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T2 T329f1(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T2 T361f1(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T2 T329f7(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern unsigned char ge154os4243;
extern T0* ge154ov4243;
extern T0* T329f4(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T361c2(void);
/* GEANT_DELETE_TASK.is_executable */
extern T2 T258f1(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T2 T326f1(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T326f4(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T2 T257f1(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T2 T325f1(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T2 T256f1(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T2 T324f1(T0* C);
/* GEANT_GEXMLSPLIT_TASK.is_executable */
extern T2 T255f1(T0* C);
/* GEANT_GEXMLSPLIT_COMMAND.is_executable */
extern T2 T323f1(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T2 T254f1(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T2 T321f1(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T2 T321f6(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T2 T253f1(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T2 T320f1(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T2 T252f1(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T2 T319f1(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T2 T319f6(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T2 T251f1(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T2 T318f1(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T2 T250f1(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T2 T317f1(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T2 T249f1(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T2 T315f1(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T315f5(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T2 T248f1(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T2 T314f1(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T2 T247f1(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T2 T313f1(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T2 T246f1(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T2 T312f1(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T2 T245f1(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T2 T309f1(T0* C);
/* GEANT_EXEC_COMMAND.is_fileset_executable */
extern T2 T309f5(T0* C);
/* GEANT_VE_TASK.is_executable */
extern T2 T244f1(T0* C);
/* GEANT_VE_COMMAND.is_executable */
extern T2 T308f1(T0* C);
/* GEANT_VE_COMMAND.is_cleanable */
extern T2 T308f5(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T2 T243f1(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T2 T307f1(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T2 T307f5(T0* C);
/* GEANT_SE_TASK.is_executable */
extern T2 T242f1(T0* C);
/* GEANT_SE_COMMAND.is_executable */
extern T2 T306f1(T0* C);
/* GEANT_SE_COMMAND.is_traditional_configuration */
extern T2 T306f5(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T2 T241f1(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T2 T305f1(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T2 T266f2(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T266f10(T0* C);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T266f7(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T2 T265f2(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T265f10(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T265f7(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T2 T264f2(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T264f10(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T264f7(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T2 T263f2(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T263f10(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T263f7(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T2 T262f2(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T262f10(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T262f7(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T2 T261f2(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T261f10(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T261f7(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T2 T260f2(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T260f10(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T260f7(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T2 T259f2(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T259f10(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T259f7(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T2 T258f2(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T258f10(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T258f7(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T2 T257f2(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T257f10(T0* C);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T257f7(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T2 T256f2(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T256f10(T0* C);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T256f7(T0* C);
/* GEANT_GEXMLSPLIT_TASK.is_enabled */
extern T2 T255f2(T0* C);
/* GEANT_GEXMLSPLIT_TASK.unless_attribute_name */
extern T0* T255f10(T0* C);
/* GEANT_GEXMLSPLIT_TASK.if_attribute_name */
extern T0* T255f7(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T2 T254f2(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T254f10(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T254f7(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T2 T253f2(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T253f10(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T253f7(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T2 T252f2(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T252f10(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T252f7(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T2 T251f2(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T251f10(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T251f7(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T2 T250f2(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T250f10(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T250f7(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T2 T249f2(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T249f10(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T249f7(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T2 T248f2(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T248f10(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T248f7(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T2 T247f2(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T247f10(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T247f7(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T2 T246f2(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T246f10(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T246f7(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T2 T245f2(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T245f10(T0* C);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T245f7(T0* C);
/* GEANT_VE_TASK.is_enabled */
extern T2 T244f2(T0* C);
/* GEANT_VE_TASK.unless_attribute_name */
extern T0* T244f10(T0* C);
/* GEANT_VE_TASK.if_attribute_name */
extern T0* T244f7(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T2 T243f2(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T243f10(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T243f7(T0* C);
/* GEANT_SE_TASK.is_enabled */
extern T2 T242f2(T0* C);
/* GEANT_SE_TASK.unless_attribute_name */
extern T0* T242f10(T0* C);
/* GEANT_SE_TASK.if_attribute_name */
extern T0* T242f7(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T2 T241f2(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T241f10(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T241f7(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T4 T266f3(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T4 T265f3(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T4 T264f3(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T4 T263f3(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T4 T262f3(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T4 T261f3(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T4 T260f3(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T4 T259f3(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T4 T258f3(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T4 T257f3(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T4 T256f3(T0* C);
/* GEANT_GEXMLSPLIT_TASK.exit_code */
extern T4 T255f3(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T4 T254f3(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T4 T253f3(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T4 T252f3(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T4 T251f3(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T4 T250f3(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T4 T249f3(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T4 T248f3(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T4 T247f3(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T4 T246f3(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T4 T245f3(T0* C);
/* GEANT_VE_TASK.exit_code */
extern T4 T244f3(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T4 T243f3(T0* C);
/* GEANT_SE_TASK.exit_code */
extern T4 T242f3(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T4 T241f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T140f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T97c5(T0* a1, T4 a2, T4 a3, T4 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T138f1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T134f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T96f1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T2 T140f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T2 T138f4(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T2 T134f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T2 T96f4(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_valid_encoding */
extern T2 T140f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T2 T162f2(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_valid_encoding */
extern T2 T138f5(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_valid_encoding */
extern T2 T134f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_valid_encoding */
extern T2 T96f5(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T4 T140f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T4 T138f6(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T4 T134f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T4 T96f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T2 T156f31(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_after */
extern T2 T59f24(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T2 T25f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T2 T23f45(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T156f32(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_key */
extern T0* T59f25(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T25f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T23f46(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T156f39(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].cursor_item */
extern T0* T59f40(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T25f42(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T23f52(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T438f1(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T438f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T438f6(T0* C);
/* ARRAY [STRING].valid_index */
extern T2 T32f5(T0* C, T4 a1);
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
extern T0* T161f3(T0* C);
/* STRING.to_c */
extern T0* T16f18(T0* C);
extern T0* gema32(T4 c, ...);
extern T0* gema159(T4 c, ...);
extern T0* gema143(T4 c, ...);
extern T0* gema399(T4 c, ...);
extern T0* gema362(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge298ov3879;
extern T0* ge233ov7151;
extern T0* ge497ov8290;
extern T0* ge287ov2139;
extern T0* ge291ov3065;
extern T0* ge346ov9997;
extern T0* ge185ov2139;
extern T0* ge469ov8441;
extern T0* ge265ov2937;
extern T0* ge289ov2139;
extern T0* ge197ov2974;
extern T0* ge197ov2975;
extern T0* ge186ov3313;
extern T0* ge186ov3312;
extern T0* ge195ov2974;
extern T0* ge195ov2975;
extern T0* ge1283ov4227;
extern T0* ge1283ov4226;
extern T0* ge1290ov4521;
extern T0* ge1290ov4483;
extern T0* ge1290ov4481;
extern T0* ge1290ov4522;
extern T0* ge1290ov4494;
extern T0* ge1290ov4493;
extern T0* ge1290ov4504;
extern T0* ge1290ov4498;
extern T0* ge1290ov4497;
extern T0* ge1290ov4496;
extern T0* ge1290ov4502;
extern T0* ge1290ov4501;
extern T0* ge1290ov4503;
extern T0* ge1290ov4480;
extern T0* ge1290ov4506;
extern T0* ge1290ov4515;
extern T0* ge1293ov4168;
extern T0* ge1293ov4166;
extern T0* ge1293ov4167;
extern T0* ge1290ov4516;
extern T0* ge1290ov4517;
extern T0* ge1290ov4520;
extern T0* ge1290ov4518;
extern T0* ge1290ov4519;
extern T0* ge1290ov4513;
extern T0* ge1286ov6030;
extern T0* ge1286ov6031;
extern T0* ge1290ov4486;
extern T0* ge1290ov4509;
extern T0* ge1290ov4529;
extern T0* ge1290ov4530;
extern T0* ge1290ov4524;
extern T0* ge1290ov4507;
extern T0* ge1290ov4508;
extern T0* ge1290ov4510;
extern T0* ge1290ov4514;
extern T0* ge264ov3204;
extern T0* ge197ov2985;
extern T0* ge195ov2985;
extern T0* ge203ov1306;
extern T0* ge473ov9055;
extern T0* ge473ov9092;
extern T0* ge473ov9077;
extern T0* ge473ov9070;
extern T0* ge473ov9080;
extern T0* ge473ov9073;
extern T0* ge473ov9081;
extern T0* ge473ov9090;
extern T0* ge473ov9083;
extern T0* ge473ov9079;
extern T0* ge473ov9067;
extern T0* ge473ov9068;
extern T0* ge473ov9082;
extern T0* ge473ov9069;
extern T0* ge473ov9056;
extern T0* ge473ov9057;
extern T0* ge473ov9058;
extern T0* ge473ov9064;
extern T0* ge473ov9066;
extern T0* ge473ov9061;
extern T0* ge473ov9086;
extern T0* ge473ov9085;
extern T0* ge473ov9062;
extern T0* ge473ov9063;
extern T0* ge473ov9060;
extern T0* ge473ov9059;
extern T0* ge260ov8052;
extern T0* ge264ov3206;
extern T0* ge275ov3184;
extern T0* ge294ov2139;
extern T0* ge1297ov5537;
extern T0* ge1297ov5538;
extern T0* ge1288ov6670;
extern T0* ge1288ov6672;
extern T0* ge1241ov4814;
extern T0* ge1222ov6401;
extern T0* ge1222ov6402;
extern T0* ge1288ov6669;
extern T0* ge1288ov6671;
extern T0* ge331ov2902;
extern T0* ge318ov2902;
extern T0* ge324ov2902;
extern T0* ge323ov2902;
extern T0* ge322ov2902;
extern T0* ge313ov2902;
extern T0* ge312ov2902;
extern T0* ge328ov2902;
extern T0* ge341ov2902;
extern T0* ge1148ov2902;
extern T0* ge1151ov2902;
extern T0* ge1152ov2902;
extern EIF_TYPE getypes[];

