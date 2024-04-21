/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef ISE_PSTORE_H
#define ISE_PSTORE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_STRUCT_H
#include "eif_struct.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern long store_append(EIF_INTEGER f_desc, EIF_REFERENCE o, fnptr mid, fnptr nid, EIF_REFERENCE s);
extern void parsing_store_initialize(void);
extern void parsing_store_dispose(void);
extern void parsing_store(EIF_INTEGER file_desc, EIF_REFERENCE object);
extern EIF_REFERENCE partial_retrieve(EIF_INTEGER f_desc, long position, long nb_obj);
extern EIF_REFERENCE retrieve_all(EIF_INTEGER f_desc, long position);
extern void parsing_retrieve_initialize(void);
extern EIF_REFERENCE parsing_retrieve(EIF_INTEGER f_desc, EIF_INTEGER a_pos);

#ifdef __cplusplus
}
#endif

#endif
