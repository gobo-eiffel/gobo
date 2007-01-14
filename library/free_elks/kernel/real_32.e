indexing
	description: "Real values, single precision"
	external_name: "System.Single"
	assembly: "mscorlib"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

frozen expanded class REAL_32 inherit

	REAL_32_REF
		redefine
			infix "<",
			truncated_to_integer,
			truncated_to_integer_64,
			to_double,
			ceiling_real_32,
			floor_real_32,
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
	make_from_reference ({REAL_32_REF}),
	to_double: {DOUBLE}

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current real?
		external
			"built_in"
		end

feature -- Conversion

	truncated_to_integer: INTEGER is
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	truncated_to_integer_64: INTEGER_64 is
			-- Integer part (same sign, largest absolute
			-- value no greater than current object's)
		external
			"built_in"
		end

	to_double: DOUBLE is
			-- Current seen as a double
		external
			"built_in"
		end

	ceiling_real_32: REAL_32 is
			-- Smallest integral value no smaller than current object
		external
			"built_in"
		end

	floor_real_32: REAL_32 is
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
			-- Product by `other'
		external
			"built_in"
		end

	infix "/" (other: like Current): like Current is
			-- Division by `other'
		external
			"built_in"
		end

	infix "^" (other: DOUBLE): DOUBLE is
			-- Current real to the power `other'
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
			-- Printable representation of real value
		external
			"built_in"
		end

end
