/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H

#include <errno.h>
#ifndef GE_EXCEPTION_H
#include <ge_exception.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
	Predefined exception codes.
 */
#define EN_VOID		GE_EX_VOID			/* Feature applied to void reference */
#define EN_MEM		GE_EX_MEM			/* No more memory */
#define EN_PRE		GE_EX_PRE			/* Pre-condition violated */
#define EN_POST		GE_EX_POST			/* Post-condition violated */
#define EN_FLOAT	GE_EX_FLOAT			/* Floating point exception (signal SIGFPE) */
#define EN_CINV		GE_EX_CINV			/* Class invariant violated */
#define EN_CHECK	GE_EX_CHECK			/* Assertion violated */
#define EN_FAIL		GE_EX_FAIL			/* Routine failure */
#define EN_WHEN		GE_EX_WHEN			/* Unmatched inspect value */
#define EN_VAR		GE_EX_VAR			/* Non-decreasing loop variant */
#define EN_LINV		GE_EX_LINV			/* Loop invariant violated */
#define EN_SIG		GE_EX_SIG			/* Operating system signal */
#define EN_BYE		GE_EX_BYE			/* Eiffel run-time panic */
#define EN_RESC		GE_EX_RESC			/* Exception in rescue clause */
#define EN_OMEM		GE_EX_OMEM			/* Out of memory (cannot be ignored) */
#define EN_RES		GE_EX_RES			/* Resumption failed (retry did not succeed) */
#define EN_CDEF		GE_EX_CDEF			/* Create on deferred */
#define EN_EXT		GE_EX_EXT			/* External event */
#define EN_VEXP		GE_EX_VEXP			/* Void assigned to expanded */
#define EN_HDLR		GE_EX_HDLR			/* Exception in signal handler */
#define EN_IO		GE_EX_IO			/* I/O error */
#define EN_SYS		GE_EX_SYS			/* Operating system error */
#define EN_RETR		GE_EX_RETR			/* Retrieval error */
#define EN_PROG		GE_EX_PROG			/* Developer exception */
#define EN_FATAL	GE_EX_FATAL			/* Eiffel run-time fatal error */
#define EN_DOL		GE_EX_DOL			/* $ applied to melted feature */
#define EN_ISE_IO	GE_EX_ISE_IO		/* I/O error raised by the ISE Eiffel runtime */
#define EN_COM		GE_EX_COM			/* COM error raised by EiffelCOM runtime */
#define EN_RT_CHECK	GE_EX_RT_CHECK		/* Runtime check error such as out-of-bound array access */
#define EN_OLD		GE_EX_OLD			/* Old violation */
#define EN_SEL		GE_EX_SEL			/* Serialization failure */
#define EN_DIRTY	GE_EX_DIRTY			/* SCOOP processor dirty exception. */
#define EN_NEX		GE_EX_NEX			/* Number of internal exceptions */

/*
	Raise an Eiffel exception.
*/
extern void eraise(const char* name, long code);

/*
	Raise an Eiffel exception of the given code with no associated tag.
*/
extern void xraise(int code);

/*
	Raise an "Operating system error" exception.
*/
extern void esys(void);

/*
	As a special case, an I/O error is raised when a system call which is I/O bound fails.
*/
extern void eise_io(const char* tag);

/*
	Raise a "No more memory" exception.
*/
extern void enomem(void);

/*
	Raise EiffelCOM exception.
*/
extern void com_eraise(const char* tag, long num);

/*
	Terminate execution with exit status 'code',
	without triggering an exception.
*/
extern void esdie(int code);

/*
	Exception tag associated with 'code'.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
extern EIF_REFERENCE eename(long except);

/*
	Is exception 'ex' defined?
	Used in EiffelCOM.
*/
extern char eedefined(long ex);

/*
	Enable/diable printing of the exception trace.
	Per thead information.
*/
extern void eetrace(char b);

/*
	Is current execution during rescue?
*/
extern EIF_BOOLEAN eif_is_in_rescue(void);

#ifdef EIF_WINDOWS
/*
	Set default exception handler.
*/
extern void set_windows_exception_filter();
#endif

/*
	Used in EiffelCOM.
*/
#define echval 0
#define echtg (char*)0

#ifdef __cplusplus
}
#endif

#endif
