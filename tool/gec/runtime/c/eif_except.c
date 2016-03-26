/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Pre-defined exception tags. No restriction on size.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
static char* ex_tag[] = {
	(char *) 0,							/* Nothing */
	"Feature call on void target.",		/* EN_VOID */
	"No more memory.",					/* EN_MEM */
	"Precondition violated.",			/* EN_PRE */
	"Postcondition violated.",			/* EN_POST */
	"Floating point exception.",		/* EN_FLOAT */
	"Class invariant violated.",		/* EN_CINV */
	"Assertion violated.",				/* EN_CHECK */
	"Routine failure.",					/* EN_FAIL */
	"Unmatched inspect value.",			/* EN_WHEN */
	"Non-decreasing loop variant or negative value reached.",		/* EN_VAR */
	"Loop invariant violated.",			/* EN_LINV */
	"Operating system signal.",			/* EN_SIG */
	"Eiffel run-time panic.",			/* EN_BYE */
	"Exception in rescue clause.",		/* EN_RESC */
	"Out of memory.",					/* EN_OMEM */
	"Resumption attempt failed.",		/* EN_RES */
	"Create on deferred.",				/* EN_CDEF */
	"External event.",					/* EN_EXT */
	"Void assigned to expanded.",		/* EN_VEXP */
	"Exception in signal handler.",		/* EN_HDLR */
	"I/O error.",						/* EN_IO */
	"Operating system error.",			/* EN_SYS */
	"Retrieval error.",					/* EN_RETR */
	"Developer exception.",				/* EN_PROG */
	"Eiffel run-time fatal error.",		/* EN_FATAL */
	"CECIL cannot call melted code",	/* EN_DOL */
	"Runtime I/O error.",				/* EN_ISE_IO */
	"COM error.",						/* EN_COM */
	"Runtime check violated.",			/* EN_RT_CHECK */
	"Old expression evaluation failed.",/* EN_OLD */
	"Serialization failed."				/* EN_SEL */
	"SCOOP processor dirty."			/* EN_DIRTY */
};

/*
	Raise an Eiffel exception.
*/
void eraise(const char* name, long code)
{
	GE_raise_with_message(code, name);
}

/*
	Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code)
{
	GE_raise((long)code);
}

/*
	Raise an "Operating system error" exception.
*/
void esys(void)
{
	if (errno == 0) {
			/* External event */
		GE_raise(GE_EX_EXT);
	} else {
			/* Operating system error */
		GE_raise(GE_EX_SYS);
	}
}

/*
	As a special case, an I/O error is raised when a system call which is I/O bound fails.
*/
void eise_io(const char* tag)
{
	GE_raise_with_message(GE_EX_ISE_IO, tag);
}

/*
	Raise a "No more memory" exception.
*/
 void enomem(void) {
	GE_raise(GE_EX_OMEM);
 }

/*
	Raise EiffelCOM exception.
*/
void com_eraise(const char* tag, long num)
{
	GE_raise_with_message(num, tag);
}

/*
	Terminate execution with exit status 'code',
	without triggering an exception.
*/
void esdie(int code)
{
/* TODO: check that the Boehm GC triggers the 'dispose' routines. */
	exit(code);
}

/*
	Exception tag associated with 'code'.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
EIF_REFERENCE eename(long code)
{
	if (code < 0) {
		return GE_str8("User-defined exception.");
	} else if (code < 1 || code > EN_NEX) {
		return GE_str8("Unknown exception.");
	} else {
		return GE_str8(ex_tag[code]);
	}
}

/*
	Is exception 'ex' defined?
	Used in EiffelCOM.
*/
char eedefined(long ex)
{
	return (char) ((ex > 0 && ex <= GE_EX_NEX)? 1 : 0);
}

/*
	Enable/diable printing of the exception trace.
	Per thead information.
*/
void eetrace(char b) {
	GE_context* context;
#ifdef EIF_THREADS
	GE_thread_context* volatile ge_thread_context;
	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	context = ge_thread_context->context;
#else
	context = GE_main_context;
#endif

	context->exception_trace = EIF_TEST(b);
}

/*
	Is current execution during rescue?
*/
EIF_BOOLEAN eif_is_in_rescue(void)
{
	GE_context* context;
#ifdef EIF_THREADS
	GE_thread_context* volatile ge_thread_context;
	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	context = ge_thread_context->context;
#else
	context = GE_main_context;
#endif

	return (EIF_TEST(context->in_rescue > 0));
}

#ifdef EIF_WINDOWS
/*
	Set default exception handler.
*/
void set_windows_exception_filter()
{
	GE_set_windows_exception_filter();
}
#endif

#ifdef __cplusplus
}
#endif

#endif
