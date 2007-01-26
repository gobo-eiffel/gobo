indexing

	description: "[
		Basic mathematical operations, single-precision.
		This class may be used as ancestor by classes needing its facilities
		]"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	SINGLE_MATH

inherit

	MATH_CONST

feature -- Access

	log_2 (v: REAL): REAL is
			-- Base 2 logarithm of `v'
		require
			v > 0.0
		do
			Result := log (v) / log (2.0)
		end

	cosine (v: REAL): REAL is
			-- Trigonometric cosine of radian `v' approximated
			-- in the range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"cos"
		end

	arc_cosine (v: REAL): REAL is
			-- Trigonometric arccosine of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"acos"
		end

	sine (v: REAL): REAL is
			-- Trigonometric sine of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"sin"
		end

	arc_sine (v: REAL): REAL is
			-- Trigonometric arcsine of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"asin"
		end

	tangent (v: REAL): REAL is
			-- Trigonometric tangent of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"tan"
		end

	arc_tangent (v: REAL): REAL is
			-- Trigonometric arctangent of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"atan"
		end

	sqrt (v: REAL): REAL is
			-- Square root of `v'
		require
			v >= 0.0
		external
			"C signature (double): double use <math.h>"
		alias
			"sqrt"
		end

	log (v: REAL): REAL is
			-- Natural logarithm of `v'
		require
			v > 0.0
		external
			"C signature (double): double use <math.h>"
		alias
			"log"
		end

	log10 (v: REAL): REAL is
			-- Base 10 logarithm of `v'
		require
			v > 0.0
		external
			"C signature (double): double use <math.h>"
		alias
			"log10"
		end

	floor (v: REAL): REAL is
			-- Greatest integral value less than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"floor"
		end

	ceiling (v: REAL): REAL is
			-- Least integral value greater than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"ceil"
		end

feature {NONE} -- Implementation

	rabs (v: REAL): REAL is
			-- Absolute value of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"fabs"
		end

end
