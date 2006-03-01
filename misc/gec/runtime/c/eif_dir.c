/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef WIN32
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	char *pattern;
} ge_directory;
#include <io.h> /* for 'access' */
#else
#include <dirent.h>
#include <unistd.h>
#endif
#include <sys/stat.h>
#include <string.h>

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

void* dir_open(char* dirname) {
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
	result->pattern = pattern;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_REFERENCE dir_next(void* dir) {
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		if (FindNextFile(h, &(ge_dir->data))) {
			char* s = ge_dir->data.cFileName;
			return gems(s,strlen(s));
		} else {
			return EIF_VOID;
		}
	} else {
		h = FindFirstFile(ge_dir->pattern, &(ge_dir->data));
		if (h == INVALID_HANDLE_VALUE) {
			return EIF_VOID;
		} else {
			char* s = ge_dir->data.cFileName;
			ge_dir->handle = h;
			return gems(s,strlen(s));
		}
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		char* s = p->d_name;
		return gems(s,strlen(s));
	} else {
		return EIF_VOID;
	}
#endif
}

void dir_rewind(void* dir) {
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		FindClose(h);
	}
	ge_dir->handle = 0;
#else
	DIR* ge_dir = (DIR*)dir;
	rewinddir(ge_dir);
#endif
}

void dir_close(void* dir) {
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		FindClose(h);
	}
	free(ge_dir->pattern);
	free(ge_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(char* dirname) {
	struct stat buf;

	if (stat(dirname, &buf) == -1) {
		return EIF_FALSE;
	} else {
		return ((buf.st_mode & S_IFDIR) ? EIF_TRUE : EIF_FALSE);
	}
}

EIF_BOOLEAN eif_dir_is_readable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN)(access(dirname, 04) != -1);
#else
#ifdef HAS_GETEUID
	int uid, gid;
	int euid, egid;
#endif
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
#ifdef HAS_GETEUID
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
	else
#endif
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 0) != -1);
#else
#ifdef HAS_GETEUID
	int uid, gid;
	int euid, egid;
#endif
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
#ifdef HAS_GETEUID
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
	else
#endif
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 02) != -1);
#else
#ifdef HAS_GETEUID
	int uid, gid;
	int euid, egid;
#endif
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
#ifdef HAS_GETEUID
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
	else
#endif
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

void eif_dir_delete(char* dirname) {
	rmdir(dirname);
}

EIF_CHARACTER eif_dir_separator(void) {
#ifdef WIN32
	return (EIF_CHARACTER)'\\';
#else
	return (EIF_CHARACTER)'/';
#endif
}

EIF_REFERENCE dir_current(void) {
	char* s;
	EIF_REFERENCE result;

	s = (char*)getcwd(NULL, PATH_MAX);
	result = gems(s, strlen(s));
	free(s);
	return result;
}

EIF_INTEGER eif_chdir(char* path) {
	return chdir(path);
}

#endif
