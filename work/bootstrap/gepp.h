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
	T4 a9; /* internal_hash_code */
} T16;

/* GEPP */
typedef struct {
	int id;
	T0* a2; /* error_handler */
	T0* a3; /* parser */
	T0* a4; /* in_filename */
	T0* a5; /* out_filename */
} T18;

/* KL_ARGUMENTS */
typedef struct {
	int id;
	T0* a3; /* program_name */
} T19;

/* UT_ERROR_HANDLER */
typedef struct {
	int id;
	T0* a1; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
} T20;

/* GEPP_PARSER */
typedef struct {
	int id;
	T4 a2; /* yy_parsing_status */
	T0* a4; /* error_handler */
	T0* a5; /* defined_values */
	T0* a6; /* include_stack */
	T2 a8; /* makefile_dependencies */
	T2 a9; /* empty_lines */
	T0* a10; /* output_file */
	T4 a14; /* line_nb */
	T0* a15; /* yyss */
	T0* a18; /* input_buffer */
	T4 a19; /* yy_end */
	T4 a20; /* yy_position */
	T4 a21; /* yy_line */
	T4 a22; /* yy_column */
	T4 a24; /* yy_suspended_yystacksize */
	T4 a25; /* yy_suspended_yystate */
	T4 a26; /* yy_suspended_yyn */
	T4 a27; /* yy_suspended_yychar1 */
	T4 a28; /* yy_suspended_index */
	T4 a29; /* yy_suspended_yyss_top */
	T4 a30; /* yy_suspended_yy_goto */
	T4 a32; /* error_count */
	T2 a33; /* yy_lookahead_needed */
	T4 a34; /* yyerrstatus */
	T4 a35; /* yyssp */
	T0* a42; /* yypact */
	T4 a44; /* last_token */
	T0* a47; /* yytranslate */
	T0* a50; /* yycheck */
	T0* a51; /* yytable */
	T0* a53; /* yydefact */
	T0* a55; /* yyr1 */
	T0* a57; /* yypgoto */
	T0* a58; /* yydefgoto */
	T0* a63; /* yytypes1 */
	T0* a65; /* yytypes2 */
	T4 a73; /* yy_start */
	T4 a74; /* yyvsp1 */
	T4 a75; /* yyvsp2 */
	T4 a76; /* yyvsp3 */
	T2 a83; /* yy_more_flag */
	T4 a84; /* yy_more_len */
	T4 a85; /* line */
	T4 a86; /* column */
	T4 a87; /* position */
	T4 a88; /* yy_start_state */
	T0* a90; /* yy_state_stack */
	T4 a91; /* yy_state_count */
	T0* a92; /* yy_ec */
	T0* a93; /* yy_content_area */
	T0* a94; /* yy_content */
	T0* a95; /* yy_accept */
	T4 a96; /* yy_last_accepting_state */
	T4 a97; /* yy_last_accepting_cpos */
	T0* a98; /* yy_chk */
	T0* a99; /* yy_base */
	T0* a100; /* yy_def */
	T0* a101; /* yy_meta */
	T0* a103; /* yy_nxt */
	T4 a105; /* yy_lp */
	T0* a106; /* yy_acclist */
	T4 a109; /* yy_looking_for_trail_begin */
	T4 a111; /* yy_full_match */
	T4 a112; /* yy_full_state */
	T4 a113; /* yy_full_lp */
	T2 a119; /* yy_rejected */
	T4 a121; /* yyvsc1 */
	T0* a122; /* yyvs1 */
	T0* a123; /* yyspecial_routines1 */
	T0* a125; /* last_any_value */
	T4 a126; /* yyvsc2 */
	T0* a127; /* yyvs2 */
	T0* a128; /* yyspecial_routines2 */
	T0* a129; /* last_string_value */
	T4 a130; /* if_level */
	T0* a131; /* yyvs3 */
	T4 a132; /* ignored_level */
	T4 a134; /* yyvsc3 */
	T0* a135; /* yyspecial_routines3 */
} T21;

/* KL_EQUALITY_TESTER [STRING] */
typedef struct {
	int id;
} T22;

/* KL_EXCEPTIONS */
typedef struct {
	int id;
} T23;

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
} T24;

/* KL_TEXT_OUTPUT_FILE */
typedef struct {
	int id;
	T4 a5; /* mode */
	T0* a11; /* name */
	T0* a16; /* string_name */
	T14 a17; /* file_pointer */
	T2 a18; /* descriptor_available */
} T25;

/* KL_STANDARD_FILES */
typedef struct {
	int id;
} T27;

/* KL_STDOUT_FILE */
typedef struct {
	int id;
	T14 a3; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T28;

/* KL_STDIN_FILE */
typedef struct {
	int id;
	T2 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a4; /* name */
	T4 a5; /* mode */
	T1 a9; /* last_character */
	T0* a10; /* character_buffer */
} T29;

/* UT_VERSION_NUMBER */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T31;

/* UT_USAGE_MESSAGE */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T33;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T34;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct {
	int id;
	T0* a1; /* parameters */
} T35;

/* KL_STDERR_FILE */
typedef struct {
	int id;
	T14 a2; /* file_pointer */
	T0* a5; /* name */
	T4 a6; /* mode */
} T36;

/* DS_HASH_TABLE [STRING, STRING] */
typedef struct {
	int id;
	T4 a2; /* position */
	T0* a4; /* key_equality_tester */
	T4 a5; /* count */
	T4 a6; /* capacity */
	T4 a9; /* slots_position */
	T4 a10; /* free_slot */
	T4 a11; /* last_position */
	T4 a15; /* modulus */
	T4 a16; /* clashes_previous_position */
	T0* a18; /* equality_tester */
	T4 a19; /* found_position */
	T0* a20; /* items */
	T0* a23; /* clashes */
	T0* a24; /* slots */
	T0* a25; /* keys */
	T0* a26; /* internal_cursor */
	T0* a29; /* special_item_routines */
	T0* a30; /* special_key_routines */
} T37;

/* DS_ARRAYED_STACK [YY_BUFFER] */
typedef struct {
	int id;
	T4 a2; /* count */
	T4 a5; /* capacity */
	T0* a6; /* storage */
	T0* a7; /* special_routines */
} T38;

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
} T39;

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
} T40;

