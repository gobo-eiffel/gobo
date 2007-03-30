/*
	description:

		"C functions used to implement class STORABLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_STORE_C
#define EIF_STORE_C

#ifdef __cplusplus
extern "C" {
#endif

void estore(EIF_INTEGER file_desc, char* object) {
	/* TODO */
	printf("'estore' in 'eif_store.h' not implemented\n");
}

void eestore(EIF_INTEGER file_desc, char* object) {
	/* TODO */
	printf("'eestore' in 'eif_store.h' not implemented\n");
}

void sstore (EIF_INTEGER file_desc, char* object) {
	/* TODO */
	printf("'sstore' in 'eif_store.h' not implemented\n");
}

void eif_set_new_independent_format(EIF_BOOLEAN v) {
	/* TODO */
	printf("'eif_set_new_independent_format' in 'eif_store.h' not implemented\n");
}

EIF_BOOLEAN eif_is_new_recoverable_format_active(void) {
	/* TODO */
	printf("'eif_is_new_recoverable_format' in 'eif_store.h' not implemented\n");
	return EIF_FALSE;
}

void eif_set_new_recoverable_format(EIF_BOOLEAN v) {
	/* TODO */
	printf("'eif_set_new_recoverable_format' in 'eif_store.h' not implemented\n");
}

EIF_INTEGER stream_estore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size) {
	/* TODO */
	printf("'stream_estore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_INTEGER stream_eestore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size) {
	/* TODO */
	printf("'stream_eestore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_INTEGER stream_sstore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size) {
	/* TODO */
	printf("'stream_sstore' in 'eif_store.h' not implemented\n");
	return (EIF_INTEGER)0;
}

EIF_POINTER* stream_malloc(EIF_INTEGER stream_size) {
	/* TODO */
	printf("'stream_malloc' in 'eif_store.h' not implemented\n");
	return (EIF_POINTER*)0;
}

void stream_free(EIF_POINTER* stream) {
	/* TODO */
	printf("'stream_free' in 'eif_store.h' not implemented\n");
}

void set_buffer_size(EIF_INTEGER) {
	/* TODO */
	printf("'set_buffer_size' in 'eif_store.h' not implemented\n");
}

#ifdef __cplusplus
}
#endif

#endif
