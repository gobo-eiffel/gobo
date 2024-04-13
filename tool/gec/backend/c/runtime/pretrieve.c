/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef ISE_PRETRIEVE_C
#define ISE_PRETRIEVE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef ISE_PRETRIEVE_H
#include "pretrieve.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_REFERENCE partial_retrieve(EIF_INTEGER f_desc, long position, long nb_obj)
{
		/* TODO */
	GE_show_console();
	fprintf(stderr, "'partial_retrieve' in 'pretrieve.h' not implemented\n");
	return 0;
}

EIF_REFERENCE retrieve_all(EIF_INTEGER f_desc, long position)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'retrieve_all' in 'pretrieve.h' not implemented\n");
	return 0;
}

EIF_REFERENCE parsing_retrieve(EIF_INTEGER f_desc, EIF_INTEGER a_pos)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'parsing_retrieve' in 'pretrieve.h' not implemented\n");
	return 0;
}

#ifdef __cplusplus
}
#endif

#endif
