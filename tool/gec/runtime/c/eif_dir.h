/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_H
#define EIF_DIR_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_POINTER eif_dir_open(EIF_FILENAME dirname);
extern EIF_POINTER eif_dir_next(EIF_POINTER dir);
extern EIF_POINTER eif_dir_rewind(EIF_POINTER d, EIF_FILENAME dir_name);
extern void eif_dir_close(EIF_POINTER dir);
extern EIF_BOOLEAN eif_dir_exists(EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_readable(EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_writable(EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_executable(EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_deletable(EIF_FILENAME name);
extern EIF_CHARACTER_8 eif_dir_separator(void);
extern EIF_INTEGER eif_dir_current(EIF_FILENAME a_buffer, EIF_INTEGER a_count);
extern EIF_INTEGER eif_chdir(EIF_FILENAME path);

#ifdef __cplusplus
}
#endif

#endif
