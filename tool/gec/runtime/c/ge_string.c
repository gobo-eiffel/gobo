/*
	description:

		"C functions used to manipulate strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_STRING_C
#define GE_STRING_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_STRING_H
#include "ge_string.h"
#endif
#ifndef GE_NATIVE_STRING_H
#include "ge_native_string.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Number of EIF_CHARACTER_32 characters which can be read from
 * the first `n' native characters in native string `s'.
 * Invalid native characters are escaped.
 */
static int GE_nstr_str32len(EIF_NATIVE_CHAR* s, EIF_INTEGER n)
{
	int i, j;
#ifdef EIF_WINDOWS
	uint16_t c1, c2;
#else
	uint8_t c1, c2, c3, c4;
#endif

	j = 0;
	for (i = 0; i < n; i++) {
#ifdef EIF_WINDOWS
		c1 = (uint16_t)s[i];
		if (c1 == 0) {
			return j;
		} else if (c1 < 0xD800 || c1 >= 0xE000) {
				/* Codepoint from Basic Multilingual Plane: one 16-bit code unit. */
			j++;
		} else if (c1 <= 0xDBFF && i + 1 < n) {
				/* Check if a lead surrogate (value between 0xD800 and 0xDBFF) is followed by a trail surrogate. */
			c2 = (uint16_t)s[i + 1];
			if (c2 >= 0xDC00 && c2 <= 0xDFFF) {
				/* Supplementary Planes: surrogate pair with lead and trail surrogates. */
				i++;
				j++;
			} else {
				j += 6;
			}
		} else {
			j += 6;
		}
#else
		c1 = (uint8_t)s[i];
		if (c1 == 0) {
			return j;
		} else if (c1 <= 0x7F) {
			j++;
		} else if ((c1 & 0xE0) == 0xC0) {
			if (i + 1 < n) {
				c2 = (uint8_t)s[i + 1];
				if ((c2 & 0xC0) == 0x80) {
					j++;
					i++;
				} else {
					j += 3;
				}
			} else {
				j += 3;
			}
		} else if ((c1 & 0xF0) == 0xE0) {
			if (i + 2 < n) {
				c2 = (uint8_t)s[i + 1];
				c3 = (uint8_t)s[i + 2];
				if ((c2 & 0xC0) == 0x80 && (c3 & 0xC0) == 0x80) {
					j++;
					i +=2;
				} else {
					j += 3;
				}
			} else {
				j += 3;
			}
		} else if ((c1 & 0xF8) == 0xF0) {
			if (i + 3 < n) {
				c2 = (uint8_t)s[i + 1];
				c3 = (uint8_t)s[i + 2];
				c4 = (uint8_t)s[i + 3];
				if ((c2 & 0xC0) == 0x80 && (c3 & 0xC0) == 0x80 && (c4 & 0xC0) == 0x80) {
					j++;
					i +=3;
				} else {
					j += 3;
				}
			} else {
				j += 3;
			}
		} else {
			j += 3;
		}
#endif
	}
	return j;
}

/*
 * Hexadecimal representation of `a_code'.
 * `a_code' is expected to be between 0 and 15.
 */
static char GE_to_hex(uint16_t a_code)
{
	switch (a_code) {
	case 0:
		return '0';
	case 1:
		return '1';
	case 2:
		return '2';
	case 3:
		return '3';
	case 4:
		return '4';
	case 5:
		return '5';
	case 6:
		return '6';
	case 7:
		return '7';
	case 8:
		return '8';
	case 9:
		return '9';
	case 10:
		return 'A';
	case 11:
		return 'B';
	case 12:
		return 'C';
	case 13:
		return 'D';
	case 14:
		return 'E';
	default:
		return 'F';
	}
}

/*
 * Copy escaped version of `c' to `a_buffer'.
 * `a_buffer' is expected to have enough space for 6 characters.
 */
static void GE_uint16_to_escaped_str32(uint16_t c, EIF_CHARACTER_32* a_buffer)
{
	int i = 0;

	a_buffer[i] = (EIF_CHARACTER_32)0x0000FFFD;
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)'u';
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex((c & 0xF000) >> 12);
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex((c & 0x0F00) >> 8);
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex((c & 0x00F0) >> 4);
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex(c & 0x000F);
}

#ifndef __LCC__
/* lcc-win32 complains about this used static function. */

/*
 * Copy escaped version of `c' to `a_buffer'.
 * `a_buffer' is expected to have enough space for 3 characters.
 */
static void GE_uint8_to_escaped_str32(uint8_t c, EIF_CHARACTER_32* a_buffer)
{
	int i = 0;

	a_buffer[i] = (EIF_CHARACTER_32)0x0000FFFD;
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex((uint16_t)((c & 0xF0) >> 4));
	i++;
	a_buffer[i] = (EIF_CHARACTER_32)GE_to_hex((uint16_t)(c & 0x0F));
}
#endif

