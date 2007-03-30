/*
	description:

		"C functions used for object traversal"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_TRAVERSE_C
#define EIF_TRAVERSE_C

#ifdef __cplusplus
extern "C" {
#endif

EIF_REFERENCE find_referers (EIF_REFERENCE target, EIF_INTEGER result_type) {
	/* TODO */
	printf("'find_referers' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

EIF_REFERENCE find_instance_of (EIF_INTEGER instance_type, EIF_INTEGER result_type) {
	/* TODO */
	printf("'find_instance_of' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

EIF_REFERENCE find_all_instances (EIF_INTEGER result_type) {
	/* TODO */
	printf("'find_all_instances' in 'eif_traverse.h' not implemented\n");
	return EIF_VOID;
}

#ifdef __cplusplus
}
#endif

#endif
