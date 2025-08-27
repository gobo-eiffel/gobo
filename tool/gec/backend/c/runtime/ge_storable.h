/*
	description:

		"C functions used to implement Storable facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_STORABLE_H
#define GE_STORABLE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Different kinds of Storable formats. */
#define GE_BASIC_STORE_3_1			0x00
#define GE_BASIC_STORE_3_2			0x02
#define GE_BASIC_STORE_4_0			0x06
#define GE_GENERAL_STORE_3_1		0x01
#define GE_GENERAL_STORE_3_2		0x03
#define GE_GENERAL_STORE_3_3		0x05
#define GE_GENERAL_STORE_4_0		0x07
#define GE_INDEPENDENT_STORE_3_2	0x04
#define GE_INDEPENDENT_STORE_4_0	0x08
#define GE_INDEPENDENT_STORE_4_3	0x09
#define GE_INDEPENDENT_STORE_4_4	0x0A
#define GE_INDEPENDENT_STORE_5_0	0x0B
#define GE_RECOVERABLE_STORE_5_3	0x0C
#define GE_INTERMEDIATE_STORE_5_5	0x0D
#define GE_INDEPENDENT_STORE_5_5	0x0E
#define GE_INDEPENDENT_STORE_6_0	0x0F
#define GE_INDEPENDENT_STORE_6_3	0x10
#define GE_GENERAL_STORE_6_4		0x11
#define GE_INDEPENDENT_STORE_6_4	0x12
#define GE_BASIC_STORE_6_6			0x13
#define GE_GENERAL_STORE_6_6		0x14
#define GE_INDEPENDENT_STORE_6_6	0x15
#define GE_SED_STORE				0x17

#define GE_STORABLE_MAX_DTYPE		0xFF00
#define GE_STORABLE_ANNOTATION_MASK	0xFF7F /* All possible annotations. */
#define GE_STORABLE_ATTACHED_FLAG	0xFF01
#define GE_STORABLE_DETACHABLE_FLAG	0xFF02 /* Default when no attachment flag specified. */
#define GE_STORABLE_SEPARATE_FLAG	0xFF04
#define GE_STORABLE_NONE_TYPE		0xFFFE
#define GE_STORABLE_TUPLE_TYPE		0xFFF9
#define GE_STORABLE_FORMAL_TYPE		0xFFF8
#define GE_STORABLE_TYPE_TERMINATOR	0xFFFF

#define GE_STORABLE_EO_SPEC		0x01000000		/* Object is special (C area) */
#define GE_STORABLE_EO_TUPLE	0x40000000		/* Object is tuple */
#define GE_STORABLE_EO_REF		0x00800000		/* Does object contain references */
#define GE_STORABLE_EO_COMP		0x00010000		/* Composite (has expanded) */
#define GE_STORABLE_EO_EXP		0x00020000		/* Object is an expanded one (even when boxed) */
#define GE_STORABLE_EO_TYPE		0x0000FFFF		/* Mask to get the dynamic type */

#define GE_STORABLE_SK_EXP		0x80			/* Type is a user-defined expanded */
#define GE_STORABLE_SK_BOOL		0x04			/* Simple boolean type */
#define GE_STORABLE_SK_CHAR8	0x08			/* Simple character type */
#define GE_STORABLE_SK_INT8		0x0C			/* Simple integer 8 type */
#define GE_STORABLE_SK_INT32	0x10			/* Simple integer 32 type */
#define GE_STORABLE_SK_INT16	0x14			/* Simple integer 16 type */
#define GE_STORABLE_SK_REAL32	0x18			/* Simple real type */
#define GE_STORABLE_SK_CHAR32	0x1C			/* Simple unicode character type */
#define GE_STORABLE_SK_REAL64	0x20			/* Simple double type */
#define GE_STORABLE_SK_INT64	0x24			/* Simple integer 64 types */
#define GE_STORABLE_SK_UINT8	0x30			/* Simple unsigned integer 8 type */
#define GE_STORABLE_SK_UINT16	0x34			/* Simple unsigned integer 16 type */
#define GE_STORABLE_SK_UINT32	0x38			/* Simple unsigned integer 32 type */
#define GE_STORABLE_SK_UINT64	0x3C			/* Simple unsigned integer 64 type */
#define GE_STORABLE_SK_POINTER	0x40			/* Simple pointer type */
#define GE_STORABLE_SK_REF		0xF8			/* Mask to test for reference type */

