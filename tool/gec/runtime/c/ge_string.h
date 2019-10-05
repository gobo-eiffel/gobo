/*
	description:

		"C functions used to manipulate strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_STRING_H
#define GE_STRING_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * New Eiffel empty string of type "STRING_8" with can
 * contain `c' characters.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_REFERENCE GE_new_str8(EIF_INTEGER c);

/*
 * New Eiffel empty string of type "IMMUTABLE_STRING_8" with can
 * contain `c' characters.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_REFERENCE GE_new_istr8(EIF_INTEGER c);

/*
 * New Eiffel empty string of type "STRING_32" with can
 * contain `c' characters.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_REFERENCE GE_new_str32(EIF_INTEGER c);

/*
 * New Eiffel empty string of type "IMMUTABLE_STRING_32" with can
 * contain `c' characters.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_REFERENCE GE_new_istr32(EIF_INTEGER c);

/*
 * New Eiffel string of type "STRING_8" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_ms8(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "STRING_8" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_str8(const char* s);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_8" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_ims8(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "STRING_32" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_ms32(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "STRING_32" containing the
 * first `c' 32-bit characters built from `s' by reading
 * groups of four bytes with little-endian byte order.
 */
extern EIF_REFERENCE GE_ms32_from_utf32le(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "STRING_32" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_str32(const char* s);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing
 * the first `c' characters found in ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_ims32(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing the
 * first `c' 32-bit characters built from `s' by reading
 * groups of four bytes with little-endian byte order.
 */
extern EIF_REFERENCE GE_ms32_from_utf32le(const char* s, EIF_INTEGER c);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
extern EIF_REFERENCE GE_istr32(const char* s);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing the
 * first `n' native characters found in native string `s'.
 * Invalid native characters are escaped.
 */
extern EIF_REFERENCE GE_ims32_from_nstr(EIF_NATIVE_CHAR* s, EIF_INTEGER n);

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing all
 * characters found in the null-terminated native string `s'.
 * Invalid native characters are escaped.
 */
extern EIF_REFERENCE GE_istr32_from_nstr(EIF_NATIVE_CHAR* s);

/*
 * New Eiffel string of type "STRING" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'
 */
extern EIF_REFERENCE GE_str(const char* s);

#ifdef __cplusplus
}
#endif

#endif