/* SPECIAL [INTEGER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T4 a2[1]; /* item */
} T41;

/* KL_SPECIAL_ROUTINES [INTEGER] */
typedef struct {
	int id;
} T42;

/* SPECIAL [ANY] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T45;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct {
	int id;
} T46;

/* SPECIAL [STRING] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T47;

/* KL_SPECIAL_ROUTINES [STRING] */
typedef struct {
	int id;
} T48;

/* SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T4 a1; /* count */
	T2 a2[1]; /* item */
} T49;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct {
	int id;
} T50;

/* UT_SYNTAX_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T51;

/* GEPP_TOO_MANY_INCLUDES_ERROR */
typedef struct {
	int id;
	T0* a5; /* parameters */
} T52;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
} T53;

/* KL_STRING_ROUTINES */
typedef struct {
	int id;
} T54;

/* TYPED_POINTER [ANY] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T57;

/* KL_DIRECTORY */
typedef struct {
	int id;
	T0* a2; /* string_name */
	T0* a5; /* name */
	T4 a8; /* mode */
} T58;

/* ARRAY [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T60;

/* ARRAY [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T61;

/* UNIX_FILE_INFO */
typedef struct {
	int id;
	T0* a4; /* file_name */
	T0* a5; /* buffered_file_info */
} T62;

/* KL_OPERATING_SYSTEM */
typedef struct {
	int id;
} T63;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct {
	int id;
	T1 a12; /* secondary_directory_separator */
} T64;

/* KL_UNIX_FILE_SYSTEM */
typedef struct {
	int id;
} T65;

/* DS_HASH_TABLE_CURSOR [STRING, STRING] */
typedef struct {
	int id;
	T4 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
} T66;

/* SPECIAL [YY_BUFFER] */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2[1]; /* item */
} T67;

/* KL_SPECIAL_ROUTINES [YY_BUFFER] */
typedef struct {
	int id;
} T68;

/* TO_SPECIAL [INTEGER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T69;

/* TO_SPECIAL [ANY] */
typedef struct {
	int id;
	T0* a1; /* area */
} T70;

/* TO_SPECIAL [STRING] */
typedef struct {
	int id;
	T0* a1; /* area */
} T71;

/* TO_SPECIAL [BOOLEAN] */
typedef struct {
	int id;
	T0* a1; /* area */
} T72;

/* EXECUTION_ENVIRONMENT */
typedef struct {
	int id;
} T73;

/* KL_ANY_ROUTINES */
typedef struct {
	int id;
} T75;

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
} T76;

/* KL_CHARACTER_BUFFER */
typedef struct {
	int id;
	T0* a3; /* as_special */
	T0* a6; /* area */
} T79;

/* TYPED_POINTER [SPECIAL [CHARACTER]] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T80;

/* KL_PATHNAME */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T2 a5; /* is_relative */
	T0* a11; /* components */
} T82;

/* TO_SPECIAL [YY_BUFFER] */
typedef struct {
	int id;
	T0* a1; /* area */
} T83;

/* C_STRING */
typedef struct {
	int id;
	T4 a1; /* count */
	T0* a2; /* managed_data */
} T84;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct {
	int id;
	T0* a7; /* integer_overflow_state1 */
	T0* a8; /* integer_overflow_state2 */
	T0* a10; /* natural_overflow_state1 */
	T0* a11; /* natural_overflow_state2 */
} T85;

/* SPECIAL [NATURAL_8] */
typedef struct {
	int id;
	T4 a1; /* count */
	T8 a2[1]; /* item */
} T86;

/* MANAGED_POINTER */
typedef struct {
	int id;
	T2 a1; /* is_shared */
	T14 a3; /* item */
	T4 a6; /* count */
} T87;

/* SPECIAL [NATURAL_64] */
typedef struct {
	int id;
	T4 a1; /* count */
	T11 a2[1]; /* item */
} T88;

/* ARRAY [NATURAL_64] */
typedef struct {
	int id;
	T0* a1; /* area */
	T4 a2; /* lower */
	T4 a3; /* upper */
} T89;

/* PLATFORM */
typedef struct {
	int id;
} T90;

/* TYPED_POINTER [NATURAL_8] */
typedef struct {
	int id;
	T14 a1; /* pointer_item */
} T91;

/* EXCEPTIONS */
typedef struct {
	int id;
} T92;

typedef struct {
	int id;
	EIF_BOOLEAN is_special;
} EIF_TYPE;


extern int geargc;
extern char** geargv;