/*
 * Copy to `a_buffer' the EIF_CHARACTER_32 characters corresponding to the
 * first `n' native characters in the native string `s'.
 * `a_buffer' is expected to have enough space.
 * Invalid native characters are escaped.
 */
static void GE_nstr_to_str32(EIF_NATIVE_CHAR* s, EIF_CHARACTER_32* a_buffer, EIF_INTEGER n)
{
	int i, j;
#ifdef EIF_WINDOWS
	uint16_t c1, c2;
#else
	uint8_t c1, c2, c3, c4;
#endif

	j = 0;
	for (i = 0; i < n; i++) {
#ifdef EIF_WINDOWS
		c1 = (uint16_t)s[i];
		if (c1 < 0xD800 || c1 >= 0xE000) {
				/* Codepoint from Basic Multilingual Plane: one 16-bit code unit. */
			a_buffer[j] = (EIF_CHARACTER_32)(c1);
			j++;
		} else if (c1 <= 0xDBFF && i + 1 < n) {
				/* Check if a lead surrogate (value between 0xD800 and 0xDBFF) is followed by a trail surrogate. */
			c2 = (uint16_t)s[i + 1];
			if (c2 >= 0xDC00 && c2 <= 0xDFFF) {
					/* Supplementary Planes: surrogate pair with lead and trail surrogates. */
				a_buffer[j] = (EIF_CHARACTER_32)(((uint32_t)c1 << 10) + (uint32_t)c2 - 0x035FDC00);
				j++;
				i++;
			} else {
				GE_uint16_to_escaped_str32(c1, a_buffer + j);
				j += 6;
			}
		} else {
			GE_uint16_to_escaped_str32(c1, a_buffer + j);
			j += 6;
		}
#else
		c1 = (uint8_t)s[i];
		if (c1 <= 0x7F) {
			a_buffer[j] = (EIF_CHARACTER_32)(c1);
			j++;
		} else if ((c1 & 0xE0) == 0xC0) {
			if (i + 1 < n) {
				c2 = (uint8_t)s[i + 1];
				if ((c2 & 0xC0) == 0x80) {
					a_buffer[j] = (EIF_CHARACTER_32)((((uint32_t)c1 & 0x0000001F) << 6) | ((uint32_t)c2 & 0x0000003F));
					j++;
					i++;
				} else {
					GE_uint8_to_escaped_str32(c1, a_buffer + j);
					j += 3;
				}
			} else {
				GE_uint8_to_escaped_str32(c1, a_buffer + j);
				j += 3;
			}
		} else if ((c1 & 0xF0) == 0xE0) {
			if (i + 2 < n) {
				c2 = (uint8_t)s[i + 1];
				c3 = (uint8_t)s[i + 2];
				if ((c2 & 0xC0) == 0x80 && (c3 & 0xC0) == 0x80) {
					a_buffer[j] = (EIF_CHARACTER_32)((((uint32_t)c1 & 0x0000000F) << 12) | (((uint32_t)c2 & 0x0000003F) << 6) | ((uint32_t)c3 & 0x0000003F));
					j++;
					i +=2;
				} else {
					GE_uint8_to_escaped_str32(c1, a_buffer + j);
					j += 3;
				}
			} else {
				GE_uint8_to_escaped_str32(c1, a_buffer + j);
				j += 3;
			}
		} else if ((c1 & 0xF8) == 0xF0) {
			if (i + 3 < n) {
				c2 = (uint8_t)s[i + 1];
				c3 = (uint8_t)s[i + 2];
				c4 = (uint8_t)s[i + 3];
				if ((c2 & 0xC0) == 0x80 && (c3 & 0xC0) == 0x80 && (c4 & 0xC0) == 0x80) {
					a_buffer[j] = (EIF_CHARACTER_32)((((uint32_t)c1 & 0x00000007) << 18) | (((uint32_t)c2 & 0x0000003F) << 12) | (((uint32_t)c3 & 0x0000003F) << 6) | ((uint32_t)c4 & 0x0000003F));
					j++;
					i +=3;
				} else {
					GE_uint8_to_escaped_str32(c1, a_buffer + j);
					j += 3;
				}
			} else {
				GE_uint8_to_escaped_str32(c1, a_buffer + j);
				j += 3;
			}
		} else {
			GE_uint8_to_escaped_str32(c1, a_buffer + j);
			j += 3;
		}
#endif
	}
}

/*
 * Copy to `a_buffer' the EIF_CHARACTER_32 characters corresponding to the
 * first `n' characters in the ISO 8859-1 string `s'.
 * `a_buffer' is expected to have enough space for `n' characters.
 */
static void GE_str8_to_str32(const char* s, EIF_CHARACTER_32* a_buffer, EIF_INTEGER n)
{
	int i;
	for (i = 0; i < n; i++) {
		a_buffer[i] = (EIF_CHARACTER_32)s[i];
	}
}

