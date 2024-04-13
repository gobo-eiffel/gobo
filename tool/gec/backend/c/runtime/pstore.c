/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef ISE_PSTORE_C
#define ISE_PSTORE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef ISE_PSTORE_H
#include "pstore.h"
#endif
#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

long store_append(EIF_INTEGER f_desc, EIF_REFERENCE o, fnptr mid, fnptr nid, EIF_REFERENCE s)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'store_append' in 'pstore.h' not implemented\n");
	return 0;
}

void parsing_store(EIF_INTEGER file_desc, EIF_REFERENCE object)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'parsing_store' in 'pstore.h' not implemented\n");
}

void ca_store(EIF_POINTER area, EIF_INTEGER siz, EIF_POINTER fil)
{
	if (fwrite((char *)area, sizeof(char), (size_t)siz, (FILE *)fil) != (size_t) siz)
		xraise(EN_IO);
}

void write_int(FILE *file, EIF_INTEGER_32 val)
{
	fwrite(&val, sizeof(EIF_INTEGER_32), 1, file);
}

#ifdef __cplusplus
}
#endif

#endif
