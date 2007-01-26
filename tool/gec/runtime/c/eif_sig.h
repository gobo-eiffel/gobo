/*
	description:

		"C functions used to implement class UNIX_SIGNALS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_SIG_H
#define EIF_SIG_H

extern char esigdefined(long int sig);
extern long esignum(void);
extern void esigcatch(long int sig);
extern void esigignore(long int sig);
extern void esigresall(void);
extern void esigresdef(long int sig);
extern char esigiscaught(long int sig);
extern long esigmap(long int idx);
extern char* esigname(long int sig);

#endif
