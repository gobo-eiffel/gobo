/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

extern EIF_INTEGER eif_system(char* s);
extern void eif_system_asynchronous(char* cmd);
extern char* eif_getenv(char* k);

#endif
