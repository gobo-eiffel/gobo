/*
	description:

		"C functions used to implement class UNIX_SIGNALS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_SIG_C
#define EIF_SIG_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_SIG_H
#include "eif_sig.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

char esigdefined(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigdefined' in 'eif_sig.h' not implemented\n");
	return (char)'\0';
}

long esignum(void)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esignum' in 'eif_sig.h' not implemented\n");
	return (long)0;
}

void esigcatch(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigcatch' in 'eif_sig.h' not implemented\n");
}

void esigignore(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigignore' in 'eif_sig.h' not implemented\n");
}

void esigresall(void)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigresall' in 'eif_sig.h' not implemented\n");
}

void esigresdef(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigresdef' in 'eif_sig.h' not implemented\n");
}

char esigiscaught(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigiscaught' in 'eif_sig.h' not implemented\n");
	return (char)'\0';
}

long esigmap(long int idx)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigmap' in 'eif_sig.h' not implemented\n");
	return (long)0;
}

char* esigname(long int sig)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'esigname' in 'eif_sig.h' not implemented\n");
	return (char*)0;
}

#ifdef __cplusplus
}
#endif

#endif
