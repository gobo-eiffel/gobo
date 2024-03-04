/*
	description:

		"C functions used to implement class IDENTIFIED."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_OBJECT_ID_H
#define EIF_OBJECT_ID_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_IDENTIFIED_H
#include "ge_identified.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define eif_object_id(object) GE_object_id(object)
#define eif_reference_id(object) GE_object_id(object)
#define eif_id_object(id) GE_id_object(id)
#define eif_object_id_free(id) GE_object_id_free(id)

#ifdef __cplusplus
}
#endif

#endif
