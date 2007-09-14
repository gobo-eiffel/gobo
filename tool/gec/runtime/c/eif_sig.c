/*
	description:

		"C functions used to implement class UNIX_SIGNALS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_SIG_C
#define EIF_SIG_C

#ifdef __cplusplus
extern "C" {
#endif

char esigdefined(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigdefined' in 'eif_sig.h' not implemented\n");
	return (char)'\0';
}

long esignum(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esignum' in 'eif_sig.h' not implemented\n");
	return (long)0;
}

void esigcatch(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigcatch' in 'eif_sig.h' not implemented\n");
}

void esigignore(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigignore' in 'eif_sig.h' not implemented\n");
}

void esigresall(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigresall' in 'eif_sig.h' not implemented\n");
}

void esigresdef(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigresdef' in 'eif_sig.h' not implemented\n");
}

char esigiscaught(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigiscaught' in 'eif_sig.h' not implemented\n");
	return (char)'\0';
}

long esigmap(long int idx) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigmap' in 'eif_sig.h' not implemented\n");
	return (long)0;
}

char* esigname(long int sig) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'esigname' in 'eif_sig.h' not implemented\n");
	return (char*)0;
}

#ifdef __cplusplus
}
#endif

#endif
