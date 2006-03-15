/*
	description:

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_H
#define GE_REAL_H

#include <math.h>

#ifndef gepower
#define gepower(x,y) pow((x),(y))
#endif
#define geceiling(x) ceil(x)
#define gefloor(x) floor(x)

#endif
