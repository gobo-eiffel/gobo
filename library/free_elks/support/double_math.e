indexing

	description: "[
		Basic mathematical operations, double-precision.
		This class may be used as ancestor by classes needing its facilities.
		]"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	DOUBLE_MATH

inherit
	MATH_CONST

feature -- Access

	log_2 (v: DOUBLE): DOUBLE is
			-- Base 2 logarithm of `v'
		local
			a: DOUBLE
		do
			a := 2.0
			Result := log (v) / log (a)
		end

	cosine (v: DOUBLE): DOUBLE is
			-- Trigonometric cosine of radian `v' approximated
			-- in the range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"cos"
		end

	arc_cosine (v: DOUBLE): DOUBLE is
			-- Trigonometric arccosine of radian `v'
			-- in the range [0, pi]
		external
			"C signature (double): double use <math.h>"
		alias
			"acos"
		end

	sine (v: DOUBLE): DOUBLE is
			-- Trigonometric sine of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"sin"
		end

	arc_sine (v: DOUBLE): DOUBLE is
			-- Trigonometric arcsine of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"asin"
		end

	tangent (v: DOUBLE): DOUBLE is
			-- Trigonometric tangent of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"tan"
		end

	arc_tangent (v: DOUBLE): DOUBLE is
			-- Trigonometric arctangent of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"atan"
		end

	sqrt (v: DOUBLE): DOUBLE is
			-- Square root of `v'
		external
			"C signature (double): double use <math.h>"
		end

	exp (x: DOUBLE): DOUBLE is
			-- Exponential of `v'.
		external
			"C signature (double): double use <math.h>"
		end

	log (v: DOUBLE): DOUBLE is
			-- Natural logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		end

	log10 (v: DOUBLE): DOUBLE is
			-- Base 10 logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		end

	floor (v: DOUBLE): DOUBLE is
			-- Greatest integral less than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		end

	ceiling (v: DOUBLE): DOUBLE is
			-- Least integral greater than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"ceil"
		end

	dabs (v: DOUBLE): DOUBLE is
			-- Absolute of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"fabs"
		end

end
