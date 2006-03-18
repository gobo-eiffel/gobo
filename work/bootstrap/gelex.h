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
#include <inttypes.h>
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
#define geint64(x) x##LL
#define genat64(x) x##ULL

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
	T4 a4; /* internal_hash_code */
} T16;

/* GELEX */
typedef struct {
	int id;
	T0* a2; /* error_handler */
	T0* a3; /* description */
	T0* a6; /* dfa */
} T18;

/* GELEX_COMMAND_LINE */
typedef struct {
	int id;
	T0* a1; /* error_handler */
} T19;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a1; /* program_name */
} T20;

/* UT_ERROR_HANDLER */
typedef struct {
	int id;
	T0* a1; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
} T21;

/* LX_DESCRIPTION */
typedef struct {
	int id;
	T0* a1; /* input_filename */
	T2 a2; /* full_table */
	T2 a3; /* no_warning */
	T2 a4; /* reject_used */
	T0* a5; /* rules */
	T2 a6; /* no_default_rule */
	T0* a7; /* output_filename */
	T2 a8; /* backing_up_report */
	T0* a9; /* backing_up_filename */
	T2 a10; /* equiv_classes_used */
	T2 a11; /* meta_equiv_classes_used */
	T4 a12; /* characters_count */
	T4 a13; /* array_size */
	T2 a14; /* line_pragma */
	T0* a16; /* eof_rules */
	T0* a18; /* eiffel_header */
	T0* a19; /* start_conditions */
	T2 a20; /* debug_mode */
	T2 a21; /* case_insensitive */
	T2 a22; /* actions_separated */
	T2 a23; /* inspect_used */
	T0* a24; /* equiv_classes */
	T2 a25; /* variable_trail_context */
	T0* a26; /* eiffel_code */
	T2 a27; /* bol_needed */
	T2 a28; /* pre_action_used */
	T2 a29; /* post_action_used */
	T2 a30; /* pre_eof_action_used */
	T2 a31; /* post_eof_action_used */
	T2 a32; /* line_used */
	T2 a33; /* position_used */
} T22;

/* KL_EQUALITY_TESTER [LX_DFA_STATE] */
typedef struct {
	int id;
} T23;

/* KL_EQUALITY_TESTER [LX_NFA_STATE] */
typedef struct {
	int id;
} T24;

/* KL_EQUALITY_TESTER [LX_START_CONDITION] */
typedef struct {
	int id;
} T25;

/* KL_EQUALITY_TESTER [LX_RULE] */
typedef struct {
	int id;
} T26;

/* KL_EQUALITY_TESTER [INTEGER] */
typedef struct {
	int id;
} T27;

/* KL_EQUALITY_TESTER [STRING] */
typedef struct {
	int id;
} T28;

/* KL_EQUALITY_TESTER [LX_NFA] */
typedef struct {
	int id;
} T29;

/* KL_EQUALITY_TESTER [LX_PROTO] */
typedef struct {
	int id;
} T30;

/* KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
} T31;

/* KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct {
	int id;
} T32;

/* KL_EQUALITY_TESTER [LX_SINGLETON] */
typedef struct {
	int id;
} T33;

/* KL_EQUALITY_TESTER [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
} T34;

/* LX_LEX_PARSER */
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
	T0* a14; /* options_overrider */
	T0* a16; /* description */
	T0* a18; /* error_handler */
	T0* a19; /* name_definitions */
	T0* a22; /* character_classes */
	T4 a24; /* line_nb */
	T0* a25; /* yyss */
	T0* a28; /* input_buffer */
	T4 a29; /* yy_end */
	T4 a30; /* yy_position */
	T4 a31; /* yy_line */
	T4 a32; /* yy_column */
	T4 a33; /* yy_parsing_status */
	T4 a35; /* yy_suspended_yystacksize */
	T4 a36; /* yy_suspended_yystate */
	T4 a37; /* yy_suspended_yyn */
	T4 a38; /* yy_suspended_yychar1 */
	T4 a39; /* yy_suspended_index */
	T4 a40; /* yy_suspended_yyss_top */
	T4 a41; /* yy_suspended_yy_goto */
	T4 a43; /* error_count */
	T2 a44; /* yy_lookahead_needed */
	T4 a45; /* yyerrstatus */
	T4 a46; /* yyssp */
	T0* a53; /* yypact */
	T4 a55; /* last_token */
	T0* a58; /* yytranslate */
	T0* a61; /* yycheck */
	T0* a62; /* yytable */
	T0* a64; /* yydefact */
	T0* a66; /* yyr1 */
	T0* a68; /* yypgoto */
	T0* a69; /* yydefgoto */
	T0* a73; /* yytypes1 */
	T0* a75; /* yytypes2 */
	T4 a83; /* yy_start */
	T4 a84; /* yyvsp1 */
	T4 a85; /* yyvsp2 */
	T4 a86; /* yyvsp3 */
	T4 a87; /* yyvsp4 */
	T4 a88; /* yyvsp5 */
	T2 a95; /* yy_more_flag */
	T4 a96; /* yy_more_len */
	T4 a97; /* line */
	T4 a98; /* column */
	T4 a99; /* position */
	T4 a100; /* yy_start_state */
	T0* a102; /* yy_state_stack */
	T4 a103; /* yy_state_count */
	T0* a104; /* yy_ec */
	T0* a105; /* yy_content_area */
	T0* a106; /* yy_content */
	T0* a107; /* yy_accept */
	T4 a108; /* yy_last_accepting_state */
	T4 a109; /* yy_last_accepting_cpos */
	T0* a110; /* yy_chk */
	T0* a111; /* yy_base */
	T0* a112; /* yy_def */
	T0* a113; /* yy_meta */
	T0* a115; /* yy_nxt */
	T4 a117; /* yy_lp */
	T0* a118; /* yy_acclist */
	T4 a121; /* yy_looking_for_trail_begin */
	T4 a123; /* yy_full_match */
	T4 a124; /* yy_full_state */
	T4 a125; /* yy_full_lp */
	T2 a131; /* yy_rejected */
	T4 a134; /* yyvsc1 */
	T0* a135; /* yyvs1 */
	T0* a136; /* yyspecial_routines1 */
	T0* a138; /* last_any_value */
	T4 a139; /* yyvsc2 */
	T0* a140; /* yyvs2 */
	T0* a141; /* yyspecial_routines2 */
	T0* a142; /* last_string_value */
	T4 a143; /* yyvsc3 */
	T0* a144; /* yyvs3 */
	T0* a145; /* yyspecial_routines3 */
	T4 a146; /* last_integer_value */
	T4 a147; /* yyvsc4 */
	T0* a148; /* yyvs4 */
	T0* a149; /* yyspecial_routines4 */
	T0* a150; /* last_lx_symbol_class_value */
	T2 a151; /* in_trail_context */
	T0* a152; /* rule */
	T0* a153; /* yyvs5 */
	T2 a154; /* has_trail_context */
	T4 a155; /* trail_count */
	T4 a156; /* regexp_count */
	T4 a158; /* head_count */
	T4 a159; /* head_line */
	T4 a160; /* regexp_line */
	T4 a161; /* head_column */
	T4 a162; /* regexp_column */
	T4 a165; /* series_count */
	T4 a166; /* series_line */
	T4 a167; /* series_column */
	T4 a168; /* yyvsc5 */
	T0* a169; /* yyspecial_routines5 */
	T4 a170; /* singleton_count */
	T4 a171; /* singleton_line */
	T4 a172; /* singleton_column */
	T0* a189; /* last_string */
	T4 a202; /* rule_line_nb */
	T4 a231; /* nb_open_brackets */
} T35;

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
	T1 a25; /* last_character */
} T36;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T37;

/* KL_EXCEPTIONS */
typedef struct {
	int id;
} T41;

/* KL_STANDARD_FILES */
typedef struct {
	int id;
} T42;

/* KL_STDIN_FILE */
typedef struct {
	int id;
	T2 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a4; /* name */
	T4 a5; /* mode */
	T1 a8; /* last_character */
	T0* a9; /* character_buffer */
} T43;

/* LX_COMPRESSED_DFA */
typedef struct {
	int id;
	T0* a2; /* yy_rules */
	T2 a3; /* yyVariable_trail_context */
	T0* a4; /* states */
	T2 a6; /* yyReject_used */
	T2 a7; /* meta_equiv_classes_used */
	T4 a8; /* start_states_count */
	T0* a9; /* input_filename */
	T4 a11; /* characters_count */
	T4 a12; /* array_size */
	T2 a13; /* inspect_used */
	T2 a14; /* actions_separated */
	T0* a15; /* eiffel_code */
	T0* a16; /* eiffel_header */
	T2 a17; /* bol_needed */
	T2 a18; /* pre_action_used */
	T2 a19; /* post_action_used */
	T2 a20; /* pre_eof_action_used */
	T2 a21; /* post_eof_action_used */
	T2 a22; /* line_pragma */
	T0* a23; /* yy_start_conditions */
	T0* a24; /* yy_ec */
	T4 a25; /* yyNull_equiv_class */
	T4 a26; /* yyNb_rules */
	T4 a27; /* yyEnd_of_buffer */
	T2 a28; /* yyLine_used */
	T2 a29; /* yyPosition_used */
	T4 a30; /* minimum_symbol */
	T4 a31; /* maximum_symbol */
	T4 a32; /* first_free */
	T4 a33; /* table_end */
	T4 a34; /* templates_count */
	T0* a35; /* protos */
	T0* a36; /* singletons */
	T0* a38; /* meta_equiv_classes */
	T0* a39; /* templates */
	T0* a40; /* partitions */
	T0* a41; /* yy_nxt */
	T0* a43; /* yy_chk */
	T0* a44; /* yy_base */
	T0* a45; /* yy_def */
	T4 a46; /* backing_up_count */
	T0* a49; /* yy_meta */
	T0* a50; /* yy_acclist */
	T0* a51; /* yy_eof_rules */
	T0* a52; /* yy_accept */
	T4 a53; /* yyJam_base */
	T4 a54; /* yyJam_state */
	T4 a55; /* yyTemplate_mark */
} T44;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a4; /* storage */
	T0* a5; /* equality_tester */
	T0* a6; /* special_routines */
	T4 a7; /* capacity */
	T0* a8; /* internal_cursor */
} T45;

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
	T2 a12; /* is_useful */
} T46;

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T47;

/* LX_RULE_CANNOT_BE_MATCHED_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T48;

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T49;

/* LX_FULL_DFA */
typedef struct {
	int id;
	T4 a1; /* backing_up_count */
	T4 a2; /* start_states_count */
	T0* a3; /* states */
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
	T0* a28; /* partitions */
	T2 a29; /* yyBacking_up */
	T0* a31; /* yy_eof_rules */
	T0* a32; /* yy_nxt */
	T0* a33; /* yy_accept */
	T4 a34; /* yyNb_rows */
} T51;

/* KL_TEXT_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a15; /* file_pointer */
	T2 a17; /* descriptor_available */
} T52;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T53;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a3; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T55;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T56;

/* UT_VERSION_NUMBER */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T57;

/* UT_USAGE_MESSAGE */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T58;

/* UT_SEPARATED_FLAG_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T59;

/* UT_UNKNOWN_FLAG_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T60;

/* KL_STDERR_FILE */
typedef struct {
	int id;
	T14 a2; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T61;

/* DS_ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T62;

/* LX_START_CONDITIONS */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a7; /* storage */
	T0* a8; /* special_routines */
	T4 a9; /* capacity */
	T0* a10; /* internal_cursor */
	T0* a16; /* equality_tester */
} T63;

/* LX_ACTION_FACTORY */
typedef struct {
	int id;
} T64;

/* DS_ARRAYED_STACK [INTEGER] */
typedef struct {
	int id;
	T0* a2; /* storage */
	T4 a3; /* count */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T65;

/* YY_FILE_BUFFER */
typedef struct {
	int id;
	T0* a1; /* content */
	T4 a2; /* index */
	T4 a3; /* line */
	T4 a4; /* column */
	T4 a5; /* position */
	T2 a6; /* beginning_of_line */
	T4 a7; /* count */
	T2 a8; /* filled */
	T0* a9; /* file */
	T2 a11; /* end_of_file */
	T4 a12; /* capacity */
	T2 a13; /* interactive */
} T66;

/* YY_BUFFER */
typedef struct {
	int id;
	T0* a1; /* content */
	T4 a2; /* index */
	T4 a3; /* line */
	T4 a4; /* column */
	T4 a5; /* position */
	T2 a6; /* beginning_of_line */
	T4 a7; /* count */
	T2 a8; /* filled */
	T4 a11; /* capacity */
} T67;

/* DS_HASH_TABLE [STRING, STRING] */
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
} T68;

