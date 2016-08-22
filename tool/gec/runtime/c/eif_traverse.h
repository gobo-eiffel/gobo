/*
	description:

		"C functions used for object traversal"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_TRAVERSE_H
#define EIF_TRAVERSE_H

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
