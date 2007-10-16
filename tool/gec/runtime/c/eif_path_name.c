/*
	description:

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_C
#define EIF_PATH_NAME_C

#ifdef EIF_WINDOWS
#include <windows.h>
#endif
#include <string.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER* p) {
#ifdef WIN32
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
		/* Unix */
	return (EIF_BOOLEAN)(*p == '\0');
#endif
}

EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	return eif_is_file_name_valid(p);
#else
		/* Unix */
	return EIF_TRUE;
#endif
}

void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
	if (*((char*)p) != '\0')
#ifdef EIF_WINDOWS
		strcat((char*)p, "\\");
#else /* Unix */
		strcat((char*)p, "/");
#endif
	strcat((char*)p, (char*)v);
}

void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
#ifdef WIN32
	strcat((char*)p, (char*)v);
#else /* Unix */
	if (*((char*)v) != '/' )
		strcat((char*)p, "/");
	strcat((char*)p, (char*)v);
#endif
}

EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER* s, EIF_CHARACTER* t, EIF_INTEGER length) {
#ifdef EIF_WINDOWS
	return EIF_TEST(!strnicmp((char*)s, (char*)t, length));
#else /* Unix */
	return EIF_TEST(!strncmp((char*)s, (char*)t, length));
#endif
}

EIF_REFERENCE eif_volume_name(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	/* To be implemented */
#else /* Unix */
	/* To be implemented */
#endif
	return EIF_VOID;
}

EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	/* To be implemented */
#else /* Unix */
	/* To be implemented */
#endif
	return EIF_VOID;
}

void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
	if (*((char*)p) == '\0'){
		strcat((char*)p, (char*)v);
	} else {
#ifdef EIF_WINDOWS
		if (p[strlen((char*)p) - 1] != '\\')
			strcat((char*)p, "\\");
#else /* Not Windows: append unix delimiter */
		if (p[strlen((char*)p) - 1] != '/')
			strcat((char *)p, "/");
#endif
		strcat((char*)p, (char*)v);
	}
}

EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	return EIF_TRUE;
#else /* Unix */
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_home_dir_supported(void) {
#ifdef WIN32
	return EIF_FALSE;
#else
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_root_dir_supported(void) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_case_sensitive_path_names(void) {
#ifdef EIF_WINDOWS
	return EIF_FALSE;
#else /* Unix */
	return EIF_TRUE;
#endif
}

EIF_REFERENCE eif_current_dir_representation(void) {
	return GE_ms(".", 1);
}

EIF_REFERENCE eif_home_directory_name(void) {
#ifdef WIN32
	return EIF_VOID;
#else
	char* s = getenv("HOME");
	return GE_ms(s, strlen(s));
#endif
}

EIF_REFERENCE eif_root_directory_name(void) {
#ifdef EIF_WINDOWS
	return GE_ms("\\", 1);
#else
	return GE_ms("/", 1);
#endif
}

#ifdef __cplusplus
}
#endif

#endif