/* KL_STRING_EQUALITY_TESTER */
typedef struct {
	int id;
} T69;

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
} T70;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2[1]; /* item */
} T71;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T72;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T75;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T76;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T77;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T78;

/* LX_SYMBOL_CLASS */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T2 a6; /* negated */
	T2 a10; /* sort_needed */
	T4 a12; /* count */
	T0* a16; /* equality_tester */
} T79;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T80;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
} T81;

/* LX_NFA */
typedef struct {
	int id;
	T2 a1; /* in_trail_context */
	T0* a2; /* states */
} T82;

/* LX_EQUIVALENCE_CLASSES */
typedef struct {
	int id;
	T4 a3; /* count */
	T0* a6; /* storage */
} T83;

/* SPECIAL [LX_NFA] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T84;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct {
	int id;
} T85;

/* UT_SYNTAX_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T86;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a5; /* next_cursor */
} T87;

/* LX_ACTION */
typedef struct {
	int id;
	T0* a1; /* text */
} T89;

/* LX_START_CONDITION */
typedef struct {
	int id;
	T0* a1; /* name */
	T4 a2; /* id */
	T2 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
	T2 a6; /* has_eof */
} T90;

/* LX_BAD_START_CONDITION_LIST_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T91;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T92;

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T93;

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T94;

/* LX_DIRECTIVE_EXPECTED_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T95;

/* LX_START_CONDITION_EXPECTED_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T96;

/* LX_UNRECOGNIZED_OPTION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T97;

/* LX_MISSING_QUOTE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T98;

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T99;

/* LX_UNDEFINED_DEFINITION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T100;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T101;

/* LX_BAD_START_CONDITION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T102;

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T103;

/* LX_MISSING_BRACKET_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T104;

/* LX_BAD_CHARACTER_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T105;

/* LX_FULL_AND_META_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T106;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T107;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T108;

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T109;

/* LX_UNDECLARED_START_CONDITION_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T110;

/* LX_ALL_START_CONDITIONS_EOF_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T111;

/* LX_START_CONDITION_DECLARED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T112;

/* LX_NAME_DEFINED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T113;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T114;

/* LX_MULTIPLE_EOF_RULES_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T115;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T118;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T119;

/* LX_DFA_STATE */
typedef struct {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T4 a5; /* code */
	T4 a8; /* id */
} T120;

/* LX_NFA_STATE */
typedef struct {
	int id;
	T2 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T4 a4; /* id */
	T0* a7; /* accepted_rule */
} T121;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a6; /* storage */
	T0* a7; /* equality_tester */
	T0* a8; /* special_routines */
	T4 a9; /* capacity */
	T0* a10; /* internal_cursor */
} T122;

/* SPECIAL [LX_RULE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T123;

/* ARRAY [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T124;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* capacity */
	T0* a5; /* storage */
	T0* a6; /* special_routines */
	T0* a7; /* internal_cursor */
	T0* a12; /* equality_tester */
} T125;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T126;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct {
	int id;
} T128;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T130;

/* LX_SINGLETON */
typedef struct {
	int id;
	T4 a1; /* symbol */
	T4 a2; /* state_id */
	T4 a3; /* default_id */
	T4 a4; /* target_id */
} T131;

/* LX_PROTO_QUEUE */
typedef struct {
	int id;
	T4 a4; /* count */
	T0* a5; /* first_cell */
	T0* a6; /* internal_cursor */
	T0* a8; /* last_cell */
} T132;

/* DS_ARRAYED_LIST [LX_SINGLETON] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a4; /* storage */
	T4 a5; /* capacity */
	T0* a6; /* special_routines */
	T0* a7; /* internal_cursor */
} T133;

/* LX_TEMPLATE_LIST */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a5; /* last_cell */
	T0* a6; /* meta_equiv_classes */
	T0* a7; /* internal_cursor */
	T0* a9; /* first_cell */
} T134;

/* LX_SYMBOL_PARTITIONS */
typedef struct {
	int id;
	T0* a2; /* symbols */
	T0* a5; /* storage */
	T4 a8; /* count */
} T135;

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T136;

/* DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]] */
typedef struct {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
} T137;

/* DS_LINKED_LIST [LX_RULE] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T138;

/* DS_LINKED_LIST_CURSOR [LX_RULE] */
typedef struct {
	int id;
	T2 a2; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T139;

/* UT_BOOLEAN_FORMATTER */
typedef struct {
	int id;
} T140;

/* DS_ARRAYED_LIST [INTEGER] */
typedef struct {
	int id;
	T4 a2; /* count */
	T0* a4; /* equality_tester */
	T0* a5; /* storage */
	T0* a6; /* special_routines */
	T4 a7; /* capacity */
	T0* a8; /* internal_cursor */
} T141;

/* DS_BUBBLE_SORTER [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T142;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a7; /* storage */
	T0* a9; /* array_routines */
} T144;

/* SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T2 a2[1]; /* item */
} T145;

/* ARRAY [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T146;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a6; /* next_cursor */
} T147;

/* LX_PROTO */
typedef struct {
	int id;
	T4 a1; /* state_id */
	T0* a2; /* transitions */
	T0* a3; /* common_state */
} T148;

/* DS_BILINKED_LIST_CURSOR [LX_PROTO] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
	T2 a6; /* before */
} T149;

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T150;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T151;

/* UT_ARRAY_FORMATTER */
typedef struct {
	int id;
} T152;

/* KL_INTEGER_ROUTINES */
typedef struct {
	int id;
} T153;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a6; /* count */
} T154;

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
} T155;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct {
	int id;
} T156;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T157;

/* LX_BAD_ITERATION_VALUES_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T160;

/* LX_ITERATION_NOT_POSITIVE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T161;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T162;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a4; /* file_name */
	T0* a5; /* buffered_file_info */
} T163;

/* KL_COMPARABLE_COMPARATOR [INTEGER] */
typedef struct {
	int id;
} T165;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T168;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
} T169;

/* SPECIAL [LX_START_CONDITION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T170;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct {
	int id;
} T171;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T4 a2; /* position */
	T0* a3; /* container */
} T172;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T173;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T174;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T175;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T176;

/* DS_ARRAYED_LIST_CURSOR [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
} T177;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct {
	int id;
	T0* a1; /* area */
} T178;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* target */
} T179;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
} T182;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* label */
	T0* a2; /* target */
} T183;

/* DS_BILINKABLE [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T184;

/* SPECIAL [DS_BILINKABLE [INTEGER]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T185;

/* ARRAY [DS_BILINKABLE [INTEGER]] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T186;

/* TO_SPECIAL [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* area */
} T187;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T188;

/* SPECIAL [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T190;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct {
	int id;
} T191;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a5; /* container */
} T192;

/* SPECIAL [LX_DFA_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T194;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct {
	int id;
} T195;

/* DS_BILINKABLE [LX_PROTO] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
} T197;

/* SPECIAL [LX_SINGLETON] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T198;

/* KL_SPECIAL_ROUTINES [LX_SINGLETON] */
typedef struct {
	int id;
} T199;

/* DS_ARRAYED_LIST_CURSOR [LX_SINGLETON] */
typedef struct {
	int id;
	T0* a1; /* container */
} T200;

/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T201;

/* SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T203;

/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
} T204;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
	T0* a1; /* container */
} T205;

/* DS_LINKABLE [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T206;

/* ARRAY [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T208;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct {
	int id;
} T209;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct {
	int id;
	T0* a1; /* container */
} T210;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T211;

/* TO_SPECIAL [LX_RULE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T212;

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
} T213;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a3; /* as_special */
	T0* a6; /* area */
} T216;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct {
	int id;
} T217;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T220;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T221;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T222;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T223;

/* TO_SPECIAL [LX_SINGLETON] */
typedef struct {
	int id;
	T0* a1; /* area */
} T224;

/* TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T225;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 a1; /* count */
	T8 a2[1]; /* item */
} T226;

/* DS_SHELL_SORTER [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T227;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T228;

/* KL_OPERATING_SYSTEM */
typedef struct {
	int id;
} T229;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 a1; /* count */
	T11 a2[1]; /* item */
} T230;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T231;

/* PLATFORM */
typedef struct {
	int id;
} T232;

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern int geargc;
extern char** geargv;

