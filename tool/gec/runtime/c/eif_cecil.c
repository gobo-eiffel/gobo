/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CECIL_C
#define EIF_CECIL_C

#ifdef __cplusplus
extern "C" {
#endif

EIF_PROCEDURE eif_procedure(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_procedure' in 'eif_cecil.c' not implemented\n");
	return (EIF_PROCEDURE) 0;
}

EIF_INTEGER_FUNCTION eif_integer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_integer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_INTEGER_FUNCTION) 0;
}

EIF_REFERENCE_FUNCTION eif_reference_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_reference_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REFERENCE_FUNCTION) 0;
}

EIF_POINTER_FUNCTION eif_pointer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_pointer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_POINTER_FUNCTION) 0;
}

EIF_BOOLEAN_FUNCTION eif_boolean_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_boolean_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_BOOLEAN_FUNCTION) 0;
}

EIF_REAL_32_FUNCTION eif_real_32_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_32_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_32_FUNCTION) 0;
}

EIF_REAL_64_FUNCTION eif_real_64_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_64_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_64_FUNCTION) 0;
}

EIF_CHARACTER_FUNCTION eif_character_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_character_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_CHARACTER_FUNCTION) 0;
}

EIF_OBJECT eif_create(EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_create' in 'eif_cecil.c' not implemented\n");
	return (EIF_OBJECT) 0;
}

EIF_TYPE_ID eif_type_id(char* type_string) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_type_id' in 'eif_cecil.c' not implemented\n");
	return EIF_NO_TYPE;
}

extern EIF_INTEGER eifaddr_offset(EIF_REFERENCE object, char *name, int * const ret) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eifaddr_offset' in 'eif_cecil.c' not implemented\n");
	return 0;
}

EIF_TYPE_ID eiftype(EIF_OBJECT object) {
		/* Obsolete. Use "eif_type_by_reference" instead.
		 * Return the Type id of the specified object. 
		 */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_ID eif_type_by_reference (EIF_REFERENCE object) {
		/* Return type id of the direct reference "object" */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_INDEX eif_gen_param_id (EIF_TYPE_INDEX dftype, uint32_t pos) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_gen_param_id' in 'eif_cecil.c' not implemented\n");
	return 0;
}

#ifdef __cplusplus
}
#endif

#endif
