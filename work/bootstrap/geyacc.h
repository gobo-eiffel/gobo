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
typedef unsigned char int8_t;
typedef unsigned short int16_t;
typedef unsigned long int int32_t;
typedef unsigned __int64 int64_t;
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

/* GEYACC */
typedef struct {
	int id;
	T0* a2; /* error_handler */
	T2 a3; /* old_typing */
	T2 a4; /* line_pragma */
	T0* a5; /* grammar */
	T0* a6; /* doc_format */
	T0* a7; /* output_filename */
	T0* a10; /* verbose_filename */
	T0* a11; /* input_filename */
	T0* a12; /* token_classname */
	T0* a13; /* token_filename */
	T2 a15; /* actions_separated */
} T18;

/* PR_FSM */
typedef struct {
	int id;
	T0* a1; /* grammar */
	T0* a2; /* states */
	T0* a4; /* cached_states */
} T19;

/* PR_PARSER_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* machine */
	T4 a2; /* yyFinal */
	T4 a3; /* yyFlag */
	T4 a4; /* array_size */
	T2 a5; /* line_pragma */
	T0* a6; /* input_filename */
	T2 a8; /* old_typing */
	T4 a9; /* yyNtbase */
	T4 a10; /* yyNsyms */
	T4 a11; /* yyMax_token */
	T0* a12; /* yytranslate */
	T0* a13; /* yyr1 */
	T0* a14; /* yytypes1 */
	T0* a15; /* yytypes2 */
	T0* a16; /* yydefact */
	T0* a17; /* yydefgoto */
	T0* a19; /* yypact */
	T0* a20; /* yypgoto */
	T0* a22; /* yytable */
	T0* a23; /* yycheck */
	T4 a24; /* yyLast */
} T20;

/* KL_TEXT_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a3; /* mode */
	T0* a8; /* name */
	T0* a11; /* string_name */
	T14 a15; /* file_pointer */
	T2 a17; /* descriptor_available */
} T21;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T22;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a3; /* program_name */
} T24;

/* UT_ERROR_HANDLER */
typedef struct {
	int id;
	T0* a1; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
} T25;

/* PR_GRAMMAR */
typedef struct {
	int id;
	T0* a1; /* rules */
	T4 a2; /* expected_conflicts */
	T0* a3; /* start_symbol */
	T0* a5; /* variables */
	T0* a6; /* tokens */
	T0* a7; /* eiffel_header */
	T0* a8; /* types */
	T0* a9; /* eiffel_code */
} T26;

/* PR_XML_DOC_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* grammar */
	T2 a2; /* lhs_shared */
} T27;

/* PR_HTML_DOC_GENERATOR */
typedef struct {
	int id;
	T0* a1; /* grammar */
	T2 a2; /* lhs_shared */
} T28;

/* KL_EXCEPTIONS */
typedef struct {
	int id;
} T31;

/* KL_STANDARD_FILES */
typedef struct {
	int id;
} T32;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a3; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T33;

/* KL_EQUALITY_TESTER [PR_RULE] */
typedef struct {
	int id;
} T34;

/* KL_EQUALITY_TESTER [PR_TOKEN] */
typedef struct {
	int id;
} T35;

/* KL_EQUALITY_TESTER [PR_VARIABLE] */
typedef struct {
	int id;
} T36;

/* KL_EQUALITY_TESTER [PR_TYPE] */
typedef struct {
	int id;
} T37;

/* KL_EQUALITY_TESTER [INTEGER] */
typedef struct {
	int id;
} T38;

/* KL_EQUALITY_TESTER [STRING] */
typedef struct {
	int id;
} T39;

/* KL_EQUALITY_TESTER [PR_TRANSITION] */
typedef struct {
	int id;
} T40;

/* KL_EQUALITY_TESTER [PR_REDUCTION] */
typedef struct {
	int id;
} T41;

/* KL_EQUALITY_TESTER [PR_STATE] */
typedef struct {
	int id;
} T42;

/* KL_EQUALITY_TESTER [PR_PORTION] */
typedef struct {
	int id;
} T43;

/* KL_EQUALITY_TESTER [PR_CONFLICT] */
typedef struct {
	int id;
} T44;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
} T45;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct {
	int id;
} T46;

/* PR_YACC_PARSER */
typedef struct {
	int id;
	T2 a1; /* successful */
	T0* a2; /* last_grammar */
	T0* a3; /* action_factory */
	T0* a4; /* terminal_symbols */
	T0* a6; /* nonterminal_symbols */
	T0* a8; /* types */
	T2 a10; /* old_typing */
	T0* a13; /* error_handler */
	T0* a14; /* action_buffer */
	T4 a16; /* line_nb */
	T0* a17; /* yyss */
	T0* a20; /* input_buffer */
	T4 a21; /* yy_end */
	T4 a22; /* yy_position */
	T4 a23; /* yy_line */
	T4 a24; /* yy_column */
	T4 a25; /* yy_parsing_status */
	T4 a27; /* yy_suspended_yystacksize */
	T4 a28; /* yy_suspended_yystate */
	T4 a29; /* yy_suspended_yyn */
	T4 a30; /* yy_suspended_yychar1 */
	T4 a31; /* yy_suspended_index */
	T4 a32; /* yy_suspended_yyss_top */
	T4 a33; /* yy_suspended_yy_goto */
	T4 a35; /* error_count */
	T2 a36; /* yy_lookahead_needed */
	T4 a37; /* yyerrstatus */
	T4 a38; /* yyssp */
	T0* a45; /* yypact */
	T4 a47; /* last_token */
	T0* a50; /* yytranslate */
	T0* a53; /* yycheck */
	T0* a54; /* yytable */
	T0* a56; /* yydefact */
	T0* a58; /* yyr1 */
	T0* a60; /* yypgoto */
	T0* a61; /* yydefgoto */
	T0* a65; /* yytypes1 */
	T0* a67; /* yytypes2 */
	T4 a75; /* yy_start */
	T4 a76; /* yyvsp1 */
	T4 a77; /* yyvsp2 */
	T4 a78; /* yyvsp3 */
	T4 a79; /* yyvsp4 */
	T4 a80; /* yyvsp5 */
	T4 a81; /* yyvsp6 */
	T2 a88; /* yy_more_flag */
	T4 a89; /* yy_more_len */
	T4 a90; /* line */
	T4 a91; /* column */
	T4 a92; /* position */
	T4 a93; /* yy_start_state */
	T0* a95; /* yy_state_stack */
	T4 a96; /* yy_state_count */
	T0* a97; /* yy_ec */
	T0* a98; /* yy_content_area */
	T0* a99; /* yy_content */
	T0* a100; /* yy_accept */
	T4 a101; /* yy_last_accepting_state */
	T4 a102; /* yy_last_accepting_cpos */
	T0* a103; /* yy_chk */
	T0* a104; /* yy_base */
	T0* a105; /* yy_def */
	T0* a106; /* yy_meta */
	T0* a108; /* yy_nxt */
	T4 a110; /* yy_lp */
	T0* a111; /* yy_acclist */
	T4 a114; /* yy_looking_for_trail_begin */
	T4 a116; /* yy_full_match */
	T4 a117; /* yy_full_state */
	T4 a118; /* yy_full_lp */
	T2 a124; /* yy_rejected */
	T4 a127; /* yyvsc1 */
	T0* a128; /* yyvs1 */
	T0* a129; /* yyspecial_routines1 */
	T0* a131; /* last_any_value */
	T4 a132; /* yyvsc2 */
	T0* a133; /* yyvs2 */
	T0* a134; /* yyspecial_routines2 */
	T0* a135; /* last_string_value */
	T4 a136; /* yyvsc3 */
	T0* a137; /* yyvs3 */
	T0* a138; /* yyspecial_routines3 */
	T4 a139; /* last_integer_value */
	T4 a140; /* precedence */
	T0* a141; /* type */
	T0* a142; /* start_symbol */
	T0* a144; /* yyvs5 */
	T4 a146; /* yyvsc5 */
	T0* a147; /* yyspecial_routines5 */
	T0* a149; /* yyvs6 */
	T4 a152; /* yyvsc6 */
	T0* a153; /* yyspecial_routines6 */
	T4 a155; /* yyvsc4 */
	T0* a156; /* yyvs4 */
	T0* a157; /* yyspecial_routines4 */
	T0* a166; /* rule */
	T0* a167; /* precedence_token */
	T4 a224; /* last_error */
	T4 a227; /* nb_open_brackets */
} T47;

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
} T48;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T49;

/* KL_STDIN_FILE */
typedef struct {
	int id;
	T2 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a4; /* name */
	T4 a5; /* mode */
	T1 a8; /* last_character */
	T0* a9; /* character_buffer */
} T51;

/* UT_VERSION_NUMBER */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T52;

/* UT_USAGE_MESSAGE */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T53;

/* DS_ARRAYED_LIST [PR_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a4; /* capacity */
	T0* a7; /* storage */
	T0* a8; /* special_routines */
	T0* a9; /* internal_cursor */
} T54;

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER] */
typedef struct {
	int id;
	T4 a1; /* capacity */
	T4 a4; /* position */
	T0* a7; /* items */
	T0* a8; /* key_equality_tester */
	T4 a10; /* modulus */
	T4 a11; /* last_position */
	T4 a17; /* free_slot */
	T4 a19; /* slots_position */
	T4 a20; /* count */
	T4 a21; /* clashes_previous_position */
	T0* a22; /* equality_tester */
	T4 a23; /* found_position */
	T0* a24; /* slots */
	T0* a26; /* clashes */
	T0* a27; /* special_item_routines */
	T0* a28; /* keys */
	T0* a29; /* special_key_routines */
	T0* a30; /* internal_cursor */
} T55;

/* PR_STATE */
typedef struct {
	int id;
	T0* a1; /* shifts */
	T4 a2; /* hash_code */
	T0* a5; /* positions */
	T4 a6; /* id */
	T0* a7; /* accessing_symbol */
	T0* a10; /* reductions */
	T0* a12; /* errors */
	T2 a17; /* lookahead_needed */
	T2 a19; /* has_conflict */
	T0* a23; /* error_action */
} T56;

/* UT_MESSAGE */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T59;

/* DS_LINKED_LIST [PR_CONFLICT] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T60;

/* PR_CONFLICT */
typedef struct {
	int id;
	T0* a1; /* state */
	T0* a2; /* rule */
	T0* a3; /* token */
	T0* a4; /* resolution */
} T62;

/* KL_INTEGER_ROUTINES */
typedef struct {
	int id;
} T63;

/* DS_ARRAYED_LIST [PR_POSITION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a5; /* storage */
	T0* a6; /* equality_tester */
	T4 a7; /* capacity */
	T0* a8; /* special_routines */
	T0* a9; /* internal_cursor */
} T64;

/* PR_POSITION */
typedef struct {
	int id;
	T4 a2; /* index */
	T0* a3; /* rule */
} T65;

/* PR_ERROR_ACTION */
typedef struct {
	int id;
	T0* a1; /* action */
	T4 a2; /* line_nb */
} T66;

/* DS_ARRAYED_LIST [PR_RULE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a7; /* storage */
	T4 a9; /* capacity */
	T0* a10; /* special_routines */
	T0* a11; /* internal_cursor */
	T0* a16; /* equality_tester */
} T67;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T68;

/* PR_RULE */
typedef struct {
	int id;
	T0* a1; /* rhs */
	T0* a2; /* lhs */
	T0* a3; /* error_actions */
	T0* a4; /* action */
	T4 a5; /* line_nb */
	T4 a6; /* id */
	T4 a8; /* associativity */
	T4 a12; /* precedence */
	T2 a14; /* is_useful */
} T69;

/* PR_VARIABLE */
typedef struct {
	int id;
	T0* a1; /* rules */
	T0* a2; /* derives */
	T2 a3; /* is_useful */
	T0* a4; /* type */
	T4 a5; /* id */
	T0* a6; /* name */
	T0* a8; /* transitions */
	T0* a9; /* firsts */
	T2 a11; /* is_nullable */
	T4 a14; /* index */
} T70;

/* DS_LINKED_LIST [PR_REDUCTION] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T71;

/* DS_LINKED_LIST [PR_TRANSITION] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T73;

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
typedef struct {
	int id;
} T75;

/* DS_LINKED_LIST [PR_TOKEN] */
typedef struct {
	int id;
	T0* a2; /* first_cell */
	T0* a3; /* equality_tester */
	T0* a4; /* internal_cursor */
	T0* a7; /* last_cell */
	T4 a8; /* count */
} T76;

/* DS_ARRAYED_LIST [PR_SYMBOL] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a4; /* storage */
	T4 a5; /* capacity */
	T0* a6; /* special_routines */
	T0* a7; /* internal_cursor */
	T0* a12; /* equality_tester */
} T77;

/* DS_ARRAYED_STACK [PR_STATE] */
typedef struct {
	int id;
	T0* a2; /* storage */
	T4 a3; /* count */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T78;

/* PR_TRANSITION */
typedef struct {
	int id;
	T0* a1; /* following_tokens */
	T0* a2; /* target */
	T0* a3; /* included_tokens */
	T0* a5; /* source */
	T4 a6; /* index */
} T79;

/* PR_TOKEN */
typedef struct {
	int id;
	T4 a2; /* token_id */
	T0* a3; /* name */
	T0* a4; /* literal_string */
	T2 a5; /* is_declared */
	T4 a7; /* precedence */
	T4 a8; /* id */
	T0* a9; /* type */
	T4 a10; /* associativity */
	T2 a14; /* is_useful */
} T81;

/* DS_ARRAYED_LIST [PR_REDUCTION] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a7; /* count */
} T82;

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T84;

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T86;

/* PR_REDUCTION */
typedef struct {
	int id;
	T0* a1; /* rule */
	T0* a2; /* lookaheads */
	T0* a4; /* transitions */
} T87;

/* DS_ARRAYED_LIST [PR_VARIABLE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a6; /* storage */
	T0* a8; /* special_routines */
	T4 a9; /* capacity */
	T0* a10; /* internal_cursor */
} T88;

/* DS_NESTED_LIST_FLATTENER [PR_RULE] */
typedef struct {
	int id;
} T89;

/* DS_LINKED_LIST [PR_VARIABLE] */
typedef struct {
	int id;
	T0* a1; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T4 a6; /* count */
} T90;

/* DS_LINKED_LIST [PR_RULE] */
typedef struct {
	int id;
	T0* a2; /* internal_cursor */
	T0* a4; /* first_cell */
	T0* a6; /* equality_tester */
	T0* a8; /* last_cell */
	T4 a9; /* count */
} T91;

/* SPECIAL [PR_STATE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T93;

/* ARRAY [PR_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T94;

/* DS_ARRAYED_LIST [PR_TOKEN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
	T0* a10; /* equality_tester */
} T95;

