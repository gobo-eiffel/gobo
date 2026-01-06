/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2026, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_DIR_H
#include "eif_dir.h"
#endif
#ifndef EIF_CONFIG_H
#include "eif_config.h"
#endif

#include <sys/stat.h>
#ifdef EIF_WINDOWS
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATAW last_entry;
	wchar_t	*name;
} GE_directory;
#ifdef __cplusplus
}
#endif
#include <io.h> /* for 'access' */
#include <direct.h> /* (ch|rm)dir */
#include <wchar.h>
#else
#include <dirent.h>
#include <unistd.h>
#endif
#include <string.h>

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

#ifndef S_IRUSR
#define S_IRUSR 0000400
#endif
#ifndef S_IWUSR
#define S_IWUSR 0000200
#endif
#ifndef S_IXUSR
#define S_IXUSR 0000100
#endif
#ifndef S_IRGRP
#define S_IRGRP 0000040
#endif
#ifndef S_IWGRP
#define S_IWGRP 0000020
#endif
#ifndef S_IXGRP
#define S_IXGRP 0000010
#endif
#ifndef S_IROTH
#define S_IROTH 0000004
#endif
#ifndef S_IWOTH
#define S_IWOTH 0000002
#endif
#ifndef S_IXOTH
#define S_IXOTH 0000001
#endif
#ifndef S_IFDIR
#define S_IFDIR 0040000
#endif
#ifndef S_IFCHR
#define S_IFCHR 0020000
#endif
#ifdef __LCC__
#ifndef _S_IFCHR
#define _S_IFCHR S_IFCHR
#endif
#endif
#ifndef S_IFBLK
#define S_IFBLK 0060000
#endif
#ifndef S_IFREG
#define S_IFREG 0100000
#endif
#ifndef S_IFIFO
#define S_IFIFO 0010000
#endif
#ifndef S_IFLNK
#define S_IFLNK 0120000
#endif
#ifndef S_IFSOCK
#define S_IFSOCK 0140000
#endif
#ifndef S_IFMT
#define S_IFMT 0170000
#endif
#ifndef S_ISREG
#define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif
#ifndef S_ISDIR
#define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif
#ifndef S_ISCHR
#define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif
#ifndef S_ISBLK
#define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif
#ifndef S_ISLNK
#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
#endif
#ifndef S_ISFIFO
#define S_ISFIFO(m) (((m) & S_IFMT) == S_IFIFO)
#endif

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

/* The following access constants seems to be universally accepeted. And
 * anyway, it's only after BSD 4.1 that the symbolic constants appeared.
 */
#ifndef R_OK
#define R_OK 4
#define W_OK 2
#define X_OK 1
#define F_OK 0
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#	ifdef __LCC__
#		define rt_stat_buf	struct stat
#	elif defined EIF_64_BITS
#		define rt_stat_buf	struct _stat64
#	else
#		define rt_stat_buf	struct _stat64i32
#	endif
#else
#	define rt_stat_buf		struct stat
#endif

#ifdef EIF_WINDOWS
#	ifdef __LCC__
#		define rt_stat		_wstat
#		define rt_fstat		fstat
#	elif defined(EIF_64_BITS)
#		define rt_stat		_wstat64
#		define rt_fstat		_fstat64
#	else
#		define rt_stat		_wstat64i32
#		define rt_fstat		_fstat64i32
#	endif
#	define rt_access		_waccess
#else
#	define rt_stat			stat
#	define rt_fstat			fstat
#	define rt_access		access
#endif