#define GE_STORABLE_SK32_EXP		0x80000000			/* Type is a user-defined expanded */
#define GE_STORABLE_SK32_BOOL		0x04000000			/* Simple boolean type */
#define GE_STORABLE_SK32_CHAR8		0x08000000			/* Simple character type */
#define GE_STORABLE_SK32_INT8		0x0C000000			/* Simple integer 8 type */
#define GE_STORABLE_SK32_INT32		0x10000000			/* Simple integer 32 type */
#define GE_STORABLE_SK32_INT16		0x14000000			/* Simple integer 16 type */
#define GE_STORABLE_SK32_REAL32		0x18000000			/* Simple real type */
#define GE_STORABLE_SK32_CHAR32		0x1C000000			/* Simple unicode character type */
#define GE_STORABLE_SK32_REAL64		0x20000000			/* Simple double type */
#define GE_STORABLE_SK32_INT64		0x24000000			/* Simple integer 64 types */
#define GE_STORABLE_SK32_UINT8		0x30000000			/* Simple unsigned integer 8 type */
#define GE_STORABLE_SK32_UINT16		0x34000000			/* Simple unsigned integer 16 type */
#define GE_STORABLE_SK32_UINT32		0x38000000			/* Simple unsigned integer 32 type */
#define GE_STORABLE_SK32_UINT64		0x3C000000			/* Simple unsigned integer 64 type */
#define GE_STORABLE_SK32_POINTER	0x40000000			/* Simple pointer type */
#define GE_STORABLE_SK32_REF		0xF8000000			/* Mask to test for reference type */
#define GE_STORABLE_SK32_DTYPE		0x0000FFFF			/* Mask to get the dynamic type */

#define GE_STORABLE_TUPLE_REFERENCE_CODE	0x00
#define GE_STORABLE_TUPLE_BOOLEAN_CODE		0x01
#define GE_STORABLE_TUPLE_CHARACTER_8_CODE	0x02
#define GE_STORABLE_TUPLE_REAL_64_CODE		0x03
#define GE_STORABLE_TUPLE_REAL_32_CODE		0x04
#define GE_STORABLE_TUPLE_POINTER_CODE		0x05
#define GE_STORABLE_TUPLE_INTEGER_8_CODE	0x06
#define GE_STORABLE_TUPLE_INTEGER_16_CODE	0x07
#define GE_STORABLE_TUPLE_INTEGER_32_CODE	0x08
#define GE_STORABLE_TUPLE_INTEGER_64_CODE	0x09
#define GE_STORABLE_TUPLE_NATURAL_8_CODE	0x0A
#define GE_STORABLE_TUPLE_NATURAL_16_CODE	0x0B
#define GE_STORABLE_TUPLE_NATURAL_32_CODE 	0x0C
#define GE_STORABLE_TUPLE_NATURAL_64_CODE 	0x0D
#define GE_STORABLE_TUPLE_CHARACTER_32_CODE	0x0E

#define GE_STORABLE_CLASS_IS_FROZEN_FLAG			0x00002000
#define GE_STORABLE_CLASS_IS_COMPOSITE_FLAG			0x00000800
#define GE_STORABLE_CLASS_IS_EXPANDED_FLAG			0x00000200
#define GE_STORABLE_CLASS_IS_DECLARED_EXPANDED_FLAG	0x00000100

#ifdef __cplusplus
}
#endif

#endif
