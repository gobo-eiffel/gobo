/*
	description:

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_H
#define GE_REAL_H

#include <math.h>

#ifndef GE_power
#define GE_power(x,y) pow((x),(y))
#endif
#define GE_ceiling(x) ceil(x)
#define GE_floor(x) floor(x)

extern EIF_NATURAL_32 GE_real_32_to_bits (EIF_REAL_32 v);
extern EIF_NATURAL_64 GE_real_64_to_bits (EIF_REAL_64 v);
extern EIF_REAL_32 GE_real_32_from_bits (EIF_NATURAL_32 v);
extern EIF_REAL_64 GE_real_64_from_bits (EIF_NATURAL_64 v);

#define GE_real_32_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_32_to_bits(v) & ~GE_nat32(0x80000000)) > GE_nat32(0x7FF00000)))
#define GE_real_64_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_64_to_bits(v) & ~GE_nat64(0x8000000000000000)) > GE_nat64(0x7FF0000000000000)))
#define GE_real_32_is_negative_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0xFF800000))
#define GE_real_64_is_negative_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0xFFF0000000000000))
#define GE_real_32_is_positive_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0x7F800000))
#define GE_real_64_is_positive_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0x7FF0000000000000))
#define GE_real_32_nan GE_real_32_from_bits(GE_nat32(0x7FC00000))
#define GE_real_64_nan GE_real_64_from_bits(GE_nat64(0x7FF8000000000000))
#define GE_real_32_negative_infinity GE_real_32_from_bits(GE_nat32(0xFF800000))
#define GE_real_64_negative_infinity GE_real_64_from_bits(GE_nat64(0xFFF0000000000000))
#define GE_real_32_positive_infinity GE_real_32_from_bits(GE_nat32(0x7F800000))
#define GE_real_64_positive_infinity GE_real_64_from_bits(GE_nat64(0x7FF0000000000000))

#endif
