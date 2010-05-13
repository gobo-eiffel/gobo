/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PLUG_H
#define EIF_PLUG_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS
extern int nstcall;	/* Nested call global variable: signals a nested call and
					 * trigger an invariant check in generated C routines  */
#endif

#ifdef __cplusplus
}
#endif

#endif
