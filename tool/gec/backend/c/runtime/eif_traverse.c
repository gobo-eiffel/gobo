/*
	description:

		"C functions used for object traversal"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_TRAVERSE_C
#define EIF_TRAVERSE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_TRAVERSE_H
#include "eif_traverse.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_REFERENCE find_referers(EIF_REFERENCE target, EIF_INTEGER result_type)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'find_referers' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

EIF_REFERENCE find_instance_of(EIF_INTEGER instance_type, EIF_INTEGER result_type)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'find_instance_of' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

EIF_REFERENCE find_all_instances(EIF_INTEGER result_type)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'find_all_instances' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

EIF_REFERENCE once_objects(EIF_INTEGER result_type)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'once_objects' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

#ifdef __cplusplus
}
#endif

#endif
