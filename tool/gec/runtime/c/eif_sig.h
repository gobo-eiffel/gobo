/*
	description:

		"C functions used to implement class UNIX_SIGNALS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_SIG_H
#define EIF_SIG_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern char esigdefined(long int sig);
extern long esignum(void);
extern void esigcatch(long int sig);
extern void esigignore(long int sig);
extern void esigresall(void);
extern void esigresdef(long int sig);
extern char esigiscaught(long int sig);
extern long esigmap(long int idx);
extern char* esigname(long int sig);

#ifdef __cplusplus
}
#endif

#endif
