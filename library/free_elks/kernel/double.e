indexing
	description: "Real values, double precision" 
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

expanded class DOUBLE inherit

	DOUBLE_REF
		redefine
			infix "<",
			truncated_to_integer,
			truncated_to_integer_64,
			truncated_to_real,
			ceiling_real_64,
			floor_real_64,
			infix "+",
			infix "-",
			infix "*",
			infix "/",
			infix "^",
			prefix "-",
			prefix "+",
			out
		end

create
	default_create,
	make_from_reference

convert
	make_from_reference ({DOUBLE_REF}),
	to_reference: {DOUBLE_REF, NUMERIC, COMPARABLE, PART_COMPARABLE, HASHABLE, ANY},
	truncated_to_real: {REAL}

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current double?
		external
			"built_in"
		end

feature -- Conversion

	truncated_to_integer: INTEGER is
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

	truncated_to_real: REAL is
			-- Real part (Same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	ceiling_real_64: DOUBLE is
			-- Smallest integral value no smaller than current object
		external
			"built_in"
		end

	floor_real_64: DOUBLE is
			-- Greatest integral value no greater than current object
		external
			"built_in"
		end

feature -- Basic operations

	infix "+" (other: like Current): like Current is
			-- Sum with `other'
		external
			"built_in"
		end

	infix "-" (other: like Current): like Current is
			-- Result of subtracting `other'
		external
			"built_in"
		end

	infix "*" (other: like Current): like Current is
			-- Product with `other'
		external
			"built_in"
		end

	infix "/" (other: like Current): like Current is
			-- Division by `other'
		external
			"built_in"
		end

	infix "^" (other: DOUBLE): DOUBLE is
			-- Current double to the power `other'
		external
			"built_in"
		end

	prefix "+": like Current is
			-- Unary plus
		external
			"built_in"
		end

	prefix "-": like Current is
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