EIF_POINTER eif_dir_open(EIF_FILENAME dirname)
{
#ifdef EIF_WINDOWS
	GE_directory* result = (GE_directory*)malloc(sizeof(GE_directory));
	result->name = dirname;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_POINTER eif_dir_next(EIF_POINTER dir)
{
#ifdef EIF_WINDOWS
	BOOL r;
	size_t a_name_length;
	wchar_t * wname;
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		r = FindNextFileW(h, &(GE_dir->last_entry));
	} else {
		r = EIF_FALSE;
			/* Allocate additional space for "\\*": 2 characters + terminating zero */
		a_name_length = wcslen(GE_dir->name);
		wname = (wchar_t *)malloc((a_name_length + 3) * sizeof(wchar_t));
		if (!wname) {
			enomem();
		} else {
			wcscpy(wname, GE_dir->name);
			if (wname[a_name_length - 1] == '\\') {
				wcscat(wname, L"*");
			} else {
				wcscat(wname , L"\\*");
			}
			h = FindFirstFileW(wname, &(GE_dir->last_entry));
			free(wname);
			if (h != INVALID_HANDLE_VALUE) {
				GE_dir->handle = h;
				r = EIF_TRUE;
			}
		}
	}
	if (r) {
		return GE_dir->last_entry.cFileName;
	} else {
		return NULL;
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		return p->d_name;
	} else {
		return NULL;
	}
#endif
}

EIF_POINTER eif_dir_rewind(EIF_POINTER dir, EIF_FILENAME a_name)
{
#ifdef EIF_WINDOWS
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
#else
	DIR* GE_dir = (DIR*)dir;
	rewinddir(GE_dir);
#endif
	return GE_dir;
}

void eif_dir_close(EIF_POINTER dir)
{
#ifdef EIF_WINDOWS
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
	free(GE_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(EIF_FILENAME dirname)
{
	rt_stat_buf buf;

	return (EIF_BOOLEAN)((!rt_stat (dirname, &buf) && S_ISDIR(buf.st_mode)) ? EIF_TRUE : EIF_FALSE);
}

EIF_BOOLEAN eif_dir_is_readable(EIF_FILENAME dirname)
{
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN)(_waccess (dirname, R_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(EIF_FILENAME dirname)
{
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN)(_waccess(dirname, F_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(EIF_FILENAME dirname)
{
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN)(_waccess(dirname, W_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_deletable(EIF_FILENAME name)
{
	return eif_dir_is_writable(name);
}

EIF_CHARACTER_8 eif_dir_separator(void)
{
#ifdef EIF_WINDOWS
	return (EIF_CHARACTER_8)'\\';
#else
	return (EIF_CHARACTER_8)'/';
#endif
}

EIF_INTEGER eif_dir_current(EIF_FILENAME a_buffer, EIF_INTEGER a_count)
{
	EIF_INTEGER l_nbytes;

#ifdef EIF_WINDOWS
	wchar_t *subpart;
	wchar_t drive[2];
	drive [0] = '.';
	drive [1] = '\0';
		/* First calculate the length of the buffer we need to hold the current working directory. */
	l_nbytes = (GetFullPathNameW(drive, 0, NULL, &subpart) + 1) * sizeof(wchar_t);

	if (l_nbytes == 0) {
			/* Failure: we cannot retrieve our current directory. */
		l_nbytes = -1;
	} else {
		if (a_buffer && (a_count >= l_nbytes)) {
			l_nbytes = (GetFullPathNameW(drive, l_nbytes / sizeof(wchar_t), a_buffer, &subpart) + 1) * sizeof(wchar_t);
		}
	}
	return l_nbytes;
#else
	char *cwd;
	cwd = getcwd(NULL, PATH_MAX);

	if (cwd) {
		l_nbytes = (strlen(cwd) + 1) * sizeof(char);
		if (a_buffer && (a_count >= l_nbytes)) {
			memcpy(a_buffer, cwd, l_nbytes);
		}
		free(cwd);	/* Not `eif_free', getcwd() call malloc in POSIX.1 */
	} else {
		l_nbytes = -1;
	}

	return l_nbytes;

#endif
}

EIF_INTEGER eif_chdir(EIF_FILENAME path)
{
#ifdef EIF_WINDOWS
	return _wchdir(path);
#else
	return chdir(path);
#endif
}

#ifdef __cplusplus
}
#endif

#endif
