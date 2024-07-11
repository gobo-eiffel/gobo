/*
	description:

		"C functions used to implement once features"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2017-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_ONCE_H
#define GE_ONCE_H
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
 * Struct to keep track of the call status
 * and results of once features.
 */
typedef volatile struct {
	EIF_BOOLEAN* volatile boolean_value;
	EIF_REFERENCE* volatile boolean_exception;
	unsigned char* volatile boolean_status;
	uint32_t volatile boolean_count;
	EIF_CHARACTER_8* volatile character_8_value;
	EIF_REFERENCE* volatile character_8_exception;
	unsigned char* volatile character_8_status;
	uint32_t volatile character_8_count;
	EIF_CHARACTER_32* volatile character_32_value;
	EIF_REFERENCE* volatile character_32_exception;
	unsigned char* volatile character_32_status;
	uint32_t volatile character_32_count;
	EIF_INTEGER_8* volatile integer_8_value;
	EIF_REFERENCE* volatile integer_8_exception;
	unsigned char* volatile integer_8_status;
	uint32_t volatile integer_8_count;
	EIF_INTEGER_16* volatile integer_16_value;
	EIF_REFERENCE* volatile integer_16_exception;
	unsigned char* volatile integer_16_status;
	uint32_t volatile integer_16_count;
	EIF_INTEGER_32* volatile integer_32_value;
	EIF_REFERENCE* volatile integer_32_exception;
	unsigned char* volatile integer_32_status;
	uint32_t volatile integer_32_count;
	EIF_INTEGER_64* volatile integer_64_value;
	EIF_REFERENCE* volatile integer_64_exception;
	unsigned char* volatile integer_64_status;
	uint32_t volatile integer_64_count;
	EIF_NATURAL_8* volatile natural_8_value;
	EIF_REFERENCE* volatile natural_8_exception;
	unsigned char* volatile natural_8_status;
	uint32_t volatile natural_8_count;
	EIF_NATURAL_16* volatile natural_16_value;
	EIF_REFERENCE* volatile natural_16_exception;
	unsigned char* volatile natural_16_status;
	uint32_t volatile natural_16_count;
	EIF_NATURAL_32* volatile natural_32_value;
	EIF_REFERENCE* volatile natural_32_exception;
	unsigned char* volatile natural_32_status;
	uint32_t volatile natural_32_count;
	EIF_NATURAL_64* volatile natural_64_value;
	EIF_REFERENCE* volatile natural_64_exception;
	unsigned char* volatile natural_64_status;
	uint32_t volatile natural_64_count;
	EIF_POINTER* volatile pointer_value;
	EIF_REFERENCE* volatile pointer_exception;
	unsigned char* volatile pointer_status;
	uint32_t volatile pointer_count;
	EIF_REAL_32* volatile real_32_value;
	EIF_REFERENCE* volatile real_32_exception;
	unsigned char* volatile real_32_status;
	uint32_t volatile real_32_count;
	EIF_REAL_64* volatile real_64_value;
	EIF_REFERENCE* volatile real_64_exception;
	unsigned char* volatile real_64_status;
	uint32_t volatile real_64_count;
	EIF_REFERENCE* volatile reference_value;
	EIF_REFERENCE* volatile reference_exception;
	unsigned char* volatile reference_status;
	uint32_t volatile reference_count;
	EIF_REFERENCE* volatile procedure_exception;
	unsigned char* volatile procedure_status;
	uint32_t volatile procedure_count;
} GE_onces;

/*
 * Variable to keep track of the call status
 * and results of once-per-process features.
 */
extern GE_onces* GE_process_onces;

/*
 * Initialize `GE_process_onces'.
 */
extern void GE_init_onces(
	uint32_t a_boolean_count,
	uint32_t a_character_8_count,
	uint32_t a_character_32_count,
	uint32_t a_integer_8_count,
	uint32_t a_integer_16_count,
	uint32_t a_integer_32_count,
	uint32_t a_integer_64_count,
	uint32_t a_natural_8_count,
	uint32_t a_natural_16_count,
	uint32_t a_natural_32_count,
	uint32_t a_natural_64_count,
	uint32_t a_pointer_count,
	uint32_t a_real_32_count,
	uint32_t a_real_64_count,
	uint32_t a_reference_count,
	uint32_t a_procedure_count);

/*
 * Create a new 'GE_onces' struct which can deal with the
 * numbers of once features passed as argument.
 */
extern GE_onces* GE_new_onces(
	uint32_t a_boolean_count,
	uint32_t a_character_8_count,
	uint32_t a_character_32_count,
	uint32_t a_integer_8_count,
	uint32_t a_integer_16_count,
	uint32_t a_integer_32_count,
	uint32_t a_integer_64_count,
	uint32_t a_natural_8_count,
	uint32_t a_natural_16_count,
	uint32_t a_natural_32_count,
	uint32_t a_natural_64_count,
	uint32_t a_pointer_count,
	uint32_t a_real_32_count,
	uint32_t a_real_64_count,
	uint32_t a_reference_count,
	uint32_t a_procedure_count);

/*
 * Free memory allocated by `a_onces'.
 */
extern void GE_free_onces(GE_onces* a_onces);

#ifdef __cplusplus
}
#endif

#endif
