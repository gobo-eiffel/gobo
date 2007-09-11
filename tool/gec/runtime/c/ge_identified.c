/*
	description:

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_IDENTIFIED_C
#define GE_IDENTIFIED_C

#ifdef __cplusplus
extern "C" {
#endif

/* Get a new id for `object', assuming it is NOT in the stack */
EIF_INTEGER ge_object_id(EIF_OBJECT object) {
	return (EIF_INTEGER)object;
}

/* Return the object associated with `id' */
EIF_REFERENCE ge_id_object(EIF_INTEGER id) {
	return (EIF_REFERENCE)id;
}

/* Remove the object associated with `id' from the stack */
void ge_object_id_free(EIF_INTEGER id) {
	/* Do nothing */
}

#ifdef __cplusplus
}
#endif

#endif
