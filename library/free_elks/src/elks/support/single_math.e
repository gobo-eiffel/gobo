note
	description: "[
			Basic mathematical operations, single-precision.
			This class may be used as ancestor by classes needing its facilities
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	SINGLE_MATH

inherit
	MATH_CONST

feature -- Access

	log_2 (v: REAL_32): REAL_32
			-- Base 2 logarithm of `v'
		do
			Result := log (v) / log ({REAL_32} 2.0)
		ensure
			instance_free: class
		end

	cosine (v: REAL_32): REAL_32
			-- Trigonometric cosine of radian `v' approximated
			-- in the range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"cos"
		ensure
			instance_free: class
		end

	arc_cosine (v: REAL_32): REAL_32
			-- Trigonometric arccosine of radian `v'
			-- in the range [0, pi]
		external
			"C signature (double): double use <math.h>"
		alias
			"acos"
		ensure
			instance_free: class
		end

	sine (v: REAL_32): REAL_32
			-- Trigonometric sine of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"sin"
		ensure
			instance_free: class
		end

	arc_sine (v: REAL_32): REAL_32
			-- Trigonometric arcsine of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"asin"
		ensure
			instance_free: class
		end

	tangent (v: REAL_32): REAL_32
			-- Trigonometric tangent of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		external
			"C signature (double): double use <math.h>"
		alias
			"tan"
		ensure
			instance_free: class
		end

	arc_tangent (v: REAL_32): REAL_32
			-- Trigonometric arctangent of radian `v'
			-- in the range [-pi/2, +pi/2]
		external
			"C signature (double): double use <math.h>"
		alias
			"atan"
		ensure
			instance_free: class
		end

	sqrt (v: REAL_32): REAL_32
			-- Square root of `v'
		external
			"C signature (double): double use <math.h>"
		ensure
			instance_free: class
		end

	exp (x: REAL_32): REAL_32
			-- Exponential of `v'.
		external
			"C signature (double): double use <math.h>"
		ensure
			instance_free: class
		end

	log (v: REAL_32): REAL_32
			-- Natural logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		ensure
			instance_free: class
		end

	log10 (v: REAL_32): REAL_32
			-- Base 10 logarithm of `v'
		external
			"C signature (double): double use <math.h>"
		ensure
			instance_free: class
		end

	floor (v: REAL_32): REAL_32
			-- Greatest integral value less than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		ensure
			instance_free: class
		end

	ceiling (v: REAL_32): REAL_32
			-- Least integral value greater than or equal to `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"ceil"
		ensure
			instance_free: class
		end

	rabs (v: REAL_32): REAL_32
			-- Absolute value of `v'
		external
			"C signature (double): double use <math.h>"
		alias
			"fabs"
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
