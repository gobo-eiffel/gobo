/*
	description:

		"C functions used for object traversal"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_TRAVERSE_H
#define EIF_TRAVERSE_H

extern EIF_REFERENCE find_referers (EIF_REFERENCE target, EIF_INTEGER result_type);
extern EIF_REFERENCE find_instance_of (EIF_INTEGER instance_type, EIF_INTEGER result_type);
extern EIF_REFERENCE find_all_instances (EIF_INTEGER result_type);

#endif