/* PR_TYPE */
typedef struct {
	int id;
	T0* a1; /* name */
	T4 a2; /* id */
	T2 a4; /* is_used */
} T96;

/* DS_LINKED_LIST_CURSOR [PR_RULE] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T97;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2[1]; /* item */
} T98;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T99;

/* DS_ARRAYED_LIST [PR_PORTION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T100;

/* DS_ARRAYED_LIST [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T4 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T4 a6; /* count */
} T101;

/* PR_PORTION */
typedef struct {
	int id;
	T4 a1; /* id */
	T0* a2; /* froms */
	T0* a3; /* tos */
	T4 a4; /* count */
	T4 a5; /* width */
	T2 a6; /* is_state */
	T4 a9; /* position */
} T102;

/* DS_BUBBLE_SORTER [PR_PORTION] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T104;

/* KL_ARRAY_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T106;

/* UT_STRING_FORMATTER */
typedef struct {
	int id;
} T107;

/* DS_ARRAYED_LIST [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T108;

/* DS_ARRAYED_LIST [PR_TYPE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a5; /* storage */
	T0* a6; /* special_routines */
	T4 a7; /* capacity */
	T0* a8; /* internal_cursor */
} T109;

/* DS_HASH_SET [PR_TYPE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a8; /* clashes */
	T0* a9; /* items */
	T4 a10; /* capacity */
	T4 a11; /* modulus */
	T4 a13; /* last_position */
	T4 a14; /* free_slot */
	T4 a16; /* position */
	T0* a17; /* internal_cursor */
	T4 a19; /* slots_position */
	T0* a21; /* special_item_routines */
	T0* a23; /* slots */
	T4 a24; /* found_position */
	T4 a25; /* clashes_previous_position */
	T0* a32; /* equality_tester */
} T110;

/* DS_HASH_SET_CURSOR [PR_TYPE] */
typedef struct {
	int id;
	T0* a3; /* container */
	T4 a4; /* position */
	T0* a5; /* next_cursor */
} T111;

/* SPECIAL [PR_TRANSITION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T113;

/* ARRAY [PR_TRANSITION] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T114;

/* UT_ARRAY_FORMATTER */
typedef struct {
	int id;
} T115;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T116;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T119;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T120;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T121;

/* KL_STDERR_FILE */
typedef struct {
	int id;
	T14 a2; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T122;

/* PR_ACTION_FACTORY */
typedef struct {
	int id;
} T123;

/* DS_HASH_TABLE [PR_TOKEN, STRING] */
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
} T124;

/* DS_HASH_TABLE [PR_VARIABLE, STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a4; /* position */
	T0* a7; /* items */
	T0* a8; /* key_equality_tester */
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
} T125;

/* DS_HASH_TABLE [PR_TYPE, STRING] */
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
} T126;

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
} T127;

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
} T128;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T129;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T131;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T132;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T133;

/* DS_PAIR [STRING, INTEGER] */
typedef struct {
	int id;
	T0* a1; /* first */
	T4 a2; /* second */
} T134;

/* SPECIAL [PR_TYPE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T135;

/* KL_SPECIAL_ROUTINES [PR_TYPE] */
typedef struct {
	int id;
} T136;

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T137;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct {
	int id;
} T138;

/* SPECIAL [PR_TOKEN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T139;

/* KL_SPECIAL_ROUTINES [PR_TOKEN] */
typedef struct {
	int id;
} T140;

/* DS_ARRAYED_LIST [PR_ERROR_ACTION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* storage */
	T0* a6; /* internal_cursor */
} T141;

/* UT_SYNTAX_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T142;

/* ARRAY [PR_TOKEN] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T143;

/* PR_MULTIPLE_START_DECLARATIONS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T144;

/* PR_NO_RULES_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T145;

/* PR_LHS_SYMBOL_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T146;

/* PR_RULE_DECLARED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T147;

/* PR_INVALID_ERROR_N_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T148;

/* PR_PREC_SPECIFIED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T149;

/* PR_PREC_NOT_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T150;

/* PR_MISSING_CHARACTERS_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T151;

/* PR_NULL_INTEGER_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T152;

/* PR_INVALID_STRING_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T153;

/* PR_INVALID_DOLLAR_DOLLAR_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T154;

/* PR_START_SYMBOL_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T155;

/* PR_UNKNOWN_START_SYMBOL_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T156;

/* PR_TOKEN_ID_USED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T157;

/* PR_UNDEFINED_SYMBOL_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T158;

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T159;

/* PR_TWO_STRINGS_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T160;

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T161;

/* PR_DANGEROUS_DOLLAR_N_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T162;

/* PR_INVALID_DOLLAR_N_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T163;

/* KL_COMPARABLE_COMPARATOR [PR_PORTION] */
typedef struct {
	int id;
} T166;

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
	T0* a6; /* internal_cursor */
} T169;

/* PR_BASIC_TYPE */
typedef struct {
	int id;
	T4 a1; /* id */
	T0* a2; /* name */
	T2 a3; /* is_used */
} T170;

/* PR_ACTION */
typedef struct {
	int id;
	T0* a1; /* text */
} T171;

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T172;

/* PR_TOKEN_DECLARED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T173;

/* PR_SYMBOL_DECLARED_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T174;

/* PR_VARIABLE_DECLARED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T175;

/* PR_UNDEFINED_STRING_TOKEN_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T176;

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T177;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a4; /* file_name */
	T0* a5; /* buffered_file_info */
} T178;

/* KL_SPECIAL_ROUTINES [PR_STATE] */
typedef struct {
	int id;
} T179;

/* DS_ARRAYED_LIST_CURSOR [PR_STATE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T180;

/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T181;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct {
	int id;
} T182;

/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T183;

/* DS_BUBBLE_SORTER [PR_POSITION] */
typedef struct {
	int id;
	T0* a1; /* comparator */
} T184;

/* SPECIAL [PR_POSITION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T186;

/* KL_EQUALITY_TESTER [PR_POSITION] */
typedef struct {
	int id;
} T187;

/* KL_SPECIAL_ROUTINES [PR_POSITION] */
typedef struct {
	int id;
} T188;

/* DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
typedef struct {
	int id;
	T0* a1; /* container */
} T189;

/* SPECIAL [PR_RULE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T190;

/* KL_SPECIAL_ROUTINES [PR_RULE] */
typedef struct {
	int id;
} T191;

/* DS_ARRAYED_LIST_CURSOR [PR_RULE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T192;

/* DS_LINKABLE [PR_REDUCTION] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T194;

/* DS_LINKABLE [PR_TRANSITION] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T195;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T197;

/* SPECIAL [PR_SYMBOL] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T202;

/* KL_SPECIAL_ROUTINES [PR_SYMBOL] */
typedef struct {
	int id;
} T203;

/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
typedef struct {
	int id;
	T0* a1; /* container */
} T204;

/* KL_SPECIAL_ROUTINES [PR_REDUCTION] */
typedef struct {
	int id;
} T205;

/* SPECIAL [PR_REDUCTION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T206;

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a4; /* position */
	T0* a6; /* next_cursor */
} T207;

/* SPECIAL [PR_VARIABLE] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T208;

/* KL_SPECIAL_ROUTINES [PR_VARIABLE] */
typedef struct {
	int id;
} T209;

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a5; /* container */
} T210;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T4 a5; /* capacity */
} T213;

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
typedef struct {
	int id;
	T0* a1; /* container */
	T2 a2; /* before */
	T2 a3; /* after */
	T0* a5; /* current_cell */
	T0* a6; /* next_cursor */
} T218;

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a4; /* position */
	T0* a5; /* next_cursor */
} T219;

/* DS_LINKABLE [PR_RULE] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T220;

/* SPECIAL [PR_PORTION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T221;

/* KL_SPECIAL_ROUTINES [PR_PORTION] */
typedef struct {
	int id;
} T222;

/* DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
typedef struct {
	int id;
	T0* a1; /* container */
} T223;

/* DS_ARRAYED_LIST_CURSOR [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* container */
} T225;

/* UT_INTEGER_FORMATTER */
typedef struct {
	int id;
} T226;

/* DS_ARRAYED_LIST_CURSOR [STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
} T227;

/* DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
typedef struct {
	int id;
	T0* a1; /* container */
} T228;

/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T230;

/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T231;

/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING] */
typedef struct {
	int id;
	T0* a1; /* container */
	T4 a2; /* position */
} T232;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T233;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T234;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T235;

/* TO_SPECIAL [PR_TYPE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T236;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T237;

/* TO_SPECIAL [PR_TOKEN] */
typedef struct {
	int id;
	T0* a1; /* area */
} T238;

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
typedef struct {
	int id;
} T239;

/* SPECIAL [PR_ERROR_ACTION] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T240;

/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
typedef struct {
	int id;
	T0* a1; /* container */
} T241;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 a1; /* count */
	T8 a2[1]; /* item */
} T242;

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
} T243;

/* KL_COMPARABLE_COMPARATOR [PR_POSITION] */
typedef struct {
	int id;
} T245;

/* DS_LINKABLE [PR_TOKEN] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T249;

/* DS_LINKED_LIST_CURSOR [PR_TOKEN] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T250;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a3; /* as_special */
	T0* a6; /* area */
} T252;

/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T253;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
} T254;

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T4 a3; /* position */
} T255;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T256;

/* TO_SPECIAL [PR_STATE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T257;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T258;

/* TO_SPECIAL [PR_POSITION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T259;

/* TO_SPECIAL [PR_RULE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T260;

/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T261;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct {
	int id;
} T262;

/* TO_SPECIAL [PR_SYMBOL] */
typedef struct {
	int id;
	T0* a1; /* area */
} T263;

/* TO_SPECIAL [PR_REDUCTION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T264;

/* TO_SPECIAL [PR_VARIABLE] */
typedef struct {
	int id;
	T0* a1; /* area */
} T265;

/* SPECIAL [DS_NESTED_LIST [PR_RULE]] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T266;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
typedef struct {
	int id;
} T267;

/* TO_SPECIAL [PR_PORTION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T268;

/* TO_SPECIAL [PR_ERROR_ACTION] */
typedef struct {
	int id;
	T0* a1; /* area */
} T269;

/* KL_CHARACTER_ROUTINES */
typedef struct {
	int id;
} T270;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T271;

/* KL_OPERATING_SYSTEM */
typedef struct {
	int id;
} T272;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T273;

/* TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T274;

/* TO_SPECIAL [DS_NESTED_LIST [PR_RULE]] */
typedef struct {
	int id;
	T0* a1; /* area */
} T275;

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
typedef struct {
	int id;
	T2 a1; /* after */
	T0* a3; /* current_cell */
	T0* a4; /* container */
	T2 a5; /* before */
	T0* a6; /* next_cursor */
} T276;

/* DS_LINKABLE [PR_CONFLICT] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T277;

/* DS_HASH_TABLE [INTEGER, PR_TYPE] */
typedef struct {
	int id;
	T4 a5; /* found_position */
	T4 a8; /* position */
	T0* a9; /* items */
	T4 a10; /* free_slot */
	T4 a11; /* last_position */
	T4 a16; /* count */
	T4 a17; /* modulus */
	T4 a18; /* slots_position */
	T4 a19; /* clashes_previous_position */
	T0* a20; /* key_equality_tester */
	T0* a22; /* equality_tester */
	T0* a23; /* clashes */
	T0* a24; /* slots */
	T0* a25; /* keys */
	T4 a26; /* capacity */
	T0* a28; /* internal_cursor */
	T0* a29; /* special_item_routines */
	T0* a30; /* special_key_routines */
} T278;

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE] */
typedef struct {
	int id;
	T0* a4; /* container */
	T4 a5; /* position */
	T0* a6; /* next_cursor */
} T279;

/* DS_LINKABLE [PR_VARIABLE] */
typedef struct {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
} T282;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 a1; /* count */
	T11 a2[1]; /* item */
} T283;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T284;

/* PLATFORM */
typedef struct {
	int id;
} T285;

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern int geargc;
extern char** geargv;

