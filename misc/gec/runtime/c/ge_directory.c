/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DIRECTORY_C
#define GE_DIRECTORY_C

#ifdef WIN32
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	int entry_used;
	char *pattern;
} ge_directory;
#else
#include <dirent.h>
#include <unistd.h>
#endif

void* ge_directory_open_read(char* dirname)
{
#ifdef WIN32
	int len = strlen((char*)dirname);
	char* pattern = malloc(len + 5);
	ge_directory* result = malloc(sizeof(ge_directory));

	pattern = strcpy(pattern, (char*)dirname);
	if (pattern[len - 1] != '\\')
		pattern[len++] = '\\';
	pattern[len++] = '*';
	pattern[len++] = '.';
	pattern[len++] = '*';
	pattern[len++] = '\0';
	result->handle = FindFirstFile(pattern, &(result->data));
	if (result->handle == INVALID_HANDLE_VALUE) {
		free(pattern);
		free(result);
		return NULL;
	} else {
		result->pattern = pattern;
	}
	result->entry_used = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

void* ge_directory_read_entry(void* dir)
{
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;

	if (ge_dir->entry_used) {
		if (FindNextFile(ge_dir->handle, &(ge_dir->data))) {
			return ge_dir;
		} else {
			return NULL;
		}
	} else {
		ge_dir->entry_used = 1;
		return ge_dir;
	}
#else
	return readdir((DIR*)dir);
#endif
}

char* ge_directory_last_entry (void* dir)
{
#ifdef WIN32
	return ((ge_directory*)dir)->data.cFileName;
#else
	return ((struct dirent*)dir)->d_name;
#endif
}

int ge_directory_close (void* dir)
{
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	FindClose(ge_dir->handle);
	free(ge_dir->pattern);
	free(ge_dir);
	return 0;
#else
	return closedir((DIR*)dir);
#endif
}

#endif
