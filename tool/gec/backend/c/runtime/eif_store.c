/*
	description:

		"C functions used to implement class STORABLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_STORE_C
#define EIF_STORE_C

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_STORE_H
#include "eif_store.h"
#endif
#ifndef GE_STORE_H
#include "ge_store.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

void estore(EIF_INTEGER file_desc, EIF_REFERENCE object)
{
	/* Note: use independent store in Gobo Eiffel. */
	GE_storable_store_to_file(object, file_desc);
}

void eestore(EIF_INTEGER file_desc, EIF_REFERENCE object)
{
	/* Note: use independent store in Gobo Eiffel. */
	GE_storable_store_to_file(object, file_desc);
}

void sstore(EIF_INTEGER file_desc, EIF_REFERENCE object)
{
	GE_storable_store_to_file(object, file_desc);
}

void eif_set_new_independent_format(EIF_BOOLEAN v)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'eif_set_new_independent_format' in 'eif_store.h' not implemented\n");
}

EIF_BOOLEAN eif_is_new_recoverable_format_active(void)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'eif_is_new_recoverable_format' in 'eif_store.h' not implemented\n");
	return EIF_FALSE;
}

void eif_set_new_recoverable_format(EIF_BOOLEAN v)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'eif_set_new_recoverable_format' in 'eif_store.h' not implemented\n");
}

EIF_INTEGER stream_estore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'stream_estore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_INTEGER stream_eestore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'stream_eestore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_INTEGER stream_sstore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'stream_sstore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_POINTER* stream_malloc(EIF_INTEGER stream_size)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'stream_malloc' in 'eif_store.h' not implemented\n");
	return (EIF_POINTER*)0;
}

void stream_free(EIF_POINTER* stream)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'stream_free' in 'eif_store.h' not implemented\n");
}

void set_buffer_size(EIF_INTEGER new_size)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'set_buffer_size' in 'eif_store.h' not implemented\n");
}

/* Features needed for EiffelNet or any other libraries that wants to use some storable compatible storage. */
void eif_store_object(int(*char_write)(char *, int), EIF_REFERENCE object, char store_type)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'eif_store_object' in 'eif_store.h' not implemented\n");
}

#ifdef __cplusplus
}
#endif

#endif
