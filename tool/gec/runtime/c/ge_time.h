/*
	description:

		"C functions used to implement class C_DATE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_TIME_H
#define GE_TIME_H

#ifdef _XOPEN_UNIX
/* OpenBSD does not support 'ftime' unless -lcompat is specified. */
/* Use the recommended XSI (X/Open System Interface) extension instead. */
#include <sys/timeb.h>
#include <sys/types.h>
#define geftime(p) gettimeofday((struct timeval*)(p),((void*)0))
#define getimebsz sizeof(struct timeval)
#define getimebmillitm(p) ((struct timeval*)(p))->tv_usec
#define getimebtime(p) ((struct timeval*)(p))->tv_sec
#else
#include <sys/timeb.h>
#define geftime(p) ftime((struct timeb*)(p))
#define getimebsz sizeof(struct timeb)
#define getimebmillitm(p) ((struct timeb*)(p))->millitm
#define getimebtime(p) ((struct timeb*)(p))->time
#endif

#endif