/*
 * New Eiffel string of type "STRING_8" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_ms8(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_8* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_str8(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_8*)((char*)l_area + l_area->offset);
	memcpy((char*)l_area_base_address, s, c);
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_8)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "STRING_8" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_str8(const char* s)
{
	return GE_ms8(s, strlen(s));
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_8" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_ims8(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_8* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_istr8(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_8*)((char*)l_area + l_area->offset);
	memcpy((char*)l_area_base_address, s, c);
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_8)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "STRING_32" containing the
 * first `c' characters found in ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_ms32(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_32* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_str32(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_32*)((char*)l_area + l_area->offset);
	GE_str8_to_str32(s, l_area_base_address, c);
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_32)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "STRING_32" containing the
 * first `c' 32-bit characters built from `s' by reading
 * groups of four bytes with little-endian byte order.
 */
EIF_REFERENCE GE_ms32_from_utf32le(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_32* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_str32(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_32*)((char*)l_area + l_area->offset);
#if BYTEORDER == 0x1234
	memcpy((EIF_CHARACTER_32*)l_area_base_address, s, c * 4);
#else
	{
		int i;
		EIF_CHARACTER_32 l_little, l_big;
		for (i = 0; i < c ; i++) {
			memcpy(&l_little, s + (i * 4), 4);
				/* Convert our little endian to big endian. */
			l_big = ((l_little >> 24) & 0xFF) |
				((l_little >> 8) & 0xFF00) |
			   	((l_little << 8) & 0xFF0000) |
			   	((l_little << 24) & 0xFF000000);
			l_area_base_address[i] = l_big;
		}
	}
#endif
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_32)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "STRING_32" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_str32(const char* s)
{
	return GE_ms32(s, strlen(s));
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing
 * the first `c' characters found in ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_ims32(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_32* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_istr32(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_32*)((char*)l_area + l_area->offset);
	GE_str8_to_str32(s, l_area_base_address, c);
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_32)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing the
 * first `c' 32-bit characters built from `s' by reading
 * groups of four bytes with little-endian byte order.
 */
EIF_REFERENCE GE_ims32_from_utf32le(const char* s, EIF_INTEGER c)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_32* l_area_base_address;

	l_string = (EIF_STRING*)GE_new_istr32(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_32*)((char*)l_area + l_area->offset);
#if BYTEORDER == 0x1234
	memcpy((EIF_CHARACTER_32*)l_area_base_address, s, c * 4);
#else
	{
		int i;
		EIF_CHARACTER_32 l_little, l_big;
		for (i = 0; i < c ; i++) {
			memcpy(&l_little, s + (i * 4), 4);
				/* Convert our little endian to big endian. */
			l_big = ((l_little >> 24) & 0xFF) |
				((l_little >> 8) & 0xFF00) |
			   	((l_little << 8) & 0xFF0000) |
			   	((l_little << 24) & 0xFF000000);
			l_area_base_address[i] = l_big;
		}
	}
#endif
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_32)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'.
 */
EIF_REFERENCE GE_istr32(const char* s)
{
	return GE_ims32(s, strlen(s));
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing the
 * first `n' native characters found in native string `s'.
 * Invalid native characters are escaped.
 */
EIF_REFERENCE GE_ims32_from_nstr(EIF_NATIVE_CHAR* s, EIF_INTEGER n)
{
	EIF_STRING* l_string;
	EIF_SPECIAL* l_area;
	EIF_CHARACTER_32* l_area_base_address;
	EIF_INTEGER c;

	c = GE_nstr_str32len(s, n);
	l_string = (EIF_STRING*)GE_new_istr32(c);
	l_area = (EIF_SPECIAL*)(l_string->area);
	l_area_base_address = (EIF_CHARACTER_32*)((char*)l_area + l_area->offset);
	GE_nstr_to_str32(s, l_area_base_address, n);
#ifndef GE_alloc_atomic_cleared
	*(l_area_base_address + c) = (EIF_CHARACTER_32)'\0';
#endif
	l_area->count = (c + 1);
	l_string->count = c;
	return (EIF_REFERENCE)l_string;
}

/*
 * New Eiffel string of type "IMMUTABLE_STRING_32" containing all
 * characters found in the null-terminated native string `s'.
 * Invalid native characters are escaped.
 */
EIF_REFERENCE GE_istr32_from_nstr(EIF_NATIVE_CHAR* s)
{
	return GE_ims32_from_nstr(s, GE_nstrlen(s));
}

/*
 * New Eiffel string of type "STRING" containing all
 * characters found in the null-terminated ISO 8859-1 string `s'
 */
EIF_REFERENCE GE_str(const char* s)
{
	return GE_ms(s, strlen(s));
}

#ifdef __cplusplus
}
#endif

#endif