/* Call to UT_ERROR.default_message */
extern T0* T32x3309(T0* C);
/* GEPP.execute */
extern T0* T18c10();
/* GEPP.preprocess */
extern void T18f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T25f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T25f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T25f35(T0* C, T14 a1);
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
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T2 T25f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T2 T25f4(T0* C);
/* GEPP_PARSER.syntax_error */
extern T2 T21f1(T0* C);
/* GEPP.report_cannot_read_error */
extern void T18f18(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error */
extern void T20f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T20f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T36f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T36f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T36f11(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T36f15(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T36f19(T0* C, T14 a1, T14 a2, T4 a3);
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
extern T0* T54f1(T0* C, T0* a1);
/* STRING.string */
extern T0* T16f10(T0* C);
/* STRING.append */
extern void T16f32(T0* C, T0* a1);
/* SPECIAL [CHARACTER].copy_data */
extern void T15f8(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* SPECIAL [CHARACTER].move_data */
extern void T15f10(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].overlapping_move */
extern void T15f12(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [CHARACTER].non_overlapping_move */
extern void T15f11(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.resize */
extern void T16f34(T0* C, T4 a1);
/* SPECIAL [CHARACTER].aliased_resized_area */
extern T0* T15f4(T0* C, T4 a1);
/* INTEGER.infix ">=" */
extern T2 T4f2(T4* C, T4 a1);
/* STRING.additional_space */
extern T4 T16f16(T0* C);
/* INTEGER.max */
extern T4 T4f14(T4* C, T4 a1);
/* STRING.capacity */
extern T4 T16f15(T0* C);
/* INTEGER.infix ">" */
extern T2 T4f1(T4* C, T4 a1);
/* STRING.make */
extern T0* T16c25(T4 a1);
/* STRING.make_area */
extern void T16f27(T0* C, T4 a1);
/* SPECIAL [CHARACTER].make */
extern T0* T15c9(T4 a1);
/* KL_ANY_ROUTINES.same_types */
extern T2 T75f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge254os1802;
extern T0* ge254ov1802;
extern T0* T54f6(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T75c2();
/* KL_STDERR_FILE.string_ */
extern unsigned char ge262os1508;
extern T0* ge262ov1508;
extern T0* T36f1(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T54c12();
/* UT_ERROR_HANDLER.message */
extern T0* T20f5(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T35c7(T0* a1);
/* ARRAY [STRING].put */
extern void T60f12(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].make */
extern T0* T60c11(T4 a1, T4 a2);
/* ARRAY [STRING].make_area */
extern void T60f13(T0* C, T4 a1);
/* SPECIAL [STRING].make */
extern T0* T47c5(T4 a1);
/* INTEGER.infix "<=" */
extern T2 T4f6(T4* C, T4 a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T24f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T24f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T24f42(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T2 T24f1(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T2 T24f2(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T24f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T2 T24f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T2 T24f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T24f40(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T24f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T24f40p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T24f20(T0* C, T14 a1, T4 a2);
/* STRING.to_c */
extern T0* T16f7(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T2 T24f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T2 T62f1(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T2 T62f2(T0* C, T14 a1, T4 a2);
/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
extern T14 T80f2(T80* C);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge508os2154;
extern T0* ge508ov2154;
extern T0* T24f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T62c6();
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T62f8(T0* C, T4 a1);
/* UNIX_FILE_INFO.stat_size */
extern T4 T62f3(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T24f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T62f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T62f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T2 T24f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T2 T24f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T24c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T24f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T24f8(T0* C);
/* GEPP_PARSER.parse_file */
extern void T21f175(T0* C, T0* a1);
/* GEPP_PARSER.output */
extern void T21f180(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T28f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T28f14(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T28f17(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T28f2(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T25f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T25f33(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T25f36(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T25f12(T0* C);
/* KL_STDOUT_FILE.put_new_line */
extern void T28f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T25f28(T0* C);
/* KL_STDOUT_FILE.put_line */
extern void T28f10(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T25f27(T0* C, T0* a1);
/* STRING.substring */
extern T0* T16f6(T0* C, T4 a1, T4 a2);
/* STRING.set_count */
extern void T16f26(T0* C, T4 a1);
/* STRING.new_string */
extern T0* T16f8(T0* C, T4 a1);
/* STRING.item */
extern T1 T16f5(T0* C, T4 a1);
/* GEPP_PARSER.ignored */
extern T2 T21f60(T0* C);
/* GEPP_PARSER.parse */
extern void T21f179(T0* C);
/* GEPP_PARSER.yy_clear_all */
extern void T21f194(T0* C);
/* GEPP_PARSER.clear_all */
extern void T21f205(T0* C);
/* GEPP_PARSER.clear_stacks */
extern void T21f211(T0* C);
/* GEPP_PARSER.yy_clear_value_stacks */
extern void T21f212(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T49f6(T0* C);
/* SPECIAL [STRING].clear_all */
extern void T47f7(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T45f6(T0* C);
/* GEPP_PARSER.yy_pop_last_value */
extern void T21f193(T0* C, T4 a1);
/* GEPP_PARSER.yy_push_error_value */
extern void T21f192(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T46f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T45f2(T0* C, T4 a1);
/* SPECIAL [ANY].make */
extern T0* T45c4(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T46f1(T0* C, T4 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T70c2(T4 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T46c3();
/* GEPP_PARSER.yy_do_action */
extern void T21f191(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T50f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T49f3(T0* C, T4 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T49c4(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T50f1(T0* C, T4 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T72c2(T4 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T50c3();
/* GEPP_PARSER.is_defined */
extern T2 T21f133(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].has */
extern T2 T37f1(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].search_position */
extern void T37f36(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_item */
extern T4 T37f13(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].hash_position */
extern T4 T37f8(T0* C, T0* a1);
/* STRING.hash_code */
extern T4 T16f17(T0* C);
/* INTEGER.infix "|<<" */
extern T4 T4f15(T4* C, T4 a1);
/* KL_EQUALITY_TESTER [STRING].test */
extern T2 T22f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].keys_item */
extern T0* T37f17(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_item */
extern T4 T37f14(T0* C, T4 a1);
/* GEPP_PARSER.process_include */
extern void T21f204(T0* C, T0* a1);
/* GEPP_TOO_MANY_INCLUDES_ERROR.make */
extern T0* T52c7(T4 a1);
/* INTEGER.out */
extern T0* T4f10(T4* C);
/* STRING.append_integer */
extern void T16f31(T0* C, T4 a1);
/* STRING.append_character */
extern void T16f28(T0* C, T1 a1);
/* DS_ARRAYED_STACK [YY_BUFFER].put */
extern void T38f9(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T53f1(T0* C, T0* a1);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T54f5(T0* C, T0* a1, T0* a2);
/* STRING.append_string */
extern void T16f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T54f9(T0* C, T0* a1, T0* a2);
/* STRING.infix "+" */
extern T0* T16f13(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T53f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T73f1(T0* C, T0* a1);
/* STRING.make_from_c */
extern T0* T16c36(T14 a1);
/* STRING.from_c */
extern void T16f37(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T84f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T84f8(T0* C, T0* a1, T4 a2, T4 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T87f2(T0* C, T4 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T91f2(T91* C, T14 a1, T4 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T91f3(T91* C, T14 a1, T14 a2, T4 a3);
#include <string.h>
/* C_STRING.share_from_pointer */
extern void T84f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T84f7(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T87f9(T0* C, T14 a1, T4 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T87c8(T14 a1, T4 a2);
/* C_STRING.c_strlen */
extern T4 T84f3(T0* C, T14 a1);
/* STRING.c_string_provider */
extern unsigned char ge6os1165;
extern T0* ge6ov1165;
extern T0* T16f21(T0* C);
/* C_STRING.make_empty */
extern T0* T84c4(T4 a1);
/* MANAGED_POINTER.make */
extern T0* T87c7(T4 a1);
/* EXCEPTIONS.raise */
extern void T92f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T92f4(T0* C, T14 a1, T4 a2);
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
/* EXCEPTIONS.default_create */
extern T0* T92c2();
/* MANAGED_POINTER.default_pointer */
extern T14 T87f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T4 a1, T4 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T4 a1, T4 a2);
#include <stdlib.h>
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T73f3(T0* C, T14 a1);
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
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge364os3734;
extern T0* ge364ov3734;
extern T0* T53f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T73c4();
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T54f13(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T54f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T54f2(T0* C, T0* a1, T4 a2);
/* STRING.wipe_out */
extern void T16f29(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T54f8(T0* C, T0* a1);
/* STRING.twin */
extern T0* T16f12(T0* C);
/* STRING.copy */
extern void T16f33(T0* C, T0* a1);
/* SPECIAL [CHARACTER].twin */
extern T0* T15f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T53f2(T0* C);
/* GEPP_PARSER.execution_environment */
extern unsigned char ge311os1713;
extern T0* ge311ov1713;
extern T0* T21f155(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T53c5();
/* DS_ARRAYED_STACK [YY_BUFFER].is_full */
extern T2 T38f1(T0* C);
/* GEPP_PARSER.undefine_value */
extern void T21f203(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].remove */
extern void T37f35(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].remove_position */
extern void T37f44(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].keys_put */
extern void T37f43(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].items_put */
extern void T37f39(T0* C, T0* a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].clashes_put */
extern void T37f41(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].slots_put */
extern void T37f42(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE [STRING, STRING].move_cursors_forth */
extern void T37f51(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].move_all_cursors */
extern void T37f57(T0* C, T4 a1, T4 a2);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_position */
extern void T66f5(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].move_cursors_after */
extern void T37f56(T0* C, T4 a1);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_next_cursor */
extern void T66f6(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].internal_set_key_equality_tester */
extern void T37f50(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
extern void T37f38(T0* C);
/* GEPP_PARSER.define_value */
extern void T21f171(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].force */
extern void T37f34(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING, STRING].resize */
extern void T37f40(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
extern void T37f49(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
extern unsigned char ge260os1512;
extern T0* ge260ov1512;
extern T0* T37f28(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
extern T0* T42c4();
/* DS_HASH_TABLE [STRING, STRING].keys_resize */
extern void T37f48(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].resize */
extern T0* T48f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [STRING].resized_area */
extern T0* T47f3(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].items_resize */
extern void T37f47(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].slots_resize */
extern void T37f46(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_modulus */
extern T4 T37f21(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_capacity */
extern T4 T37f7(T0* C, T4 a1);
/* GEPP_PARSER.yy_push_last_value */
extern void T21f190(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].make */
extern T0* T48f1(T0* C, T4 a1);
/* TO_SPECIAL [STRING].make_area */
extern T0* T71c2(T4 a1);
/* KL_SPECIAL_ROUTINES [STRING].default_create */
extern T0* T48c3();
/* GEPP_PARSER.accept */
extern void T21f189(T0* C);
/* GEPP_PARSER.abort */
extern void T21f188(T0* C);
/* GEPP_PARSER.yy_do_error_action */
extern void T21f187(T0* C, T4 a1);
/* GEPP_PARSER.report_error */
extern void T21f202(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T51c7(T0* a1, T4 a2);
/* GEPP_PARSER.report_eof_expected_error */
extern void T21f201(T0* C);
/* GEPP_PARSER.read_token */
extern void T21f186(T0* C);
/* GEPP_PARSER.yy_execute_action */
extern void T21f200(T0* C, T4 a1);
/* GEPP_PARSER.yy_set_beginning_of_line */
extern void T21f210(T0* C);
/* YY_BUFFER.set_beginning_of_line */
extern void T40f16(T0* C, T2 a1);
/* YY_FILE_BUFFER.set_beginning_of_line */
extern void T39f20(T0* C, T2 a1);
/* GEPP_PARSER.text_item */
extern T1 T21f154(T0* C, T4 a1);
/* GEPP_PARSER.text */
extern T0* T21f150(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T79f2(T0* C, T4 a1, T4 a2);
/* GEPP_PARSER.text_substring */
extern T0* T21f148(T0* C, T4 a1, T4 a2);
/* GEPP_PARSER.text_count */
extern T4 T21f147(T0* C);
/* GEPP_PARSER.echo */
extern void T21f209(T0* C);
/* GEPP_PARSER.set_start_condition */
extern void T21f208(T0* C, T4 a1);
/* GEPP_PARSER.yy_execute_eof_action */
extern void T21f199(T0* C, T4 a1);
/* GEPP_PARSER.terminate */
extern void T21f207(T0* C);
/* GEPP_PARSER.wrap */
extern T2 T21f118(T0* C);
/* KL_STDIN_FILE.close */
extern void T29f23(T0* C);
/* KL_STDIN_FILE.is_closable */
extern T2 T29f8(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T2 T24f25(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].remove */
extern void T38f10(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].item */
extern T0* T38f4(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].is_empty */
extern T2 T38f3(T0* C);
/* GEPP_PARSER.yy_refill_input_buffer */
extern void T21f198(T0* C);
/* GEPP_PARSER.yy_set_content */
extern void T21f196(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T4 T79f4(T0* C);
/* YY_BUFFER.fill */
extern void T40f15(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T39f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T4 T79f5(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.read_to_string */
extern T4 T29f14(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T4 T29f17(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_STDIN_FILE.file_gss */
extern T4 T29f18(T0* C, T14 a1, T14 a2, T4 a3);
/* SPECIAL [CHARACTER].item_address */
extern T14 T15f5(T0* C, T4 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T29f15(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T2 T29f11(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T2 T29f13(T0* C, T14 a1);
/* STRING.put */
extern void T16f39(T0* C, T1 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T4 T24f30(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge376os1923;
extern T0* ge376ov1923;
extern T0* T24f34(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T79c8(T4 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge382os2944;
extern T2 ge382ov2944;
extern T2 T63f6(T0* C);
/* PLATFORM.default_create */
extern T0* T90c2();
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge312os1961;
extern T0* ge312ov1961;
extern T0* T79f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T63c7();
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T4 T24f33(T0* C, T0* a1, T4 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T4 T24f35(T0* C, T14 a1, T14 a2, T4 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T24f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T2 T24f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T2 T24f29(T0* C, T14 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T79f9(T0* C, T1 a1, T4 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T2 T24f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T29f24(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T29f25(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T1 T29f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T24f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T24f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T1 T24f28(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T39f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T79f10(T0* C, T4 a1, T4 a2, T4 a3);
/* STRING.subcopy */
extern void T16f40(T0* C, T0* a1, T4 a2, T4 a3, T4 a4);
/* YY_FILE_BUFFER.resize */
extern void T39f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T79f11(T0* C, T4 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge136os3693;
extern T4 ge136ov3693;
extern T4 T39f10(T0* C);
/* YY_BUFFER.set_index */
extern void T40f13(T0* C, T4 a1);
/* YY_FILE_BUFFER.set_index */
extern void T39f17(T0* C, T4 a1);
/* GEPP_PARSER.yy_null_trans_state */
extern T4 T21f117(T0* C, T4 a1);
/* GEPP_PARSER.yy_previous_state */
extern T4 T21f116(T0* C);
/* GEPP_PARSER.fatal_error */
extern void T21f197(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T36f12(T0* C, T1 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T36f16(T0* C, T1 a1);
/* KL_STDERR_FILE.console_pc */
extern void T36f20(T0* C, T14 a1, T1 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge294os2935;
extern T0* ge294ov2935;
extern T0* T27f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T36c9();
/* KL_STDERR_FILE.make_open_stderr */
extern void T36f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T36f18(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T36f3(T0* C, T4 a1);
/* KL_STDERR_FILE.old_make */
extern void T36f17(T0* C, T0* a1);
/* GEPP_PARSER.std */
extern unsigned char ge292os1303;
extern T0* ge292ov1303;
extern T0* T21f13(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T27c4();
/* KL_CHARACTER_BUFFER.item */
extern T1 T79f1(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].resize */
extern T0* T42f2(T0* C, T0* a1, T4 a2);
/* SPECIAL [INTEGER].resized_area */
extern T0* T41f3(T0* C, T4 a1);
/* SPECIAL [INTEGER].make */
extern T0* T41c4(T4 a1);
/* GEPP_PARSER.special_integer_ */
extern T0* T21f16(T0* C);
/* GEPP_PARSER.yy_init_value_stacks */
extern void T21f185(T0* C);
/* GEPP_PARSER.set_input_buffer */
extern void T21f178(T0* C, T0* a1);
/* GEPP_PARSER.yy_load_input_buffer */
extern void T21f184(T0* C);
/* YY_BUFFER.set_position */
extern void T40f14(T0* C, T4 a1, T4 a2, T4 a3);
/* YY_FILE_BUFFER.set_position */
extern void T39f18(T0* C, T4 a1, T4 a2, T4 a3);
/* GEPP_PARSER.new_file_buffer */
extern T0* T21f11(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T39c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T39f21(T0* C, T0* a1, T4 a2);
/* YY_FILE_BUFFER.set_file */
extern void T39f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T39f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T39f15(T0* C, T4 a1);
/* KL_STANDARD_FILES.input */
extern unsigned char ge294os2933;
extern T0* ge294ov2933;
extern T0* T27f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T29c19();
/* KL_STDIN_FILE.make_open_stdin */
extern void T29f20(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T29f22(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T29f3(T0* C, T4 a1);
/* KL_STDIN_FILE.old_make */
extern void T29f21(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge294os2934;
extern T0* ge294ov2934;
extern T0* T27f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T28c9();
/* KL_STDOUT_FILE.make_open_stdout */
extern void T28f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T28f16(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T28f4(T0* C, T4 a1);
/* KL_STDOUT_FILE.old_make */
extern void T28f15(T0* C, T0* a1);
/* GEPP.std */
extern T0* T18f7(T0* C);
/* KL_EXCEPTIONS.die */
extern void T23f2(T0* C, T4 a1);
/* GEPP.exceptions */
extern unsigned char ge310os1304;
extern T0* ge310ov1304;
extern T0* T18f6(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T23c1();
/* GEPP.report_cannot_write_error */
extern void T18f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T34c7(T0* a1);
/* GEPP_PARSER.set_output_file */
extern void T21f174(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T2 T25f1(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T2 T25f3(T0* C);
/* KL_TEXT_OUTPUT_FILE.recursive_open_write */
extern void T25f25(T0* C);
/* KL_DIRECTORY.recursive_create_directory */
extern void T58f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T2 T54f10(T0* C, T0* a1, T0* a2);
/* STRING.item_code */
extern T4 T16f22(T0* C, T4 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T2 T54f11(T0* C, T0* a1, T0* a2);
/* STRING.same_string */
extern T2 T16f23(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T58f6(T0* C);
/* KL_DIRECTORY.file_system */
extern unsigned char ge291os1957;
extern T0* ge291ov1957;
extern T0* T58f7(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern unsigned char ge291os1960;
extern T0* ge291ov1960;
extern T0* T58f12(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T65c11();
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge382os2943;
extern T2 ge382ov2943;
extern T2 T63f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T63f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T73f2(T0* C);
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
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge382os2947;
extern T0* ge382ov2947;
extern T0* T63f5(T0* C);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T63f3(T0* C, T0* a1);
/* KL_DIRECTORY.windows_file_system */
extern unsigned char ge291os1958;
extern T0* ge291ov1958;
extern T0* T58f11(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T64c13();
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge382os2942;
extern T2 ge382ov2942;
extern T2 T63f1(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T58f10(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T58f16(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T58f17(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T58f18(T0* C, T14 a1);
/* KL_DIRECTORY.old_exists */
extern T2 T58f3(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T2 T58f4(T0* C, T14 a1);
/* KL_DIRECTORY.exists */
extern T2 T58f1(T0* C);
/* KL_DIRECTORY.make */
extern T0* T58c13(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T58f15(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T65f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge297os4138;
extern T0* ge297ov4138;
extern T0* T65f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T2 T65f5(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T64f2(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge299os4138;
extern T0* ge299ov4138;
extern T0* T64f8(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T2 T64f6(T0* C, T1 a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T2 T64f5(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T65f1(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T65f4(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T82f8(T0* C, T4 a1);
/* ARRAY [STRING].item */
extern T0* T60f5(T0* C, T4 a1);
/* KL_PATHNAME.is_parent */
extern T2 T82f7(T0* C, T4 a1);
/* KL_PATHNAME.is_current */
extern T2 T82f6(T0* C, T4 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T65f9(T0* C);
/* KL_PATHNAME.set_canonical */
extern void T82f14(T0* C);
/* KL_PATHNAME.append_current */
extern void T82f16(T0* C);
/* KL_PATHNAME.append_name */
extern void T82f21(T0* C, T0* a1);
/* ARRAY [STRING].force */
extern void T60f14(T0* C, T0* a1, T4 a2);
/* ARRAY [STRING].auto_resize */
extern void T60f15(T0* C, T4 a1, T4 a2);
/* SPECIAL [STRING].fill_with */
extern void T47f9(T0* C, T0* a1, T4 a2, T4 a3);
/* SPECIAL [STRING].move_data */
extern void T47f8(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].overlapping_move */
extern void T47f11(T0* C, T4 a1, T4 a2, T4 a3);
/* SPECIAL [STRING].non_overlapping_move */
extern void T47f10(T0* C, T4 a1, T4 a2, T4 a3);
/* ARRAY [STRING].capacity */
extern T4 T60f8(T0* C);
/* SPECIAL [STRING].aliased_resized_area */
extern T0* T47f4(T0* C, T4 a1);
/* ARRAY [STRING].additional_space */
extern T4 T60f7(T0* C);
/* INTEGER.min */
extern T4 T4f19(T4* C, T4 a1);
/* ARRAY [STRING].empty_area */
extern T2 T60f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T65f3(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T82f17(T0* C);
/* KL_PATHNAME.set_relative */
extern void T82f15(T0* C, T2 a1);
/* KL_PATHNAME.make */
extern T0* T82c13();
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T64f1(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T64f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T64f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T64f3(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T82f20(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T82f19(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T82f18(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_system */
extern T0* T25f14(T0* C);
/* KL_TEXT_OUTPUT_FILE.unix_file_system */
extern T0* T25f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.windows_file_system */
extern T0* T25f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.operating_system */
extern T0* T25f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T25f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T25f34(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T25f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T25f34p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T25f20(T0* C, T14 a1, T4 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T25c24(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T25f30(T0* C, T0* a1);
/* STRING.is_equal */
extern T2 T16f3(T0* C, T0* a1);
/* STRING.str_strict_cmp */
extern T4 T16f4(T0* C, T0* a1, T0* a2, T4 a3);
/* GEPP.read_arguments */
extern void T18f12(T0* C);
/* GEPP.report_usage_error */
extern void T18f16(T0* C);
/* GEPP.usage_message */
extern unsigned char ge52os1300;
extern T0* ge52ov1300;
extern T0* T18f9(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T33c7(T0* a1);
/* GEPP_PARSER.set_empty_lines */
extern void T21f173(T0* C, T2 a1);
/* GEPP_PARSER.set_makefile_dependencies */
extern void T21f172(T0* C, T2 a1);
/* GEPP.report_usage_message */
extern void T18f15(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T20f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T20f9(T0* C, T0* a1);
/* GEPP.report_version_number */
extern void T18f14(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T31c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T19f2(T0* C, T4 a1);
/* GEPP_PARSER.make */
extern T0* T21c170(T0* a1);
/* DS_ARRAYED_STACK [YY_BUFFER].make */
extern T0* T38c8(T4 a1);
/* KL_SPECIAL_ROUTINES [YY_BUFFER].make */
extern T0* T68f1(T0* C, T4 a1);
/* TO_SPECIAL [YY_BUFFER].make_area */
extern T0* T83c2(T4 a1);
/* SPECIAL [YY_BUFFER].make */
extern T0* T67c2(T4 a1);
/* KL_SPECIAL_ROUTINES [YY_BUFFER].default_create */
extern T0* T68c2();
/* DS_HASH_TABLE [STRING, STRING].make */
extern T0* T37c33(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
extern void T37f37(T0* C, T4 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
extern void T37f45(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].new_cursor */
extern T0* T37f27(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
extern T0* T66c4(T0* a1);
/* DS_HASH_TABLE [STRING, STRING].make_slots */
extern void T37f55(T0* C, T4 a1);
/* KL_SPECIAL_ROUTINES [INTEGER].make */
extern T0* T42f1(T0* C, T4 a1);
/* TO_SPECIAL [INTEGER].make_area */
extern T0* T69c2(T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_clashes */
extern void T37f54(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_keys */
extern void T37f53(T0* C, T4 a1);
/* DS_HASH_TABLE [STRING, STRING].make_items */
extern void T37f52(T0* C, T4 a1);
/* KL_EQUALITY_TESTER [STRING].default_create */
extern T0* T22c2();
/* GEPP_PARSER.make_parser_skeleton */
extern void T21f177(T0* C);
/* GEPP_PARSER.yy_build_parser_tables */
extern void T21f183(T0* C);
/* GEPP_PARSER.yycheck_template */
extern unsigned char ge53os1376;
extern T0* ge53ov1376;
extern T0* T21f72(T0* C);
/* GEPP_PARSER.yyfixed_array */
extern T0* T21f166(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
extern T0* T42f3(T0* C, T0* a1);
/* GEPP_PARSER.yytable_template */
extern unsigned char ge53os1375;
extern T0* ge53ov1375;
extern T0* T21f71(T0* C);
/* GEPP_PARSER.yypgoto_template */
extern unsigned char ge53os1374;
extern T0* ge53ov1374;
extern T0* T21f70(T0* C);
/* GEPP_PARSER.yypact_template */
extern unsigned char ge53os1373;
extern T0* ge53ov1373;
extern T0* T21f69(T0* C);
/* GEPP_PARSER.yydefgoto_template */
extern unsigned char ge53os1372;
extern T0* ge53ov1372;
extern T0* T21f68(T0* C);
/* GEPP_PARSER.yydefact_template */
extern unsigned char ge53os1371;
extern T0* ge53ov1371;
extern T0* T21f67(T0* C);
/* GEPP_PARSER.yytypes2_template */
extern unsigned char ge53os1370;
extern T0* ge53ov1370;
extern T0* T21f66(T0* C);
/* GEPP_PARSER.yytypes1_template */
extern unsigned char ge53os1369;
extern T0* ge53ov1369;
extern T0* T21f64(T0* C);
/* GEPP_PARSER.yyr1_template */
extern unsigned char ge53os1368;
extern T0* ge53ov1368;
extern T0* T21f62(T0* C);
/* GEPP_PARSER.yytranslate_template */
extern unsigned char ge53os1367;
extern T0* ge53ov1367;
extern T0* T21f61(T0* C);
/* GEPP_PARSER.yy_create_value_stacks */
extern void T21f182(T0* C);
/* GEPP_PARSER.make_gepp_scanner */
extern void T21f176(T0* C);
/* GEPP_PARSER.make_with_buffer */
extern void T21f181(T0* C, T0* a1);
/* GEPP_PARSER.yy_initialize */
extern void T21f195(T0* C);
/* GEPP_PARSER.yy_build_tables */
extern void T21f206(T0* C);
/* GEPP_PARSER.yy_accept_template */
extern unsigned char ge54os1524;
extern T0* ge54ov1524;
extern T0* T21f162(T0* C);
/* GEPP_PARSER.yy_fixed_array */
extern T0* T21f169(T0* C, T0* a1);
/* GEPP_PARSER.yy_meta_template */
extern unsigned char ge54os1523;
extern T0* ge54ov1523;
extern T0* T21f161(T0* C);
/* GEPP_PARSER.yy_ec_template */
extern unsigned char ge54os1522;
extern T0* ge54ov1522;
extern T0* T21f160(T0* C);
/* GEPP_PARSER.yy_def_template */
extern unsigned char ge54os1521;
extern T0* ge54ov1521;
extern T0* T21f159(T0* C);
/* GEPP_PARSER.yy_base_template */
extern unsigned char ge54os1520;
extern T0* ge54ov1520;
extern T0* T21f158(T0* C);
/* GEPP_PARSER.yy_chk_template */
extern unsigned char ge54os1519;
extern T0* ge54ov1519;
extern T0* T21f157(T0* C);
/* GEPP_PARSER.yy_nxt_template */
extern unsigned char ge54os1518;
extern T0* ge54ov1518;
extern T0* T21f156(T0* C);
/* GEPP_PARSER.empty_buffer */
extern unsigned char ge141os1679;
extern T0* ge141ov1679;
extern T0* T21f12(T0* C);
/* YY_BUFFER.make */
extern T0* T40c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T40f17(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T79f12(T0* C, T0* a1, T4 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T40f9(T0* C, T4 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T20c6();
/* UT_ERROR_HANDLER.std */
extern T0* T20f2(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T19f5(T0* C, T0* a1);
/* GEPP.arguments */
extern unsigned char ge308os1306;
extern T0* ge308ov1306;
extern T0* T18f1(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T19c4();
/* GEPP.resurrect_code */
extern void T18f11(T0* C);
/* GEPP_TOO_MANY_INCLUDES_ERROR.default_message */
extern T0* T52f1(T0* C);
/* GEPP_TOO_MANY_INCLUDES_ERROR.message */
extern T0* T52f3(T0* C, T0* a1);
/* GEPP_TOO_MANY_INCLUDES_ERROR.arguments */
extern T0* T52f6(T0* C);
/* ARRAY [STRING].valid_index */
extern T2 T60f4(T0* C, T4 a1);
/* STRING.to_integer */
extern T4 T16f11(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T4 T76f1(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T76f16(T0* C, T0* a1, T4 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T76f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T2 T76f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T2 T85f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4);
/* NATURAL_64.infix ">" */
extern T2 T11f4(T11* C, T11 a1);
/* ARRAY [NATURAL_64].item */
extern T11 T89f4(T0* C, T4 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge528os4701;
extern T0* ge528ov4701;
extern T0* T76f13(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T85c13();
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
extern void T89f6(T0* C, T11 a1, T4 a2);
/* INTEGER_8.to_natural_64 */
extern T11 T5f3(T5* C);
/* ARRAY [NATURAL_64].make */
extern T0* T89c5(T4 a1, T4 a2);
/* ARRAY [NATURAL_64].make_area */
extern void T89f7(T0* C, T4 a1);
/* SPECIAL [NATURAL_64].make */
extern T0* T88c2(T4 a1);
/* STRING.has */
extern T2 T16f24(T0* C, T1 a1);
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
extern T0* T86c2(T4 a1);
/* INTEGER.to_natural_64 */
extern T11 T4f16(T4* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T76f21(T0* C, T4 a1);
/* STRING.ctoi_convertor */
extern unsigned char ge6os1167;
extern T0* ge6ov1167;
extern T0* T16f14(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T76f20(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T76f19(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T76f18(T0* C, T0* a1);
/* STRING.make_from_string */
extern T0* T16c38(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T76f17(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T76c15();
/* KL_STRING_ROUTINES.is_integer */
extern T2 T54f4(T0* C, T0* a1);
/* CHARACTER.infix ">" */
extern T2 T1f3(T1* C, T1 a1);
/* CHARACTER.infix "<" */
extern T2 T1f2(T1* C, T1 a1);
/* GEPP_TOO_MANY_INCLUDES_ERROR.string_ */
extern T0* T52f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T51f1(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T51f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T51f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T51f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T35f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T35f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T35f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T35f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T34f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T34f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T34f5(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T33f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T33f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T33f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T33f5(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T31f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T31f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T31f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T31f5(T0* C);
extern T0* gema61(T4 c, ...);
extern int gevoid(T0* C, ...);
extern T0* ge388ov2659;
extern T0* ge392ov3909;
extern T0* ge365ov1942;
extern T0* ge390ov2659;
extern T0* ge395ov2659;
extern T0* ge389ov3237;
extern T0* ge376ov1922;
extern T0* ge297ov4136;
extern T0* ge299ov4136;
extern T0* ge297ov4137;
extern T0* ge288ov4364;
extern T0* ge288ov4363;
extern T0* ge299ov4137;
extern T0* ge305ov1302;
extern T0* ge56ov3310;
extern T0* ge215ov3310;
extern T0* ge209ov3310;
extern T0* ge210ov3310;
extern T0* ge218ov3310;
extern T0* ge219ov3310;
extern EIF_TYPE getypes[];

