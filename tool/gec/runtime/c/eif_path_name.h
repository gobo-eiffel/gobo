/*
	description:

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2019, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_PATH_NAME_H
#define EIF_PATH_NAME_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER_8* p);
extern EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER_8* p);
extern void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v);
extern void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v);
extern EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER_8* s, EIF_CHARACTER_8* t, EIF_INTEGER length);
extern EIF_REFERENCE eif_volume_name(EIF_CHARACTER_8* p);
extern EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER_8* p);
extern void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v);
extern EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER_8* p);
extern EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER_8* p);
extern EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER_8* p);
extern EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER_8* p);
extern EIF_BOOLEAN eif_home_dir_supported(void);
extern EIF_BOOLEAN eif_root_dir_supported(void);
extern EIF_BOOLEAN eif_case_sensitive_path_names(void);
extern EIF_REFERENCE eif_current_dir_representation(void);
extern EIF_REFERENCE eif_root_directory_name(void);
extern EIF_INTEGER eif_home_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count);
extern EIF_INTEGER eif_temporary_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count);
extern EIF_INTEGER eif_user_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count);

#ifdef __cplusplus
}
#endif

#endif
