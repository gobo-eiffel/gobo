indexing
	description: "Real values, double precision"
	external_name: "System.Double"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class REAL_64 inherit

	REAL_64_REF
		redefine
			is_less,
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
	make_from_reference ({REAL_64_REF}),
	truncated_to_real: {REAL_32}

feature -- Comparison

	is_less alias "<" (other: REAL_64): BOOLEAN is
			-- Is `other' greater than current double?
		external
			"built_in"
		end

feature -- Conversion

	truncated_to_integer: INTEGER_32 is
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_integer_64: INTEGER_64 is
			-- Integer part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_real: REAL_32 is
			-- Real part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	ceiling_real_64: REAL_64 is
			-- Smallest integral value no smaller than current object
		external
			"built_in"
		end

	floor_real_64: REAL_64 is
			-- Greatest integral value no greater than current object
		external
			"built_in"
		end

feature -- Basic operations

	plus alias "+" (other: REAL_64): REAL_64 is
			-- Sum with `other'
		external
			"built_in"
		end

	minus alias "-" (other: REAL_64): REAL_64 is
			-- Result of subtracting `other'
		external
			"built_in"
		end

	product alias "*" (other: REAL_64): REAL_64 is
			-- Product with `other'
		external
			"built_in"
		end

	quotient alias "/" (other: REAL_64): REAL_64 is
			-- Division by `other'
		external
			"built_in"
		end

	power alias "^" (other: REAL_64): REAL_64 is
			-- Current double to the power `other'
		external
			"built_in"
		end

	identity alias "+": REAL_64 is
			-- Unary plus
		external
			"built_in"
		end

	opposite alias "-": REAL_64 is
			-- Unary minus
		external
			"built_in"
		end

feature -- Output

	out: STRING is
			-- Printable representation of double value
		external
			"built_in"
		end

end