/* Call to UT_ERROR.default_message */
extern T0* T40x3636(T0* C);
/* Call to ANY.same_type */
extern T2 T74x59(T0* C, T0* a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T180x6315(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T180x6318(T0* C, T4 a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T180x1453(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T180x6319(T0* C, T0* a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].set_target */
extern void T180x6316(T0* C, T0* a1);
/* GELEX.execute */
extern T0* T18c7();
/* GELEX.print_backing_up_report */
extern void T18f12(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge291os3690;
extern T0* ge291ov3690;
extern T0* T42f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T55c9();
/* KL_STDOUT_FILE.make_open_stdout */
extern void T55f15(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T55f19(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T55f4(T0* C, T4 a1);
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
/* KL_STDOUT_FILE.old_make */
extern void T55f18(T0* C, T0* a1);
/* GELEX.std */
extern unsigned char ge289os1299;
extern T0* ge289ov1299;
extern T0* T18f5(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T42c4();
/* KL_EXCEPTIONS.die */
extern void T41f2(T0* C, T4 a1);
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
/* GELEX.exceptions */
extern unsigned char ge307os1300;
extern T0* ge307ov1300;
extern T0* T18f4(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T41c1();
/* UT_ERROR_HANDLER.report_error */
extern void T21f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T21f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T61f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T61f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T61f11(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T61f15(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T61f19(T0* C, T14 a1, T14 a2, T4 a3);
/* TYPED_POINTER [ANY].to_pointer */
extern T14 T118f2(T118* C);
/* KL_STRING_ROUTINES.as_string */
extern T0* T56f2(T0* C, T0* a1);
/* STRING.string */
extern T0* T16f13(T0* C);
/* STRING.append */
extern void T16f31(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f9(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f10(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.resize */
extern void T16f30(T0* C, T4 a1);
/* SPECIAL [CHARACTER].aliased_resized_area */
extern T0* T15f3(T0* C, T4 a1);
/* INTEGER.infix ">=" */
extern T2 T4f5(T4* C, T4 a1);
/* STRING.additional_space */
extern T4 T16f6(T0* C);
/* INTEGER.max */
extern T4 T4f11(T4* C, T4 a1);
/* STRING.capacity */
extern T4 T16f5(T0* C);
/* INTEGER.infix ">" */
extern T2 T4f1(T4* C, T4 a1);
/* STRING.make */
extern T0* T16c25(T4 a1);
/* STRING.make_area */
extern void T16f29(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c8(T4 a1);
/* KL_ANY_ROUTINES.same_types */
extern T2 T168f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge251os1454;
extern T0* ge251ov1454;
extern T0* T56f7(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T168c2();
/* KL_STDERR_FILE.string_ */
extern unsigned char ge259os1314;
extern T0* ge259ov1314;
extern T0* T61f1(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T56c10();
/* UT_ERROR_HANDLER.message */
extern T0* T21f5(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T53c7(T0* a1);
/* ARRAY [STRING].put */
extern void T119f8(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T119c7(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T119f9(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T77c4(T4 a1);
/* INTEGER.infix "<=" */
extern T2 T4f6(T4* C, T4 a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T52f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T52f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T52f33(T0* C, T14 a1);
/* LX_COMPRESSED_DFA.print_backing_up_report */
extern void T44f82(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T55f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T55f14(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T55f10(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T55f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T55f20(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T55f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T52f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T52f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T52f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T52f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T52f34(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T52f9(T0* C);
/* LX_COMPRESSED_DFA.print_backing_up_report */
extern void T44f82p1(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_character */
extern void T55f11(T0* C, T1 a1);
/* KL_STDOUT_FILE.old_put_character */
extern void T55f17(T0* C, T1 a1);
/* KL_STDOUT_FILE.console_pc */
extern void T55f21(T0* C, T14 a1, T1 a2);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T52f24(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T52f32(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T52f35(T0* C, T14 a1, T1 a2);
/* LX_COMPRESSED_DFA.print_transitions */
extern void T44f95(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_readable_character */
extern void T44f111(T0* C, T4 a1, T0* a2);
/* KL_INTEGER_ROUTINES.to_character */
extern T1 T153f1(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.integer_ */
extern unsigned char ge256os2363;
extern T0* ge256ov2363;
extern T0* T44f77(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T153c2();
/* STRING.append_string */
extern void T16f27(T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T56f6(T0* C, T0* a1);
/* STRING.twin */
extern T0* T16f14(T0* C);
/* STRING.copy */
extern void T16f34(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f4(T0* C);
/* INTEGER.out */
extern T0* T4f13(T4* C);
/* STRING.append_integer */
extern void T16f28(T0* C, T4 a1);
/* STRING.append_character */
extern void T16f26(T0* C, T1 a1);
/* LX_COMPRESSED_DFA.string_ */
extern T0* T44f75(T0* C);
/* ARRAY [BOOLEAN].item */
extern T2 T146f4(T0* C, T4 a1);
/* ARRAY [BOOLEAN].put */
extern void T146f6(T0* C, T2 a1, T4 a2);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T144f3(T0* C, T4 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T208f4(T0* C, T4 a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].valid_label */
extern T2 T144f10(T0* C, T4 a1);
/* ARRAY [LX_DFA_STATE].valid_index */
extern T2 T208f6(T0* C, T4 a1);
/* ARRAY [INTEGER].item */
extern T4 T130f4(T0* C, T4 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T146c5(T4 a1, T4 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T146f8(T0* C, T4 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T145c3(T4 a1);
/* LX_COMPRESSED_DFA.print_rule_line_numbers */
extern void T44f94(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [INTEGER].item */
extern T4 T141f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [INTEGER].sort */
extern void T141f13(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [INTEGER].sort */
extern void T142f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [INTEGER].sort_with_comparator */
extern void T142f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [INTEGER].subsort_with_comparator */
extern void T142f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [INTEGER].replace */
extern void T141f14(T0* C, T4 a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER].less_than */
extern T2 T165f1(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [INTEGER].is_empty */
extern T2 T141f10(T0* C);
/* LX_COMPRESSED_DFA.integer_sorter */
extern unsigned char ge102os4064;
extern T0* ge102ov4064;
extern T0* T44f57(T0* C);
/* DS_BUBBLE_SORTER [INTEGER].make */
extern T0* T142c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER].make */
extern T0* T165c2();
/* DS_ARRAYED_LIST [INTEGER].put_last */
extern void T141f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [INTEGER].has */
extern T2 T141f1(T0* C, T4 a1);
/* LX_NFA.has */
extern T2 T82f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T2 T122f3(T0* C, T0* a1);
/* ARRAY [LX_RULE].item */
extern T0* T124f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T122f2(T0* C, T4 a1);
/* DS_ARRAYED_LIST [INTEGER].make */
extern T0* T141c11(T4 a1);
/* DS_ARRAYED_LIST [INTEGER].new_cursor */
extern T0* T141f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
extern T0* T177c2(T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T72f1(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T174c2(T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T71c6(T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T72c4();
/* KL_STDOUT_FILE.put_integer */
extern void T55f13(T0* C, T4 a1);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T52f26(T0* C, T4 a1);
/* LX_DFA_STATE.is_accepting */
extern T2 T120f11(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T2 T45f13(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T125f2(T0* C, T4 a1);
/* LX_FULL_DFA.print_backing_up_report */
extern void T51f51(T0* C, T0* a1);
/* LX_FULL_DFA.print_backing_up_report */
extern void T51f51p1(T0* C, T0* a1);
/* LX_FULL_DFA.print_transitions */
extern void T51f64(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_readable_character */
extern void T51f75(T0* C, T4 a1, T0* a2);
/* LX_FULL_DFA.integer_ */
extern T0* T51f48(T0* C);
/* LX_FULL_DFA.string_ */
extern T0* T51f46(T0* C);
/* LX_FULL_DFA.print_rule_line_numbers */
extern void T51f63(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.integer_sorter */
extern T0* T51f36(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T2 T52f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T2 T52f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T52f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T2 T52f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T2 T52f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T52f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T52f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T52f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T52f18(T0* C, T14 a1, T4 a2);
/* STRING.to_c */
extern T0* T16f3(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T52c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T52f28(T0* C, T0* a1);
/* GELEX.print_scanner */
extern void T18f11(T0* C);
/* LX_COMPRESSED_DFA.print_scanner */
extern void T44f81(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_eiffel_code */
extern void T44f93(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_constants */
extern void T44f92(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_constants */
extern void T44f92p1(T0* C, T0* a1);
/* ARRAY [STRING].item */
extern T0* T119f5(T0* C, T4 a1);
/* UT_BOOLEAN_FORMATTER.put_eiffel_boolean */
extern void T140f4(T0* C, T0* a1, T2 a2);
/* LX_COMPRESSED_DFA.boolean_formatter_ */
extern unsigned char ge220os4099;
extern T0* ge220ov4099;
extern T0* T44f56(T0* C);
/* UT_BOOLEAN_FORMATTER.default_create */
extern T0* T140c3();
/* LX_COMPRESSED_DFA.print_eiffel_tables */
extern void T44f91(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_eiffel_array */
extern void T44f110(T0* C, T0* a1, T0* a2, T0* a3);
/* INTEGER.min */
extern T4 T4f12(T4* C, T4 a1);
/* UT_ARRAY_FORMATTER.put_integer_array */
extern void T152f8(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* LX_COMPRESSED_DFA.array_formatter_ */
extern unsigned char ge220os4101;
extern T0* ge220ov4101;
extern T0* T44f69(T0* C);
/* UT_ARRAY_FORMATTER.default_create */
extern T0* T152c7();
/* ARRAY [INTEGER].count */
extern T4 T130f5(T0* C);
/* LX_COMPRESSED_DFA.print_eof_actions */
extern void T44f90(T0* C, T0* a1);
/* LX_ACTION.out */
extern T0* T89f2(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].forth */
extern void T139f9(T0* C);
/* DS_LINKED_LIST [LX_RULE].cursor_forth */
extern void T138f11(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].add_traversing_cursor */
extern void T138f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_RULE].set_next_cursor */
extern void T139f11(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].remove_traversing_cursor */
extern void T138f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_RULE].set */
extern void T139f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [LX_RULE].item */
extern T0* T139f1(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].start */
extern void T139f8(T0* C);
/* DS_LINKED_LIST [LX_RULE].cursor_start */
extern void T138f10(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].cursor_off */
extern T2 T138f7(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].new_cursor */
extern T0* T138f1(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].make */
extern T0* T139c7(T0* a1);
/* DS_LINKED_LIST [LX_RULE].put_last */
extern void T138f9(T0* C, T0* a1);
/* DS_LINKABLE [LX_RULE].put_right */
extern void T206f4(T0* C, T0* a1);
/* DS_LINKABLE [LX_RULE].make */
extern T0* T206c3(T0* a1);
/* DS_LINKED_LIST [LX_RULE].is_empty */
extern T2 T138f3(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].put_last */
extern void T136f9(T0* C, T0* a1);
/* DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]].make */
extern T0* T137c3(T0* a1, T0* a2);
/* DS_LINKED_LIST [LX_RULE].make */
extern T0* T138c8();
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].item */
extern T0* T136f2(T0* C, T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T136c8(T4 a1);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].new_cursor */
extern T0* T136f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T205c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T204f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make_area */
extern T0* T225c2(T4 a1);
/* SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T203c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
extern T0* T204c2();
/* ARRAY [LX_RULE].count */
extern T4 T124f4(T0* C);
/* LX_COMPRESSED_DFA.print_actions */
extern void T44f89(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_action_routine */
extern void T44f109(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_action_body */
extern void T44f118(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_binary_search_actions */
extern void T44f108(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_COMPRESSED_DFA.print_action_call */
extern void T44f117(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_inspect_actions */
extern void T44f107(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_build_tables */
extern void T44f88(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_status_report_routines */
extern void T44f87(T0* C, T0* a1);
/* ARRAY [STRING].count */
extern T4 T119f6(T0* C);
/* LX_COMPRESSED_DFA.print_eiffel_header */
extern void T44f86(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T62f2(T0* C, T4 a1);
/* LX_FULL_DFA.print_scanner */
extern void T51f50(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_code */
extern void T51f62(T0* C, T0* a1);
/* LX_FULL_DFA.print_constants */
extern void T51f61(T0* C, T0* a1);
/* LX_FULL_DFA.print_constants */
extern void T51f61p1(T0* C, T0* a1);
/* LX_FULL_DFA.boolean_formatter_ */
extern T0* T51f35(T0* C);
/* LX_FULL_DFA.print_eiffel_tables */
extern void T51f60(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_array */
extern void T51f74(T0* C, T0* a1, T0* a2, T0* a3);
/* LX_FULL_DFA.array_formatter_ */
extern T0* T51f40(T0* C);
/* LX_FULL_DFA.print_eof_actions */
extern void T51f59(T0* C, T0* a1);
/* LX_FULL_DFA.print_actions */
extern void T51f58(T0* C, T0* a1);
/* LX_FULL_DFA.print_action_routine */
extern void T51f73(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_action_body */
extern void T51f80(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_binary_search_actions */
extern void T51f72(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_FULL_DFA.print_action_call */
extern void T51f79(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_inspect_actions */
extern void T51f71(T0* C, T0* a1);
/* LX_FULL_DFA.print_build_tables */
extern void T51f57(T0* C, T0* a1);
/* LX_FULL_DFA.print_status_report_routines */
extern void T51f56(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_header */
extern void T51f55(T0* C, T0* a1);
/* GELEX.build_dfa */
extern void T18f10(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.make */
extern T0* T49c7(T0* a1);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.make */
extern T0* T48c7(T0* a1, T4 a2);
/* UT_ERROR_HANDLER.report_warning */
extern void T21f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning_message */
extern void T21f11(T0* C, T0* a1);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.make */
extern T0* T47c7(T0* a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T45f2(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.dangerous_variable_trail_rules */
extern T0* T44f1(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T45f19(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T126f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T126f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T126f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T45f24(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T2 T128f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T2 T46f13(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.rule_sorter */
extern unsigned char ge98os4025;
extern T0* ge98ov4025;
extern T0* T44f5(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T126c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T128c2();
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T45f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].has */
extern T2 T45f3(T0* C, T0* a1);
/* LX_DFA_STATE.is_accepting_head */
extern T2 T120f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T45c15(T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T45f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T157c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T156f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T212c2(T4 a1);
/* SPECIAL [LX_RULE].make */
extern T0* T123c4(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T156c3();
/* LX_COMPRESSED_DFA.make */
extern T0* T44c80(T0* a1);
/* LX_COMPRESSED_DFA.build */
extern void T44f85(T0* C);
/* LX_COMPRESSED_DFA.build_accept_tables */
extern void T44f106(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T45f14(T0* C);
/* LX_RULE.variable_trail */
extern T2 T46f14(T0* C);
/* ARRAY [INTEGER].put */
extern void T130f8(T0* C, T4 a1, T4 a2);
/* LX_COMPRESSED_DFA.build_base_def_tables */
extern void T44f105(T0* C);
/* LX_COMPRESSED_DFA.build_nxt_chk_tables */
extern void T44f104(T0* C);
/* LX_COMPRESSED_DFA.put_jam_state */
extern void T44f103(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].resize */
extern void T151f2(T0* C, T0* a1, T4 a2, T4 a3);
/* ARRAY [INTEGER].conservative_resize */
extern void T130f10(T0* C, T4 a1, T4 a2);
/* SPECIAL [INTEGER].fill_with */
extern void T71f8(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].move_data */
extern void T71f7(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T71f11(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T71f10(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].aliased_resized_area */
extern T0* T71f3(T0* C, T4 a1);
/* ARRAY [INTEGER].make_area */
extern void T130f9(T0* C, T4 a1);
/* ARRAY [INTEGER].empty_area */
extern T2 T130f6(T0* C);
/* LX_COMPRESSED_DFA.integer_array_ */
extern unsigned char ge252os2549;
extern T0* ge252ov2549;
extern T0* T44f68(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T151c1();
/* LX_COMPRESSED_DFA.put_singletons */
extern void T44f102(T0* C);
/* LX_COMPRESSED_DFA.put_singleton */
extern void T44f116(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].item */
extern T0* T133f2(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.put_templates */
extern void T44f101(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].forth */
extern void T150f9(T0* C);
/* LX_TEMPLATE_LIST.cursor_forth */
extern void T134f16(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.add_traversing_cursor */
extern void T134f17(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set_next_cursor */
extern void T150f11(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.remove_traversing_cursor */
extern void T134f18(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set */
extern void T150f10(T0* C, T0* a1, T2 a2, T2 a3);
/* LX_COMPRESSED_DFA.put_entry */
extern void T44f115(T0* C, T4 a1, T4 a2, T0* a3);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].capacity */
extern T4 T144f5(T0* C);
/* ARRAY [LX_DFA_STATE].count */
extern T4 T208f5(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].maximum_label */
extern T4 T144f4(T0* C);
/* LX_DFA_STATE.default */
extern T0* T120f9(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T4 T144f8(T0* C);
/* DS_ARRAYED_LIST [LX_SINGLETON].is_full */
extern T2 T133f3(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].minimum_label */
extern T4 T144f2(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T4 T144f6(T0* C);
/* LX_TEMPLATE_LIST.equiv_template */
extern T0* T134f4(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T144f15(T0* C, T0* a1, T4 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T208f9(T0* C, T0* a1, T4 a2);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T4 T83f9(T0* C, T4 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].item */
extern T0* T186f4(T0* C, T4 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T2 T83f8(T0* C, T4 a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T144c14(T4 a1, T4 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T209c2();
/* ARRAY [LX_DFA_STATE].make */
extern T0* T208c8(T4 a1, T4 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T208f10(T0* C, T4 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T194c5(T4 a1);
/* LX_EQUIVALENCE_CLASSES.capacity */
extern T4 T83f7(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER]].count */
extern T4 T186f5(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].item */
extern T0* T150f2(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].start */
extern void T150f8(T0* C);
/* LX_TEMPLATE_LIST.cursor_start */
extern void T134f15(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.cursor_off */
extern T2 T134f10(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.new_cursor */
extern T0* T134f3(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
extern T0* T150c7(T0* a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T83f1(T0* C, T4 a1, T4 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T4 T83f5(T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T4 T83f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T83f11(T0* C);
/* DS_BILINKABLE [INTEGER].put */
extern void T184f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].put_last */
extern void T133f10(T0* C, T0* a1);
/* LX_SINGLETON.make */
extern T0* T131c5(T4 a1, T4 a2, T4 a3, T4 a4);
/* LX_COMPRESSED_DFA.put_state */
extern void T44f100(T0* C, T0* a1);
/* LX_PROTO_QUEUE.move_to_front */
extern void T132f14(T0* C, T0* a1);
/* LX_PROTO_QUEUE.put_first */
extern void T132f16(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].put_right */
extern void T197f5(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].attach_left */
extern void T197f7(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].make */
extern T0* T197c4(T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].remove */
extern void T149f15(T0* C);
/* LX_PROTO_QUEUE.remove_at_cursor */
extern void T132f25(T0* C, T0* a1);
/* LX_PROTO_QUEUE.move_all_cursors */
extern void T132f29(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_current_cell */
extern void T149f19(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_last */
extern void T132f15(T0* C);
/* LX_PROTO_QUEUE.set_last_cell */
extern void T132f19(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].forget_right */
extern void T197f8(T0* C);
/* LX_PROTO_QUEUE.move_last_cursors_after */
extern void T132f18(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_next_cursor */
extern void T149f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_after */
extern void T149f16(T0* C);
/* LX_PROTO_QUEUE.wipe_out */
extern void T132f17(T0* C);
/* LX_PROTO_QUEUE.move_all_cursors_after */
extern void T132f20(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_last */
extern T2 T149f9(T0* C);
/* LX_PROTO_QUEUE.cursor_is_last */
extern T2 T132f11(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_first */
extern void T132f28(T0* C);
/* LX_PROTO_QUEUE.set_first_cell */
extern void T132f30(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].forget_left */
extern void T197f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_first */
extern T2 T149f8(T0* C);
/* LX_PROTO_QUEUE.cursor_is_first */
extern T2 T132f10(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].cloned_object */
extern T0* T144f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].twin */
extern T0* T144f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].copy */
extern void T144f16(T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].cloned_array */
extern T0* T209f1(T0* C, T0* a1);
/* ARRAY [LX_DFA_STATE].twin */
extern T0* T208f7(T0* C);
/* ARRAY [LX_DFA_STATE].copy */
extern void T208f11(T0* C, T0* a1);
/* ARRAY [LX_DFA_STATE].set_area */
extern void T208f13(T0* C, T0* a1);
/* SPECIAL [LX_DFA_STATE].twin */
extern T0* T194f4(T0* C);
/* LX_PROTO_QUEUE.put */
extern void T132f13(T0* C, T4 a1, T0* a2, T0* a3);
/* LX_PROTO.make */
extern T0* T148c4(T4 a1, T0* a2, T0* a3);
/* LX_TEMPLATE_LIST.last */
extern T0* T134f1(T0* C);
/* LX_TEMPLATE_LIST.put */
extern void T134f12(T0* C, T0* a1, T0* a2);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T83f12(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].forget_right */
extern void T184f7(T0* C);
/* DS_BILINKABLE [INTEGER].forget_left */
extern void T184f8(T0* C);
/* DS_BILINKABLE [INTEGER].put_right */
extern void T184f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_left */
extern void T184f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T4 T79f14(T0* C, T4 a1);
/* LX_TEMPLATE_LIST.put_last */
extern void T134f14(T0* C, T0* a1);
/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].put_right */
extern void T201f4(T0* C, T0* a1);
/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
extern T0* T201c3(T0* a1);
/* LX_TEMPLATE_LIST.is_empty */
extern T2 T134f8(T0* C);
/* LX_SYMBOL_CLASS.put */
extern void T79f20(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T79f21(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T79f22(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T72f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T71f4(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T4 T79f13(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T2 T79f11(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.last */
extern T4 T79f9(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T2 T79f8(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T2 T79f7(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T2 T79f15(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T79c18(T4 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T79f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_after */
extern void T149f13(T0* C);
/* LX_PROTO_QUEUE.cursor_go_after */
extern void T132f23(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_traversing_cursor */
extern void T132f27(T0* C, T0* a1);
/* LX_PROTO_QUEUE.cursor_off */
extern T2 T132f9(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].difference */
extern T0* T144f11(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.null_state */
extern unsigned char ge98os4013;
extern T0* ge98ov4013;
extern T0* T44f63(T0* C);
/* LX_DFA_STATE.set_id */
extern void T120f19(T0* C, T4 a1);
/* LX_DFA_STATE.make */
extern T0* T120c18(T0* a1, T4 a2, T4 a3);
/* LX_RULE.set_useful */
extern void T46f24(T0* C, T2 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge57os1450;
extern T0* ge57ov1450;
extern T0* T120f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T122f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T188f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T188f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T188f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T122f26(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T2 T217f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T2 T121f9(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge57os1449;
extern T0* ge57ov1449;
extern T0* T120f6(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T188c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T217c2();
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T122f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T2 T122f4(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T45f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T45f20(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T156f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_RULE].resized_area */
extern T0* T123f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T4 T45f11(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T2 T45f10(T0* C, T4 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T2 T121f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T2 T121f10(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T2 T121f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T122f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T122f31(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T191f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_NFA_STATE].resized_area */
extern T0* T190f3(T0* C, T4 a1);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T190c4(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T4 T122f13(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T2 T122f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T122c23(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T122f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T192c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T191f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T222c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T191c3();
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_to */
extern void T149f12(T0* C, T0* a1);
/* LX_PROTO_QUEUE.cursor_go_to */
extern void T132f22(T0* C, T0* a1, T0* a2);
/* LX_PROTO_QUEUE.add_traversing_cursor */
extern void T132f26(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].off */
extern T2 T149f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set */
extern void T149f18(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].forth */
extern void T149f14(T0* C);
/* LX_PROTO_QUEUE.cursor_forth */
extern void T132f24(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].item */
extern T0* T149f2(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].start */
extern void T149f11(T0* C);
/* LX_PROTO_QUEUE.cursor_start */
extern void T132f21(T0* C, T0* a1);
/* LX_PROTO_QUEUE.first */
extern T0* T132f3(T0* C);
/* LX_PROTO_QUEUE.is_empty */
extern T2 T132f2(T0* C);
/* LX_PROTO_QUEUE.new_cursor */
extern T0* T132f1(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].make */
extern T0* T149c10(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].go_after */
extern void T147f10(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_go_after */
extern void T125f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].remove_traversing_cursor */
extern void T125f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_next_cursor */
extern void T147f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_position */
extern void T147f11(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].off */
extern T2 T147f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_off */
extern T2 T125f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_before */
extern T2 T125f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_after */
extern T2 T125f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T125f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].index */
extern T4 T147f2(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_index */
extern T4 T125f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].after */
extern T2 T147f1(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].search_forth */
extern void T147f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_search_forth */
extern void T125f19(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [LX_DFA_STATE].add_traversing_cursor */
extern void T125f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].start */
extern void T147f8(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_start */
extern void T125f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].is_empty */
extern T2 T125f11(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T125f4(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T147c7(T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T125c15(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T195f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T223c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T195c3();
/* LX_COMPRESSED_DFA.build_transitions */
extern void T44f99(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T4 T135f4(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.new_state */
extern T0* T44f60(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T2 T120f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T2 T122f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T122f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T120f16(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T120f12(T0* C, T4 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T4 T120f15(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T4 T120f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T122f24(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T2 T135f3(T0* C, T4 a1);
/* LX_DFA_STATE.partition */
extern void T120f20(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T135f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T146f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T145f5(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T135f10p1(T0* C);
/* DS_BILINKABLE [INTEGER].put_left */
extern void T184f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER].attach_right */
extern void T184f10(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T4 T135f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T4 T135f6(T0* C);
/* LX_COMPRESSED_DFA.resize */
extern void T44f114(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T125f17(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T195f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_DFA_STATE].resized_area */
extern T0* T194f3(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T4 T135f1(T0* C);
/* ARRAY [INTEGER].make */
extern T0* T130c7(T4 a1, T4 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T135c9(T4 a1, T4 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T135f9p1(T0* C, T4 a1, T4 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].put */
extern void T186f7(T0* C, T0* a1, T4 a2);
/* DS_BILINKABLE [INTEGER].make */
extern T0* T184c4(T4 a1);
/* ARRAY [DS_BILINKABLE [INTEGER]].make */
extern T0* T186c6(T4 a1, T4 a2);
/* ARRAY [DS_BILINKABLE [INTEGER]].make_area */
extern void T186f8(T0* C, T4 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER]].make */
extern T0* T185c2(T4 a1);
/* LX_TEMPLATE_LIST.make */
extern T0* T134c11(T0* a1);
/* LX_TEMPLATE_LIST.make_list */
extern void T134f13(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T83c10(T4 a1, T4 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T83f13(T0* C);
/* DS_ARRAYED_LIST [LX_SINGLETON].make */
extern T0* T133c9(T4 a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].new_cursor */
extern T0* T133f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_SINGLETON].make */
extern T0* T200c2(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_SINGLETON].make */
extern T0* T199f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_SINGLETON].make_area */
extern T0* T224c2(T4 a1);
/* SPECIAL [LX_SINGLETON].make */
extern T0* T198c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_SINGLETON].default_create */
extern T0* T199c2();
/* LX_PROTO_QUEUE.make */
extern T0* T132c12();
/* LX_COMPRESSED_DFA.put_eob_state */
extern void T44f84(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T45f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T45f25(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T45f27(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T157f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T45f26(T0* C, T4 a1, T4 a2);
/* LX_RULE.make_default */
extern T0* T46c15(T4 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge143os1508;
extern T0* ge143ov1508;
extern T0* T46f5(T0* C);
/* LX_ACTION.make */
extern T0* T89c3(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge143os1507;
extern T0* ge143ov1507;
extern T0* T46f3(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T82c9(T2 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T122f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T122f30(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T122f34(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T192f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T122f33(T0* C, T4 a1, T4 a2);
/* LX_NFA_STATE.set_transition */
extern void T121f13(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T179c5(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T121c12(T2 a1);
/* LX_COMPRESSED_DFA.initialize */
extern void T44f83(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.initialize_dfa */
extern void T44f98(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_COMPRESSED_DFA.put_start_condition */
extern void T44f113(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T82f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T122f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T154f7(T0* C, T4 a1);
/* LX_START_CONDITIONS.item */
extern T0* T63f5(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.set_nfa_state_ids */
extern void T44f112(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T121f15(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].force */
extern void T155f35(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_put */
extern void T155f43(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_put */
extern void T155f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_put */
extern void T155f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_item */
extern T4 T155f17(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_item */
extern T4 T155f16(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].hash_position */
extern T4 T155f11(T0* C, T4 a1);
/* INTEGER.hash_code */
extern T4 T4f17(T4* C);
/* INTEGER.infix "&" */
extern T4 T4f18(T4* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].resize */
extern void T155f40(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_resize */
extern void T155f48(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].special_integer_ */
extern unsigned char ge257os2367;
extern T0* ge257ov2367;
extern T0* T155f30(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_resize */
extern void T155f47(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_resize */
extern void T155f46(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T85f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_NFA].resized_area */
extern T0* T84f3(T0* C, T4 a1);
/* SPECIAL [LX_NFA].make */
extern T0* T84c4(T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_item */
extern T4 T155f20(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_resize */
extern void T155f45(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_modulus */
extern T4 T155f23(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_capacity */
extern T4 T155f10(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_put */
extern void T155f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER].search_position */
extern void T155f36(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [INTEGER].test */
extern T2 T27f1(T0* C, T4 a1, T4 a2);
/* INTEGER.is_equal */
extern T2 T4f16(T4* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].unset_found_item */
extern void T155f38(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER].item */
extern T0* T155f2(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].items_item */
extern T0* T155f5(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].has */
extern T2 T155f1(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make */
extern T0* T155c34(T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_with_equality_testers */
extern void T155f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_sparse_container */
extern void T155f44(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].new_cursor */
extern T0* T155f29(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER].make */
extern T0* T211c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_slots */
extern void T155f52(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_clashes */
extern void T155f51(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_keys */
extern void T155f50(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER].make_items */
extern void T155f49(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T85f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T187c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T85c3();
/* KL_EQUALITY_TESTER [INTEGER].default_create */
extern T0* T27c2();
/* LX_EQUIVALENCE_CLASSES.built */
extern T2 T83f2(T0* C);
/* LX_COMPRESSED_DFA.build_eof_rules */
extern void T44f97(T0* C, T0* a1, T4 a2, T4 a3);
/* ARRAY [LX_RULE].put */
extern void T124f7(T0* C, T0* a1, T4 a2);
/* ARRAY [LX_RULE].make */
extern T0* T124c6(T4 a1, T4 a2);
/* ARRAY [LX_RULE].make_area */
extern void T124f8(T0* C, T4 a1);
/* LX_COMPRESSED_DFA.build_rules */
extern void T44f96(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T63f6(T0* C);
/* LX_FULL_DFA.make */
extern T0* T51c49(T0* a1);
/* LX_FULL_DFA.build */
extern void T51f54(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T51f70(T0* C);
/* LX_FULL_DFA.build_nxt_table */
extern void T51f69(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T51f68(T0* C, T0* a1);
/* LX_FULL_DFA.new_state */
extern T0* T51f39(T0* C, T0* a1);
/* LX_FULL_DFA.resize */
extern void T51f78(T0* C, T4 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T51f53(T0* C);
/* LX_FULL_DFA.initialize */
extern void T51f52(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T51f67(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T51f77(T0* C, T0* a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T51f76(T0* C, T0* a1);
/* LX_FULL_DFA.build_eof_rules */
extern void T51f66(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_FULL_DFA.build_rules */
extern void T51f65(T0* C, T0* a1);
/* GELEX.parse_input_file */
extern void T18f9(T0* C);
/* KL_STANDARD_FILES.input */
extern unsigned char ge291os3689;
extern T0* ge291ov3689;
extern T0* T42f1(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T43c18();
/* KL_STDIN_FILE.make_open_stdin */
extern void T43f19(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T43f21(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T43f3(T0* C, T4 a1);
/* KL_STDIN_FILE.old_make */
extern void T43f20(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T37c7(T0* a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T36f37(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T36f40(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T36f41(T0* C, T14 a1);
/* LX_LEX_PARSER.parse_file */
extern void T35f265(T0* C, T0* a1);
/* LX_LEX_PARSER.parse */
extern void T35f269(T0* C);
/* LX_LEX_PARSER.yy_clear_all */
extern void T35f283(T0* C);
/* LX_LEX_PARSER.clear_all */
extern void T35f317(T0* C);
/* LX_LEX_PARSER.clear_stacks */
extern void T35f348(T0* C);
/* LX_LEX_PARSER.yy_clear_value_stacks */
extern void T35f355(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T84f6(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T80f6(T0* C);
/* SPECIAL [INTEGER].clear_all */
extern void T71f9(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T77f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T75f6(T0* C);
/* LX_LEX_PARSER.yy_pop_last_value */
extern void T35f282(T0* C, T4 a1);
/* LX_LEX_PARSER.yy_push_error_value */
extern void T35f281(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T76f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T75f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T75c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T76f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T175c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T76c3();
/* LX_LEX_PARSER.yy_do_action */
extern void T35f280(T0* C, T4 a1);
/* LX_DESCRIPTION.set_eiffel_code */
extern void T22f50(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_string */
extern void T35f316(T0* C, T4 a1);
/* LX_LEX_PARSER.append_character_to_string */
extern T0* T35f183(T0* C, T4 a1, T0* a2);
/* LX_LEX_PARSER.new_symbol_nfa */
extern T0* T35f257(T0* C, T4 a1);
/* LX_NFA.make_symbol */
extern T0* T82c20(T4 a1, T2 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T183c6(T4 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item */
extern T0* T70f2(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_item */
extern T0* T70f6(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].search_position */
extern void T70f42(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_item */
extern T4 T70f17(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].hash_position */
extern T4 T70f12(T0* C, T0* a1);
/* STRING.hash_code */
extern T4 T16f22(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f20(T4* C, T4 a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T2 T69f1(T0* C, T0* a1, T0* a2);
/* STRING.item_code */
extern T4 T16f16(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_item */
extern T0* T70f21(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_item */
extern T4 T70f18(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].has */
extern T2 T70f1(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_empty_string */
extern void T35f315(T0* C);
/* LX_LEX_PARSER.append_character_set_to_character_class */
extern T0* T35f182(T0* C, T4 a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.report_negative_range_in_character_class_error */
extern void T35f358(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T162c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.filename */
extern T0* T35f232(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T81f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
extern T0* T80f2(T0* C, T4 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T80c4(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T81f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T178c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T81c3();
/* LX_LEX_PARSER.append_character_to_character_class */
extern T0* T35f181(T0* C, T4 a1, T0* a2);
/* LX_LEX_PARSER.new_character_class */
extern T0* T35f180(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T79f19(T0* C, T2 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].force */
extern void T70f41(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_put */
extern void T70f49(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_put */
extern void T70f48(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_put */
extern void T70f47(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].resize */
extern void T70f46(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_resize */
extern void T70f54(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].special_integer_ */
extern T0* T70f30(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_resize */
extern void T70f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T78f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T77f3(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_resize */
extern void T70f52(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_resize */
extern void T70f51(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_modulus */
extern T4 T70f24(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_capacity */
extern T4 T70f11(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_put */
extern void T70f45(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].unset_found_item */
extern void T70f44(T0* C);
/* LX_LEX_PARSER.new_nfa_from_character_class */
extern T0* T35f179(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T79f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T79f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort */
extern void T227f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER].sort_with_comparator */
extern void T227f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER].subsort_with_comparator */
extern void T227f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T79f25(T0* C, T4 a1, T4 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge62os1871;
extern T0* ge62ov1871;
extern T0* T79f17(T0* C);
/* DS_SHELL_SORTER [INTEGER].make */
extern T0* T227c2(T0* a1);
/* LX_LEX_PARSER.process_singleton_symbol_class */
extern void T35f314(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_dot */
extern void T35f313(T0* C);
/* LX_LEX_PARSER.new_symbol_class_nfa */
extern T0* T35f178(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T82c18(T0* a1, T2 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T182c6(T0* a1, T0* a2);
/* LX_LEX_PARSER.dot_character_class */
extern T0* T35f177(T0* C);
/* LX_LEX_PARSER.process_singleton_fixed_iteration */
extern void T35f312(T0* C, T4 a1);
/* LX_LEX_PARSER.new_iteration_nfa */
extern T0* T35f176(T0* C, T0* a1, T4 a2);
/* LX_NFA.build_iteration */
extern void T82f17(T0* C, T4 a1);
/* LX_NFA.cloned_object */
extern T0* T82f6(T0* C);
/* LX_NFA.twin */
extern T0* T82f7(T0* C);
/* LX_NFA.copy */
extern void T82f21(T0* C, T0* a1);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T121f14(T0* C, T0* a1);
/* LX_NFA_STATE.cloned_object */
extern T0* T121f8(T0* C);
/* LX_NFA_STATE.twin */
extern T0* T121f11(T0* C);
/* LX_NFA_STATE.copy */
extern void T121f18(T0* C, T0* a1);
/* LX_LEX_PARSER.report_iteration_not_positive_error */
extern void T35f357(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.make */
extern T0* T161c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.process_singleton_unbounded_iteration */
extern void T35f311(T0* C, T4 a1);
/* LX_LEX_PARSER.new_unbounded_iteration_nfa */
extern T0* T35f175(T0* C, T0* a1, T4 a2);
/* LX_NFA.build_unbounded_iteration */
extern void T82f16(T0* C, T4 a1);
/* LX_LEX_PARSER.process_singleton_bounded_iteration */
extern void T35f310(T0* C, T4 a1, T4 a2);
/* LX_LEX_PARSER.new_bounded_iteration_nfa */
extern T0* T35f174(T0* C, T0* a1, T4 a2, T4 a3);
/* LX_NFA.build_bounded_iteration */
extern void T82f15(T0* C, T4 a1, T4 a2);
/* LX_LEX_PARSER.report_bad_iteration_values_error */
extern void T35f356(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.make */
extern T0* T160c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.process_singleton_optional */
extern void T35f309(T0* C);
/* LX_NFA.build_optional */
extern void T82f14(T0* C);
/* LX_NFA.final_state */
extern T0* T82f5(T0* C);
/* LX_LEX_PARSER.process_singleton_plus */
extern void T35f308(T0* C);
/* LX_NFA.build_positive_closure */
extern void T82f13(T0* C);
/* LX_LEX_PARSER.process_singleton_star */
extern void T35f307(T0* C);
/* LX_NFA.build_closure */
extern void T82f12(T0* C);
/* LX_LEX_PARSER.process_singleton_char */
extern void T35f306(T0* C, T4 a1);
/* LX_LEX_PARSER.new_nfa_from_character */
extern T0* T35f173(T0* C, T4 a1);
/* LX_LEX_PARSER.process_singleton_series */
extern void T35f305(T0* C);
/* LX_NFA.build_concatenation */
extern void T82f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T122f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T122f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T192f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T122f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T122f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T192f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T122f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T192f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T122f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T2 T192f3(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T2 T122f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T192f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T122f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T2 T192f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T2 T122f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T2 T122f20(T0* C, T0* a1);
/* DS_ARRAYED_STACK [INTEGER].force */
extern void T65f10(T0* C, T4 a1);
/* DS_ARRAYED_STACK [INTEGER].resize */
extern void T65f11(T0* C, T4 a1);
/* DS_ARRAYED_STACK [INTEGER].new_capacity */
extern T4 T65f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [INTEGER].extendible */
extern T2 T65f6(T0* C, T4 a1);
/* LX_LEX_PARSER.process_regexp_or_series */
extern void T35f304(T0* C);
/* LX_NFA.build_union */
extern void T82f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [INTEGER].remove */
extern void T65f9(T0* C);
/* DS_ARRAYED_STACK [INTEGER].item */
extern T4 T65f1(T0* C);
/* LX_LEX_PARSER.new_epsilon_nfa */
extern T0* T35f164(T0* C);
/* LX_LEX_PARSER.report_trailing_context_used_twice_error */
extern void T35f303(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.make */
extern T0* T93c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.append_eol_to_regexp */
extern T0* T35f163(T0* C, T0* a1);
/* LX_LEX_PARSER.append_trail_context_to_regexp */
extern T0* T35f157(T0* C, T0* a1, T0* a2);
/* LX_NFA.set_accepted_rule */
extern void T82f19(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T121f16(T0* C, T0* a1);
/* LX_NFA.set_beginning_as_normal */
extern void T82f23(T0* C);
/* LX_NFA_STATE.set_beginning_as_normal */
extern void T121f17(T0* C);
/* LX_LEX_PARSER.report_unrecognized_rule_error */
extern void T35f302(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T92c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.process_eof_rule */
extern void T35f301(T0* C);
/* LX_LEX_PARSER.build_eof_action */
extern void T35f347(T0* C, T0* a1);
/* LX_RULE.set_line_nb */
extern void T46f17(T0* C, T4 a1);
/* LX_RULE.set_pattern */
extern void T46f16(T0* C, T0* a1);
/* LX_LEX_PARSER.eof_nfa */
extern unsigned char ge108os2269;
extern T0* ge108ov2269;
extern T0* T35f253(T0* C);
/* LX_START_CONDITION.set_has_eof */
extern void T90f8(T0* C, T2 a1);
/* LX_LEX_PARSER.report_multiple_eof_rules_error */
extern void T35f354(T0* C, T0* a1);
/* LX_MULTIPLE_EOF_RULES_ERROR.make */
extern T0* T115c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.report_all_start_conditions_eof_warning */
extern void T35f346(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.make */
extern T0* T111c7(T0* a1, T4 a2);
/* LX_START_CONDITIONS.append_non_eof_start_conditions */
extern void T63f26(T0* C, T0* a1);
/* LX_START_CONDITIONS.force_last */
extern void T63f31(T0* C, T0* a1);
/* LX_START_CONDITIONS.resize */
extern void T63f33(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].resize */
extern T0* T171f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [LX_START_CONDITION].resized_area */
extern T0* T170f3(T0* C, T4 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T170c4(T4 a1);
/* LX_START_CONDITIONS.new_capacity */
extern T4 T63f15(T0* C, T4 a1);
/* LX_START_CONDITIONS.extendible */
extern T2 T63f14(T0* C, T4 a1);
/* LX_START_CONDITIONS.is_empty */
extern T2 T63f4(T0* C);
/* LX_LEX_PARSER.process_rule */
extern void T35f300(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T63f21(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T90f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T154f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T154f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T4 T154f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T2 T154f8(T0* C, T4 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T63f25(T0* C, T0* a1);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T22f58(T0* C, T2 a1);
/* LX_RULE.set_column_count */
extern void T46f22(T0* C, T4 a1);
/* LX_RULE.set_line_count */
extern void T46f21(T0* C, T4 a1);
/* LX_RULE.set_trail_count */
extern void T46f20(T0* C, T4 a1);
/* LX_RULE.set_head_count */
extern void T46f19(T0* C, T4 a1);
/* LX_RULE.set_trail_context */
extern void T46f18(T0* C, T2 a1);
/* LX_LEX_PARSER.process_bol_rule */
extern void T35f299(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_bol_nfa_to_all */
extern void T63f24(T0* C, T0* a1);
/* LX_START_CONDITION.put_bol_nfa */
extern void T90f10(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_bol_nfa_to_non_exclusive */
extern void T63f23(T0* C, T0* a1);
/* LX_DESCRIPTION.set_bol_needed */
extern void T22f59(T0* C, T2 a1);
/* LX_LEX_PARSER.report_bad_start_condition_list_error */
extern void T35f298(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.make */
extern T0* T91c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.push_start_condition */
extern void T35f297(T0* C, T0* a1, T0* a2);
/* LX_LEX_PARSER.report_undeclared_start_condition_error */
extern void T35f345(T0* C, T0* a1);
/* LX_UNDECLARED_START_CONDITION_ERROR.make */
extern T0* T110c7(T0* a1, T4 a2, T0* a3);
/* LX_START_CONDITIONS.put_last */
extern void T63f22(T0* C, T0* a1);
/* LX_START_CONDITIONS.start_condition */
extern T0* T63f3(T0* C, T0* a1);
/* STRING.is_equal */
extern T2 T16f8(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f19(T0* C, T0* a1, T0* a2, T4 a3);
/* STRING.as_lower */
extern T0* T16f12(T0* C);
/* STRING.to_lower */
extern void T16f33(T0* C);
/* CHARACTER.lower */
extern T1 T1f6(T1* C);
/* CHARACTER.is_upper */
extern T2 T1f7(T1* C);
/* NATURAL_8.infix ">" */
extern T2 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER.character_types */
extern T8 T1f8(T1* C, T4 a1);
/* CHARACTER.internal_character_types */
extern unsigned char ge35os35;
extern T0* ge35ov35;
extern T0* T1f10(T1* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T226c2(T4 a1);
/* LX_LEX_PARSER.report_start_condition_specified_twice_warning */
extern void T35f344(T0* C, T0* a1);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.make */
extern T0* T109c7(T0* a1, T4 a2, T0* a3);
/* LX_START_CONDITIONS.has_start_condition */
extern T2 T63f2(T0* C, T0* a1);
/* LX_START_CONDITIONS.append_start_conditions */
extern void T63f20(T0* C, T0* a1);
/* LX_START_CONDITIONS.has */
extern T2 T63f12(T0* C, T0* a1);
/* LX_LEX_PARSER.set_action */
extern void T35f296(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].wipe_out */
extern void T45f17(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].clear_items */
extern void T45f22(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_all_cursors_after */
extern void T45f21(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_next_cursor */
extern void T157f6(T0* C, T0* a1);
/* LX_RULE.set_action */
extern void T46f23(T0* C, T0* a1);
/* LX_ACTION_FACTORY.new_action */
extern T0* T64f1(T0* C, T0* a1);
/* LX_START_CONDITIONS.keep_first */
extern void T63f19(T0* C, T4 a1);
/* LX_START_CONDITIONS.clear_items */
extern void T63f30(T0* C, T4 a1, T4 a2);
/* LX_START_CONDITIONS.move_all_cursors_after */
extern void T63f29(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_next_cursor */
extern void T172f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T172f5(T0* C, T4 a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T22f49(T0* C);
/* LX_LEX_PARSER.override_options */
extern void T35f295(T0* C);
/* GELEX.override_description */
extern void T18f13(T0* C, T0* a1);
/* LX_LEX_PARSER.check_options */
extern void T35f294(T0* C);
/* LX_LEX_PARSER.report_full_and_variable_trailing_context_error */
extern void T35f343(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T108c7();
/* LX_LEX_PARSER.report_full_and_reject_error */
extern void T35f342(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T107c7();
/* LX_LEX_PARSER.report_full_and_meta_equiv_classes_error */
extern void T35f341(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T106c7();
/* LX_LEX_PARSER.build_equiv_classes */
extern void T35f293(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].forth */
extern void T87f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_forth */
extern void T70f60(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].add_traversing_cursor */
extern void T70f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_next_cursor */
extern void T87f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].remove_traversing_cursor */
extern void T70f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_position */
extern void T87f9(T0* C, T4 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T79f23(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].item */
extern T0* T87f2(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_item */
extern T0* T70f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].after */
extern T2 T87f1(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_after */
extern T2 T70f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].start */
extern void T87f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_start */
extern void T70f59(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_off */
extern T2 T70f38(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].is_empty */
extern T2 T70f37(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_cursor */
extern T0* T70f3(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].make */
extern T0* T87c6(T0* a1);
/* LX_LEX_PARSER.process_default_rule */
extern void T35f292(T0* C);
/* LX_LEX_PARSER.yy_push_last_value */
extern void T35f279(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T78f1(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T176c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T78c3();
/* LX_LEX_PARSER.accept */
extern void T35f278(T0* C);
/* LX_LEX_PARSER.abort */
extern void T35f277(T0* C);
/* LX_LEX_PARSER.yy_do_error_action */
extern void T35f276(T0* C, T4 a1);
/* LX_LEX_PARSER.report_error */
extern void T35f291(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T86c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.report_eof_expected_error */
extern void T35f290(T0* C);
/* LX_LEX_PARSER.read_token */
extern void T35f275(T0* C);
/* LX_LEX_PARSER.yy_execute_action */
extern void T35f289(T0* C, T4 a1);
/* LX_LEX_PARSER.yy_set_beginning_of_line */
extern void T35f340(T0* C);
/* YY_BUFFER.set_beginning_of_line */
extern void T67f17(T0* C, T2 a1);
/* YY_FILE_BUFFER.set_beginning_of_line */
extern void T66f20(T0* C, T2 a1);
/* LX_LEX_PARSER.report_bad_character_error */
extern void T35f339(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T105c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.process_escaped_character */
extern void T35f338(T0* C);
/* LX_LEX_PARSER.report_missing_bracket_error */
extern void T35f337(T0* C);
/* LX_MISSING_BRACKET_ERROR.make */
extern T0* T104c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.report_bad_character_in_brackets_error */
extern void T35f336(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.make */
extern T0* T103c7(T0* a1, T4 a2);
/* STRING.to_integer */
extern T4 T16f10(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T213f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T213f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T213f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T213f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T228f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T231f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge525os6356;
extern T0* ge525ov6356;
extern T0* T213f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T228c13();
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
extern void T231f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T231c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T231f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T230c2(T4 a1);
/* STRING.has */
extern T2 T16f24(T0* C, T1 a1);
/* CHARACTER.is_digit */
extern T2 T1f18(T1* C);
/* INTEGER.to_natural_64 */
extern T11 T4f21(T4* C);
/* STRING.item */
extern T1 T16f7(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T213f21(T0* C, T4 a1);
/* STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T16f21(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T213f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T213f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T213f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c37(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T213f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T213c15();
/* LX_LEX_PARSER.report_bad_start_condition_error */
extern void T35f335(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_ERROR.make */
extern T0* T102c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.process_character */
extern void T35f334(T0* C, T4 a1);
/* LX_LEX_PARSER.report_character_out_of_range_error */
extern void T35f353(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T114c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.text_item */
extern T1 T35f216(T0* C, T4 a1);
/* LX_LEX_PARSER.report_bad_character_class_error */
extern void T35f333(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T101c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.report_undefined_definition_error */
extern void T35f332(T0* C, T0* a1);
/* LX_UNDEFINED_DEFINITION_ERROR.make */
extern T0* T100c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.put_back_string */
extern void T35f331(T0* C, T0* a1);
/* LX_LEX_PARSER.unread_character */
extern void T35f352(T0* C, T1 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T216f9(T0* C, T1 a1, T4 a2);
/* STRING.put */
extern void T16f38(T0* C, T1 a1, T4 a2);
/* LX_LEX_PARSER.yy_set_content */
extern void T35f285(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T4 T216f4(T0* C);
/* YY_BUFFER.compact_right */
extern void T67f18(T0* C);
/* KL_CHARACTER_BUFFER.move_right */
extern void T216f10(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.subcopy */
extern void T16f39(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_BUFFER.resize */
extern void T67f20(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T216f12(T0* C, T4 a1);
/* STRING.set_count */
extern void T16f35(T0* C, T4 a1);
/* YY_BUFFER.default_capacity */
extern unsigned char ge133os5154;
extern T4 ge133ov5154;
extern T4 T67f12(T0* C);
/* YY_FILE_BUFFER.compact_right */
extern void T66f21(T0* C);
/* YY_FILE_BUFFER.resize */
extern void T66f24(T0* C);
/* YY_FILE_BUFFER.default_capacity */
extern T4 T66f10(T0* C);
/* YY_BUFFER.set_index */
extern void T67f14(T0* C, T4 a1);
/* YY_FILE_BUFFER.set_index */
extern void T66f17(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].item */
extern T0* T68f2(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].items_item */
extern T0* T68f5(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T68f37(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T4 T68f16(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T4 T68f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].keys_item */
extern T0* T68f20(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T4 T68f17(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T2 T68f1(T0* C, T0* a1);
/* LX_LEX_PARSER.less */
extern void T35f330(T0* C, T4 a1);
/* LX_LEX_PARSER.yy_set_line_column */
extern void T35f351(T0* C);
/* LX_LEX_PARSER.report_incomplete_name_definition_error */
extern void T35f329(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.make */
extern T0* T99c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.process_name_definition */
extern void T35f328(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force */
extern void T68f36(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].keys_put */
extern void T68f44(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T68f43(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T68f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T68f41(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T68f49(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern T0* T68f30(T0* C);
/* DS_HASH_TABLE [STRING, STRING].keys_resize */
extern void T68f48(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_resize */
extern void T68f47(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T68f46(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T4 T68f23(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T4 T68f10(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_put */
extern void T68f40(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T68f39(T0* C);
/* STRING.substring */
extern T0* T16f9(T0* C, T4 a1, T4 a2);
/* STRING.new_string */
extern T0* T16f20(T0* C, T4 a1);
/* LX_LEX_PARSER.report_name_defined_twice_error */
extern void T35f350(T0* C, T0* a1);
/* LX_NAME_DEFINED_TWICE_ERROR.make */
extern T0* T113c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.report_missing_quote_error */
extern void T35f327(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T98c7(T0* a1, T4 a2);
/* LX_DESCRIPTION.set_output_filename */
extern void T22f36(T0* C, T0* a1);
/* LX_LEX_PARSER.report_unrecognized_option_error */
extern void T35f326(T0* C, T0* a1);
/* LX_UNRECOGNIZED_OPTION_ERROR.make */
extern T0* T97c7(T0* a1, T4 a2, T0* a3);
/* LX_DESCRIPTION.set_no_warning */
extern void T22f45(T0* C, T2 a1);
/* LX_DESCRIPTION.set_post_eof_action_used */
extern void T22f57(T0* C, T2 a1);
/* LX_DESCRIPTION.set_pre_eof_action_used */
extern void T22f56(T0* C, T2 a1);
/* LX_DESCRIPTION.set_post_action_used */
extern void T22f55(T0* C, T2 a1);
/* LX_DESCRIPTION.set_pre_action_used */
extern void T22f54(T0* C, T2 a1);
/* LX_DESCRIPTION.set_position_used */
extern void T22f53(T0* C, T2 a1);
/* LX_DESCRIPTION.set_line_used */
extern void T22f52(T0* C, T2 a1);
/* LX_DESCRIPTION.set_reject_used */
extern void T22f51(T0* C, T2 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T22f40(T0* C, T2 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T22f41(T0* C, T2 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T22f39(T0* C, T2 a1);
/* LX_DESCRIPTION.set_no_default_rule */
extern void T22f44(T0* C, T2 a1);
/* LX_DESCRIPTION.set_debug_mode */
extern void T22f42(T0* C, T2 a1);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T22f43(T0* C, T2 a1);
/* LX_DESCRIPTION.set_backing_up_report */
extern void T22f38(T0* C, T2 a1);
/* LX_LEX_PARSER.report_start_condition_expected_error */
extern void T35f325(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.make */
extern T0* T96c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.add_new_start_condition */
extern void T35f324(T0* C, T0* a1, T2 a2);
/* LX_START_CONDITIONS.force_new_start_condition */
extern void T63f27(T0* C, T0* a1, T2 a2);
/* LX_START_CONDITION.make */
extern T0* T90c7(T0* a1, T4 a2, T2 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T154c10(T4 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T154f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T210c2(T0* a1);
/* LX_LEX_PARSER.report_start_condition_declared_twice_error */
extern void T35f349(T0* C, T0* a1);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.make */
extern T0* T112c7(T0* a1, T4 a2, T0* a3);
/* LX_LEX_PARSER.start_condition */
extern T4 T35f198(T0* C);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T62f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T62f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T4 T62f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T2 T62f8(T0* C, T4 a1);
/* STRING.occurrences */
extern T4 T16f11(T0* C, T1 a1);
/* LX_LEX_PARSER.text_substring */
extern T0* T35f196(T0* C, T4 a1, T4 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T216f2(T0* C, T4 a1, T4 a2);
/* LX_LEX_PARSER.text_count */
extern T4 T35f195(T0* C);
/* LX_LEX_PARSER.more */
extern void T35f323(T0* C);
/* LX_LEX_PARSER.report_directive_expected_error */
extern void T35f322(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.make */
extern T0* T95c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.report_unrecognized_directive_error */
extern void T35f321(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.make */
extern T0* T94c7(T0* a1, T4 a2);
/* LX_LEX_PARSER.text */
extern T0* T35f190(T0* C);
/* LX_LEX_PARSER.set_start_condition */
extern void T35f320(T0* C, T4 a1);
/* LX_LEX_PARSER.yy_execute_eof_action */
extern void T35f288(T0* C, T4 a1);
/* LX_LEX_PARSER.terminate */
extern void T35f319(T0* C);
/* LX_LEX_PARSER.wrap */
extern T2 T35f130(T0* C);
/* LX_LEX_PARSER.yy_refill_input_buffer */
extern void T35f287(T0* C);
/* YY_BUFFER.fill */
extern void T67f16(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T66f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T216f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.read_to_string */
extern T4 T43f13(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T4 T43f16(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.file_gss */
extern T4 T43f17(T0* C, T14 a1, T14 a2, T4 a3);
/* SPECIAL [CHARACTER].item_address */
extern T14 T15f5(T0* C, T4 a1);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T220f2(T220* C);
/* KL_STDIN_FILE.any_ */
extern T0* T43f14(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T2 T43f10(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T2 T43f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T36f29(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge373os2918;
extern T0* ge373ov2918;
extern T0* T36f33(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T216c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge379os3708;
extern T2 ge379ov3708;
extern T2 T229f1(T0* C);
/* PLATFORM.default_create */
extern T0* T232c2();
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge309os2956;
extern T0* ge309ov2956;
extern T0* T216f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T229c2();
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T36f32(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T36f34(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T36f30(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T36f26(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T36f28(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T36f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T43f22(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T43f23(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T1 T43f11(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T36f43(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T36f44(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T36f27(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T66f23(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T216f11(T0* C, T4 a1, T4 a2, T4 a3);
/* LX_LEX_PARSER.yy_null_trans_state */
extern T4 T35f129(T0* C, T4 a1);
/* LX_LEX_PARSER.yy_previous_state */
extern T4 T35f128(T0* C);
/* LX_LEX_PARSER.fatal_error */
extern void T35f286(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T61f12(T0* C, T1 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T61f16(T0* C, T1 a1);
/* KL_STDERR_FILE.console_pc */
extern void T61f20(T0* C, T14 a1, T1 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge291os3691;
extern T0* ge291ov3691;
extern T0* T42f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T61c9();
/* KL_STDERR_FILE.make_open_stderr */
extern void T61f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T61f18(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T61f3(T0* C, T4 a1);
/* KL_STDERR_FILE.old_make */
extern void T61f17(T0* C, T0* a1);
/* LX_LEX_PARSER.std */
extern T0* T35f184(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T1 T216f1(T0* C, T4 a1);
/* LX_LEX_PARSER.special_integer_ */
extern T0* T35f26(T0* C);
/* LX_LEX_PARSER.yy_init_value_stacks */
extern void T35f274(T0* C);
/* LX_LEX_PARSER.set_input_buffer */
extern void T35f268(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_load_input_buffer */
extern void T35f273(T0* C);
/* YY_BUFFER.set_position */
extern void T67f15(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_position */
extern void T66f18(T0* C, T4 a1, T4 a2, T4 a3);
/* LX_LEX_PARSER.new_file_buffer */
extern T0* T35f15(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T66c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T66f22(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T66f25(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T66f26(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T66f15(T0* C, T4 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T36f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T36f2(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T36f36(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T36f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T36f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T36f39(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T36f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T36f39p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T36f20(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T36f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T163f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T163f2(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge505os3149;
extern T0* ge505ov3149;
extern T0* T36f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T163c6();
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T163f8(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T163f3(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T36f42(T0* C);
/* UNIX_FILE_INFO.update */
extern void T163f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T163f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T36f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T36f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T36c35(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T36f38(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T36f8(T0* C);
/* LX_LEX_PARSER.set_options_overrider */
extern void T35f264(T0* C, T0* a1);
/* LX_LEX_PARSER.make_from_description */
extern T0* T35c263(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER].make */
extern T0* T65c8(T4 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T64c2();
/* LX_START_CONDITIONS.make */
extern void T63f18(T0* C, T4 a1);
/* LX_START_CONDITIONS.make */
extern T0* T63c18(T4 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T63f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T172c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T171f1(T0* C, T4 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T221c2(T4 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T171c3();
/* LX_LEX_PARSER.make_parser_skeleton */
extern void T35f267(T0* C);
/* LX_LEX_PARSER.yy_build_parser_tables */
extern void T35f272(T0* C);
/* LX_LEX_PARSER.yycheck_template */
extern unsigned char ge107os2151;
extern T0* ge107ov2151;
extern T0* T35f82(T0* C);
/* LX_LEX_PARSER.yyfixed_array */
extern T0* T35f255(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T72f3(T0* C, T0* a1);
/* LX_LEX_PARSER.yytable_template */
extern unsigned char ge107os2150;
extern T0* ge107ov2150;
extern T0* T35f81(T0* C);
/* LX_LEX_PARSER.yypgoto_template */
extern unsigned char ge107os2149;
extern T0* ge107ov2149;
extern T0* T35f80(T0* C);
/* LX_LEX_PARSER.yypact_template */
extern unsigned char ge107os2148;
extern T0* ge107ov2148;
extern T0* T35f79(T0* C);
/* LX_LEX_PARSER.yydefgoto_template */
extern unsigned char ge107os2147;
extern T0* ge107ov2147;
extern T0* T35f78(T0* C);
/* LX_LEX_PARSER.yydefact_template */
extern unsigned char ge107os2146;
extern T0* ge107ov2146;
extern T0* T35f77(T0* C);
/* LX_LEX_PARSER.yytypes2_template */
extern unsigned char ge107os2145;
extern T0* ge107ov2145;
extern T0* T35f76(T0* C);
/* LX_LEX_PARSER.yytypes1_template */
extern unsigned char ge107os2144;
extern T0* ge107ov2144;
extern T0* T35f74(T0* C);
/* LX_LEX_PARSER.yyr1_template */
extern unsigned char ge107os2143;
extern T0* ge107ov2143;
extern T0* T35f72(T0* C);
/* LX_LEX_PARSER.yytranslate_template */
extern unsigned char ge107os2142;
extern T0* ge107ov2142;
extern T0* T35f71(T0* C);
/* LX_LEX_PARSER.yy_create_value_stacks */
extern void T35f271(T0* C);
/* LX_LEX_PARSER.make_lex_scanner_from_description */
extern void T35f266(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].set_key_equality_tester */
extern void T70f40(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_map */
extern T0* T70c39(T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_with_equality_testers */
extern void T70f43(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_sparse_container */
extern void T70f50(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_slots */
extern void T70f58(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_clashes */
extern void T70f57(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_keys */
extern void T70f56(T0* C, T4 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_items */
extern void T70f55(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].set_key_equality_tester */
extern void T68f35(T0* C, T0* a1);
/* LX_LEX_PARSER.string_equality_tester */
extern unsigned char ge260os2652;
extern T0* ge260ov2652;
extern T0* T35f21(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T69c2();
/* DS_HASH_TABLE [STRING, STRING].make_map */
extern T0* T68c34(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T68f38(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T68f45(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T68f29(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T173c3(T0* a1);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T68f53(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T68f52(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_keys */
extern void T68f51(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_items */
extern void T68f50(T0* C, T4 a1);
/* LX_LEX_PARSER.make_with_buffer */
extern void T35f270(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_initialize */
extern void T35f284(T0* C);
/* LX_LEX_PARSER.yy_build_tables */
extern void T35f318(T0* C);
/* LX_LEX_PARSER.yy_accept_template */
extern unsigned char ge109os2664;
extern T0* ge109ov2664;
extern T0* T35f242(T0* C);
/* LX_LEX_PARSER.yy_fixed_array */
extern T0* T35f262(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_meta_template */
extern unsigned char ge109os2663;
extern T0* ge109ov2663;
extern T0* T35f241(T0* C);
/* LX_LEX_PARSER.yy_ec_template */
extern unsigned char ge109os2662;
extern T0* ge109ov2662;
extern T0* T35f240(T0* C);
/* LX_LEX_PARSER.yy_def_template */
extern unsigned char ge109os2661;
extern T0* ge109ov2661;
extern T0* T35f239(T0* C);
/* LX_LEX_PARSER.yy_base_template */
extern unsigned char ge109os2660;
extern T0* ge109ov2660;
extern T0* T35f238(T0* C);
/* LX_LEX_PARSER.yy_chk_template */
extern unsigned char ge109os2659;
extern T0* ge109ov2659;
extern T0* T35f237(T0* C);
/* LX_LEX_PARSER.yy_nxt_template */
extern unsigned char ge109os2658;
extern T0* ge109ov2658;
extern T0* T35f236(T0* C);
/* LX_LEX_PARSER.empty_buffer */
extern unsigned char ge138os2535;
extern T0* ge138ov2535;
extern T0* T35f17(T0* C);
/* YY_BUFFER.make */
extern T0* T67c13(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T67f19(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T216f13(T0* C, T0* a1, T4 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T67f9(T0* C, T4 a1);
/* GELEX_COMMAND_LINE.read_options */
extern void T19f8(T0* C, T0* a1);
/* LX_DESCRIPTION.set_input_filename */
extern void T22f48(T0* C, T0* a1);
/* GELEX_COMMAND_LINE.report_unknown_flag_error */
extern void T19f13(T0* C, T0* a1);
/* GELEX_COMMAND_LINE.exceptions */
extern T0* T19f5(T0* C);
/* UT_UNKNOWN_FLAG_ERROR.make */
extern T0* T60c7(T0* a1);
/* CHARACTER.out */
extern T0* T1f1(T1* C);
/* LX_DESCRIPTION.set_inspect_used */
extern void T22f47(T0* C, T2 a1);
/* LX_DESCRIPTION.set_actions_separated */
extern void T22f46(T0* C, T2 a1);
/* GELEX_COMMAND_LINE.report_separated_flag_error */
extern void T19f12(T0* C, T0* a1);
/* UT_SEPARATED_FLAG_ERROR.make */
extern T0* T59c7(T0* a1);
/* LX_DESCRIPTION.set_array_size */
extern void T22f37(T0* C, T4 a1);
/* KL_STRING_ROUTINES.is_integer */
extern T2 T56f1(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f5(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f4(T1* C, T1 a1);
/* GELEX_COMMAND_LINE.string_ */
extern T0* T19f3(T0* C);
/* GELEX_COMMAND_LINE.report_usage_error */
extern void T19f11(T0* C);
/* GELEX_COMMAND_LINE.usage_message */
extern unsigned char ge53os1312;
extern T0* ge53ov1312;
extern T0* T19f6(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T58c7(T0* a1);
/* LX_DESCRIPTION.set_line_pragma */
extern void T22f35(T0* C, T2 a1);
/* GELEX_COMMAND_LINE.report_usage_message */
extern void T19f10(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T21f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T21f12(T0* C, T0* a1);
/* GELEX_COMMAND_LINE.report_version_number */
extern void T19f9(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T57c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T20f2(T0* C, T4 a1);
/* GELEX_COMMAND_LINE.arguments */
extern unsigned char ge305os1302;
extern T0* ge305ov1302;
extern T0* T19f2(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T20c4();
/* GELEX_COMMAND_LINE.make */
extern T0* T19c7(T0* a1);
/* LX_DESCRIPTION.make */
extern T0* T22c34();
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T63c17(T4 a1);
/* LX_START_CONDITIONS.put_first */
extern void T63f28(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T63f32(T0* C, T0* a1, T4 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T63f35(T0* C, T4 a1, T4 a2);
/* LX_START_CONDITIONS.move_right */
extern void T63f34(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T62c10(T4 a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T62f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T169c2(T0* a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T21c6();
/* UT_ERROR_HANDLER.std */
extern T0* T21f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T20f5(T0* C, T0* a1);
/* GELEX.arguments */
extern T0* T18f1(T0* C);
/* GELEX.resurrect_code */
extern void T18f8(T0* C);
/* KL_EQUALITY_TESTER [LX_SYMBOL_CLASS].default_create */
extern T0* T34c1();
/* KL_EQUALITY_TESTER [LX_SINGLETON].default_create */
extern T0* T33c1();
/* KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]].default_create */
extern T0* T32c1();
/* KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
extern T0* T31c1();
/* KL_EQUALITY_TESTER [LX_PROTO].default_create */
extern T0* T30c1();
/* KL_EQUALITY_TESTER [LX_NFA].default_create */
extern T0* T29c1();
/* KL_EQUALITY_TESTER [STRING].default_create */
extern T0* T28c1();
/* KL_EQUALITY_TESTER [LX_RULE].default_create */
extern T0* T26c1();
/* KL_EQUALITY_TESTER [LX_START_CONDITION].default_create */
extern T0* T25c1();
/* KL_EQUALITY_TESTER [LX_NFA_STATE].default_create */
extern T0* T24c1();
/* KL_EQUALITY_TESTER [LX_DFA_STATE].default_create */
extern T0* T23c1();
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].set_target */
extern void T183f7(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].set_target */
extern void T182f7(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].set_target */
extern void T179f6(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T183f8(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T135f12(T0* C, T4 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T135f12p1(T0* C, T4 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T182f8(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T135f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T135f11p1(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T179f7(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T183f3(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].twin */
extern T0* T183f5(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].copy */
extern void T183f9(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T182f3(T0* C);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].twin */
extern T0* T182f5(T0* C);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].copy */
extern void T182f9(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T179f2(T0* C);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].twin */
extern T0* T179f4(T0* C);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].copy */
extern void T179f8(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T183f4(T0* C, T4 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T182f4(T0* C, T4 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T2 T179f3(T0* C, T4 a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T162f1(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T162f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T162f6(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T56f5(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.concat */
extern T0* T56f9(T0* C, T0* a1, T0* a2);
/* STRING.infix "+" */
extern T0* T16f15(T0* C, T0* a1);
/* ARRAY [STRING].valid_index */
extern T2 T119f4(T0* C, T4 a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T56f11(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T56f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T56f3(T0* C, T0* a1, T4 a2);
/* STRING.wipe_out */
extern void T16f32(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T162f4(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.default_message */
extern T0* T161f1(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.message */
extern T0* T161f3(T0* C, T0* a1);
/* LX_ITERATION_NOT_POSITIVE_ERROR.arguments */
extern T0* T161f6(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.string_ */
extern T0* T161f4(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.default_message */
extern T0* T160f1(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.message */
extern T0* T160f3(T0* C, T0* a1);
/* LX_BAD_ITERATION_VALUES_ERROR.arguments */
extern T0* T160f6(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.string_ */
extern T0* T160f4(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.default_message */
extern T0* T115f1(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.message */
extern T0* T115f3(T0* C, T0* a1);
/* LX_MULTIPLE_EOF_RULES_ERROR.arguments */
extern T0* T115f6(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.string_ */
extern T0* T115f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T114f1(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T114f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T114f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T114f4(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.default_message */
extern T0* T113f1(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.message */
extern T0* T113f3(T0* C, T0* a1);
/* LX_NAME_DEFINED_TWICE_ERROR.arguments */
extern T0* T113f6(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.string_ */
extern T0* T113f4(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.default_message */
extern T0* T112f1(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.message */
extern T0* T112f3(T0* C, T0* a1);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.arguments */
extern T0* T112f6(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.string_ */
extern T0* T112f4(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.default_message */
extern T0* T111f1(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.message */
extern T0* T111f3(T0* C, T0* a1);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.arguments */
extern T0* T111f6(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.string_ */
extern T0* T111f4(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.default_message */
extern T0* T110f1(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.message */
extern T0* T110f3(T0* C, T0* a1);
/* LX_UNDECLARED_START_CONDITION_ERROR.arguments */
extern T0* T110f6(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.string_ */
extern T0* T110f4(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.default_message */
extern T0* T109f1(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.message */
extern T0* T109f3(T0* C, T0* a1);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.arguments */
extern T0* T109f6(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.string_ */
extern T0* T109f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T108f1(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T108f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T108f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T108f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T107f1(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T107f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T107f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T107f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T106f1(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T106f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T106f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T106f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T105f1(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T105f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T105f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T105f4(T0* C);
/* LX_MISSING_BRACKET_ERROR.default_message */
extern T0* T104f1(T0* C);
/* LX_MISSING_BRACKET_ERROR.message */
extern T0* T104f3(T0* C, T0* a1);
/* LX_MISSING_BRACKET_ERROR.arguments */
extern T0* T104f6(T0* C);
/* LX_MISSING_BRACKET_ERROR.string_ */
extern T0* T104f4(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.default_message */
extern T0* T103f1(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.message */
extern T0* T103f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.arguments */
extern T0* T103f6(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.string_ */
extern T0* T103f4(T0* C);
/* LX_BAD_START_CONDITION_ERROR.default_message */
extern T0* T102f1(T0* C);
/* LX_BAD_START_CONDITION_ERROR.message */
extern T0* T102f3(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_ERROR.arguments */
extern T0* T102f6(T0* C);
/* LX_BAD_START_CONDITION_ERROR.string_ */
extern T0* T102f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T101f1(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T101f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T101f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T101f4(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.default_message */
extern T0* T100f1(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.message */
extern T0* T100f3(T0* C, T0* a1);
/* LX_UNDEFINED_DEFINITION_ERROR.arguments */
extern T0* T100f6(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.string_ */
extern T0* T100f4(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.default_message */
extern T0* T99f1(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.message */
extern T0* T99f3(T0* C, T0* a1);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.arguments */
extern T0* T99f6(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.string_ */
extern T0* T99f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T98f1(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T98f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T98f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T98f4(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.default_message */
extern T0* T97f1(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.message */
extern T0* T97f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_OPTION_ERROR.arguments */
extern T0* T97f6(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.string_ */
extern T0* T97f4(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.default_message */
extern T0* T96f1(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.message */
extern T0* T96f3(T0* C, T0* a1);
/* LX_START_CONDITION_EXPECTED_ERROR.arguments */
extern T0* T96f6(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.string_ */
extern T0* T96f4(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.default_message */
extern T0* T95f1(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.message */
extern T0* T95f3(T0* C, T0* a1);
/* LX_DIRECTIVE_EXPECTED_ERROR.arguments */
extern T0* T95f6(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.string_ */
extern T0* T95f4(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.default_message */
extern T0* T94f1(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.message */
extern T0* T94f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.arguments */
extern T0* T94f6(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.string_ */
extern T0* T94f4(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.default_message */
extern T0* T93f1(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.message */
extern T0* T93f3(T0* C, T0* a1);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.arguments */
extern T0* T93f6(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.string_ */
extern T0* T93f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T92f1(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T92f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T92f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T92f4(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.default_message */
extern T0* T91f1(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.message */
extern T0* T91f3(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_LIST_ERROR.arguments */
extern T0* T91f6(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.string_ */
extern T0* T91f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T86f1(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T86f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T86f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T86f4(T0* C);
/* UT_UNKNOWN_FLAG_ERROR.default_message */
extern T0* T60f1(T0* C);
/* UT_UNKNOWN_FLAG_ERROR.message */
extern T0* T60f3(T0* C, T0* a1);
/* UT_UNKNOWN_FLAG_ERROR.arguments */
extern T0* T60f6(T0* C);
/* UT_UNKNOWN_FLAG_ERROR.string_ */
extern T0* T60f4(T0* C);
/* UT_SEPARATED_FLAG_ERROR.default_message */
extern T0* T59f1(T0* C);
/* UT_SEPARATED_FLAG_ERROR.message */
extern T0* T59f3(T0* C, T0* a1);
/* UT_SEPARATED_FLAG_ERROR.arguments */
extern T0* T59f6(T0* C);
/* UT_SEPARATED_FLAG_ERROR.string_ */
extern T0* T59f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T58f1(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T58f3(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T58f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T58f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T57f1(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T57f3(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T57f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T57f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T53f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T53f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T53f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T53f5(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.default_message */
extern T0* T49f2(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.message */
extern T0* T49f4(T0* C, T0* a1);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.arguments */
extern T0* T49f6(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.string_ */
extern T0* T49f5(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.default_message */
extern T0* T48f2(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.message */
extern T0* T48f4(T0* C, T0* a1);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.arguments */
extern T0* T48f6(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.string_ */
extern T0* T48f5(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T47f2(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.message */
extern T0* T47f4(T0* C, T0* a1);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T47f6(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T47f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T37f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T37f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T37f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T37f5(T0* C);
extern T0* gema130(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge385ov4446;
extern T0* ge389ov4845;
extern T0* ge387ov4446;
extern T0* ge392ov4446;
extern T0* ge362ov2937;
extern T0* ge218ov5893;
extern T0* ge218ov5894;
extern T0* ge102ov4063;
extern T0* ge217ov5906;
extern T0* ge217ov5905;
extern T0* ge217ov5904;
extern T0* ge217ov5903;
extern T0* ge102ov4065;
extern T0* ge386ov3705;
extern T0* ge373ov2917;
extern T0* ge302ov1313;
extern T0* ge87ov3637;
extern T0* ge82ov3637;
extern T0* ge71ov3637;
extern T0* ge85ov3637;
extern T0* ge74ov3637;
extern T0* ge86ov3637;
extern T0* ge89ov3637;
extern T0* ge67ov3637;
extern T0* ge93ov3637;
extern T0* ge91ov3637;
extern T0* ge80ov3637;
extern T0* ge79ov3637;
extern T0* ge78ov3637;
extern T0* ge69ov3637;
extern T0* ge83ov3637;
extern T0* ge70ov3637;
extern T0* ge72ov3637;
extern T0* ge68ov3637;
extern T0* ge94ov3637;
extern T0* ge81ov3637;
extern T0* ge84ov3637;
extern T0* ge96ov3637;
extern T0* ge90ov3637;
extern T0* ge77ov3637;
extern T0* ge95ov3637;
extern T0* ge92ov3637;
extern T0* ge97ov3637;
extern T0* ge73ov3637;
extern T0* ge212ov3637;
extern T0* ge214ov3637;
extern T0* ge211ov3637;
extern T0* ge215ov3637;
extern T0* ge216ov3637;
extern T0* ge207ov3637;
extern T0* ge76ov3637;
extern T0* ge88ov3637;
extern T0* ge75ov3637;
extern T0* ge206ov3637;
extern EIF_TYPE getypes[];

