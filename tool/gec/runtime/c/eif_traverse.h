/*
	description:

		"C functions used for object traversal"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_TRAVERSE_H
#define EIF_TRAVERSE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_REFERENCE find_referers(EIF_REFERENCE target, EIF_INTEGER result_type);
extern EIF_REFERENCE find_instance_of(EIF_INTEGER instance_type, EIF_INTEGER result_type);
extern EIF_REFERENCE find_all_instances(EIF_INTEGER result_type);
extern EIF_REFERENCE once_objects(EIF_INTEGER result_type);

#ifdef __cplusplus
}
#endif

#endif
