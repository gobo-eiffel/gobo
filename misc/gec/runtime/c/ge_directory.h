/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DIRECTORY_H
#define GE_DIRECTORY_H

extern void* ge_directory_open_read(char* dirname);
extern void* ge_directory_read_entry(void* dir);
extern char* ge_directory_last_entry (void* dir);
extern int ge_directory_close (void* dir);

#endif
