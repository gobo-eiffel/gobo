/*
	description:

		"C functions used to implement once features"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2017-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_ONCE_C
#define GE_ONCE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_ONCE_H
#include "ge_once.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifdef GE_USE_THREADS
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Variable to keep track of the call status
 * and results of once-per-process features.
 */
GE_onces* GE_process_onces;

/*
 * Initialize `GE_process_onces'.
 */
void GE_init_onces(
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
	uint32_t a_procedure_count)
{
	GE_process_onces = GE_new_onces(
		a_boolean_count,
		a_character_8_count,
		a_character_32_count,
		a_integer_8_count,
		a_integer_16_count,
		a_integer_32_count,
		a_integer_64_count,
		a_natural_8_count,
		a_natural_16_count,
		a_natural_32_count,
		a_natural_64_count,
		a_pointer_count,
		a_real_32_count,
		a_real_64_count,
		a_reference_count,
		a_procedure_count);
#ifdef GE_USE_THREADS
	GE_process_once_mutexes = GE_new_once_mutexes(
		a_boolean_count,
		a_character_8_count,
		a_character_32_count,
		a_integer_8_count,
		a_integer_16_count,
		a_integer_32_count,
		a_integer_64_count,
		a_natural_8_count,
		a_natural_16_count,
		a_natural_32_count,
		a_natural_64_count,
		a_pointer_count,
		a_real_32_count,
		a_real_64_count,
		a_reference_count,
		a_procedure_count);
#endif
}

/*
 * Create a new 'GE_onces' struct which can deal with the
 * numbers of once features passed as argument.
 */
