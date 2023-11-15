/*
	description:

		"C functions used to implement class STORABLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_RETRIEVE_H
#define EIF_RETRIEVE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifndef EIF_CECIL_H
#include "eif_cecil.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern char* eretrieve(EIF_INTEGER file_desc);
extern void eif_set_discard_pointer_values(EIF_BOOLEAN state);
extern EIF_REFERENCE stream_eretrieve(EIF_POINTER* buffer, EIF_INTEGER size, EIF_INTEGER start_pos, EIF_INTEGER* real_size);
extern void set_mismatch_information_access(EIF_OBJECT object, EIF_PROCEDURE init, EIF_PROCEDURE add, EIF_PROCEDURE set_vers);
extern void class_translation_put(char* new_name, char* old_name);
extern void class_translation_clear(void);
extern EIF_INTEGER class_translation_count(void);
extern char* class_translation_old(EIF_INTEGER i);
extern char* class_translation_new(EIF_INTEGER i);

#ifdef __cplusplus
}
#endif

#endif
