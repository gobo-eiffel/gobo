note
	description: "References to objects containing a unicode character value"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-26 07:05:34 +0100 (Sat, 26 Jan 2013) $"
	revision: "$Revision: 724 $"

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
		obsolete
			"Use `natural_32_code' instead."
		do
			Result := natural_32_code.as_integer_32
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := natural_32_code.hash_code
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

	max_unicode_value: NATURAL_32 = 0x10FFFD
			-- Maximum Unicode characters.

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is `other' greater than current character?
		do
			Result := natural_32_code < other.natural_32_code
		ensure then
			definition: Result = (natural_32_code < other.natural_32_code)
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Basic routines

	plus alias "+" (incr: NATURAL_32): CHARACTER_32
			-- Add `incr' to the code of `item'.
		require
			valid_increment: (item.natural_32_code.to_natural_64 + incr).is_valid_character_32_code
		do
			Result := (item.natural_32_code + incr).to_character_32
		ensure
			valid_result: Result |-| item = incr
		end

	minus alias "-" (decr: NATURAL_32): CHARACTER_32
			-- Subtract `decr' from the code of `item'.
		require
			valid_decrement: (item.natural_32_code.to_integer_64 - decr).is_valid_character_32_code
		do
			Result := (item.natural_32_code - decr).to_character_32
		ensure
			valid_result: item |-| Result = decr
		end

	difference alias "|-|" (other: CHARACTER_32): INTEGER_64
			-- Difference between the codes of `item' and `other'.
		do
			Result := item.natural_32_code.to_integer_64 - other.natural_32_code.to_integer_64
		ensure
			valid_non_negative_result: Result >= 0 implies ((other + Result.to_natural_32) = item)
			valid_negative_result: Result < 0 implies (other = (item + Result.to_natural_32))
		end

	next: CHARACTER_32
			-- Next character.
		require
			valid_character: (item.natural_32_code.to_natural_64 + 1).is_valid_character_32_code
		do
			Result := item + 1
		ensure
			valid_result: Result |-| item = 1
		end

	previous: CHARACTER_32
			-- Previous character.
		require
			valid_character: (item.natural_32_code.to_natural_64 - 1).is_valid_character_32_code
		do
			Result := item - 1
		ensure
			valid_result: Result |-| item = -1
		end

feature -- Element change

	set_item (c: CHARACTER_32)
			-- Make `c' the `item' value.
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of wide character.
		do
			create Result.make (6)
			Result.append_character ('U')
			Result.append_character ('+')
			Result.append_string (natural_32_code.to_hex_string)
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
			-- Associated reference of Current.
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_character_8: CHARACTER_8
			-- Convert current to CHARACTER_8.
		require
			is_character_8_compatible: is_character_8
		do
			Result := item.to_character_8
		end

	to_character_32: CHARACTER_32
			-- Convert current to CHARACTER_32.
		do
			Result := item
		end

	as_upper, upper: CHARACTER_32
			-- Uppercase value of `item'.
			-- Returns `item' if not `is_lower'.
		do
			Result := properties.to_upper (item)
		end

	as_lower, lower: CHARACTER_32
			-- Lowercase value of `item'.
			-- Returns `item' if not `is_upper'.
		do
			Result := properties.to_lower (item)
		end

feature -- Status report

	is_character_8: BOOLEAN
			-- Can current be represented on a CHARACTER_8?
		do
			Result := natural_32_code <= {CHARACTER_8}.max_value.to_natural_32
		end

	is_alpha: BOOLEAN
			-- Is `item' alphabetic?
			-- Alphabetic is `is_upper' or `is_lower'.
		do
			Result := properties.is_alpha (item)
		end

	is_upper: BOOLEAN
			-- Is `item' uppercase?
		do
			Result := properties.is_upper (item)
		end

	is_lower: BOOLEAN
			-- Is `item' lowercase?
		do
			Result := properties.is_lower (item)
		end

	is_digit: BOOLEAN
			-- Is `item' a decimal digit as expected for ASCII characters?
			-- A digit is one of 0123456789.
		do
			Result := '0' <= item and item <= '9'
		end

	is_unicode_digit: BOOLEAN
			-- Is `item' a decimal digit as expected for Unicode characters?
		do
			Result := properties.is_digit (item)
		end

	is_hexa_digit: BOOLEAN
			-- Is `item' a hexadecimal digit as expected for ASCII characters?
			-- A digit is one of 0123456789ABCDEFabcedf.
		do
			Result := properties.is_hexa_digit (item)
		end

	is_space: BOOLEAN
			-- Is `item' a white space?
		do
			Result := properties.is_space (item)
		end

	is_punctuation: BOOLEAN
			-- Is `item' a punctuation?
		do
			Result := properties.is_punctuation (item)
		end

	is_alpha_numeric: BOOLEAN
			-- Is `item' alphabetic or a digit?
		do
			Result := properties.is_alpha (item) or properties.is_digit (item)
		end

	is_control: BOOLEAN
			-- Is `item' a control character?
		do
			Result := properties.is_control (item)
		end

feature {NONE} -- Implementation

	properties: CHARACTER_PROPERTY
			-- Property for Unicode characters.
		once
			create Result.make
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
