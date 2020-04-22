note
	description: "Real values, double precision."
	external_name: "System.Double"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class REAL_64 inherit

	REAL_64_REF
		redefine
			is_less,
			is_nan,
			is_negative_infinity,
			is_positive_infinity,
			truncated_to_integer,
			truncated_to_integer_64,
			truncated_to_real,
			ceiling_real_64,
			floor_real_64,
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
	make_from_reference ({REAL_64_REF})

feature -- Comparison

	is_less alias "<" (other: REAL_64): BOOLEAN
			-- Is `other` greater than current double?
			-- See also: `ieee_is_less`.
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
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_integer_64: INTEGER_64
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_real: REAL_32
			-- Real part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	ceiling_real_64: REAL_64
			-- Smallest integral value no smaller than current object
		external
			"built_in"
		end

	floor_real_64: REAL_64
			-- Greatest integral value no greater than current object
		external
			"built_in"
		end

feature -- Basic operations

	plus alias "+" (other: REAL_64): REAL_64
			-- Sum with `other'
		external
			"built_in"
		end

	minus alias "-" alias "−" (other: REAL_64): REAL_64
			-- Result of subtracting `other'
		external
			"built_in"
		end

	product alias "*" alias "×" (other: REAL_64): REAL_64
			-- Product with `other'
		external
			"built_in"
		end

	quotient alias "/" alias "÷" (other: REAL_64): REAL_64
			-- Division by `other'
		external
			"built_in"
		end

	power alias "^" (other: REAL_64): REAL_64
			-- Current double to the power `other'
		external
			"built_in"
		end

	identity alias "+": REAL_64
			-- Unary plus
		external
			"built_in"
		end

	opposite alias "-" alias "−": REAL_64
			-- Unary minus
		external
			"built_in"
		end

feature -- IEEE comparison

	ieee_is_equal (other: REAL_64): BOOLEAN
			-- Is current value equal to `other` according to IEEE 754 standard?
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_is_greater (other: REAL_64): BOOLEAN
			-- Is current value greater than `other` according to IEEE 754 standard?
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_is_greater_equal (other: REAL_64): BOOLEAN
			-- Is current value greater than or equal to `other` according to IEEE 754 standard?
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_is_less (other: REAL_64): BOOLEAN
			-- Is current value less than `other` according to IEEE 754 standard?
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_is_less_equal (other: REAL_64): BOOLEAN
			-- Is current value less than or equal to `other` according to IEEE 754 standard?
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_maximum_number (other: REAL_64): REAL_64
			-- The greater of current object and `other` according to IEEE 754 standard.
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

	ieee_minimum_number (other: REAL_64): REAL_64
			-- The smaller of current object and `other` according to IEEE 754 standard.
		note
			EIS: "name=doi", "src=https://doi.org/10.1109/IEEESTD.2008.4610935", "tag=IEEE 754"
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of double value
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
