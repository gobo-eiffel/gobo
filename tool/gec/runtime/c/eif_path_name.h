/*
	description:

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_H
#define EIF_PATH_NAME_H

extern EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER* p);
extern void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER* s, EIF_CHARACTER* t, EIF_INTEGER length);
extern EIF_REFERENCE eif_volume_name(EIF_CHARACTER* p);
extern EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER* p);
extern void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_home_dir_supported(void);
extern EIF_BOOLEAN eif_root_dir_supported(void);
extern EIF_BOOLEAN eif_case_sensitive_path_names(void);
extern EIF_REFERENCE eif_current_dir_representation(void);
extern EIF_REFERENCE eif_home_directory_name(void);
extern EIF_REFERENCE eif_root_directory_name(void);

#endif
