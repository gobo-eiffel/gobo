/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

void file_mkdir (char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#else
#endif
}

void file_rename (char* old, char* new) {
#ifdef WIN32
	struct stat buf;

	if (stat(old, &buf) != -1) {
		remove (old);
	}
#endif
	rename(old, new);
}

#endif
