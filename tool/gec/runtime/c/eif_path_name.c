/*
	description:

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_C
#define EIF_PATH_NAME_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_PATH_NAME_H
#include "eif_path_name.h"
#endif
#ifndef GE_STRING_H
#include "ge_string.h"
#endif

#ifdef EIF_WINDOWS
#include <windows.h>
#include <shlobj.h>
#endif
#include <string.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER_8* p)
{
#ifdef EIF_WINDOWS
	char rootpath[4];

	if (p)
		if ((strlen((char*)p) == 2) && (*(p+1) == ':')) {
			strncpy((char*)rootpath, (char*)p, 2);
			rootpath[2] = '\\';
			rootpath [3] = '\0';
			return (EIF_BOOLEAN)(GetDriveTypeA(rootpath) != 1);
		}
	return EIF_FALSE;
#else
	return (EIF_BOOLEAN)(*p == '\0');
#endif
}

EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER_8* p)
{
#ifdef EIF_WINDOWS
	return eif_is_file_name_valid(p);
#else
	return EIF_TRUE;
#endif
}

void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v)
{
	if (*((char*)p) != '\0')
#ifdef EIF_WINDOWS
		strcat((char*)p, "\\");
#else /* Unix */
		strcat((char*)p, "/");
#endif
	strcat((char*)p, (char*)v);
}

void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v)
{
#ifdef EIF_WINDOWS
	strcat((char*)p, (char*)v);
#else
	if (*((char*)v) != '/' )
		strcat((char*)p, "/");
	strcat((char*)p, (char*)v);
#endif
}

EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER_8* s, EIF_CHARACTER_8* t, EIF_INTEGER length)
{
#ifdef EIF_WINDOWS
	return EIF_TEST(!strnicmp((char*)s, (char*)t, length));
#else
	return EIF_TEST(!strncmp((char*)s, (char*)t, length));
#endif
}

EIF_REFERENCE eif_volume_name(EIF_CHARACTER_8* p)
{
#ifdef EIF_WINDOWS
	/* To be implemented */
#else
	/* To be implemented */
#endif
	return EIF_VOID;
}

EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER_8* p)
{
#ifdef EIF_WINDOWS
	/* To be implemented */
#else
	/* To be implemented */
#endif
	return EIF_VOID;
}

void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER_8* p, EIF_CHARACTER_8* v)
{
	if (*((char*)p) == '\0'){
		strcat((char*)p, (char*)v);
	} else {
#ifdef EIF_WINDOWS
		if (p[strlen((char*)p) - 1] != '\\')
			strcat((char*)p, "\\");
#else
		if (p[strlen((char*)p) - 1] != '/')
			strcat((char *)p, "/");
#endif
		strcat((char*)p, (char*)v);
	}
}

EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER_8* p)
{
#ifdef EIF_WINDOWS
	return EIF_TRUE;
#else
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER_8* p)
{
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER_8* p)
{
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER_8* p)
{
	return EIF_TRUE;
}

