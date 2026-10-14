/*
	description:

		"C functions used to manipulate strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2026, Eric Bezault and others"
	license: "MIT License"
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

/*
 * Base address of `o' of type "SPECIAL [CHARACTER_8].
 * The base address is the addresss of the first character in `o'.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_POINTER GE_sp8_base_address(EIF_REFERENCE o);

/*
 * Base address of `o' of type "SPECIAL [CHARACTER_32].
 * The base address is the addresss of the first character in `o'.
 * Note: The implementation of this function is generated
 * by the Eiffel compiler.
 */
extern EIF_POINTER GE_sp32_base_address(EIF_REFERENCE o);

/*
 * Compare `count1` first characters of `s1` with
 * `count2` first characters of `s2`.
 * 0 if same count and equal,
 * < 0 if `s1` < `s2`,
 * > 0 if `s1` > `s2`.
 */
extern int GE_str8_compare(EIF_CHARACTER_8* s1, EIF_INTEGER count1, EIF_CHARACTER_8* s2, EIF_INTEGER count2);

/*
 * Compare `count1` first characters of `s1` with
 * `count2` first characters of `s2`.
 * 0 if same count and equal,
 * < 0 if `s1` < `s2`,
 * > 0 if `s1` > `s2`.
 */
extern int GE_str32_compare(EIF_CHARACTER_32* s1, EIF_INTEGER count1, EIF_CHARACTER_32* s2, EIF_INTEGER count2);

/*
 * Are the `count1` first characters of `s1` the same as
 * the `count2` first characters of `s2`?
 */
extern int GE_str8_same_characters(EIF_CHARACTER_8* s1, EIF_INTEGER count1, EIF_CHARACTER_8* s2, EIF_INTEGER count2);

/*
 * Are the `count1` first characters of `s1` the same as
 * the `count2` first characters of `s2`?
 */
extern int GE_str32_same_characters(EIF_CHARACTER_32* s1, EIF_INTEGER count1, EIF_CHARACTER_32* s2, EIF_INTEGER count2);

/*
 * Are the `count` first characters of `s` greater than or equal to
 * the `count1` first characters of `s1` and less than or equal to
 * the `count2` first characters of `s2`?
 */
extern int GE_str8_is_inbetween(EIF_CHARACTER_8* s, EIF_INTEGER count, EIF_CHARACTER_8* s1, EIF_INTEGER count1, EIF_CHARACTER_8* s2, EIF_INTEGER count2);

/*
 * Are the `count` first characters of `s` greater than or equal to
 * the `count1` first characters of `s1` and less than or equal to
 * the `count2` first characters of `s2`?
 */
extern int GE_str32_is_inbetween(EIF_CHARACTER_32* s, EIF_INTEGER count, EIF_CHARACTER_32* s1, EIF_INTEGER count1, EIF_CHARACTER_32* s2, EIF_INTEGER count2);

#ifdef __cplusplus
}
#endif

#endif
