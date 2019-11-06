/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_SIZE_H
#define EIF_SIZE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Basic sizes */
#define EIF_ALIGN	8	/* Alignment restrictions */
#define R64SIZ	8	/* Size of double */
#define I64SIZ	8	/* Size of integer 64 bits */
#define R32SIZ	4	/* Size of float */
#define REFSIZ	sizeof(char*)	/* Size of char* */
#define LNGSIZ	4	/* Size of long */
#define I16SIZ	2	/* Size of integer 16 bits */
#define CHRSIZ	1	/* Size of char */
#define PTRSIZ	sizeof(void*)	/* Size of a function pointer */

/* Macros used to access fields in the object */
#define REFACS(n) ((n)*REFSIZ)
#define CHRACS(n) ((n)*CHRSIZ)
#define I16ACS(n) ((n)*I16SIZ)
#define LNGACS(n) ((n)*LNGSIZ)
#define R32ACS(n) ((n)*R32SIZ)
#define I64ACS(n) ((n)*I64SIZ)
#define R64ACS(n) ((n)*R64SIZ)
#define PTRACS(n) ((n)*PTRSIZ)

#ifdef __cplusplus
}
#endif

#endif
