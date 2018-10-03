note
	description: "Information about integer, natural and real type in Eiffel"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	NUMERIC_INFORMATION

feature -- Types

	max_integer_type: INTEGER_64
			-- INTEGER type of max word length
		do
		ensure
			instance_free: class
		end

	max_natural_type: NATURAL_64
			-- NATURAL type of max word length
		do
		ensure
			instance_free: class
		end

	type_count: INTEGER = 4
			-- Number of types of integer/natural in Eiffel

	type_no_limitation: INTEGER = 0
			-- Type representing a number sequence (no length limitation)

	type_integer_natural_separator: INTEGER = 10

	type_integer_8:  INTEGER = 1
	type_integer_16: INTEGER = 2
	type_integer, type_integer_32: INTEGER = 3
	type_integer_64: INTEGER = 4

	type_natural_8: INTEGER = 11
	type_natural_16: INTEGER = 12
	type_natural, type_natural_32: INTEGER = 13
	type_natural_64: INTEGER = 14
			-- Integer/natural type indicators

	type_real: INTEGER = 100
	type_double: INTEGER = 101
			-- Real/Double type indicators

feature -- Type checking

	integer_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid integer type?
		do
			Result := (type = type_integer_8) or
					  (type = type_integer_16) or
					  (type = type_integer_32) or
					  (type = type_integer_64)
		ensure
			instance_free: class
		end

	natural_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid natural type?
		do
			Result := (type = type_natural_8) or
					  (type = type_natural_16) or
					  (type = type_natural_32) or
					  (type = type_natural_64)
		ensure
			instance_free: class
		end

	integer_natural_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid integer/natural type?
		do
			Result := (type = type_no_limitation) or
					  (type = type_integer_8) or
					  (type = type_integer_16) or
					  (type = type_integer_32) or
					  (type = type_integer_64) or
					  (type = type_natural_8) or
					  (type = type_natural_16) or
					  (type = type_natural_32) or
					  (type = type_natural_64)
		ensure
			instance_free: class
		end

	real_double_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid real/double type?
		do
			Result :=
				type = type_no_limitation or
				type = type_real or
				type = type_double
		ensure
			instance_free: class
		end

	real_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid real type?
		do
			Result := type = type_real
		ensure
			instance_free: class
		end

	double_type_valid (type: INTEGER): BOOLEAN
			-- Is `type' a valid double type?
		do
			Result := type = type_double
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
