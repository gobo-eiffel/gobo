/*
	description:

		"C functions used to implement class STORABLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_STORE_H
#define EIF_STORE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern void estore(EIF_INTEGER file_desc, EIF_REFERENCE object);
extern void eestore(EIF_INTEGER file_desc, EIF_REFERENCE object);
extern void sstore(EIF_INTEGER file_desc, EIF_REFERENCE object);
extern void eif_set_new_independent_format(EIF_BOOLEAN v);
extern EIF_BOOLEAN eif_is_new_recoverable_format_active(void);
extern void eif_set_new_recoverable_format(EIF_BOOLEAN v);
extern EIF_INTEGER stream_estore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size);
extern EIF_INTEGER stream_eestore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size);
extern EIF_INTEGER stream_sstore(EIF_POINTER* buffer, EIF_INTEGER size, EIF_REFERENCE object, EIF_INTEGER* real_size);
extern EIF_POINTER* stream_malloc(EIF_INTEGER stream_size);
extern void stream_free(EIF_POINTER* stream);
extern void set_buffer_size(EIF_INTEGER);

#ifdef __cplusplus
}
#endif

#endif
