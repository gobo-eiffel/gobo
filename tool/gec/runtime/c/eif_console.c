/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C

#include <stdio.h>

EIF_POINTER console_def(EIF_INTEGER file) {
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

EIF_BOOLEAN console_eof(FILE* fp) {
	return file_feof(fp);
}

EIF_CHARACTER console_separator(FILE *f) {
	return file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
	file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
	file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER c) {
	file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
	file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
	file_pi(f, number);
}

void console_tnwl(FILE* f) {
	console_pc(f,'\n');
}

EIF_CHARACTER console_readchar(FILE* f) {
	return file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
	return file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
	return file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
	return file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
	file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
	return file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
	file_close(f);
}

#endif
