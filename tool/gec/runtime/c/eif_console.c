/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_CONSOLE_H
#include "eif_console.h"
#endif
#ifndef EIF_FILE_H
#include "eif_file.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif

#ifdef EIF_WINDOWS
#include <windows.h>
#endif
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

EIF_POINTER console_def(EIF_INTEGER file)
{
#ifdef EIF_WINDOWS
		/* The following is needed to avoid the function `WideCharToMultiByte`
		   in ENCODING_IMP.cwin_wide_char_to_multi_byte to produce an error
		   ERROR_INVALID_PARAMETER when the code page passed as argument is
		   the code page of the console. */
	UINT l_code_page;
	l_code_page = GetConsoleOutputCP();
	if (l_code_page != 0) {
		SetConsoleOutputCP(l_code_page);
	}
#endif
	switch (file) {
	case 0:
		return (EIF_POINTER)stdin;
	case 1:
		setvbuf(stdout, NULL, _IONBF, 0);
		return (EIF_POINTER)stdout;
	case 2:
		setvbuf (stderr, NULL, _IONBF, 0);
		return (EIF_POINTER)stderr;
	default:
		return NULL;
	}
}

EIF_BOOLEAN console_eof(FILE* fp)
{
	GE_show_console();
	return eif_file_feof(fp);
}

EIF_CHARACTER_8 console_separator(FILE *f)
{
	GE_show_console();
	return eif_file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len)
{
	GE_show_console();
	eif_file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number)
{
	GE_show_console();
	eif_file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER_8 c)
{
	GE_show_console();
	eif_file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val)
{
	GE_show_console();
	eif_file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number)
{
	GE_show_console();
	eif_file_pi(f, number);
}

void console_tnwl(FILE* f)
{
	GE_show_console();
	console_pc(f,'\n');
}

EIF_CHARACTER_8 console_readchar(FILE* f)
{
	GE_show_console();
	return eif_file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f)
{
	GE_show_console();
	return eif_file_gr(f);
}

EIF_INTEGER console_readint(FILE* f)
{
	GE_show_console();
	return eif_file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f)
{
	GE_show_console();
	return eif_file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start)
{
	GE_show_console();
	return eif_file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start)
{
	GE_show_console();
	return eif_file_gs(f, s, bound, start);
}

void console_next_line(FILE* f)
{
	GE_show_console();
	eif_file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound)
{
	GE_show_console();
	return eif_file_gss(f, s, bound);
}

void console_file_close (FILE* f)
{
	GE_show_console();
	eif_file_close(f);
}

#ifdef __cplusplus
}
#endif

#endif
