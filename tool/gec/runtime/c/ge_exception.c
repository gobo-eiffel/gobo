/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
struct GE_rescue *GE_rescue;

/* Raise an exception with code `code'. */
void GE_raise(int code) {
	struct GE_rescue *r = GE_rescue;
	if (r != 0) {
		GE_rescue = r->previous;
		GE_longjmp(r->jb, code);
	}
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
}

#ifdef __cplusplus
}
#endif

#endif