GE_onces* GE_new_onces(
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
	uint32_t a_procedure_count)
{
	GE_onces* l_onces;

	l_onces = (GE_onces*)GE_calloc(1, sizeof(GE_onces));
	if (a_boolean_count > 0) {
		l_onces->boolean_value = (EIF_BOOLEAN*)GE_calloc_atomic(1, a_boolean_count * sizeof(EIF_BOOLEAN));
		l_onces->boolean_exception = (EIF_REFERENCE*)GE_calloc(1, a_boolean_count * sizeof(EIF_REFERENCE));
		l_onces->boolean_status = (unsigned char*)GE_calloc_atomic(1, a_boolean_count * sizeof(unsigned char));
		l_onces->boolean_count = a_boolean_count;
	}
	if (a_character_8_count > 0) {
		l_onces->character_8_value = (EIF_CHARACTER_8*)GE_calloc_atomic(1, a_character_8_count * sizeof(EIF_CHARACTER_8));
		l_onces->character_8_exception = (EIF_REFERENCE*)GE_calloc(1, a_character_8_count * sizeof(EIF_REFERENCE));
		l_onces->character_8_status = (unsigned char*)GE_calloc_atomic(1, a_character_8_count * sizeof(unsigned char));
		l_onces->character_8_count = a_character_8_count;
	}
	if (a_character_32_count > 0) {
		l_onces->character_32_value = (EIF_CHARACTER_32*)GE_calloc_atomic(1, a_character_32_count * sizeof(EIF_CHARACTER_32));
		l_onces->character_32_exception = (EIF_REFERENCE*)GE_calloc(1, a_character_32_count * sizeof(EIF_REFERENCE));
		l_onces->character_32_status = (unsigned char*)GE_calloc_atomic(1, a_character_32_count * sizeof(unsigned char));
		l_onces->character_32_count = a_character_32_count;
	}
	if (a_integer_8_count > 0) {
		l_onces->integer_8_value = (EIF_INTEGER_8*)GE_calloc_atomic(1, a_integer_8_count * sizeof(EIF_INTEGER_8));
		l_onces->integer_8_exception = (EIF_REFERENCE*)GE_calloc(1, a_integer_8_count * sizeof(EIF_REFERENCE));
		l_onces->integer_8_status = (unsigned char*)GE_calloc_atomic(1, a_integer_8_count * sizeof(unsigned char));
		l_onces->integer_8_count = a_integer_8_count;
	}
	if (a_integer_16_count > 0) {
		l_onces->integer_16_value = (EIF_INTEGER_16*)GE_calloc_atomic(1, a_integer_16_count * sizeof(EIF_INTEGER_16));
		l_onces->integer_16_exception = (EIF_REFERENCE*)GE_calloc(1, a_integer_16_count * sizeof(EIF_REFERENCE));
		l_onces->integer_16_status = (unsigned char*)GE_calloc_atomic(1, a_integer_16_count * sizeof(unsigned char));
		l_onces->integer_16_count = a_integer_16_count;
	}
	if (a_integer_32_count > 0) {
		l_onces->integer_32_value = (EIF_INTEGER_32*)GE_calloc_atomic(1, a_integer_32_count * sizeof(EIF_INTEGER_32));
		l_onces->integer_32_exception = (EIF_REFERENCE*)GE_calloc(1, a_integer_32_count * sizeof(EIF_REFERENCE));
		l_onces->integer_32_status = (unsigned char*)GE_calloc_atomic(1, a_integer_32_count * sizeof(unsigned char));
		l_onces->integer_32_count = a_integer_32_count;
	}
	if (a_integer_64_count > 0) {
		l_onces->integer_64_value = (EIF_INTEGER_64*)GE_calloc_atomic(1, a_integer_64_count * sizeof(EIF_INTEGER_64));
		l_onces->integer_64_exception = (EIF_REFERENCE*)GE_calloc(1, a_integer_64_count*  sizeof(EIF_REFERENCE));
		l_onces->integer_64_status = (unsigned char*)GE_calloc_atomic(1, a_integer_64_count * sizeof(unsigned char));
		l_onces->integer_64_count = a_integer_64_count;
	}
	if (a_natural_8_count > 0) {
		l_onces->natural_8_value = (EIF_NATURAL_8*)GE_calloc_atomic(1, a_natural_8_count * sizeof(EIF_NATURAL_8));
		l_onces->natural_8_exception = (EIF_REFERENCE*)GE_calloc(1, a_natural_8_count * sizeof(EIF_REFERENCE));
		l_onces->natural_8_status = (unsigned char*)GE_calloc_atomic(1, a_natural_8_count * sizeof(unsigned char));
		l_onces->natural_8_count = a_natural_8_count;
	}
	if (a_natural_16_count > 0) {
		l_onces->natural_16_value = (EIF_NATURAL_16*)GE_calloc_atomic(1, a_natural_16_count * sizeof(EIF_NATURAL_16));
		l_onces->natural_16_exception = (EIF_REFERENCE*)GE_calloc(1, a_natural_16_count * sizeof(EIF_REFERENCE));
		l_onces->natural_16_status = (unsigned char*)GE_calloc_atomic(1, a_natural_16_count * sizeof(unsigned char));
		l_onces->natural_16_count = a_natural_16_count;
	}
	if (a_natural_32_count > 0) {
		l_onces->natural_32_value = (EIF_NATURAL_32*)GE_calloc_atomic(1, a_natural_32_count * sizeof(EIF_NATURAL_32));
		l_onces->natural_32_exception = (EIF_REFERENCE*)GE_calloc(1, a_natural_32_count * sizeof(EIF_REFERENCE));
		l_onces->natural_32_status = (unsigned char*)GE_calloc_atomic(1, a_natural_32_count *  sizeof(unsigned char));
		l_onces->natural_32_count = a_natural_32_count;
	}
	if (a_natural_64_count > 0) {
		l_onces->natural_64_value = (EIF_NATURAL_64*)GE_calloc_atomic(1, a_natural_64_count * sizeof(EIF_NATURAL_64));
		l_onces->natural_64_exception = (EIF_REFERENCE*)GE_calloc(1, a_natural_64_count * sizeof(EIF_REFERENCE));
		l_onces->natural_64_status = (unsigned char*)GE_calloc_atomic(1, a_natural_64_count * sizeof(unsigned char));
		l_onces->natural_64_count = a_natural_64_count;
	}
	if (a_pointer_count > 0) {
		l_onces->pointer_value = (EIF_POINTER*)GE_calloc_atomic(1, a_pointer_count * sizeof(EIF_POINTER));
		l_onces->pointer_exception = (EIF_REFERENCE*)GE_calloc(1, a_pointer_count * sizeof(EIF_REFERENCE));
		l_onces->pointer_status = (unsigned char*)GE_calloc_atomic(1, a_pointer_count * sizeof(unsigned char));
		l_onces->pointer_count = a_pointer_count;
	}
	if (a_real_32_count > 0) {
		l_onces->real_32_value = (EIF_REAL_32*)GE_calloc_atomic(1, a_real_32_count * sizeof(EIF_REAL_32));
		l_onces->real_32_exception = (EIF_REFERENCE*)GE_calloc(1, a_real_32_count * sizeof(EIF_REFERENCE));
		l_onces->real_32_status = (unsigned char*)GE_calloc_atomic(1, a_real_32_count * sizeof(unsigned char));
		l_onces->real_32_count = a_real_32_count;
	}
	if (a_real_64_count > 0) {
		l_onces->real_64_value = (EIF_REAL_64*)GE_calloc_atomic(1, a_real_64_count * sizeof(EIF_REAL_64));
		l_onces->real_64_exception = (EIF_REFERENCE*)GE_calloc(1, a_real_64_count * sizeof(EIF_REFERENCE));
		l_onces->real_64_status = (unsigned char*)GE_calloc_atomic(1, a_real_64_count * sizeof(unsigned char));
		l_onces->real_64_count = a_real_64_count;
	}
	if (a_reference_count > 0) {
		l_onces->reference_value = (EIF_REFERENCE*)GE_calloc(1, a_reference_count * sizeof(EIF_REFERENCE));
		l_onces->reference_exception = (EIF_REFERENCE*)GE_calloc(1, a_reference_count * sizeof(EIF_REFERENCE));
		l_onces->reference_status = (unsigned char*)GE_calloc_atomic(1, a_reference_count * sizeof(unsigned char));
		l_onces->reference_count = a_reference_count;
	}
	if (a_procedure_count > 0) {
		l_onces->procedure_exception = (EIF_REFERENCE*)GE_calloc(1, a_procedure_count * sizeof(EIF_REFERENCE));
		l_onces->procedure_status = (unsigned char*)GE_calloc_atomic(1, a_procedure_count * sizeof(unsigned char));
		l_onces->procedure_count = a_procedure_count;
	}
	return l_onces;
}

