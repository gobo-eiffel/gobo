note
	description: "[
		Basic mathematical operations, double-precision.
		This class may be used as ancestor by classes needing its facilities.
		]"

	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	DOUBLE_MATH

inherit
	MATH_CONST

feature -- Access

	log_2 (v: REAL_64): REAL_64
			-- Base 2 logarithm of `v'
		do
			Result := log (v) / log ({REAL_64} 2.0)
		end

	cosine (v: REAL_64): REAL_64
			-- Trigonometric cosine of radian `v' approximated
			-- in the range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"cos"
		end

	arc_cosine (v: REAL_64): REAL_64
			-- Trigonometric arccosine of radian `v'
			-- in the range [0, pi]
		external
			"C signature (double): double use <math.h>"
		alias
			"acos"
		end

	sine (v: REAL_64): REAL_64
			-- Trigonometric sine of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"sin"
		end

	arc_sine (v: REAL_64): REAL_64
			-- Trigonometric arcsine of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"asin"
		end

	tangent (v: REAL_64): REAL_64
			-- Trigonometric tangent of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"tan"
		end

	arc_tangent (v: REAL_64): REAL_64
			-- Trigonometric arctangent of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"atan"
		end

	sqrt (v: REAL_64): REAL_64
			-- Square root of `v'
		external
			"C signature (double): double use <math.h>"
		end

	exp (x: REAL_64): REAL_64
			-- Exponential of `v'.
		external
			"C signature (double): double use <math.h>"
		end

	log (v: REAL_64): REAL_64
			-- Natural logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		end

	log10 (v: REAL_64): REAL_64
			-- Base 10 logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		end

	floor (v: REAL_64): REAL_64
			-- Greatest integral less than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		end

	ceiling (v: REAL_64): REAL_64
			-- Least integral greater than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"ceil"
		end

	dabs (v: REAL_64): REAL_64
			-- Absolute of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"fabs"
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
