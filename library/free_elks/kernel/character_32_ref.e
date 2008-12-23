indexing
	description: "References to objects containing a unicode character value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	CHARACTER_32_REF

inherit
	COMPARABLE
		redefine
			is_equal, out
		end

	HASHABLE
		redefine
			is_equal, out
		end

feature -- Access

	item: CHARACTER_32
			-- Unicode character value
		external
			"built_in"
		end

	code: INTEGER
			-- Associated integer value
		do
			Result := item.code
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := code.hash_code
		end

	natural_32_code: NATURAL_32
			-- Associated natural value
		do
			Result := item.natural_32_code
		ensure
			natural_32_code_in_range: Result >= min_value and Result <= max_value
		end

	min_value: NATURAL_32 = 0
	max_value: NATURAL_32 = 4294967295
			-- Bounds for integer representation of CHARACTER_32

feature -- Status report

	is_space: BOOLEAN
			-- Is `item' a white space?
		require
			is_character_8_compatible: is_character_8
		do
			Result := to_character_8.is_space
		end

	is_character_8: BOOLEAN
			-- Can current be represented on a CHARACTER_8?
		do
			Result := natural_32_code <= {CHARACTER_8}.max_value.to_natural_32
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is `other' greater than current character?
		do
			Result := code < other.code
		ensure then
			definition: Result = (code < other.code)
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Element change

	set_item (c: CHARACTER_32)
			-- Make `c' the `item' value.
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of wide character
		do
			create Result.make (6)
			Result.append_character ('U')
			Result.append_character ('+')
			Result.append_string (code.to_hex_string)
		end

feature {NONE} -- Initialization

	make_from_reference (v: CHARACTER_32_REF)
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: CHARACTER_32_REF
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_character_8: CHARACTER_8
			-- Convert current to CHARACTER_8
		require
			is_character_8_compatible: is_character_8
		do
			Result := item.to_character_8
		end

	to_character_32: CHARACTER_32
			-- Convert current to CHARACTER_32
		do
			Result := item
		end

	as_upper, upper: CHARACTER_32
			-- Uppercase value of `item'
			-- Returns `item' if not `is_lower'
		require
			is_character_8_compatible: is_character_8
		do
			Result := to_character_8.upper
		end

	as_lower, lower: CHARACTER_32
			-- Lowercase value of `item'
			-- Returns `item' if not `is_upper'
		require
			is_character_8_compatible: is_character_8
		do
			Result := to_character_8.lower
		end

end
