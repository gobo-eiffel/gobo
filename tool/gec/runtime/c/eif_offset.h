/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2018-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_OFFSET_H
#define EIF_OFFSET_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_SIZE_H
#include "eif_size.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define REMAINDER(x)		(((x) % EIF_ALIGN)?(EIF_ALIGN-((x)%EIF_ALIGN)):0)
#define PADD(x,y)			(REMAINDER(x)%(y))

#define eif_chroff(nb_ref)		(REFACS(nb_ref) + PADD(REFACS(nb_ref), CHRSIZ))
#define eif_i16off(nb_ref, nb_char)		(eif_chroff(nb_ref) + CHRACS(nb_char) + PADD(eif_chroff(nb_ref) + CHRACS(nb_char), I16SIZ))
#define eif_lngoff(nb_ref, nb_char, nb_int16)		(eif_i16off(nb_ref, nb_char) + I16ACS(nb_int16) + PADD(eif_i16off(nb_ref, nb_char) + I16ACS(nb_int16), LNGSIZ))
#define eif_r32off(nb_ref, nb_char, nb_int16, nb_int32)		(eif_lngoff(nb_ref, nb_char, nb_int16) + LNGACS(nb_int32) + PADD(eif_lngoff(nb_ref, nb_char, nb_int16) + LNGACS(nb_int32), R32SIZ))
#define eif_ptroff(nb_ref, nb_char, nb_int16, nb_int32, nb_r32)		(eif_r32off(nb_ref, nb_char, nb_int16 ,nb_int32) + R32ACS(nb_r32) + PADD(eif_r32off(nb_ref, nb_char, nb_int16, nb_int32) + R32ACS(nb_r32), PTRSIZ))
#define eif_i64off(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr)		(eif_ptroff(nb_ref, nb_char, nb_int16, nb_int32, nb_r32) + PTRACS(nb_ptr) + PADD(eif_ptroff(nb_ref, nb_char, nb_int16, nb_int32, nb_r32) + PTRACS(nb_ptr), I64SIZ))
#define eif_r64off(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr, nb_int64)	(eif_i64off(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr) + I64ACS(nb_int64) + PADD(eif_i64off(nb_ref,nb_char, nb_int16, nb_int32, nb_r32, nb_ptr) + I64ACS(nb_int64), R64SIZ))
#define eif_objsiz(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr, nb_int64, nb_r64)		(eif_r64off(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr, nb_int64) + R64ACS(nb_r64) + REMAINDER(eif_r64off(nb_ref, nb_char, nb_int16, nb_int32, nb_r32, nb_ptr, nb_int64) + R64ACS(nb_r64)))

#ifdef __cplusplus
}
#endif

#endif
