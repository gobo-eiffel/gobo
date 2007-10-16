/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DIRECTORY_C
#define GE_DIRECTORY_C

#ifdef WIN32
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	int entry_used;
	char *pattern;
} GE_directory;
#ifdef __cplusplus
}
#endif
#else
#include <dirent.h>
#include <unistd.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

void* GE_directory_open_read(char* dirname)
{
#ifdef WIN32
	int len = strlen((char*)dirname);
	char* pattern = malloc(len + 5);
	GE_directory* result = malloc(sizeof(GE_directory));

	pattern = strncpy(pattern, (char*)dirname, len);
	if (pattern[len - 1] != '\\')
		pattern[len++] = '\\';
	pattern[len++] = '*';
	pattern[len++] = '.';
	pattern[len++] = '*';
	pattern[len++] = '\0';
	result->handle = FindFirstFileA(pattern, &(result->data));
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

void* GE_directory_read_entry(void* dir)
{
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;

	if (GE_dir->entry_used) {
		if (FindNextFileA(GE_dir->handle, &(GE_dir->data))) {
			return GE_dir;
		} else {
			return NULL;
		}
	} else {
		GE_dir->entry_used = 1;
		return GE_dir;
	}
#else
	return readdir((DIR*)dir);
#endif
}

char* GE_directory_last_entry (void* dir)
{
#ifdef WIN32
	return ((GE_directory*)dir)->data.cFileName;
#else
	return ((struct dirent*)dir)->d_name;
#endif
}

int GE_directory_close (void* dir)
{
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	FindClose(GE_dir->handle);
	free(GE_dir->pattern);
	free(GE_dir);
	return 0;
#else
	return closedir((DIR*)dir);
#endif
}

#ifdef __cplusplus
}
#endif

#endif