/* Call to UT_ERROR.default_message */
extern T0* T30x2170(T0* C);
/* Call to ANY.same_type */
extern T2 T118x59(T0* C, T0* a1);
/* GEYACC.execute */
extern T0* T18c18();
/* PR_PARSER_GENERATOR.print_parser */
extern void T20f35(T0* C, T2 a1, T2 a2, T0* a3);
/* PR_PARSER_GENERATOR.print_eiffel_code */
extern void T20f58(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_constants */
extern void T20f57(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_integer */
extern void T33f14(T0* C, T4 a1);
/* KL_STDOUT_FILE.put_character */
extern void T33f12(T0* C, T1 a1);
/* KL_STDOUT_FILE.old_put_character */
extern void T33f17(T0* C, T1 a1);
/* KL_STDOUT_FILE.console_pc */
extern void T33f21(T0* C, T14 a1, T1 a2);
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
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T21f24(T0* C, T4 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T21f25(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T21f32(T0* C, T1 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T21f35(T0* C, T14 a1, T1 a2);
/* PR_PARSER_GENERATOR.print_stack_declarations */
extern void T20f56(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_yyvs_declaration */
extern void T170f14(T0* C, T4 a1, T0* a2);
/* KL_STDOUT_FILE.put_line */
extern void T33f10(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T21f27(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_indentation */
extern void T170f20(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_yyvs_declaration */
extern void T96f16(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_indentation */
extern void T96f22(T0* C, T4 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_TYPE].item */
extern T0* T109f2(T0* C, T4 a1);
/* INTEGER.infix ">" */
extern T2 T4f1(T4* C, T4 a1);
/* PR_PARSER_GENERATOR.old_print_conversion_routines */
extern void T20f55(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_conversion_routine */
extern void T170f13(T0* C, T0* a1);
/* PR_TYPE.old_print_conversion_routine */
extern void T96f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_empty */
extern T2 T109f3(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_tables */
extern void T20f54(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_eiffel_array */
extern void T20f62(T0* C, T0* a1, T0* a2, T0* a3);
/* INTEGER.min */
extern T4 T4f9(T4* C, T4 a1);
/* INTEGER.infix "<=" */
extern T2 T4f12(T4* C, T4 a1);
/* UT_ARRAY_FORMATTER.put_integer_array */
extern void T115f8(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* INTEGER.out */
extern T0* T4f11(T4* C);
/* STRING.append_integer */
extern void T16f29(T0* C, T4 a1);
/* INTEGER.infix ">=" */
extern T2 T4f4(T4* C, T4 a1);
/* STRING.append_character */
extern void T16f28(T0* C, T1 a1);
/* STRING.resize */
extern void T16f36(T0* C, T4 a1);
/* SPECIAL [CHARACTER].aliased_resized_area */
extern T0* T15f4(T0* C, T4 a1);
/* STRING.additional_space */
extern T4 T16f13(T0* C);
/* INTEGER.max */
extern T4 T4f15(T4* C, T4 a1);
/* STRING.capacity */
extern T4 T16f12(T0* C);
/* STRING.make */
extern T0* T16c25(T4 a1);
/* STRING.make_area */
extern void T16f34(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c9(T4 a1);
/* ARRAY [INTEGER].item */
extern T4 T99f4(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.array_formatter_ */
extern unsigned char ge219os1406;
extern T0* ge219ov1406;
extern T0* T20f28(T0* C);
/* UT_ARRAY_FORMATTER.default_create */
extern T0* T115c7();
/* ARRAY [INTEGER].count */
extern T4 T99f5(T0* C);
/* PR_PARSER_GENERATOR.print_error_actions */
extern void T20f53(T0* C, T0* a1);
/* PR_ACTION.out */
extern T0* T171f2(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].item */
extern T0* T54f2(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.print_separated_error_actions */
extern void T20f52(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_actions */
extern void T20f51(T0* C, T0* a1);
/* PR_RULE.print_action */
extern void T69f26(T0* C, T0* a1, T2 a2, T0* a3);
/* PR_BASIC_TYPE.print_push_yyval */
extern void T170f19(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_push_yyval */
extern void T96f21(T0* C, T4 a1, T0* a2);
/* PR_BASIC_TYPE.print_resize_yyvs */
extern void T170f18(T0* C, T4 a1, T0* a2);
/* PR_BASIC_TYPE.print_create_yyvs */
extern void T170f21(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_resize_yyvs */
extern void T96f20(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_create_yyvs */
extern void T96f23(T0* C, T4 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].item */
extern T4 T278f4(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].items_item */
extern T4 T278f7(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].search_position */
extern void T278f44(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].clashes_item */
extern T4 T278f13(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].hash_position */
extern T4 T278f14(T0* C, T0* a1);
/* PR_BASIC_TYPE.hash_code */
extern T4 T170f4(T0* C);
/* PR_TYPE.hash_code */
extern T4 T96f5(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].keys_item */
extern T0* T278f21(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].slots_item */
extern T4 T278f15(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].forth */
extern void T279f9(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_forth */
extern void T278f57(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].add_traversing_cursor */
extern void T278f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].set_next_cursor */
extern void T279f11(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].remove_traversing_cursor */
extern void T278f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].set_position */
extern void T279f10(T0* C, T4 a1);
/* PR_BASIC_TYPE.print_increment_yyvsp */
extern void T170f17(T0* C, T4 a1, T4 a2, T0* a3);
/* PR_TYPE.print_increment_yyvsp */
extern void T96f19(T0* C, T4 a1, T4 a2, T0* a3);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].key */
extern T0* T279f3(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_key */
extern T0* T278f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].item */
extern T4 T279f2(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_item */
extern T4 T278f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].after */
extern T2 T279f1(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_after */
extern T2 T278f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].start */
extern void T279f8(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_start */
extern void T278f56(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_off */
extern T2 T278f38(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].is_empty */
extern T2 T278f37(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].new_cursor */
extern T0* T278f3(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].make */
extern T0* T279c7(T0* a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].replace_found_item */
extern void T278f43(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].items_put */
extern void T278f49(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].found_item */
extern T4 T278f2(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].found */
extern T2 T278f1(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].search */
extern void T278f42(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].item */
extern T0* T77f2(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].put_new */
extern void T278f41(T0* C, T4 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].keys_put */
extern void T278f50(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].slots_put */
extern void T278f48(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].clashes_put */
extern void T278f47(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].unset_found_item */
extern void T278f46(T0* C);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_map */
extern T0* T278c40(T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_with_equality_testers */
extern void T278f45(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_sparse_container */
extern void T278f51(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_slots */
extern void T278f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T129f1(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T233c2(T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T98c6(T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].special_integer_ */
extern unsigned char ge256os3449;
extern T0* ge256ov3449;
extern T0* T278f31(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T129c4();
/* DS_HASH_TABLE [INTEGER, PR_TYPE].new_modulus */
extern T4 T278f27(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_clashes */
extern void T278f54(T0* C, T4 a1);
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_keys */
extern void T278f53(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].make */
extern T0* T136f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_TYPE].make_area */
extern T0* T236c2(T4 a1);
/* SPECIAL [PR_TYPE].make */
extern T0* T135c4(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].default_create */
extern T0* T136c3();
/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_items */
extern void T278f52(T0* C, T4 a1);
/* PR_RULE.old_print_action */
extern void T69f25(T0* C, T0* a1, T2 a2, T0* a3);
/* PR_BASIC_TYPE.old_print_dollar_dollar_finalization */
extern void T170f25(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_finalization */
extern void T96f27(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_dollar_dollar_initialization */
extern void T170f24(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_initialization */
extern void T96f26(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].forth */
extern void T111f8(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_forth */
extern void T110f47(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].add_traversing_cursor */
extern void T110f49(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_next_cursor */
extern void T111f10(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].remove_traversing_cursor */
extern void T110f48(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_position */
extern void T111f9(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].clashes_item */
extern T4 T110f5(T0* C, T4 a1);
/* PR_BASIC_TYPE.print_dollar_dollar_declaration */
extern void T170f16(T0* C, T0* a1);
/* PR_TYPE.print_dollar_dollar_declaration */
extern void T96f18(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].item */
extern T0* T111f2(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_item */
extern T0* T110f30(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].items_item */
extern T0* T110f7(T0* C, T4 a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].after */
extern T2 T111f1(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_after */
extern T2 T110f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].start */
extern void T111f7(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_start */
extern void T110f46(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].cursor_off */
extern T2 T110f34(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].new_cursor */
extern T0* T110f3(T0* C);
/* DS_HASH_SET_CURSOR [PR_TYPE].make */
extern T0* T111c6(T0* a1);
/* DS_HASH_SET [PR_TYPE].is_empty */
extern T2 T110f4(T0* C);
/* DS_HASH_SET [PR_TYPE].put */
extern void T110f36(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].slots_put */
extern void T110f45(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [PR_TYPE].clashes_put */
extern void T110f44(T0* C, T4 a1, T4 a2);
/* DS_HASH_SET [PR_TYPE].slots_item */
extern T4 T110f20(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].items_put */
extern void T110f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_SET [PR_TYPE].search_position */
extern void T110f42(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].hash_position */
extern T4 T110f28(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].keys_item */
extern T0* T110f27(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].key_equality_tester */
extern T0* T110f26(T0* C);
/* DS_HASH_SET [PR_TYPE].unset_found_item */
extern void T110f41(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].item */
extern T0* T67f2(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].make */
extern T0* T110c35(T4 a1);
/* DS_HASH_SET [PR_TYPE].make_slots */
extern void T110f40(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].special_integer_ */
extern T0* T110f22(T0* C);
/* DS_HASH_SET [PR_TYPE].new_modulus */
extern T4 T110f12(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].make_clashes */
extern void T110f39(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].make_keys */
extern void T110f38(T0* C, T4 a1);
/* DS_HASH_SET [PR_TYPE].make_items */
extern void T110f37(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.print_separated_actions */
extern void T20f50(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_pop_last_value */
extern void T20f49(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_pop_last_value */
extern void T170f12(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_pop_last_value */
extern void T96f14(T0* C, T4 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_push_error_value */
extern void T20f48(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].item */
extern T0* T95f2(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.print_push_last_value */
extern void T20f47(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_push_last_value */
extern void T170f15(T0* C, T4 a1, T0* a2);
/* PR_BASIC_TYPE.last_value_name */
extern T0* T170f5(T0* C);
/* KL_CHARACTER_ROUTINES.as_lower */
extern T1 T270f1(T0* C, T1 a1);
/* CHARACTER.lower */
extern T1 T1f3(T1* C);
/* CHARACTER.is_upper */
extern T2 T1f8(T1* C);
/* NATURAL_8.infix ">" */
extern T2 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER.character_types */
extern T8 T1f9(T1* C, T4 a1);
/* CHARACTER.internal_character_types */
extern unsigned char ge35os35;
extern T0* ge35ov35;
extern T0* T1f12(T1* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T242c2(T4 a1);
/* PR_BASIC_TYPE.character_ */
extern unsigned char ge253os2968;
extern T0* ge253ov2968;
extern T0* T170f6(T0* C);
/* KL_CHARACTER_ROUTINES.default_create */
extern T0* T270c2();
/* STRING.item */
extern T1 T16f14(T0* C, T4 a1);
/* STRING.append_string */
extern void T16f26(T0* C, T0* a1);
/* STRING.append */
extern void T16f35(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f8(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f14(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f13(T0* C, T4 a1, T4 a2, T4 a3);
/* PR_TYPE.print_push_last_value */
extern void T96f17(T0* C, T4 a1, T0* a2);
/* PR_TYPE.last_value_name */
extern T0* T96f6(T0* C);
/* PR_TYPE.character_ */
extern T0* T96f7(T0* C);
/* DS_HASH_SET [PR_TYPE].first */
extern T0* T110f2(T0* C);
/* PR_PARSER_GENERATOR.print_clear_value_stacks */
extern void T20f46(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_clear_yyvs */
extern void T170f11(T0* C, T4 a1, T0* a2);
/* PR_TYPE.print_clear_yyvs */
extern void T96f13(T0* C, T4 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_init_value_stacks */
extern void T20f45(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_create_value_stacks */
extern void T20f44(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_build_parser_tables */
extern void T20f43(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T33f11(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T33f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T33f20(T0* C, T14 a1, T14 a2, T4 a3);
/* TYPED_POINTER [ANY].to_pointer */
extern T14 T119f2(T119* C);
/* KL_STRING_ROUTINES.as_string */
extern T0* T116f1(T0* C, T0* a1);
/* STRING.string */
extern T0* T16f16(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T2 T68f2(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge250os1337;
extern T0* ge250ov1337;
extern T0* T116f6(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T68c3();
/* KL_STDOUT_FILE.string_ */
extern unsigned char ge258os1313;
extern T0* ge258ov1313;
extern T0* T33f1(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T116c10();
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T21f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T21f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T21f34(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T21f9(T0* C);
/* PR_PARSER_GENERATOR.print_token_codes */
extern void T20f41(T0* C, T0* a1);
/* UT_STRING_FORMATTER.put_eiffel_string */
extern void T107f3(T0* C, T0* a1, T0* a2);
/* UT_INTEGER_FORMATTER.put_decimal_integer */
extern void T226f2(T0* C, T0* a1, T4 a2);
/* STRING.item_code */
extern T4 T16f23(T0* C, T4 a1);
/* UT_STRING_FORMATTER.integer_formatter_ */
extern unsigned char ge219os1402;
extern T0* ge219ov1402;
extern T0* T107f1(T0* C);
/* UT_INTEGER_FORMATTER.default_create */
extern T0* T226c1();
/* PR_PARSER_GENERATOR.string_formatter_ */
extern unsigned char ge219os1405;
extern T0* ge219ov1405;
extern T0* T20f27(T0* C);
/* UT_STRING_FORMATTER.default_create */
extern T0* T107c2();
/* PR_TOKEN.has_identifier */
extern T2 T81f15(T0* C);
/* PR_PARSER_GENERATOR.print_last_values */
extern void T20f61(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T33f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T21f26(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_header */
extern void T20f42(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].item */
extern T0* T108f2(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.print_token_class */
extern void T20f34(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_PARSER_GENERATOR.set_input_filename */
extern void T20f33(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.set_line_pragma */
extern void T20f32(T0* C, T2 a1);
/* PR_PARSER_GENERATOR.set_old_typing */
extern void T20f31(T0* C, T2 a1);
/* PR_PARSER_GENERATOR.make */
extern T0* T20c30(T0* a1);
/* PR_PARSER_GENERATOR.build_action_tables */
extern void T20f40(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].subarray */
extern T0* T106f1(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
extern void T106f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5);
/* ARRAY [INTEGER].subcopy */
extern void T99f11(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].copy_data */
extern void T98f9(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [INTEGER].move_data */
extern void T98f7(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].overlapping_move */
extern void T98f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].non_overlapping_move */
extern void T98f11(T0* C, T4 a1, T4 a2, T4 a3);
/* PR_PORTION.set_position */
extern void T102f13(T0* C, T4 a1);
/* KL_ARRAY_ROUTINES [INTEGER].resize */
extern void T106f3(T0* C, T0* a1, T4 a2, T4 a3);
/* ARRAY [INTEGER].conservative_resize */
extern void T99f10(T0* C, T4 a1, T4 a2);
/* SPECIAL [INTEGER].fill_with */
extern void T98f8(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [INTEGER].aliased_resized_area */
extern T0* T98f3(T0* C, T4 a1);
/* ARRAY [INTEGER].make_area */
extern void T99f9(T0* C, T4 a1);
/* ARRAY [INTEGER].empty_area */
extern T2 T99f6(T0* C);
/* PR_PARSER_GENERATOR.integer_array_ */
extern unsigned char ge251os1398;
extern T0* ge251ov1398;
extern T0* T20f26(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER].default_create */
extern T0* T106c2();
/* DS_ARRAYED_LIST [INTEGER].item */
extern T4 T101f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [INTEGER].first */
extern T4 T101f8(T0* C);
/* PR_PORTION.same_portion */
extern T2 T102f8(T0* C, T0* a1);
/* PR_PORTION.order_is_equal */
extern T2 T102f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].item */
extern T0* T100f2(T0* C, T4 a1);
/* ARRAY [INTEGER].put */
extern void T99f8(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_PORTION].sort */
extern void T100f10(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort */
extern void T104f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort_with_comparator */
extern void T104f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_PORTION].subsort_with_comparator */
extern void T104f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [PR_PORTION].replace */
extern void T100f12(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].less_than */
extern T2 T166f1(T0* C, T0* a1, T0* a2);
/* PR_PORTION.infix "<" */
extern T2 T102f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].is_empty */
extern T2 T100f8(T0* C);
/* PR_PARSER_GENERATOR.portion_sorter */
extern unsigned char ge180os1379;
extern T0* ge180ov1379;
extern T0* T20f18(T0* C);
/* DS_BUBBLE_SORTER [PR_PORTION].make */
extern T0* T104c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].make */
extern T0* T166c2();
/* PR_PARSER_GENERATOR.put_yydefgoto */
extern void T20f60(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_PORTION].put_last */
extern void T100f11(T0* C, T0* a1);
/* PR_PORTION.make_symbol */
extern T0* T102c12(T4 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [INTEGER].last */
extern T4 T101f7(T0* C);
/* DS_ARRAYED_LIST [INTEGER].put_last */
extern void T101f11(T0* C, T4 a1);
/* ARRAY [PR_TRANSITION].item */
extern T0* T114f4(T0* C, T4 a1);
/* DS_ARRAYED_LIST [INTEGER].make */
extern T0* T101c10(T4 a1);
/* DS_ARRAYED_LIST [INTEGER].new_cursor */
extern T0* T101f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
extern T0* T225c2(T0* a1);
/* ARRAY [PR_TRANSITION].put */
extern void T114f6(T0* C, T0* a1, T4 a2);
/* ARRAY [PR_TRANSITION].make */
extern T0* T114c5(T4 a1, T4 a2);
/* ARRAY [PR_TRANSITION].make_area */
extern void T114f7(T0* C, T4 a1);
/* SPECIAL [PR_TRANSITION].make */
extern T0* T113c2(T4 a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].forth */
extern void T84f9(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_forth */
extern void T73f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].add_traversing_cursor */
extern void T73f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_next_cursor */
extern void T84f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].remove_traversing_cursor */
extern void T73f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set */
extern void T84f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].item */
extern T0* T84f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].start */
extern void T84f8(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_start */
extern void T73f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_off */
extern T2 T73f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].new_cursor */
extern T0* T73f1(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].make */
extern T0* T84c7(T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].is_empty */
extern T2 T73f3(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].item */
extern T0* T88f2(T0* C, T4 a1);
/* PR_PARSER_GENERATOR.put_yydefact */
extern void T20f59(T0* C, T0* a1, T0* a2);
/* PR_PORTION.make_state */
extern T0* T102c11(T4 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_REDUCTION].first */
extern T0* T82f10(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].item */
extern T0* T82f9(T0* C, T4 a1);
/* ARRAY [INTEGER].make */
extern T0* T99c7(T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_PORTION].make */
extern T0* T100c9(T4 a1);
/* DS_ARRAYED_LIST [PR_PORTION].new_cursor */
extern T0* T100f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_PORTION].make */
extern T0* T223c2(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].make */
extern T0* T222f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_PORTION].make_area */
extern T0* T268c2(T4 a1);
/* SPECIAL [PR_PORTION].make */
extern T0* T221c2(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].default_create */
extern T0* T222c2();
/* PR_PARSER_GENERATOR.build_yytypes2 */
extern void T20f39(T0* C);
/* PR_PARSER_GENERATOR.build_yytypes1 */
extern void T20f38(T0* C);
/* PR_PARSER_GENERATOR.build_yyr1 */
extern void T20f37(T0* C);
/* PR_PARSER_GENERATOR.build_yytranslate */
extern void T20f36(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].last */
extern T0* T54f6(T0* C);
/* PR_FSM.make */
extern T0* T19c11(T0* a1, T0* a2);
/* PR_FSM.set_error_actions */
extern void T19f17(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning */
extern void T25f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning_message */
extern void T25f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T122f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T122f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T122f11(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T122f15(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T122f19(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_STDERR_FILE.string_ */
extern T0* T122f1(T0* C);
/* UT_ERROR_HANDLER.message */
extern T0* T25f5(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T59c7(T0* a1);
/* ARRAY [STRING].put */
extern void T121f7(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T121c6(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T121f8(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T120c4(T4 a1);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T63f2(T0* C, T4 a1, T0* a2);
/* PR_FSM.integer_ */
extern unsigned char ge255os1336;
extern T0* ge255ov1336;
extern T0* T19f5(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T63c1();
/* PR_STATE.set_error_action */
extern void T56f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].put_last */
extern void T64f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].has */
extern T2 T67f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].make */
extern T0* T64c12(T4 a1);
/* DS_ARRAYED_LIST [PR_POSITION].new_cursor */
extern T0* T64f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_POSITION].make */
extern T0* T189c2(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].make */
extern T0* T188f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_POSITION].make_area */
extern T0* T259c2(T4 a1);
/* SPECIAL [PR_POSITION].make */
extern T0* T186c4(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].default_create */
extern T0* T188c3();
/* KL_ANY_ROUTINES.equal_objects */
extern T2 T68f1(T0* C, T0* a1, T0* a2);
/* PR_ERROR_ACTION.is_equal */
extern T2 T66f4(T0* C, T0* a1);
/* PR_ACTION.is_equal */
extern T2 T171f3(T0* C, T0* a1);
/* PR_ACTION.any_ */
extern T0* T171f4(T0* C);
/* PR_ERROR_ACTION.any_ */
extern T0* T66f5(T0* C);
/* PR_FSM.any_ */
extern T0* T19f6(T0* C);
/* PR_POSITION.error_action */
extern T0* T65f6(T0* C);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].item */
extern T0* T141f8(T0* C, T4 a1);
/* PR_POSITION.after */
extern T2 T65f5(T0* C);
/* PR_POSITION.before */
extern T2 T65f4(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].item */
extern T0* T64f2(T0* C, T4 a1);
/* PR_FSM.resolve_conflicts */
extern void T19f16(T0* C, T0* a1);
/* PR_STATE.reduce_reduce_count */
extern T4 T56f21(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].force_last */
extern void T76f11(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].put_right */
extern void T249f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].make */
extern T0* T249c3(T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].is_empty */
extern T2 T76f6(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].has */
extern T2 T76f1(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].make */
extern T0* T76c10();
/* DS_LINKED_LIST [PR_TOKEN].new_cursor */
extern T0* T76f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T250c7(T0* a1);
/* PR_STATE.shift_reduce_count */
extern T4 T56f20(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].remove */
extern void T95f22(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].move_left */
extern void T95f28(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].move_cursors_left */
extern void T95f27(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_position */
extern void T219f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_last */
extern void T95f26(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_last_cursors_after */
extern void T95f31(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T219f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].has */
extern T2 T95f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].put_last */
extern void T95f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].make */
extern T0* T95c19(T4 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_cursor */
extern T0* T95f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T219c7(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].make */
extern T0* T140f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_TOKEN].make_area */
extern T0* T238c2(T4 a1);
/* SPECIAL [PR_TOKEN].make */
extern T0* T139c4(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].default_create */
extern T0* T140c3();
/* PR_STATE.resolve_conflicts */
extern T0* T56f18(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].force_last */
extern void T95f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].resize */
extern void T95f20(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].resize */
extern T0* T140f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_TOKEN].resized_area */
extern T0* T139f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_capacity */
extern T4 T95f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extendible */
extern T2 T95f11(T0* C, T4 a1);
/* PR_TOKEN.is_non_associative */
extern T2 T81f18(T0* C);
/* PR_TOKEN.is_right_associative */
extern T2 T81f17(T0* C);
/* PR_TOKEN.is_left_associative */
extern T2 T81f16(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].delete */
extern void T95f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].clear_items */
extern void T95f30(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].is_empty */
extern T2 T95f13(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_all_cursors_after */
extern void T95f29(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].force_last */
extern void T60f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].put_right */
extern void T277f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].make */
extern T0* T277c3(T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].is_empty */
extern T2 T60f3(T0* C);
/* PR_CONFLICT.make */
extern T0* T62c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* PR_STATE.remove_shift */
extern void T56f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].remove */
extern void T54f22(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_STATE].move_left */
extern void T54f25(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_left */
extern void T54f24(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_position */
extern void T180f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_STATE].remove_last */
extern void T54f23(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].move_last_cursors_after */
extern void T54f26(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_next_cursor */
extern void T180f6(T0* C, T0* a1);
/* PR_TOKEN.has_precedence */
extern T2 T81f6(T0* C);
/* PR_RULE.has_precedence */
extern T2 T69f15(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].make */
extern T0* T60c8();
/* DS_LINKED_LIST [PR_CONFLICT].new_cursor */
extern T0* T60f1(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].make */
extern T0* T276c7(T0* a1);
/* PR_FSM.make_default */
extern void T19f12(T0* C, T0* a1);
/* PR_FSM.build_deterministic */
extern void T19f19(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T86f9(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_forth */
extern void T71f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T71f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T86f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T71f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set */
extern void T86f10(T0* C, T0* a1, T2 a2, T2 a3);
/* PR_REDUCTION.build_lookaheads */
extern void T87f7(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].forth */
extern void T250f9(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_forth */
extern void T76f13(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T76f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T250f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T76f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set */
extern void T250f10(T0* C, T0* a1, T2 a2, T2 a3);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T250f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].start */
extern void T250f8(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_start */
extern void T76f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].cursor_off */
extern T2 T76f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].wipe_out */
extern void T95f34(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T86f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].start */
extern void T86f8(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_start */
extern void T71f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_off */
extern T2 T71f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].new_cursor */
extern T0* T71f1(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T86c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].flatten */
extern void T75f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].traverse */
extern void T75f3(T0* C, T0* a1, T0* a2);
/* PR_TRANSITION.set_following_tokens */
extern void T79f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].remove */
extern void T197f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].item */
extern T0* T197f2(T0* C);
/* PR_TRANSITION.add_following_token */
extern void T79f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].force */
extern void T197f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].resize */
extern void T197f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].resize */
extern T0* T262f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].resized_area */
extern T0* T261f3(T0* C, T4 a1);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T261c4(T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].new_capacity */
extern T4 T197f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].extendible */
extern T2 T197f6(T0* C, T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T197c8(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T262f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make_area */
extern T0* T274c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].default_create */
extern T0* T262c3();
/* PR_TRANSITION.set_index */
extern void T79f8(T0* C, T4 a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].make */
extern T0* T75c1();
/* DS_ARRAYED_STACK [PR_STATE].item */
extern T0* T78f1(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].remove */
extern void T78f9(T0* C);
/* PR_STATE.put_transition */
extern void T56f32(T0* C, T0* a1, T0* a2);
/* PR_REDUCTION.put_transition */
extern void T87f6(T0* C, T0* a1);
/* PR_STATE.shift */
extern T0* T56f22(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].put */
extern void T78f8(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].wipe_out */
extern void T78f7(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].clear_items */
extern void T78f10(T0* C, T4 a1, T4 a2);
/* PR_TRANSITION.symbol */
extern T0* T79f4(T0* C);
/* PR_VARIABLE.transition */
extern T0* T70f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].go_after */
extern void T84f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_go_after */
extern void T73f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_after */
extern void T84f13(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].make */
extern T0* T78c6(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].make */
extern T0* T179f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_STATE].make_area */
extern T0* T257c2(T4 a1);
/* SPECIAL [PR_STATE].make */
extern T0* T93c4(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].default_create */
extern T0* T179c3();
/* PR_GRAMMAR.max_rhs */
extern T4 T26f4(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].force_last */
extern void T73f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].put_right */
extern void T195f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].make */
extern T0* T195c3(T0* a1);
/* PR_VARIABLE.put_transition */
extern void T70f19(T0* C, T0* a1);
/* PR_TRANSITION.make */
extern T0* T79c7(T0* a1, T0* a2);
/* DS_LINKED_LIST [PR_REDUCTION].append_last */
extern void T71f9(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].is_empty */
extern T2 T71f3(T0* C);
/* DS_LINKABLE [PR_REDUCTION].put_right */
extern void T194f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].after */
extern T2 T207f3(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_after */
extern T2 T82f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T207f9(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_forth */
extern void T82f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_position */
extern void T207f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T82f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T207f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T82f22(T0* C, T0* a1);
/* DS_LINKABLE [PR_REDUCTION].make */
extern T0* T194c3(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T207f2(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_item */
extern T0* T82f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].start */
extern void T207f8(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_start */
extern void T82f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].off */
extern T2 T207f5(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_off */
extern T2 T82f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_before */
extern T2 T82f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].new_cursor */
extern T0* T82f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T207c7(T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].is_empty */
extern T2 T82f8(T0* C);
/* PR_STATE.set_lookahead_needed */
extern void T56f31(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].is_empty */
extern T2 T54f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].make */
extern T0* T73c8();
/* DS_LINKED_LIST [PR_REDUCTION].make */
extern T0* T71c8();
/* PR_FSM.build_nondeterministic */
extern void T19f18(T0* C);
/* PR_FSM.put_final_state */
extern void T19f23(T0* C);
/* PR_TOKEN.make */
extern T0* T81c20(T4 a1, T0* a2, T0* a3);
/* PR_FSM.no_type */
extern unsigned char ge173os1335;
extern T0* ge173ov1335;
extern T0* T19f9(T0* C);
/* DS_ARRAYED_LIST [PR_TYPE].first */
extern T0* T109f4(T0* C);
/* PR_TYPE.make */
extern T0* T96c8(T4 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_STATE].force_last */
extern void T54f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].new_capacity */
extern T4 T54f11(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_STATE].put_last */
extern void T54f17(T0* C, T0* a1);
/* PR_STATE.make */
extern T0* T56c25(T4 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_REDUCTION].make */
extern T0* T82c16(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].make */
extern T0* T205f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_REDUCTION].make_area */
extern T0* T264c2(T4 a1);
/* SPECIAL [PR_REDUCTION].make */
extern T0* T206c4(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].default_create */
extern T0* T205c3();
/* DS_ARRAYED_LIST [PR_POSITION].make_equal */
extern T0* T64c14(T4 a1);
/* KL_EQUALITY_TESTER [PR_POSITION].default_create */
extern T0* T187c2();
/* PR_STATE.has_shift */
extern T2 T56f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].first */
extern T0* T54f5(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].resize */
extern void T54f16(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].resize */
extern T0* T179f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_STATE].resized_area */
extern T0* T93f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_STATE].extendible */
extern T2 T54f3(T0* C, T4 a1);
/* PR_FSM.build_transitions */
extern void T19f22(T0* C, T0* a1);
/* PR_FSM.new_state */
extern T0* T19f8(T0* C, T0* a1);
/* PR_STATE.set_id */
extern void T56f28(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].put */
extern void T55f35(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_put */
extern void T55f46(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_put */
extern void T55f40(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_put */
extern void T55f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_item */
extern T4 T55f16(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_item */
extern T4 T55f12(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_put */
extern void T55f45(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].search_position */
extern void T55f36(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].hash_position */
extern T4 T55f15(T0* C, T4 a1);
/* INTEGER.hash_code */
extern T4 T4f17(T4* C);
/* INTEGER.infix "&" */
extern T4 T4f18(T4* C, T4 a1);
/* KL_EQUALITY_TESTER [INTEGER].test */
extern T2 T38f1(T0* C, T4 a1, T4 a2);
/* INTEGER.is_equal */
extern T2 T4f16(T4* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_item */
extern T4 T55f14(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].unset_found_item */
extern void T55f38(T0* C);
/* PR_STATE.same_state */
extern T2 T56f3(T0* C, T0* a1);
/* PR_POSITION.same_position */
extern T2 T65f7(T0* C, T0* a1);
/* PR_STATE.any_ */
extern T0* T56f4(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].item */
extern T0* T55f3(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_item */
extern T0* T55f6(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].has */
extern T2 T55f2(T0* C, T4 a1);
/* PR_STATE.sort_positions */
extern void T56f26(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].sort */
extern void T64f15(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort */
extern void T184f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort_with_comparator */
extern void T184f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_POSITION].subsort_with_comparator */
extern void T184f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* DS_ARRAYED_LIST [PR_POSITION].replace */
extern void T64f17(T0* C, T0* a1, T4 a2);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].less_than */
extern T2 T245f1(T0* C, T0* a1, T0* a2);
/* PR_POSITION.infix "<" */
extern T2 T65f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_empty */
extern T2 T64f11(T0* C);
/* PR_STATE.position_sorter */
extern unsigned char ge176os3050;
extern T0* ge176ov3050;
extern T0* T56f14(T0* C);
/* DS_BUBBLE_SORTER [PR_POSITION].make */
extern T0* T184c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].make */
extern T0* T245c2();
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].resize */
extern void T55f34(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_resize */
extern void T55f44(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T129f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T98f4(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].special_integer_ */
extern T0* T55f25(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_resize */
extern void T55f43(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_resize */
extern void T55f42(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].resize */
extern T0* T182f1(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].resized_area */
extern T0* T181f3(T0* C, T4 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make */
extern T0* T181c4(T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_resize */
extern void T55f39(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].new_modulus */
extern T4 T55f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].put_last */
extern void T82f18(T0* C, T0* a1);
/* PR_REDUCTION.make */
extern T0* T87c5(T0* a1);
/* PR_FSM.put_closure_positions */
extern void T19f24(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].forth */
extern void T97f9(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_forth */
extern void T91f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].add_traversing_cursor */
extern void T91f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T97f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].remove_traversing_cursor */
extern void T91f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set */
extern void T97f10(T0* C, T0* a1, T2 a2, T2 a3);
/* PR_POSITION.make */
extern T0* T65c12(T0* a1, T4 a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].item */
extern T0* T97f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].start */
extern void T97f8(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_start */
extern void T91f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].cursor_off */
extern T2 T91f3(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].new_cursor */
extern T0* T91f1(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].make */
extern T0* T97c7(T0* a1);
/* PR_STATE.put_position */
extern void T56f27(T0* C, T0* a1);
/* PR_POSITION.hash_code */
extern T4 T65f1(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].resize */
extern void T64f16(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].resize */
extern T0* T188f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_POSITION].resized_area */
extern T0* T186f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_full */
extern T2 T64f4(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].has */
extern T2 T64f3(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [PR_POSITION].test */
extern T2 T187f1(T0* C, T0* a1, T0* a2);
/* PR_POSITION.is_equal */
extern T2 T65f11(T0* C, T0* a1);
/* PR_POSITION.next */
extern T0* T65f10(T0* C);
/* ARRAY [PR_STATE].put */
extern void T94f6(T0* C, T0* a1, T4 a2);
/* ARRAY [PR_STATE].item */
extern T0* T94f4(T0* C, T4 a1);
/* PR_POSITION.symbol */
extern T0* T65f9(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].resize */
extern void T82f17(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].resize */
extern T0* T205f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_REDUCTION].resized_area */
extern T0* T206f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].extendible */
extern T2 T82f6(T0* C, T4 a1);
/* ARRAY [PR_STATE].make */
extern T0* T94c5(T4 a1, T4 a2);
/* ARRAY [PR_STATE].make_area */
extern void T94f7(T0* C, T4 a1);
/* PR_FSM.put_start_state */
extern void T19f21(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].put_first */
extern void T54f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].put */
extern void T54f19(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_right */
extern void T54f21(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_right */
extern void T54f20(T0* C, T4 a1, T4 a2);
/* PR_FSM.build_derives */
extern void T19f20(T0* C);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].flatten */
extern void T89f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].traverse */
extern void T89f3(T0* C, T0* a1, T0* a2);
/* PR_VARIABLE.set_derives */
extern void T70f25(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].remove */
extern void T213f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].item */
extern T0* T213f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T218f9(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_forth */
extern void T90f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T90f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T218f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T90f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set */
extern void T218f10(T0* C, T0* a1, T2 a2, T2 a3);
/* PR_VARIABLE.add_derive */
extern void T70f24(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].force_last */
extern void T91f16(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].put_right */
extern void T220f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].make */
extern T0* T220c3(T0* a1);
/* DS_LINKED_LIST [PR_RULE].is_empty */
extern T2 T91f7(T0* C);
/* DS_LINKED_LIST [PR_RULE].has */
extern T2 T91f5(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T218f4(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].start */
extern void T218f8(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_start */
extern void T90f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_off */
extern T2 T90f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].new_cursor */
extern T0* T90f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T218c7(T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].force */
extern void T213f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].resize */
extern void T213f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].resize */
extern T0* T267f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].resized_area */
extern T0* T266f3(T0* C, T4 a1);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T266c4(T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].new_capacity */
extern T4 T213f7(T0* C, T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].extendible */
extern T2 T213f6(T0* C, T4 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T213c8(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T267f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_NESTED_LIST [PR_RULE]].make_area */
extern T0* T275c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].default_create */
extern T0* T267c3();
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T210f11(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_forth */
extern void T88f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_position */
extern void T210f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T88f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T210f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T88f38(T0* C, T0* a1);
/* PR_VARIABLE.set_index */
extern void T70f23(T0* C, T4 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T210f4(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_item */
extern T0* T88f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].after */
extern T2 T210f3(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_after */
extern T2 T88f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].start */
extern void T210f10(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_start */
extern void T88f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_empty */
extern T2 T88f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].off */
extern T2 T210f6(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_off */
extern T2 T88f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_before */
extern T2 T88f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].new_cursor */
extern T0* T88f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T210c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].make */
extern T0* T89c1();
/* DS_LINKED_LIST [PR_RULE].append_last */
extern void T91f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].after */
extern T2 T192f5(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_after */
extern T2 T67f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].forth */
extern void T192f11(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_forth */
extern void T67f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_position */
extern void T192f8(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_RULE].add_traversing_cursor */
extern void T67f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T192f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_traversing_cursor */
extern void T67f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].item */
extern T0* T192f4(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_item */
extern T0* T67f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].start */
extern void T192f10(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_start */
extern void T67f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].off */
extern T2 T192f6(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_off */
extern T2 T67f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].cursor_before */
extern T2 T67f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].new_cursor */
extern T0* T67f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].make */
extern T0* T192c7(T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].is_empty */
extern T2 T67f3(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].force_last */
extern void T90f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].put_right */
extern void T282f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].make */
extern T0* T282c3(T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].is_empty */
extern T2 T90f3(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].first */
extern T0* T77f10(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_empty */
extern T2 T77f9(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make */
extern T0* T55c33(T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_with_equality_testers */
extern void T55f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_sparse_container */
extern void T55f47(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].new_cursor */
extern T0* T55f31(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER].make */
extern T0* T183c3(T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_slots */
extern void T55f51(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_clashes */
extern void T55f50(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_keys */
extern void T55f49(T0* C, T4 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_items */
extern void T55f48(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].make */
extern T0* T182f2(T0* C, T4 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make_area */
extern T0* T258c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T182c3();
/* KL_EQUALITY_TESTER [INTEGER].default_create */
extern T0* T38c2();
/* DS_ARRAYED_LIST [PR_STATE].make */
extern T0* T54c14(T4 a1);
/* DS_ARRAYED_LIST [PR_STATE].new_cursor */
extern T0* T54f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].make */
extern T0* T180c4(T0* a1);
/* PR_GRAMMAR.set_nullable */
extern void T26f21(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_last */
extern void T88f23(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_last_cursors_after */
extern void T88f27(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].last */
extern T0* T88f5(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].first */
extern T0* T88f4(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].item */
extern T0* T169f2(T0* C, T4 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].wipe_out */
extern void T169f11(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].clear_items */
extern void T169f13(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].move_all_cursors_after */
extern void T169f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_next_cursor */
extern void T255f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_position */
extern void T255f5(T0* C, T4 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].put_last */
extern void T169f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_last */
extern void T88f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_first */
extern void T88f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put */
extern void T88f26(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_right */
extern void T88f33(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_right */
extern void T88f32(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].make */
extern T0* T88c20(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].make */
extern T0* T209f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_VARIABLE].make_area */
extern T0* T265c2(T4 a1);
/* SPECIAL [PR_VARIABLE].make */
extern T0* T208c5(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].default_create */
extern T0* T209c3();
/* PR_VARIABLE.set_nullable */
extern void T70f20(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T169c9(T4 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].new_cursor */
extern T0* T169f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T255c4(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T254f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make_area */
extern T0* T273c2(T4 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T253c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T254c2();
/* PR_GRAMMAR.reduce */
extern void T26f23(T0* C, T0* a1);
/* PR_GRAMMAR.integer_ */
extern T0* T26f14(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove */
extern void T88f24(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_left */
extern void T88f29(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_left */
extern void T88f28(T0* C, T4 a1);
/* PR_VARIABLE.set_id */
extern void T70f22(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove */
extern void T67f22(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_RULE].move_left */
extern void T67f28(T0* C, T4 a1, T4 a2);
/* DS_ARRAYED_LIST [PR_RULE].move_cursors_left */
extern void T67f27(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_last */
extern void T67f26(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].move_last_cursors_after */
extern void T67f31(T0* C);
/* PR_RULE.set_id */
extern void T69f28(T0* C, T4 a1);
/* PR_GRAMMAR.mark_useful_rules */
extern void T26f29(T0* C);
/* PR_RULE.set_useful */
extern void T69f29(T0* C, T2 a1);
/* PR_GRAMMAR.traverse_variable */
extern void T26f30(T0* C, T0* a1);
/* PR_TOKEN.set_useful */
extern void T81f28(T0* C, T2 a1);
/* PR_VARIABLE.set_useful */
extern void T70f18(T0* C, T2 a1);
/* PR_GRAMMAR.mark_useful_variables */
extern void T26f28(T0* C);
/* PR_FSM.make_verbose */
extern T0* T19c10(T0* a1, T0* a2, T0* a3);
/* PR_FSM.print_machine */
extern void T19f15(T0* C, T0* a1);
/* PR_STATE.print_state */
extern void T56f30(T0* C, T0* a1);
/* PR_STATE.print_reductions */
extern void T56f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extend_last */
extern void T95f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].forth */
extern void T219f9(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_forth */
extern void T95f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T95f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T95f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T219f3(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_item */
extern T0* T95f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].after */
extern T2 T219f2(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_after */
extern T2 T95f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].start */
extern void T219f8(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_start */
extern void T95f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].off */
extern T2 T219f6(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_off */
extern T2 T95f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_before */
extern T2 T95f18(T0* C, T0* a1);
/* PR_POSITION.print_position */
extern void T65f13(T0* C, T0* a1);
/* PR_GRAMMAR.print_grammar */
extern void T26f22(T0* C, T0* a1);
/* PR_VARIABLE.print_variable */
extern void T70f21(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_SYMBOL].has */
extern T2 T77f11(T0* C, T0* a1);
/* PR_TOKEN.print_token */
extern void T81f30(T0* C, T0* a1, T0* a2);
/* PR_RULE.print_rule */
extern void T69f27(T0* C, T0* a1);
/* PR_FSM.set_error_actions_verbose */
extern void T19f14(T0* C, T0* a1, T0* a2);
/* PR_FSM.resolve_conflicts_verbose */
extern void T19f13(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].forth */
extern void T276f9(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_forth */
extern void T60f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].add_traversing_cursor */
extern void T60f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set_next_cursor */
extern void T276f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].remove_traversing_cursor */
extern void T60f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set */
extern void T276f10(T0* C, T0* a1, T2 a2, T2 a3);
/* PR_CONFLICT.print_conflict */
extern void T62f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].item */
extern T0* T276f2(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].start */
extern void T276f8(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_start */
extern void T60f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_off */
extern T2 T60f7(T0* C, T0* a1);
/* PR_GRAMMAR.reduce_verbose */
extern void T26f20(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_RULE].cloned_object */
extern T0* T67f5(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].twin */
extern T0* T67f8(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].copy */
extern void T67f25(T0* C, T0* a1);
/* SPECIAL [PR_RULE].twin */
extern T0* T190f4(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].valid_cursor */
extern T2 T67f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].move_all_cursors_after */
extern void T67f29(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cloned_object */
extern T0* T88f3(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].twin */
extern T0* T88f7(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].copy */
extern void T88f25(T0* C, T0* a1);
/* SPECIAL [PR_VARIABLE].twin */
extern T0* T208f2(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].valid_cursor */
extern T2 T88f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_all_cursors_after */
extern void T88f30(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge290os2353;
extern T0* ge290ov2353;
extern T0* T32f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T33c9();
/* KL_STDOUT_FILE.make_open_stdout */
extern void T33f15(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T33f19(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T33f4(T0* C, T4 a1);
/* KL_STDOUT_FILE.old_make */
extern void T33f18(T0* C, T0* a1);
/* GEYACC.std */
extern unsigned char ge288os1312;
extern T0* ge288ov1312;
extern T0* T18f9(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T32c4();
/* KL_EXCEPTIONS.die */
extern void T31f2(T0* C, T4 a1);
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
/* GEYACC.exceptions */
extern unsigned char ge306os1309;
extern T0* ge306ov1309;
extern T0* T18f8(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T31c1();
/* UT_ERROR_HANDLER.report_error */
extern void T25f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T25f10(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T22c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T21f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T21f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T21f33(T0* C, T14 a1);
/* PR_HTML_DOC_GENERATOR.print_grammar */
extern void T28f5(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_footer */
extern void T28f8(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rules */
extern void T28f7(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_footer */
extern void T28f17(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_header */
extern void T28f16(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_lhs */
extern void T28f15(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_rule_header */
extern void T28f14(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rule_footer */
extern void T28f13(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_footer */
extern void T28f12(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rhs */
extern void T28f11(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_variable */
extern void T28f20(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_token */
extern void T28f19(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_escaped */
extern void T28f21(T0* C, T0* a1, T0* a2);
/* STRING.substring */
extern T0* T16f5(T0* C, T4 a1, T4 a2);
/* STRING.set_count */
extern void T16f30(T0* C, T4 a1);
/* STRING.new_string */
extern T0* T16f8(T0* C, T4 a1);
/* PR_HTML_DOC_GENERATOR.print_empty_rhs */
extern void T28f18(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_header */
extern void T28f10(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_header */
extern void T28f6(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_css */
extern void T28f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar */
extern void T27f5(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_footer */
extern void T27f8(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rules */
extern void T27f7(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_footer */
extern void T27f16(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_header */
extern void T27f15(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_lhs */
extern void T27f14(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_rule_header */
extern void T27f13(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rule_footer */
extern void T27f12(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_footer */
extern void T27f11(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rhs */
extern void T27f10(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_variable */
extern void T27f19(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_token */
extern void T27f18(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_escaped */
extern void T27f20(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_empty_rhs */
extern void T27f17(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_header */
extern void T27f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_header */
extern void T27f6(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T2 T21f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T2 T21f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T21f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T2 T21f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T2 T21f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T21f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T21f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T21f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T21f18(T0* C, T14 a1, T4 a2);
/* STRING.to_c */
extern T0* T16f3(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T21c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T21f28(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.set_lhs_shared */
extern void T28f4(T0* C, T2 a1);
/* PR_XML_DOC_GENERATOR.set_lhs_shared */
extern void T27f4(T0* C, T2 a1);
/* PR_HTML_DOC_GENERATOR.make */
extern T0* T28c3(T0* a1);
/* PR_XML_DOC_GENERATOR.make */
extern T0* T27c3(T0* a1);
/* STRING.is_equal */
extern T2 T16f4(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f7(T0* C, T0* a1, T0* a2, T4 a3);
/* GEYACC.parse_input_file */
extern void T18f21(T0* C);
/* KL_STANDARD_FILES.input */
extern unsigned char ge290os2352;
extern T0* ge290ov2352;
extern T0* T32f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T51c18();
/* KL_STDIN_FILE.make_open_stdin */
extern void T51f19(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T51f21(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T51f3(T0* C, T4 a1);
/* KL_STDIN_FILE.old_make */
extern void T51f20(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T49c7(T0* a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T48f37(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T48f40(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T48f41(T0* C, T14 a1);
/* PR_YACC_PARSER.parse_file */
extern void T47f257(T0* C, T0* a1);
/* PR_YACC_PARSER.parse */
extern void T47f261(T0* C);
/* PR_YACC_PARSER.yy_clear_all */
extern void T47f275(T0* C);
/* PR_YACC_PARSER.clear_all */
extern void T47f301(T0* C);
/* PR_YACC_PARSER.clear_stacks */
extern void T47f319(T0* C);
/* PR_YACC_PARSER.yy_clear_value_stacks */
extern void T47f322(T0* C);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].clear_all */
extern void T137f6(T0* C);
/* SPECIAL [PR_TYPE].clear_all */
extern void T135f6(T0* C);
/* SPECIAL [PR_TOKEN].clear_all */
extern void T139f6(T0* C);
/* SPECIAL [INTEGER].clear_all */
extern void T98f10(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T120f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T131f6(T0* C);
/* PR_YACC_PARSER.yy_pop_last_value */
extern void T47f274(T0* C, T4 a1);
/* PR_YACC_PARSER.yy_push_error_value */
extern void T47f273(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T132f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T131f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T131c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T132f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T234c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T132c3();
/* PR_YACC_PARSER.yy_do_action */
extern void T47f272(T0* C, T4 a1);
/* PR_GRAMMAR.set_eiffel_code */
extern void T26f25(T0* C, T0* a1);
/* PR_YACC_PARSER.report_prec_not_token_error */
extern void T47f300(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.make */
extern T0* T150c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.filename */
extern T0* T47f229(T0* C);
/* PR_YACC_PARSER.new_token */
extern T0* T47f177(T0* C, T0* a1);
/* PR_GRAMMAR.put_token */
extern void T26f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].is_full */
extern T2 T95f8(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING].force */
extern void T124f35(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_put */
extern void T124f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_put */
extern void T124f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_put */
extern void T124f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_item */
extern T4 T124f17(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_item */
extern T4 T124f16(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].hash_position */
extern T4 T124f11(T0* C, T0* a1);
/* STRING.hash_code */
extern T4 T16f22(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f20(T4* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].resize */
extern void T124f40(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_resize */
extern void T124f48(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].special_integer_ */
extern T0* T124f30(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_resize */
extern void T124f47(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T133f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T120f3(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].items_resize */
extern void T124f46(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_item */
extern T0* T124f20(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_resize */
extern void T124f45(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].new_modulus */
extern T4 T124f23(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].new_capacity */
extern T4 T124f10(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].items_put */
extern void T124f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].search_position */
extern void T124f36(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [STRING].test */
extern T2 T39f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING].unset_found_item */
extern void T124f38(T0* C);
/* PR_YACC_PARSER.unknown_type */
extern unsigned char ge201os3352;
extern T0* ge201ov3352;
extern T0* T47f244(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING].item */
extern T0* T124f2(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].items_item */
extern T0* T124f5(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].has */
extern T2 T124f1(T0* C, T0* a1);
/* STRING.as_lower */
extern T0* T16f10(T0* C);
/* STRING.to_lower */
extern void T16f33(T0* C);
/* STRING.twin */
extern T0* T16f9(T0* C);
/* STRING.copy */
extern void T16f32(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f3(T0* C);
/* PR_YACC_PARSER.report_prec_specified_twice_error */
extern void T47f299(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.make */
extern T0* T149c7(T0* a1, T4 a2);
/* PR_YACC_PARSER.put_action */
extern void T47f298(T0* C, T0* a1, T0* a2);
/* PR_RULE.put_symbol */
extern void T69f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].put_last */
extern void T141f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].resize */
extern void T141f11(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].resize */
extern T0* T239f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_ERROR_ACTION].resized_area */
extern T0* T240f2(T0* C, T4 a1);
/* SPECIAL [PR_ERROR_ACTION].make */
extern T0* T240c4(T4 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].is_full */
extern T2 T141f2(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].put_last */
extern void T77f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].resize */
extern void T77f14(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].resize */
extern T0* T203f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_SYMBOL].resized_area */
extern T0* T202f3(T0* C, T4 a1);
/* SPECIAL [PR_SYMBOL].make */
extern T0* T202c4(T4 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_full */
extern T2 T77f3(T0* C);
/* PR_RULE.set_action */
extern void T69f24(T0* C, T0* a1);
/* PR_VARIABLE.set_type */
extern void T70f16(T0* C, T0* a1);
/* PR_YACC_PARSER.no_action */
extern unsigned char ge201os3350;
extern T0* ge201ov3350;
extern T0* T47f231(T0* C);
/* PR_ACTION_FACTORY.new_action */
extern T0* T123f1(T0* C, T0* a1);
/* PR_ACTION.make */
extern T0* T171c6(T0* a1);
/* PR_YACC_PARSER.new_action */
extern T0* T47f176(T0* C, T0* a1);
/* PR_YACC_PARSER.new_string_token */
extern T0* T47f175(T0* C, T0* a1);
/* PR_TOKEN.set_literal_string */
extern void T81f22(T0* C, T0* a1);
/* PR_YACC_PARSER.report_undefined_string_token_error */
extern void T47f328(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.make */
extern T0* T176c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.new_char_token */
extern T0* T47f174(T0* C, T0* a1);
/* PR_TOKEN.set_token_id */
extern void T81f21(T0* C, T4 a1);
/* PR_YACC_PARSER.put_symbol */
extern void T47f297(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.new_symbol */
extern T0* T47f173(T0* C, T0* a1);
/* PR_GRAMMAR.put_variable */
extern void T26f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].resize */
extern void T88f34(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].resize */
extern T0* T209f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_VARIABLE].resized_area */
extern T0* T208f4(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_full */
extern T2 T88f14(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].force */
extern void T125f35(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_put */
extern void T125f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_put */
extern void T125f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_put */
extern void T125f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_item */
extern T4 T125f17(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_item */
extern T4 T125f16(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].hash_position */
extern T4 T125f11(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].resize */
extern void T125f40(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_resize */
extern void T125f48(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].special_integer_ */
extern T0* T125f30(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_resize */
extern void T125f47(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_resize */
extern void T125f46(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_item */
extern T0* T125f20(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_resize */
extern void T125f45(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_modulus */
extern T4 T125f23(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_capacity */
extern T4 T125f10(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_put */
extern void T125f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].search_position */
extern void T125f36(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].unset_found_item */
extern void T125f38(T0* C);
/* PR_VARIABLE.make */
extern T0* T70c15(T4 a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [PR_VARIABLE].make */
extern T0* T90c8();
/* DS_LINKED_LIST [PR_RULE].make */
extern T0* T91c10();
/* DS_ARRAYED_LIST [PR_RULE].make */
extern T0* T67c21(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].make */
extern T0* T191f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_RULE].make_area */
extern T0* T260c2(T4 a1);
/* SPECIAL [PR_RULE].make */
extern T0* T190c5(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].default_create */
extern T0* T191c3();
/* DS_HASH_TABLE [PR_VARIABLE, STRING].item */
extern T0* T125f3(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_item */
extern T0* T125f6(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].has */
extern T2 T125f2(T0* C, T0* a1);
/* PR_YACC_PARSER.put_error_action */
extern void T47f296(T0* C, T0* a1, T4 a2, T0* a3);
/* PR_RULE.set_error_action */
extern void T69f22(T0* C, T0* a1, T4 a2);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].replace */
extern void T141f10(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.new_error_action */
extern T0* T47f172(T0* C, T0* a1, T4 a2);
/* PR_ERROR_ACTION.make */
extern T0* T66c6(T0* a1, T4 a2);
/* PR_YACC_PARSER.report_invalid_error_n_error */
extern void T47f295(T0* C, T4 a1);
/* PR_INVALID_ERROR_N_ERROR.make */
extern T0* T148c7(T0* a1, T4 a2, T4 a3);
/* PR_RULE.set_line_nb */
extern void T69f21(T0* C, T4 a1);
/* PR_YACC_PARSER.put_rule */
extern void T47f294(T0* C, T0* a1);
/* PR_GRAMMAR.put_rule */
extern void T26f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].put_last */
extern void T67f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].resize */
extern void T67f23(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].resize */
extern T0* T191f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_RULE].resized_area */
extern T0* T190f3(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_RULE].is_full */
extern T2 T67f6(T0* C);
/* PR_YACC_PARSER.report_rule_declared_twice_warning */
extern void T47f293(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.make */
extern T0* T147c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.new_variable */
extern T0* T47f171(T0* C, T0* a1);
/* PR_YACC_PARSER.new_rule */
extern T0* T47f170(T0* C, T0* a1);
/* PR_VARIABLE.put_rule */
extern void T70f17(T0* C, T0* a1);
/* PR_RULE.make */
extern T0* T69c16(T4 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].make */
extern T0* T141c9(T4 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].new_cursor */
extern T0* T141f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION].make */
extern T0* T241c2(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].make */
extern T0* T239f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_ERROR_ACTION].make_area */
extern T0* T269c2(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].default_create */
extern T0* T239c3();
/* DS_ARRAYED_LIST [PR_SYMBOL].make */
extern T0* T77c13(T4 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].new_cursor */
extern T0* T77f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL].make */
extern T0* T204c2(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].make */
extern T0* T203f1(T0* C, T4 a1);
/* TO_SPECIAL [PR_SYMBOL].make_area */
extern T0* T263c2(T4 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].default_create */
extern T0* T203c3();
/* PR_YACC_PARSER.new_dummy_variable */
extern T0* T47f169(T0* C);
/* PR_YACC_PARSER.integer_ */
extern T0* T47f243(T0* C);
/* PR_YACC_PARSER.report_lhs_symbol_token_error */
extern void T47f292(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.make */
extern T0* T146c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.is_terminal */
extern T2 T47f168(T0* C, T0* a1);
/* PR_YACC_PARSER.process_rule */
extern void T47f291(T0* C, T0* a1);
/* PR_RULE.set_precedence */
extern void T69f20(T0* C, T4 a1);
/* PR_RULE.set_non_associative */
extern void T69f19(T0* C);
/* PR_RULE.set_right_associative */
extern void T69f18(T0* C);
/* PR_RULE.set_left_associative */
extern void T69f17(T0* C);
/* PR_YACC_PARSER.report_no_rules_error */
extern void T47f290(T0* C);
/* PR_NO_RULES_ERROR.make */
extern T0* T145c7(T0* a1);
/* PR_YACC_PARSER.new_nonterminal */
extern T0* T47f165(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_variable_declared_twice_error */
extern void T47f327(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.make */
extern T0* T175c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.is_nonterminal */
extern T2 T47f230(T0* C, T0* a1);
/* PR_YACC_PARSER.report_variable_declared_as_token_error */
extern void T47f326(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.make */
extern T0* T174c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.new_nonassoc_char_terminal */
extern T0* T47f164(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.set_precedence */
extern void T47f325(T0* C, T0* a1, T4 a2);
/* PR_TOKEN.set_precedence */
extern void T81f29(T0* C, T4 a1);
/* PR_YACC_PARSER.report_precedence_defined_twice_error */
extern void T47f329(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.make */
extern T0* T177c7(T0* a1, T4 a2, T0* a3);
/* PR_TOKEN.set_non_associative */
extern void T81f27(T0* C);
/* PR_YACC_PARSER.new_nonassoc_terminal */
extern T0* T47f163(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.report_token_declared_as_variable_error */
extern void T47f323(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.make */
extern T0* T172c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.new_right_char_terminal */
extern T0* T47f162(T0* C, T0* a1, T4 a2);
/* PR_TOKEN.set_right_associative */
extern void T81f26(T0* C);
/* PR_YACC_PARSER.new_right_terminal */
extern T0* T47f161(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.new_left_char_terminal */
extern T0* T47f160(T0* C, T0* a1, T4 a2);
/* PR_TOKEN.set_left_associative */
extern void T81f25(T0* C);
/* PR_YACC_PARSER.new_left_terminal */
extern T0* T47f159(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.new_char_terminal */
extern T0* T47f158(T0* C, T0* a1, T0* a2);
/* PR_TOKEN.set_type */
extern void T81f24(T0* C, T0* a1);
/* PR_TOKEN.set_declared */
extern void T81f23(T0* C);
/* PR_YACC_PARSER.report_token_declared_twice_error */
extern void T47f324(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.make */
extern T0* T173c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.set_literal_string */
extern void T47f289(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_string_token_defined_twice_error */
extern void T47f318(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.make */
extern T0* T161c7(T0* a1, T4 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.report_two_strings_token_error */
extern void T47f317(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_TWO_STRINGS_TOKEN_ERROR.make */
extern T0* T160c7(T0* a1, T4 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.set_token_id */
extern void T47f288(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.report_two_token_ids_token_error */
extern void T47f316(T0* C, T0* a1, T4 a2, T4 a3);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.make */
extern T0* T159c7(T0* a1, T4 a2, T0* a3, T4 a4, T4 a5);
/* PR_TOKEN.has_token_id */
extern T2 T81f1(T0* C);
/* PR_YACC_PARSER.new_terminal */
extern T0* T47f154(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_TYPE].force_last */
extern void T109f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].resize */
extern void T109f15(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_capacity */
extern T4 T109f11(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TYPE].extendible */
extern T2 T109f10(T0* C, T4 a1);
/* DS_ARRAYED_LIST [PR_TYPE].make */
extern T0* T109c13(T4 a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_cursor */
extern T0* T109f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TYPE].make */
extern T0* T228c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].resize */
extern T0* T138f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].resized_area */
extern T0* T137f3(T0* C, T4 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make */
extern T0* T137c4(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].make */
extern T0* T138f1(T0* C, T4 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make_area */
extern T0* T237c2(T4 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].default_create */
extern T0* T138c3();
/* PR_YACC_PARSER.new_anchored_type */
extern T0* T47f151(T0* C, T0* a1);
/* PR_GRAMMAR.put_type */
extern void T26f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].put_last */
extern void T109f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_full */
extern T2 T109f12(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING].force */
extern void T126f35(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].keys_put */
extern void T126f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].slots_put */
extern void T126f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_put */
extern void T126f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].slots_item */
extern T4 T126f17(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_item */
extern T4 T126f16(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].hash_position */
extern T4 T126f11(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].resize */
extern void T126f40(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_resize */
extern void T126f48(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].special_integer_ */
extern T0* T126f30(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING].keys_resize */
extern void T126f47(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].items_resize */
extern void T126f46(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].keys_item */
extern T0* T126f20(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].slots_resize */
extern void T126f45(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].new_modulus */
extern T4 T126f23(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].new_capacity */
extern T4 T126f10(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].items_put */
extern void T126f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].search_position */
extern void T126f36(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].unset_found_item */
extern void T126f38(T0* C);
/* PR_TYPE.make_anchored */
extern T0* T96c10(T4 a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING].item */
extern T0* T126f2(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].items_item */
extern T0* T126f5(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].has */
extern T2 T126f1(T0* C, T0* a1);
/* PR_YACC_PARSER.new_generic_type */
extern T0* T47f150(T0* C, T0* a1, T0* a2);
/* STRING.as_upper */
extern T0* T16f6(T0* C);
/* STRING.to_upper */
extern void T16f31(T0* C);
/* CHARACTER.upper */
extern T1 T1f2(T1* C);
/* CHARACTER.is_lower */
extern T2 T1f6(T1* C);
/* PR_TYPE.make_generic */
extern T0* T96c9(T4 a1, T0* a2, T0* a3);
/* PR_YACC_PARSER.new_basic_type */
extern T0* T47f148(T0* C, T0* a1);
/* PR_BASIC_TYPE.make */
extern T0* T170c8(T4 a1, T0* a2);
/* KL_SPECIAL_ROUTINES [PR_TYPE].resize */
extern T0* T136f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [PR_TYPE].resized_area */
extern T0* T135f3(T0* C, T4 a1);
/* PR_YACC_PARSER.new_type */
extern T0* T47f145(T0* C, T0* a1);
/* PR_YACC_PARSER.no_type */
extern unsigned char ge201os3351;
extern T0* ge201ov3351;
extern T0* T47f143(T0* C);
/* PR_GRAMMAR.set_expected_conflicts */
extern void T26f24(T0* C, T4 a1);
/* DS_PAIR [STRING, INTEGER].make */
extern T0* T134c3(T0* a1, T4 a2);
/* PR_YACC_PARSER.report_multiple_start_declarations_error */
extern void T47f287(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.make */
extern T0* T144c7(T0* a1, T4 a2);
/* DS_ARRAYED_LIST [STRING].force_last */
extern void T108f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING].resize */
extern void T108f12(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].new_capacity */
extern T4 T108f9(T0* C, T4 a1);
/* DS_ARRAYED_LIST [STRING].extendible */
extern T2 T108f8(T0* C, T4 a1);
/* PR_YACC_PARSER.initialize_grammar */
extern void T47f286(T0* C);
/* PR_YACC_PARSER.process_symbols */
extern void T47f285(T0* C);
/* PR_YACC_PARSER.report_undefined_symbol_error */
extern void T47f315(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.make */
extern T0* T158c7(T0* a1, T0* a2);
/* ARRAY [PR_TOKEN].put */
extern void T143f6(T0* C, T0* a1, T4 a2);
/* PR_YACC_PARSER.report_token_id_used_twice_warning */
extern void T47f314(T0* C, T0* a1, T0* a2);
/* PR_TOKEN_ID_USED_TWICE_ERROR.make */
extern T0* T157c7(T0* a1, T0* a2, T0* a3, T4 a4);
/* ARRAY [PR_TOKEN].item */
extern T0* T143f4(T0* C, T4 a1);
/* ARRAY [PR_TOKEN].make */
extern T0* T143c5(T4 a1, T4 a2);
/* ARRAY [PR_TOKEN].make_area */
extern void T143f7(T0* C, T4 a1);
/* PR_YACC_PARSER.set_start_symbol */
extern void T47f284(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].first */
extern T0* T67f4(T0* C);
/* PR_GRAMMAR.set_start_symbol */
extern void T26f26(T0* C, T0* a1);
/* PR_YACC_PARSER.report_unknown_start_symbol_error */
extern void T47f313(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.make */
extern T0* T156c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.report_start_symbol_token_error */
extern void T47f312(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.make */
extern T0* T155c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.yy_push_last_value */
extern void T47f271(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T133f1(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T235c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T133c3();
/* PR_YACC_PARSER.accept */
extern void T47f270(T0* C);
/* PR_YACC_PARSER.abort */
extern void T47f269(T0* C);
/* PR_YACC_PARSER.yy_do_error_action */
extern void T47f268(T0* C, T4 a1);
/* PR_YACC_PARSER.report_error */
extern void T47f283(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T142c7(T0* a1, T4 a2);
/* PR_YACC_PARSER.report_eof_expected_error */
extern void T47f282(T0* C);
/* PR_YACC_PARSER.read_token */
extern void T47f267(T0* C);
/* PR_YACC_PARSER.yy_execute_action */
extern void T47f281(T0* C, T4 a1);
/* PR_YACC_PARSER.text_item */
extern T1 T47f228(T0* C, T4 a1);
/* STRING.wipe_out */
extern void T16f27(T0* C);
/* PR_YACC_PARSER.cloned_string */
extern T0* T47f184(T0* C, T0* a1);
/* PR_YACC_PARSER.process_dollar_n */
extern void T47f311(T0* C, T4 a1, T4 a2, T0* a3);
/* PR_BASIC_TYPE.append_dollar_n_to_string */
extern void T170f23(T0* C, T4 a1, T4 a2, T0* a3, T0* a4);
/* PR_BASIC_TYPE.integer_ */
extern T0* T170f7(T0* C);
/* PR_TYPE.append_dollar_n_to_string */
extern void T96f25(T0* C, T4 a1, T4 a2, T0* a3, T0* a4);
/* PR_TYPE.integer_ */
extern T0* T96f3(T0* C);
/* PR_BASIC_TYPE.old_append_dollar_n_to_string */
extern void T170f22(T0* C, T4 a1, T4 a2, T0* a3, T0* a4);
/* PR_TYPE.old_append_dollar_n_to_string */
extern void T96f24(T0* C, T4 a1, T4 a2, T0* a3, T0* a4);
/* PR_YACC_PARSER.report_invalid_dollar_n_error */
extern void T47f321(T0* C, T4 a1);
/* PR_INVALID_DOLLAR_N_ERROR.make */
extern T0* T163c7(T0* a1, T4 a2, T4 a3);
/* PR_YACC_PARSER.report_dangerous_dollar_n_warning */
extern void T47f320(T0* C, T4 a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.make */
extern T0* T162c7(T0* a1, T4 a2, T4 a3);
/* PR_YACC_PARSER.process_dollar_dollar */
extern void T47f310(T0* C, T0* a1);
/* PR_BASIC_TYPE.append_dollar_dollar_to_string */
extern void T170f10(T0* C, T0* a1);
/* PR_TYPE.append_dollar_dollar_to_string */
extern void T96f12(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_append_dollar_dollar_to_string */
extern void T170f9(T0* C, T0* a1);
/* PR_TYPE.old_append_dollar_dollar_to_string */
extern void T96f11(T0* C, T0* a1);
/* PR_YACC_PARSER.report_invalid_dollar_dollar_error */
extern void T47f309(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.make */
extern T0* T154c7(T0* a1, T4 a2);
/* PR_YACC_PARSER.start_condition */
extern T4 T47f226(T0* C);
/* PR_YACC_PARSER.text_substring */
extern T0* T47f181(T0* C, T4 a1, T4 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T252f2(T0* C, T4 a1, T4 a2);
/* PR_YACC_PARSER.more */
extern void T47f308(T0* C);
/* PR_YACC_PARSER.report_invalid_string_token_error */
extern void T47f307(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.make */
extern T0* T153c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.text_count */
extern T4 T47f180(T0* C);
/* PR_YACC_PARSER.report_null_integer_error */
extern void T47f306(T0* C);
/* PR_NULL_INTEGER_ERROR.make */
extern T0* T152c7(T0* a1, T4 a2);
/* STRING.to_integer */
extern T4 T16f15(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T243f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T243f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T243f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T243f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T271f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T284f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge524os5567;
extern T0* ge524ov5567;
extern T0* T243f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T271c13();
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
extern void T284f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T284c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T284f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T283c2(T4 a1);
/* STRING.has */
extern T2 T16f24(T0* C, T1 a1);
/* CHARACTER.is_digit */
extern T2 T1f19(T1* C);
/* INTEGER.to_natural_64 */
extern T11 T4f21(T4* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T243f21(T0* C, T4 a1);
/* STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T16f21(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T243f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T243f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T243f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c38(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T243f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T243c15();
/* PR_YACC_PARSER.text */
extern T0* T47f202(T0* C);
/* PR_YACC_PARSER.set_start_condition */
extern void T47f304(T0* C, T4 a1);
/* PR_YACC_PARSER.yy_execute_eof_action */
extern void T47f280(T0* C, T4 a1);
/* PR_YACC_PARSER.terminate */
extern void T47f305(T0* C);
/* PR_YACC_PARSER.report_missing_characters_error */
extern void T47f303(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.make */
extern T0* T151c7(T0* a1, T4 a2, T0* a3);
/* PR_YACC_PARSER.wrap */
extern T2 T47f123(T0* C);
/* PR_YACC_PARSER.yy_refill_input_buffer */
extern void T47f279(T0* C);
/* PR_YACC_PARSER.yy_set_content */
extern void T47f277(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T4 T252f4(T0* C);
/* YY_BUFFER.fill */
extern void T128f15(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T127f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T252f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.read_to_string */
extern T4 T51f13(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T4 T51f16(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.file_gss */
extern T4 T51f17(T0* C, T14 a1, T14 a2, T4 a3);
/* SPECIAL [CHARACTER].item_address */
extern T14 T15f5(T0* C, T4 a1);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T256f2(T256* C);
/* KL_STDIN_FILE.any_ */
extern T0* T51f14(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T2 T51f10(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T2 T51f12(T0* C, T14 a1);
/* STRING.put */
extern void T16f39(T0* C, T1 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T48f29(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge372os3980;
extern T0* ge372ov3980;
extern T0* T48f33(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T252c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge378os2363;
extern T2 ge378ov2363;
extern T2 T272f1(T0* C);
/* PLATFORM.default_create */
extern T0* T285c2();
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge308os1496;
extern T0* ge308ov1496;
extern T0* T252f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T272c2();
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T48f32(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T48f34(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T48f30(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T48f26(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T48f28(T0* C, T14 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T252f9(T0* C, T1 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T48f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T51f22(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T51f23(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T1 T51f11(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T48f43(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T48f44(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T48f27(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T127f21(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T252f10(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.subcopy */
extern void T16f40(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_FILE_BUFFER.resize */
extern void T127f23(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T252f11(T0* C, T4 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge132os5017;
extern T4 ge132ov5017;
extern T4 T127f10(T0* C);
/* YY_BUFFER.set_index */
extern void T128f13(T0* C, T4 a1);
/* YY_FILE_BUFFER.set_index */
extern void T127f17(T0* C, T4 a1);
/* PR_YACC_PARSER.yy_null_trans_state */
extern T4 T47f122(T0* C, T4 a1);
/* PR_YACC_PARSER.yy_previous_state */
extern T4 T47f121(T0* C);
/* PR_YACC_PARSER.fatal_error */
extern void T47f278(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T122f12(T0* C, T1 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T122f16(T0* C, T1 a1);
/* KL_STDERR_FILE.console_pc */
extern void T122f20(T0* C, T14 a1, T1 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge290os2354;
extern T0* ge290ov2354;
extern T0* T32f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T122c9();
/* KL_STDERR_FILE.make_open_stderr */
extern void T122f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T122f18(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T122f3(T0* C, T4 a1);
/* KL_STDERR_FILE.old_make */
extern void T122f17(T0* C, T0* a1);
/* PR_YACC_PARSER.std */
extern T0* T47f178(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T1 T252f1(T0* C, T4 a1);
/* PR_YACC_PARSER.special_integer_ */
extern T0* T47f18(T0* C);
/* PR_YACC_PARSER.yy_init_value_stacks */
extern void T47f266(T0* C);
/* PR_YACC_PARSER.set_input_buffer */
extern void T47f260(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_load_input_buffer */
extern void T47f265(T0* C);
/* YY_BUFFER.set_position */
extern void T128f14(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_position */
extern void T127f18(T0* C, T4 a1, T4 a2, T4 a3);
/* PR_YACC_PARSER.new_file_buffer */
extern T0* T47f11(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T127c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T127f20(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T127f22(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T127f24(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T127f15(T0* C, T4 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T48f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T48f2(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T48f36(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T48f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T48f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T48f39(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T48f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T48f39p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T48f20(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T48f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T178f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T178f2(T0* C, T14 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge504os1689;
extern T0* ge504ov1689;
extern T0* T48f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T178c6();
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T178f8(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T178f3(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T48f42(T0* C);
/* UNIX_FILE_INFO.update */
extern void T178f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T178f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T48f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T48f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T48c35(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T48f38(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T48f8(T0* C);
/* PR_YACC_PARSER.set_old_typing */
extern void T47f256(T0* C, T2 a1);
/* PR_YACC_PARSER.make */
extern T0* T47c255(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make */
extern T0* T126c34(T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_with_equality_testers */
extern void T126f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_sparse_container */
extern void T126f44(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].new_cursor */
extern T0* T126f29(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING].make */
extern T0* T232c3(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_slots */
extern void T126f52(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_clashes */
extern void T126f51(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_keys */
extern void T126f50(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING].make_items */
extern void T126f49(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [STRING].default_create */
extern T0* T39c2();
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make */
extern T0* T125c34(T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_with_equality_testers */
extern void T125f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_sparse_container */
extern void T125f44(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_cursor */
extern T0* T125f29(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING].make */
extern T0* T231c3(T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_slots */
extern void T125f52(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_clashes */
extern void T125f51(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_keys */
extern void T125f50(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_items */
extern void T125f49(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make */
extern T0* T124c34(T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_with_equality_testers */
extern void T124f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_sparse_container */
extern void T124f44(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].new_cursor */
extern T0* T124f29(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING].make */
extern T0* T230c3(T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_slots */
extern void T124f52(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_clashes */
extern void T124f51(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_keys */
extern void T124f50(T0* C, T4 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING].make_items */
extern void T124f49(T0* C, T4 a1);
/* PR_GRAMMAR.make */
extern T0* T26c19();
/* DS_ARRAYED_LIST [STRING].make */
extern T0* T108c10(T4 a1);
/* DS_ARRAYED_LIST [STRING].new_cursor */
extern T0* T108f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING].make */
extern T0* T227c2(T0* a1);
/* PR_ACTION_FACTORY.make */
extern T0* T123c2();
/* PR_YACC_PARSER.make_parser_skeleton */
extern void T47f259(T0* C);
/* PR_YACC_PARSER.yy_build_parser_tables */
extern void T47f264(T0* C);
/* PR_YACC_PARSER.yycheck_template */
extern unsigned char ge200os3246;
extern T0* ge200ov3246;
extern T0* T47f74(T0* C);
/* PR_YACC_PARSER.yyfixed_array */
extern T0* T47f241(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T129f3(T0* C, T0* a1);
/* PR_YACC_PARSER.yytable_template */
extern unsigned char ge200os3245;
extern T0* ge200ov3245;
extern T0* T47f73(T0* C);
/* PR_YACC_PARSER.yypgoto_template */
extern unsigned char ge200os3244;
extern T0* ge200ov3244;
extern T0* T47f72(T0* C);
/* PR_YACC_PARSER.yypact_template */
extern unsigned char ge200os3243;
extern T0* ge200ov3243;
extern T0* T47f71(T0* C);
/* PR_YACC_PARSER.yydefgoto_template */
extern unsigned char ge200os3242;
extern T0* ge200ov3242;
extern T0* T47f70(T0* C);
/* PR_YACC_PARSER.yydefact_template */
extern unsigned char ge200os3241;
extern T0* ge200ov3241;
extern T0* T47f69(T0* C);
/* PR_YACC_PARSER.yytypes2_template */
extern unsigned char ge200os3240;
extern T0* ge200ov3240;
extern T0* T47f68(T0* C);
/* PR_YACC_PARSER.yytypes1_template */
extern unsigned char ge200os3239;
extern T0* ge200ov3239;
extern T0* T47f66(T0* C);
/* PR_YACC_PARSER.yyr1_template */
extern unsigned char ge200os3238;
extern T0* ge200ov3238;
extern T0* T47f64(T0* C);
/* PR_YACC_PARSER.yytranslate_template */
extern unsigned char ge200os3237;
extern T0* ge200ov3237;
extern T0* T47f63(T0* C);
/* PR_YACC_PARSER.yy_create_value_stacks */
extern void T47f263(T0* C);
/* PR_YACC_PARSER.make_yacc_scanner */
extern void T47f258(T0* C, T0* a1);
/* PR_YACC_PARSER.make_with_buffer */
extern void T47f262(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_initialize */
extern void T47f276(T0* C);
/* PR_YACC_PARSER.yy_build_tables */
extern void T47f302(T0* C);
/* PR_YACC_PARSER.yy_accept_template */
extern unsigned char ge202os3754;
extern T0* ge202ov3754;
extern T0* T47f238(T0* C);
/* PR_YACC_PARSER.yy_fixed_array */
extern T0* T47f254(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_meta_template */
extern unsigned char ge202os3753;
extern T0* ge202ov3753;
extern T0* T47f237(T0* C);
/* PR_YACC_PARSER.yy_ec_template */
extern unsigned char ge202os3752;
extern T0* ge202ov3752;
extern T0* T47f236(T0* C);
/* PR_YACC_PARSER.yy_def_template */
extern unsigned char ge202os3751;
extern T0* ge202ov3751;
extern T0* T47f235(T0* C);
/* PR_YACC_PARSER.yy_base_template */
extern unsigned char ge202os3750;
extern T0* ge202ov3750;
extern T0* T47f234(T0* C);
/* PR_YACC_PARSER.yy_chk_template */
extern unsigned char ge202os3749;
extern T0* ge202ov3749;
extern T0* T47f233(T0* C);
/* PR_YACC_PARSER.yy_nxt_template */
extern unsigned char ge202os3748;
extern T0* ge202ov3748;
extern T0* T47f232(T0* C);
/* PR_YACC_PARSER.empty_buffer */
extern unsigned char ge137os3603;
extern T0* ge137ov3603;
extern T0* T47f12(T0* C);
/* YY_BUFFER.make */
extern T0* T128c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T128f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T252f12(T0* C, T0* a1, T4 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T128f9(T0* C, T4 a1);
/* GEYACC.read_command_line */
extern void T18f20(T0* C);
/* GEYACC.report_usage_error */
extern void T18f24(T0* C);
/* GEYACC.usage_message */
extern unsigned char ge52os1306;
extern T0* ge52ov1306;
extern T0* T18f17(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T53c7(T0* a1);
/* GEYACC.report_usage_message */
extern void T18f23(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T25f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T25f11(T0* C, T0* a1);
/* GEYACC.report_version_number */
extern void T18f22(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T52c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T24f2(T0* C, T4 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T25c6();
/* UT_ERROR_HANDLER.std */
extern T0* T25f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T24f5(T0* C, T0* a1);
/* GEYACC.arguments */
extern unsigned char ge304os1311;
extern T0* ge304ov1311;
extern T0* T18f1(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T24c4();
/* GEYACC.resurrect_code */
extern void T18f19(T0* C);
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T46c1();
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T45c1();
/* KL_EQUALITY_TESTER [PR_CONFLICT].default_create */
extern T0* T44c1();
/* KL_EQUALITY_TESTER [PR_PORTION].default_create */
extern T0* T43c1();
/* KL_EQUALITY_TESTER [PR_STATE].default_create */
extern T0* T42c1();
/* KL_EQUALITY_TESTER [PR_REDUCTION].default_create */
extern T0* T41c1();
/* KL_EQUALITY_TESTER [PR_TRANSITION].default_create */
extern T0* T40c1();
/* KL_EQUALITY_TESTER [PR_TYPE].default_create */
extern T0* T37c1();
/* KL_EQUALITY_TESTER [PR_VARIABLE].default_create */
extern T0* T36c1();
/* KL_EQUALITY_TESTER [PR_TOKEN].default_create */
extern T0* T35c1();
/* KL_EQUALITY_TESTER [PR_RULE].default_create */
extern T0* T34c1();
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.default_message */
extern T0* T177f1(T0* C);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.message */
extern T0* T177f3(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.arguments */
extern T0* T177f6(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T116f5(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.concat */
extern T0* T116f9(T0* C, T0* a1, T0* a2);
/* STRING.infix "+" */
extern T0* T16f18(T0* C, T0* a1);
/* ARRAY [STRING].item */
extern T0* T121f5(T0* C, T4 a1);
/* ARRAY [STRING].valid_index */
extern T2 T121f4(T0* C, T4 a1);
/* KL_STRING_ROUTINES.is_integer */
extern T2 T116f4(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f5(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f4(T1* C, T1 a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T116f11(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T116f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T116f2(T0* C, T0* a1, T4 a2);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T116f8(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.string_ */
extern T0* T177f4(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.default_message */
extern T0* T176f1(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.message */
extern T0* T176f3(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.arguments */
extern T0* T176f6(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.string_ */
extern T0* T176f4(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.default_message */
extern T0* T175f1(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.message */
extern T0* T175f3(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.arguments */
extern T0* T175f6(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.string_ */
extern T0* T175f4(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.default_message */
extern T0* T174f1(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.message */
extern T0* T174f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.arguments */
extern T0* T174f6(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.string_ */
extern T0* T174f4(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.default_message */
extern T0* T173f1(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.message */
extern T0* T173f3(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.arguments */
extern T0* T173f6(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.string_ */
extern T0* T173f4(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.default_message */
extern T0* T172f1(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.message */
extern T0* T172f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.arguments */
extern T0* T172f6(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.string_ */
extern T0* T172f4(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.default_message */
extern T0* T163f1(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.message */
extern T0* T163f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_N_ERROR.arguments */
extern T0* T163f6(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.string_ */
extern T0* T163f4(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.default_message */
extern T0* T162f1(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.message */
extern T0* T162f3(T0* C, T0* a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.arguments */
extern T0* T162f6(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.string_ */
extern T0* T162f4(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.default_message */
extern T0* T161f1(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.message */
extern T0* T161f3(T0* C, T0* a1);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.arguments */
extern T0* T161f6(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.string_ */
extern T0* T161f4(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.default_message */
extern T0* T160f1(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.message */
extern T0* T160f3(T0* C, T0* a1);
/* PR_TWO_STRINGS_TOKEN_ERROR.arguments */
extern T0* T160f6(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.string_ */
extern T0* T160f4(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.default_message */
extern T0* T159f1(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.message */
extern T0* T159f3(T0* C, T0* a1);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.arguments */
extern T0* T159f6(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.string_ */
extern T0* T159f4(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.default_message */
extern T0* T158f1(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.message */
extern T0* T158f3(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.arguments */
extern T0* T158f6(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.string_ */
extern T0* T158f4(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.default_message */
extern T0* T157f1(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.message */
extern T0* T157f3(T0* C, T0* a1);
/* PR_TOKEN_ID_USED_TWICE_ERROR.arguments */
extern T0* T157f6(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.string_ */
extern T0* T157f4(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.default_message */
extern T0* T156f1(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.message */
extern T0* T156f3(T0* C, T0* a1);
/* PR_UNKNOWN_START_SYMBOL_ERROR.arguments */
extern T0* T156f6(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.string_ */
extern T0* T156f4(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T155f1(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.message */
extern T0* T155f3(T0* C, T0* a1);
/* PR_START_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T155f6(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T155f4(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.default_message */
extern T0* T154f1(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.message */
extern T0* T154f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.arguments */
extern T0* T154f6(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.string_ */
extern T0* T154f4(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.default_message */
extern T0* T153f1(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.message */
extern T0* T153f3(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.arguments */
extern T0* T153f6(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.string_ */
extern T0* T153f4(T0* C);
/* PR_NULL_INTEGER_ERROR.default_message */
extern T0* T152f1(T0* C);
/* PR_NULL_INTEGER_ERROR.message */
extern T0* T152f3(T0* C, T0* a1);
/* PR_NULL_INTEGER_ERROR.arguments */
extern T0* T152f6(T0* C);
/* PR_NULL_INTEGER_ERROR.string_ */
extern T0* T152f4(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.default_message */
extern T0* T151f1(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.message */
extern T0* T151f3(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.arguments */
extern T0* T151f6(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.string_ */
extern T0* T151f4(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.default_message */
extern T0* T150f1(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.message */
extern T0* T150f3(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.arguments */
extern T0* T150f6(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.string_ */
extern T0* T150f4(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.default_message */
extern T0* T149f1(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.message */
extern T0* T149f3(T0* C, T0* a1);
/* PR_PREC_SPECIFIED_TWICE_ERROR.arguments */
extern T0* T149f6(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.string_ */
extern T0* T149f4(T0* C);
/* PR_INVALID_ERROR_N_ERROR.default_message */
extern T0* T148f1(T0* C);
/* PR_INVALID_ERROR_N_ERROR.message */
extern T0* T148f3(T0* C, T0* a1);
/* PR_INVALID_ERROR_N_ERROR.arguments */
extern T0* T148f6(T0* C);
/* PR_INVALID_ERROR_N_ERROR.string_ */
extern T0* T148f4(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.default_message */
extern T0* T147f1(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.message */
extern T0* T147f3(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.arguments */
extern T0* T147f6(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.string_ */
extern T0* T147f4(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T146f1(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.message */
extern T0* T146f3(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T146f6(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T146f4(T0* C);
/* PR_NO_RULES_ERROR.default_message */
extern T0* T145f1(T0* C);
/* PR_NO_RULES_ERROR.message */
extern T0* T145f3(T0* C, T0* a1);
/* PR_NO_RULES_ERROR.arguments */
extern T0* T145f6(T0* C);
/* PR_NO_RULES_ERROR.string_ */
extern T0* T145f4(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.default_message */
extern T0* T144f1(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.message */
extern T0* T144f3(T0* C, T0* a1);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.arguments */
extern T0* T144f6(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.string_ */
extern T0* T144f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T142f1(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T142f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T142f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T142f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T59f1(T0* C);
/* UT_MESSAGE.message */
extern T0* T59f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T59f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T59f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T53f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T53f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T53f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T53f5(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T52f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T52f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T52f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T52f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T49f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T49f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T49f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T49f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T22f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T22f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T22f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T22f5(T0* C);
extern T0* gema99(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge301ov1308;
extern T0* ge180ov1378;
extern T0* ge216ov4852;
extern T0* ge216ov4851;
extern T0* ge216ov4850;
extern T0* ge216ov4849;
extern T0* ge388ov4904;
extern T0* ge386ov1447;
extern T0* ge391ov1447;
extern T0* ge180ov1380;
extern T0* ge384ov1447;
extern T0* ge361ov1477;
extern T0* ge385ov4265;
extern T0* ge372ov3979;
extern T0* ge52ov1302;
extern T0* ge156ov2171;
extern T0* ge168ov2171;
extern T0* ge171ov2171;
extern T0* ge162ov2171;
extern T0* ge164ov2171;
extern T0* ge163ov2171;
extern T0* ge148ov2171;
extern T0* ge146ov2171;
extern T0* ge161ov2171;
extern T0* ge166ov2171;
extern T0* ge167ov2171;
extern T0* ge169ov2171;
extern T0* ge165ov2171;
extern T0* ge170ov2171;
extern T0* ge160ov2171;
extern T0* ge147ov2171;
extern T0* ge150ov2171;
extern T0* ge155ov2171;
extern T0* ge152ov2171;
extern T0* ge157ov2171;
extern T0* ge158ov2171;
extern T0* ge149ov2171;
extern T0* ge159ov2171;
extern T0* ge151ov2171;
extern T0* ge154ov2171;
extern T0* ge153ov2171;
extern T0* ge211ov2171;
extern T0* ge209ov2171;
extern T0* ge214ov2171;
extern T0* ge215ov2171;
extern T0* ge205ov2171;
extern T0* ge206ov2171;
extern EIF_TYPE getypes[];

