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
typedef struct {
	EIF_BOOLEAN* boolean_value;
	EIF_REFERENCE* boolean_exception;
	unsigned char* boolean_status;
	uint32_t boolean_count;
	EIF_CHARACTER_8* character_8_value;
	EIF_REFERENCE* character_8_exception;
	unsigned char* character_8_status;
	uint32_t character_8_count;
	EIF_CHARACTER_32* character_32_value;
	EIF_REFERENCE* character_32_exception;
	unsigned char* character_32_status;
	uint32_t character_32_count;
	EIF_INTEGER_8* integer_8_value;
	EIF_REFERENCE* integer_8_exception;
	unsigned char* integer_8_status;
	uint32_t integer_8_count;
	EIF_INTEGER_16* integer_16_value;
	EIF_REFERENCE* integer_16_exception;
	unsigned char* integer_16_status;
	uint32_t integer_16_count;
	EIF_INTEGER_32* integer_32_value;
	EIF_REFERENCE* integer_32_exception;
	unsigned char* integer_32_status;
	uint32_t integer_32_count;
	EIF_INTEGER_64* integer_64_value;
	EIF_REFERENCE* integer_64_exception;
	unsigned char* integer_64_status;
	uint32_t integer_64_count;
	EIF_NATURAL_8* natural_8_value;
	EIF_REFERENCE* natural_8_exception;
	unsigned char* natural_8_status;
	uint32_t natural_8_count;
	EIF_NATURAL_16* natural_16_value;
	EIF_REFERENCE* natural_16_exception;
	unsigned char* natural_16_status;
	uint32_t natural_16_count;
	EIF_NATURAL_32* natural_32_value;
	EIF_REFERENCE* natural_32_exception;
	unsigned char* natural_32_status;
	uint32_t natural_32_count;
	EIF_NATURAL_64* natural_64_value;
	EIF_REFERENCE* natural_64_exception;
	unsigned char* natural_64_status;
	uint32_t natural_64_count;
	EIF_POINTER* pointer_value;
	EIF_REFERENCE* pointer_exception;
	unsigned char* pointer_status;
	uint32_t pointer_count;
	EIF_REAL_32* real_32_value;
	EIF_REFERENCE* real_32_exception;
	unsigned char* real_32_status;
	uint32_t real_32_count;
	EIF_REAL_64* real_64_value;
	EIF_REFERENCE* real_64_exception;
	unsigned char* real_64_status;
	uint32_t real_64_count;
	EIF_REFERENCE* reference_value;
	EIF_REFERENCE* reference_exception;
	unsigned char* reference_status;
	uint32_t reference_count;
	EIF_REFERENCE* procedure_exception;
	unsigned char* procedure_status;
	uint32_t procedure_count;
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