EIF_BOOLEAN eif_home_dir_supported(void)
{
#ifdef EIF_WINDOWS
	return EIF_FALSE;
#else
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_root_dir_supported(void)
{
	return EIF_TRUE;
}

EIF_BOOLEAN eif_case_sensitive_path_names(void)
{
#ifdef EIF_WINDOWS
	return EIF_FALSE;
#else /* Unix */
	return EIF_TRUE;
#endif
}

EIF_REFERENCE eif_current_dir_representation(void)
{
	return GE_ms(".", 1);
}

EIF_REFERENCE eif_root_directory_name(void)
{
#ifdef EIF_WINDOWS
	return GE_ms("\\", 1);
#else
	return GE_ms("/", 1);
#endif
}

EIF_INTEGER eif_home_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count)
{
		/* String representation of $HOME */
#ifdef EIF_WINDOWS
	EIF_INTEGER l_nbytes;
	if (a_buffer && (a_count >= (MAX_PATH * sizeof(wchar_t)))) {
			/* Buffer is large enough for the call to SHGetFolderPathW. */
		if (SHGetFolderPathW(NULL, CSIDL_LOCAL_APPDATA | CSIDL_FLAG_CREATE, NULL, SHGFP_TYPE_CURRENT, a_buffer) == S_OK) {
			return (EIF_INTEGER)((wcslen(a_buffer) + 1) * sizeof(wchar_t));
		} else {
			wchar_t *l_env_value = _wgetenv(L"APPDATA");
			if (l_env_value) {
				l_nbytes = (EIF_INTEGER)((wcslen(l_env_value) + 1) * sizeof(wchar_t));
				if (a_count >= l_nbytes) {
					memcpy(a_buffer, l_env_value, l_nbytes);
				}
				return l_nbytes;
			} else {
				return 0;
			}
		}
	} else {
			/* Buffer is NULL or not large enough we ask for more. */
		return MAX_PATH * sizeof(wchar_t);
	}
#else
	char *l_env_value;
	char l_home[2] = "~";
	EIF_INTEGER l_nbytes;

	l_env_value = getenv("HOME");
	if (!l_env_value) {
		l_env_value = l_home;
	}
	_nbytes = (strlen(l_env_value) + 1) * sizeof(char);
	if (a_buffer && (a_count >= l_nbytes)) {
		memcpy(a_buffer, l_env_value, l_nbytes);
	}
	return l_nbytes;
#endif
}

/*
 * Store the representation of the temporary directory in `a_buffer'
 * as a null-terminated path in UTF-16 encoding on Windows and a
 * byte sequence otherwise.
 * Return the size in bytes actually required in `a_buffer' including
 * the terminating null character. If `a_count' is less than the
 * returned value or if `a_buffer' is NULL, nothing is done to `a_buffer'.
 * `a_buffer' is a pointer to a buffer that will hold the temporary directory,
 * or NULL if length of buffer is required.
 * `a_count'is the length of `a_buffer' in bytes.
 */
EIF_INTEGER eif_temporary_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count)
{
#ifdef EIF_WINDOWS
	EIF_INTEGER l_nbytes;
	if (a_buffer && (a_count >= (MAX_PATH * sizeof(wchar_t)))) {
			/* Buffer is large enough for the call to GetTempPathW. */
		l_nbytes = (EIF_INTEGER) GetTempPathW(a_count, a_buffer);
		if (l_nbytes == 0) {
			/* Failure ... use GetLastError for more information */
			return 0;
		} else if (l_nbytes > a_count) {
			return l_nbytes;
		} else {
			return (EIF_INTEGER) ((wcslen(a_buffer) + 1) * sizeof (wchar_t));
		}
	} else {
			/* Buffer is NULL or not large enough we ask for more. */
		return MAX_PATH * sizeof(wchar_t);
	}
#else
	char *l_env_value;
	EIF_INTEGER l_nbytes;
    (l_env_value = getenv("TMPDIR" )) ||
    (l_env_value = getenv("TMP"    )) ||
    (l_env_value = getenv("TEMP"   )) ||
    (l_env_value = getenv("TEMPDIR")) ||
	(l_env_value = "/tmp");
	l_nbytes = (strlen(l_env_value) + 1) * sizeof(char);
	if (a_buffer && (a_count >= l_nbytes)) {
		memcpy(a_buffer, l_env_value, l_nbytes);
	}
	return l_nbytes;
#endif
}

EIF_INTEGER eif_user_directory_name_ptr(EIF_FILENAME a_buffer, EIF_INTEGER a_count)
{
#ifdef EIF_WINDOWS
	if (a_buffer && (a_count >= (MAX_PATH * sizeof(wchar_t)))) {
			/* Buffer is large enough for the call to SHGetFolderPathW. */
		if (SHGetSpecialFolderPathW(NULL, a_buffer, CSIDL_PERSONAL, TRUE)) {
			return (EIF_INTEGER)((wcslen(a_buffer) + 1) * sizeof(wchar_t));
		} else {
			return 0;
		}
	} else {
			/* Buffer is NULL or not large enough we ask for more. */
		return MAX_PATH * sizeof(wchar_t);
	}
#else
	return 0;
#endif
}

#ifdef __cplusplus
}
#endif

#endif
