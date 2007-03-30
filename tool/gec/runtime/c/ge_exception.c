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
struct gerescue *gerescue;

/* Raise an exception with code `code'. */
void geraise(int code) {
	struct gerescue *r = gerescue;
	if (r != 0) {
		gerescue = r->previous;
		gelongjmp(r->jb, code);
	}
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
}

#ifdef __cplusplus
}
#endif

#endif
