/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_H
#define EIF_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Used by the ISE runtime to figure out whether the application
 * was launched from EiffelStudio in workbench mode or not.
 */
extern int debug_mode;

#ifdef __cplusplus
}
#endif

#endif
