note
	description: "Real values, single precision"
	external_name: "System.Single"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

frozen expanded class REAL_32 inherit

	REAL_32_REF
		redefine
			is_less,
			is_nan,
			is_negative_infinity,
			is_positive_infinity,
			truncated_to_integer,
			truncated_to_integer_64,
			to_double,
			ceiling_real_32,
			floor_real_32,
			plus,
			minus,
			product,
			quotient,
			power,
			opposite,
			identity,
			out
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({REAL_32_REF}),
	to_double: {REAL_64}

feature -- Comparison

	is_less alias "<" (other: REAL_32): BOOLEAN
			-- Is `other' greater than current real?
		external
			"built_in"
		end

feature -- Status Report

	is_nan: BOOLEAN
			-- Is current the representation of `nan'?
		external
			"built_in"
		end

	is_negative_infinity: BOOLEAN
			-- Is current the representation of `negative_infinity'?
		external
			"built_in"
		end

	is_positive_infinity: BOOLEAN
			-- Is current the representation of `positive_infinity'?
		external
			"built_in"
		end

feature -- Conversion

	truncated_to_integer: INTEGER_32
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_integer_64: INTEGER_64
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	to_double: REAL_64
			-- Current seen as a double
		external
			"built_in"
		end

	ceiling_real_32: REAL_32
			-- Smallest integral value no smaller than current object
		external
			"built_in"
		end

	floor_real_32: REAL_32
			-- Greatest integral value no greater than current object
		external
			"built_in"
		end

feature -- Basic operations

	plus alias "+" (other: REAL_32): REAL_32
			-- Sum with `other'
		external
			"built_in"
		end

	minus alias "-" (other: REAL_32): REAL_32
			-- Result of subtracting `other'
		external
			"built_in"
		end

	product alias "*" (other: REAL_32): REAL_32
			-- Product by `other'
		external
			"built_in"
		end

	quotient alias "/" (other: REAL_32): REAL_32
			-- Division by `other'
		external
			"built_in"
		end

	power alias "^" (other: REAL_64): REAL_64
			-- Current real to the power `other'
		external
			"built_in"
		end

	identity alias "+": REAL_32
			-- Unary plus
		external
			"built_in"
		end

	opposite alias "-": REAL_32
			-- Unary minus
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of real value
		external
			"built_in"
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