/*
 * Free memory allocated by `a_onces'.
 */
void GE_free_onces(GE_onces* a_onces)
{
	if (a_onces->boolean_value) {
		GE_free(a_onces->boolean_value);
	}
	if (a_onces->boolean_exception) {
		GE_free(a_onces->boolean_exception);
	}
	if (a_onces->boolean_status) {
		GE_free(a_onces->boolean_status);
	}
	if (a_onces->character_8_value) {
		GE_free(a_onces->character_8_value);
	}
	if (a_onces->character_8_exception) {
		GE_free(a_onces->character_8_exception);
	}
	if (a_onces->character_8_status) {
		GE_free(a_onces->character_8_status);
	}
	if (a_onces->character_32_value) {
		GE_free(a_onces->character_32_value);
	}
	if (a_onces->character_32_exception) {
		GE_free(a_onces->character_32_exception);
	}
	if (a_onces->character_32_status) {
		GE_free(a_onces->character_32_status);
	}
	if (a_onces->integer_8_value) {
		GE_free(a_onces->integer_8_value);
	}
	if (a_onces->integer_8_exception) {
		GE_free(a_onces->integer_8_exception);
	}
	if (a_onces->integer_8_status) {
		GE_free(a_onces->integer_8_status);
	}
	if (a_onces->integer_16_value) {
		GE_free(a_onces->integer_16_value);
	}
	if (a_onces->integer_16_exception) {
		GE_free(a_onces->integer_16_exception);
	}
	if (a_onces->integer_16_status) {
		GE_free(a_onces->integer_16_status);
	}
	if (a_onces->integer_32_value) {
		GE_free(a_onces->integer_32_value);
	}
	if (a_onces->integer_32_exception) {
		GE_free(a_onces->integer_32_exception);
	}
	if (a_onces->integer_32_status) {
		GE_free(a_onces->integer_32_status);
	}
	if (a_onces->integer_64_value) {
		GE_free(a_onces->integer_64_value);
	}
	if (a_onces->integer_64_exception) {
		GE_free(a_onces->integer_64_exception);
	}
	if (a_onces->integer_64_status) {
		GE_free(a_onces->integer_64_status);
	}
	if (a_onces->natural_8_value) {
		GE_free(a_onces->natural_8_value);
	}
	if (a_onces->natural_8_exception) {
		GE_free(a_onces->natural_8_exception);
	}
	if (a_onces->natural_8_status) {
		GE_free(a_onces->natural_8_status);
	}
	if (a_onces->natural_16_value) {
		GE_free(a_onces->natural_16_value);
	}
	if (a_onces->natural_16_exception) {
		GE_free(a_onces->natural_16_exception);
	}
	if (a_onces->natural_16_status) {
		GE_free(a_onces->natural_16_status);
	}
	if (a_onces->natural_32_value) {
		GE_free(a_onces->natural_32_value);
	}
	if (a_onces->natural_32_exception) {
		GE_free(a_onces->natural_32_exception);
	}
	if (a_onces->natural_32_status) {
		GE_free(a_onces->natural_32_status);
	}
	if (a_onces->natural_64_value) {
		GE_free(a_onces->natural_64_value);
	}
	if (a_onces->natural_64_exception) {
		GE_free(a_onces->natural_64_exception);
	}
	if (a_onces->natural_64_status) {
		GE_free(a_onces->natural_64_status);
	}
	if (a_onces->pointer_value) {
		GE_free(a_onces->pointer_value);
	}
	if (a_onces->pointer_exception) {
		GE_free(a_onces->pointer_exception);
	}
	if (a_onces->pointer_status) {
		GE_free(a_onces->pointer_status);
	}
	if (a_onces->real_32_value) {
		GE_free(a_onces->real_32_value);
	}
	if (a_onces->real_32_exception) {
		GE_free(a_onces->real_32_exception);
	}
	if (a_onces->real_32_status) {
		GE_free(a_onces->real_32_status);
	}
	if (a_onces->real_64_value) {
		GE_free(a_onces->real_64_value);
	}
	if (a_onces->real_64_exception) {
		GE_free(a_onces->real_64_exception);
	}
	if (a_onces->real_64_status) {
		GE_free(a_onces->real_64_status);
	}
	if (a_onces->reference_value) {
		GE_free(a_onces->reference_value);
	}
	if (a_onces->reference_exception) {
		GE_free(a_onces->reference_exception);
	}
	if (a_onces->reference_status) {
		GE_free(a_onces->reference_status);
	}
	if (a_onces->procedure_exception) {
		GE_free(a_onces->procedure_exception);
	}
	if (a_onces->procedure_status) {
		GE_free(a_onces->procedure_status);
	}
	GE_free(a_onces);
}

#ifdef __cplusplus
}
#endif

#endif
