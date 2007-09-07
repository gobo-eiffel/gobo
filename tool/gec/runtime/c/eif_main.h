/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_H
#define EIF_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#include <windows.h>
/* Used in WEL */
extern HINSTANCE eif_hInstance;

/* Break the shell command held in 'cmd', putting each shell
 * word in a separate array entry, hence building an argument
 * suitable for the 'main'. Note that 'cmd' will be altered
 * and 'argvp' will point to some chunks of it.
 */
extern void get_argcargv(char* cmd, int* argc, char*** argvp);
#endif

/* Used by the ISE runtime to figure out whether the application
   was launched from EiffelStudio in workbench mode or not */
extern int debug_mode;

#ifdef __cplusplus
}
#endif

#endif
