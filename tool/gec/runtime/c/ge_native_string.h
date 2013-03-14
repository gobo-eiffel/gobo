/*
	description:

		"C functions used to manipulate native strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_NATIVE_STRING_H
#define GE_NATIVE_STRING_H

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#include <string.h>
#ifndef EIF_WINDOWS
#include <sys/types.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

	/* Macro used to manipulate native string, i.e: (wchar_t*) */
#define GE_nstrlen wcslen /* size of string */
#define GE_nstrncpy wcsncpy /* Copy n characters of one string to another */
#define GE_nstrcpy wcscpy /* Copy one string to another */
#define GE_nstrncat wcsncat /* Append characters of a string */
#define GE_nstrcat wcscat /* Append a string */
#define GE_nstrstr wcsstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) L##quote /* Manifest Native string declaration */
#define GE_nstr_fopen	_wfopen /* Open file using native string name */
#define GE_nstrcmp wcscmp /* Compare two strings. */
#define GE_nstrdup _wcsdup /* Duplicate string. */

#define GE_nstr_cat_ascii(dest, src) { 						\
		int i;													\
		size_t dest_len, src_len;								\
		dest_len = rt_nstrlen (dest);							\
		src_len = strlen (src);									\
		for (i = 0; i < src_len; i++) {							\
			dest[dest_len + i] = (EIF_NATIVE_CHAR) src[i];		\
		}														\
		dest[dest_len + src_len] = (EIF_NATIVE_CHAR) 0;			\
	}

#else /* not EIF_WINDOWS */

	/* Macro used to manipulate native string, i.e: (char*) */
#define GE_nstrlen  strlen /* size of string */
#define GE_nstrncpy strncpy /* Copy n characters of one string to another */
#define GE_nstrcpy strcpy /* Copy one string to another */
#define GE_nstrncat strncat /* Append characters of a string */
#define GE_nstrcat strcat /* Append a string */
#define GE_nstrstr strstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) quote /* Manifest Native string declaration */
#define GE_nstr_fopen	fopen /* Open file using native string name */
#define GE_nstrcmp strcmp /* Compare two strings. */
#define GE_nstrdup strdup /* Duplicate string. */

#define GE_nstr_cat_ascii strcat

#endif


#ifdef __cplusplus
}
#endif

#endif
