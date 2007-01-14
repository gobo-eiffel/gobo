indexing
	description: "References to objects containing a character value"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class CHARACTER_8_REF inherit

	COMPARABLE
		redefine
			out, is_equal
		end

	HASHABLE
		redefine
			is_hashable, out, is_equal
		end

	REFACTORING_HELPER
		redefine
			out, is_equal
		end

feature -- Access

	item: CHARACTER_8 is
			-- Character value
		external
			"built_in"
		end

	code: INTEGER is
			-- Associated integer value
		do
			Result := item.code
		end

	natural_32_code: NATURAL_32 is
			-- Associated integer value
		do
			Result := code.to_natural_32
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := code
		end

	Min_value: INTEGER is 0
	Max_value: INTEGER is 255
			-- Bounds for integer representation of characters (ASCII)

feature -- Status report

	is_hashable: BOOLEAN is
			-- May current object be hashed?
			-- (True if it is not its type's default.)
		do
			Result := item /= '%U'
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is `other' greater than current character?
		do
			Result := code < other.code
		ensure then
			definition: Result = (code < other.code)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := other.item = item
		end

feature -- Basic routines

	infix "+" (incr: INTEGER): CHARACTER_8 is
			-- Add `incr' to the code of `item'
		require
			valid_increment: (item.code + incr).is_valid_character_8_code
		do
			Result := (item.code + incr).to_character_8
		ensure
			valid_result: Result |-| item = incr
		end

	infix "-" (decr: INTEGER): CHARACTER_8 is
			-- Subtract `decr' to the code of `item'
		require
			valid_decrement: (item.code - decr).is_valid_character_8_code
		do
			Result := (item.code - decr).to_character_8
		ensure
			valid_result: item |-| Result = decr
		end

	infix "|-|" (other: CHARACTER_8): INTEGER is
			-- Difference between the codes of `item' and `other'
		do
			Result := item.code - other.code
		ensure
			valid_result: other + Result = item
		end

	next: CHARACTER_8 is
			-- Next character
		require
			valid_character: (item.code + 1).is_valid_character_8_code
		do
			Result := item + 1
		ensure
			valid_result: Result |-| item = 1
		end

	previous: CHARACTER_8 is
			-- Previous character
		require
			valid_character: (item.code - 1).is_valid_character_8_code
		do
			Result := item - 1
		ensure
			valid_result: Result |-| item = -1
		end

feature -- Element change

	set_item (c: CHARACTER_8) is
			-- Make `c' the `item' value.
		external
			"built_in"
		end

feature -- Output

	out: STRING is
			-- Printable representation of character
		do
			create Result.make (1)
			Result.append_character (item)
		end

feature {NONE} -- Initialization

	make_from_reference (v: CHARACTER_8_REF) is
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: CHARACTER_8_REF is
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_character_8: CHARACTER_8 is
			-- Associated character in 8 bit version.
		do
			Result := item
		end

	to_character_32: CHARACTER_32 is
			-- Associated character in 32 bit version.
		do
			Result := item.to_character_32
		end

	as_upper, upper: CHARACTER_8 is
			-- Uppercase value of `item'
			-- Returns `item' if not `is_lower'
		do
			if is_lower then
				Result := (item.code - ('a').code + ('A').code).to_character_8
			else
				Result := item
			end
		end

	as_lower, lower: CHARACTER_8 is
			-- Lowercase value of `item'
			-- Returns `item' if not `is_upper'
		do
			if is_upper then
				Result := (item.code - ('A').code + ('a').code).to_character_8
			else
				Result := item
			end
		end

feature -- Status report

	is_alpha: BOOLEAN is
			-- Is `item' alphabetic?
			-- Alphabetic is `is_upper' or `is_lower'
		do
			Result := (character_types (item.code) & (is_upper_flag | is_lower_flag)) > 0
		end

	is_upper: BOOLEAN is
			-- Is `item' uppercase?
		do
			Result := (character_types (item.code) & is_upper_flag) > 0
		end

	is_lower: BOOLEAN is
			-- Is `item' lowercase?
		do
			Result := (character_types (item.code) & is_lower_flag) > 0
		end

	is_digit: BOOLEAN is
			-- Is `item' a digit?
			-- A digit is one of 0123456789
		do
			Result := (character_types (item.code) & is_digit_flag) > 0
		end

	is_hexa_digit: BOOLEAN is
			-- Is `item' an hexadecimal digit?
			-- A digit is one of 0123456789ABCDEFabcedf
		do
			Result := (character_types (item.code) & (is_hexa_digit_flag | is_digit_flag)) > 0
		end

	is_space: BOOLEAN is
			-- Is `item' a white space?
		do
			Result := (character_types (item.code) & is_white_space_flag) > 0
		end

	is_punctuation: BOOLEAN is
			-- Is `item' a punctuation?
		do
			Result := (character_types (item.code) & is_punctuation_flag) > 0
		end

	is_alpha_numeric: BOOLEAN is
			-- Is `item' alphabetic or a digit?
		do
			Result := (character_types (item.code) & (is_upper_flag | is_lower_flag | is_digit_flag)) > 0
		end

	is_printable: BOOLEAN is
			-- Is `item' a printable character including space?
		do
			Result := (character_types (item.code) &
				(is_upper_flag | is_lower_flag | is_digit_flag | is_punctuation_flag | is_space_flag)) > 0
		end

	is_graph: BOOLEAN is
			-- Is `item' a printable character except space?
		do
			Result := (character_types (item.code) &
				(is_upper_flag | is_lower_flag | is_digit_flag | is_punctuation_flag)) > 0
		end

	is_control: BOOLEAN is
			-- Is `item' a control character?
		do
			Result := (character_types (item.code) & is_control_flag) > 0
		end

feature {NONE} -- Implementation

	character_types (a_code: INTEGER): NATURAL_8 is
			-- Associated type for character of code `a_code'.
		do
				-- For character whose code is above 256, it is as if
				-- we had no information about it.
			if a_code < 256 then
				Result := internal_character_types.item (a_code)
			end
		end

	internal_character_types: SPECIAL [NATURAL_8] is
			-- Array which stores the various type for the ASCII characters.
		once
			create Result.make (256)
			Result.put (is_control_flag, 0)
			Result.put (is_control_flag, 1)
			Result.put (is_control_flag, 2)
			Result.put (is_control_flag, 3)
			Result.put (is_control_flag, 4)
			Result.put (is_control_flag, 5)
			Result.put (is_control_flag, 6)
			Result.put (is_control_flag, 7)
			Result.put (is_control_flag, 8)
			Result.put (is_control_flag | is_white_space_flag, 9)
			Result.put (is_control_flag | is_white_space_flag, 10)
			Result.put (is_control_flag | is_white_space_flag, 11)
			Result.put (is_control_flag | is_white_space_flag, 12)
			Result.put (is_control_flag | is_white_space_flag, 13)
			Result.put (is_control_flag, 14)
			Result.put (is_control_flag, 15)
			Result.put (is_control_flag, 16)
			Result.put (is_control_flag, 17)
			Result.put (is_control_flag, 18)
			Result.put (is_control_flag, 19)
			Result.put (is_control_flag, 20)
			Result.put (is_control_flag, 21)
			Result.put (is_control_flag, 22)
			Result.put (is_control_flag, 23)
			Result.put (is_control_flag, 24)
			Result.put (is_control_flag, 25)
			Result.put (is_control_flag, 26)
			Result.put (is_control_flag, 27)
			Result.put (is_control_flag, 28)
			Result.put (is_control_flag, 29)
			Result.put (is_control_flag, 30)
			Result.put (is_control_flag, 31)
			Result.put (is_white_space_flag | is_space_flag, 32)
			Result.put (is_punctuation_flag, 33)
			Result.put (is_punctuation_flag, 34)
			Result.put (is_punctuation_flag, 35)
			Result.put (is_punctuation_flag, 36)
			Result.put (is_punctuation_flag, 37)
			Result.put (is_punctuation_flag, 38)
			Result.put (is_punctuation_flag, 39)
			Result.put (is_punctuation_flag, 40)
			Result.put (is_punctuation_flag, 41)
			Result.put (is_punctuation_flag, 42)
			Result.put (is_punctuation_flag, 43)
			Result.put (is_punctuation_flag, 44)
			Result.put (is_punctuation_flag, 45)
			Result.put (is_punctuation_flag, 46)
			Result.put (is_punctuation_flag, 47)
			Result.put (is_digit_flag, 48)
			Result.put (is_digit_flag, 49)
			Result.put (is_digit_flag, 50)
			Result.put (is_digit_flag, 51)
			Result.put (is_digit_flag, 52)
			Result.put (is_digit_flag, 53)
			Result.put (is_digit_flag, 54)
			Result.put (is_digit_flag, 55)
			Result.put (is_digit_flag, 56)
			Result.put (is_digit_flag, 57)
			Result.put (is_punctuation_flag, 58)
			Result.put (is_punctuation_flag, 59)
			Result.put (is_punctuation_flag, 60)
			Result.put (is_punctuation_flag, 61)
			Result.put (is_punctuation_flag, 62)
			Result.put (is_punctuation_flag, 63)
			Result.put (is_punctuation_flag, 64)
			Result.put (is_upper_flag | is_hexa_digit_flag, 65)
			Result.put (is_upper_flag | is_hexa_digit_flag, 66)
			Result.put (is_upper_flag | is_hexa_digit_flag, 67)
			Result.put (is_upper_flag | is_hexa_digit_flag, 68)
			Result.put (is_upper_flag | is_hexa_digit_flag, 69)
			Result.put (is_upper_flag | is_hexa_digit_flag, 70)
			Result.put (is_upper_flag, 71)
			Result.put (is_upper_flag, 72)
			Result.put (is_upper_flag, 73)
			Result.put (is_upper_flag, 74)
			Result.put (is_upper_flag, 75)
			Result.put (is_upper_flag, 76)
			Result.put (is_upper_flag, 77)
			Result.put (is_upper_flag, 78)
			Result.put (is_upper_flag, 79)
			Result.put (is_upper_flag, 80)
			Result.put (is_upper_flag, 81)
			Result.put (is_upper_flag, 82)
			Result.put (is_upper_flag, 83)
			Result.put (is_upper_flag, 84)
			Result.put (is_upper_flag, 85)
			Result.put (is_upper_flag, 86)
			Result.put (is_upper_flag, 87)
			Result.put (is_upper_flag, 88)
			Result.put (is_upper_flag, 89)
			Result.put (is_upper_flag, 90)
			Result.put (is_punctuation_flag, 91)
			Result.put (is_punctuation_flag, 92)
			Result.put (is_punctuation_flag, 93)
			Result.put (is_punctuation_flag, 94)
			Result.put (is_punctuation_flag, 95)
			Result.put (is_punctuation_flag, 96)
			Result.put (is_lower_flag | is_hexa_digit_flag, 97)
			Result.put (is_lower_flag | is_hexa_digit_flag, 98)
			Result.put (is_lower_flag | is_hexa_digit_flag, 99)
			Result.put (is_lower_flag | is_hexa_digit_flag, 100)
			Result.put (is_lower_flag | is_hexa_digit_flag, 101)
			Result.put (is_lower_flag | is_hexa_digit_flag, 102)
			Result.put (is_lower_flag, 103)
			Result.put (is_lower_flag, 104)
			Result.put (is_lower_flag, 105)
			Result.put (is_lower_flag, 106)
			Result.put (is_lower_flag, 107)
			Result.put (is_lower_flag, 108)
			Result.put (is_lower_flag, 109)
			Result.put (is_lower_flag, 110)
			Result.put (is_lower_flag, 111)
			Result.put (is_lower_flag, 112)
			Result.put (is_lower_flag, 113)
			Result.put (is_lower_flag, 114)
			Result.put (is_lower_flag, 115)
			Result.put (is_lower_flag, 116)
			Result.put (is_lower_flag, 117)
			Result.put (is_lower_flag, 118)
			Result.put (is_lower_flag, 119)
			Result.put (is_lower_flag, 120)
			Result.put (is_lower_flag, 121)
			Result.put (is_lower_flag, 122)
			Result.put (is_punctuation_flag, 123)
			Result.put (is_punctuation_flag, 124)
			Result.put (is_punctuation_flag, 125)
			Result.put (is_punctuation_flag, 126)
			Result.put (is_control_flag, 127)
		end

	is_upper_flag: NATURAL_8 is {NATURAL_8} 0x01

	is_lower_flag: NATURAL_8 is {NATURAL_8} 0x02

	is_digit_flag: NATURAL_8 is {NATURAL_8} 0x04

	is_white_space_flag: NATURAL_8 is {NATURAL_8} 0x08

	is_punctuation_flag: NATURAL_8 is {NATURAL_8} 0x10

	is_control_flag: NATURAL_8 is {NATURAL_8} 0x20

	is_hexa_digit_flag: NATURAL_8 is {NATURAL_8} 0x40

	is_space_flag: NATURAL_8 is {NATURAL_8} 0x80;

end
