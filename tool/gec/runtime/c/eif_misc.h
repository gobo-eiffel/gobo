/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER eif_system(EIF_NATIVE_CHAR* s);
extern void eif_system_asynchronous(EIF_NATIVE_CHAR* cmd);
extern void eif_sleep(EIF_INTEGER_64);

#ifdef EIF_WINDOWS
/* DLL declarations */
#define eif_load_dll(name) GE_load_dll(name)
#endif

#ifdef __cplusplus
}
#endif

#endif
