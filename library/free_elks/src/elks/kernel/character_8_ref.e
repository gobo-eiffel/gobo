note
	description: "References to objects containing a character value"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2014-05-19 14:26:14 -0700 (Mon, 19 May 2014) $"
	revision: "$Revision: 95117 $"

class CHARACTER_8_REF inherit

	COMPARABLE
		redefine
			out, is_equal
		end

	HASHABLE
		redefine
			out, is_equal
		end

feature -- Access

	item: CHARACTER_8
			-- Character value
		external
			"built_in"
		end

	code: INTEGER
			-- Associated integer value
		obsolete
			"Use `natural_32_code' instead. [2017-05-31]"
		do
			Result := item.code
		ensure
			code_non_negatif: Result >= 0
			code_in_range: Result >= min_value and Result <= max_value
		end

	natural_32_code: NATURAL_32
			-- Associated natural value
		do
			Result := item.code.to_natural_32
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := natural_32_code.hash_code
		end

	min_value: INTEGER = 0
	max_value: INTEGER = 255
	max_ascii_value: INTEGER = 127
			-- Bounds for integer representation of characters (ASCII)

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

	plus alias "+" (incr: INTEGER): CHARACTER_8
			-- Add `incr' to the code of `item'
		require
			valid_increment: (item.code + incr).is_valid_character_8_code
		do
			Result := (item.code + incr).to_character_8
		ensure
			valid_result: Result |-| item = incr
		end

	minus alias "-" (decr: INTEGER): CHARACTER_8
			-- Subtract `decr' from the code of `item'
		require
			valid_decrement: (item.code - decr).is_valid_character_8_code
		do
			Result := (item.code - decr).to_character_8
		ensure
			valid_result: item |-| Result = decr
		end

	difference alias "|-|" (other: CHARACTER_8): INTEGER
			-- Difference between the codes of `item' and `other'
		do
			Result := item.code - other.code
		ensure
			valid_result: other + Result = item
		end

	next: CHARACTER_8
			-- Next character
		require
			valid_character: (item.code + 1).is_valid_character_8_code
		do
			Result := item + 1
		ensure
			valid_result: Result |-| item = 1
		end

	previous: CHARACTER_8
			-- Previous character
		require
			valid_character: (item.code - 1).is_valid_character_8_code
		do
			Result := item - 1
		ensure
			valid_result: Result |-| item = -1
		end

feature -- Element change

	set_item (c: CHARACTER_8)
			-- Make `c' the `item' value.
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- Printable representation of character
		do
			create Result.make (1)
			Result.append_character (item)
		end

feature {NONE} -- Initialization

	make_from_reference (v: CHARACTER_8_REF)
			-- Initialize `Current' with `v.item'.
		require
			v_not_void: v /= Void
		do
			set_item (v.item)
		ensure
			item_set: item = v.item
		end

feature -- Conversion

	to_reference: CHARACTER_8_REF
			-- Associated reference of Current
		do
			create Result
			Result.set_item (item)
		ensure
			to_reference_not_void: Result /= Void
		end

	to_character_8: CHARACTER_8
			-- Associated character in 8 bit version
		do
			Result := item
		end

	to_character_32: CHARACTER_32
			-- Associated character in 32 bit version
		do
			Result := item.to_character_32
		end

	as_upper, upper: CHARACTER_8
			-- Uppercase value of `item'
			-- Returns `item' if not `is_lower'
		do
			if is_lower then
				Result := (item.code - ('a').code + ('A').code).to_character_8
			else
				Result := item
			end
		end

	as_lower, lower: CHARACTER_8
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

	is_alpha: BOOLEAN
			-- Is `item' alphabetic?
			-- Alphabetic is `is_upper' or `is_lower'
		do
			Result := (character_types (item.code) & (is_upper_flag | is_lower_flag)) > 0
		end

	is_upper: BOOLEAN
			-- Is `item' uppercase?
		do
			Result := (character_types (item.code) & is_upper_flag) > 0
		end

	is_lower: BOOLEAN
			-- Is `item' lowercase?
		do
			Result := (character_types (item.code) & is_lower_flag) > 0
		end

	is_digit: BOOLEAN
			-- Is `item' a digit?
			-- A digit is one of 0123456789
		do
			Result := (character_types (item.code) & is_digit_flag) > 0
		end

	is_hexa_digit: BOOLEAN
			-- Is `item' an hexadecimal digit?
			-- A digit is one of 0123456789ABCDEFabcedf
		do
			Result := (character_types (item.code) & (is_hexa_digit_flag | is_digit_flag)) > 0
		end

	is_space: BOOLEAN
			-- Is `item' a white space?
		do
			Result := (character_types (item.code) & is_white_space_flag) > 0
		end

	is_punctuation: BOOLEAN
			-- Is `item' a punctuation?
		do
			Result := (character_types (item.code) & is_punctuation_flag) > 0
		end

	is_alpha_numeric: BOOLEAN
			-- Is `item' alphabetic or a digit?
		do
			Result := (character_types (item.code) & (is_upper_flag | is_lower_flag | is_digit_flag)) > 0
		end

	is_printable: BOOLEAN
			-- Is `item' a printable character including space?
		do
			Result := (character_types (item.code) &
				(is_upper_flag | is_lower_flag | is_digit_flag | is_punctuation_flag | is_space_flag)) > 0
		end

	is_graph: BOOLEAN
			-- Is `item' a printable character except space?
		do
			Result := (character_types (item.code) &
				(is_upper_flag | is_lower_flag | is_digit_flag | is_punctuation_flag)) > 0
		end

	is_control: BOOLEAN
			-- Is `item' a control character?
		do
			Result := (character_types (item.code) & is_control_flag) > 0
		end

feature {NONE} -- Implementation

	character_types (a_code: INTEGER): NATURAL_8
			-- Associated type for character of code `a_code'
		do
				-- For character whose code is above 256, it is as if
				-- we had no information about it.
			if a_code < 256 then
				Result := internal_character_types.item (a_code)
			end
		end

	internal_character_types: SPECIAL [NATURAL_8]
			-- Array which stores the various type for the ASCII characters
		once
			create Result.make_empty (256)
			Result.extend (is_control_flag)							-- 0	null
			Result.extend (is_control_flag)                         -- 1	start of heading
			Result.extend (is_control_flag)                         -- 2	start of text
			Result.extend (is_control_flag)                         -- 3	end of text
			Result.extend (is_control_flag)                         -- 4	end of transmission
			Result.extend (is_control_flag)                         -- 5	enquiry
			Result.extend (is_control_flag)                         -- 6	acknowledge
			Result.extend (is_control_flag)                         -- 7	bell
			Result.extend (is_control_flag)                         -- 8	backspace
			Result.extend (is_control_flag | is_white_space_flag)   -- 9	horizontal tab
			Result.extend (is_control_flag | is_white_space_flag)   -- 10	NL line feed, new line
			Result.extend (is_control_flag | is_white_space_flag)   -- 11	vertical tab
			Result.extend (is_control_flag | is_white_space_flag)   -- 12	NP form feed, new page
			Result.extend (is_control_flag | is_white_space_flag)   -- 13	carriage return=CR
			Result.extend (is_control_flag)                         -- 14	shift out
			Result.extend (is_control_flag)                         -- 15	shift in
			Result.extend (is_control_flag)                         -- 16
			Result.extend (is_control_flag)                         -- 17
			Result.extend (is_control_flag)                         -- 18
			Result.extend (is_control_flag)                         -- 19
			Result.extend (is_control_flag)                         -- 20
			Result.extend (is_control_flag)                         -- 21
			Result.extend (is_control_flag)                         -- 22
			Result.extend (is_control_flag)                         -- 23
			Result.extend (is_control_flag)                         -- 24
			Result.extend (is_control_flag)                         -- 25
			Result.extend (is_control_flag)                         -- 26
			Result.extend (is_control_flag)                         -- 27	Escape
			Result.extend (is_control_flag)                         -- 28	file separator
			Result.extend (is_control_flag)                         -- 29	group separator
			Result.extend (is_control_flag)                         -- 30	record separator
			Result.extend (is_control_flag)                         -- 31	unit separator
			Result.extend (is_white_space_flag | is_space_flag)     -- 32	Space
			Result.extend (is_punctuation_flag)                     -- 33	!
			Result.extend (is_punctuation_flag)                     -- 34	"
			Result.extend (is_punctuation_flag)                     -- 35	#
			Result.extend (is_punctuation_flag)                     -- 36	$
			Result.extend (is_punctuation_flag)                     -- 37	%
			Result.extend (is_punctuation_flag)                     -- 38	&
			Result.extend (is_punctuation_flag)                     -- 39	'
			Result.extend (is_punctuation_flag)                     -- 40	(
			Result.extend (is_punctuation_flag)                     -- 41	)
			Result.extend (is_punctuation_flag)                     -- 42	*
			Result.extend (is_punctuation_flag)                     -- 43	+
			Result.extend (is_punctuation_flag)                     -- 44	,
			Result.extend (is_punctuation_flag)                     -- 45	-
			Result.extend (is_punctuation_flag)                     -- 46	.
			Result.extend (is_punctuation_flag)                     -- 47	/
			Result.extend (is_digit_flag)                           -- 48	0
			Result.extend (is_digit_flag)                           -- 49	1
			Result.extend (is_digit_flag)                           -- 50	2
			Result.extend (is_digit_flag)                           -- 51	3
			Result.extend (is_digit_flag)                           -- 52	4
			Result.extend (is_digit_flag)                           -- 53	5
			Result.extend (is_digit_flag)                           -- 54	6
			Result.extend (is_digit_flag)                           -- 55	7
			Result.extend (is_digit_flag)                           -- 56	8
			Result.extend (is_digit_flag)                           -- 57	9
			Result.extend (is_punctuation_flag)                     -- 58	:
			Result.extend (is_punctuation_flag)                     -- 59	;
			Result.extend (is_punctuation_flag)                     -- 60	<
			Result.extend (is_punctuation_flag)                     -- 61	=
			Result.extend (is_punctuation_flag)                     -- 62	>
			Result.extend (is_punctuation_flag)                     -- 63	?
			Result.extend (is_punctuation_flag)                     -- 64	@
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 65	A
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 66	B
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 67	C
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 68	D
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 69	E
			Result.extend (is_upper_flag | is_hexa_digit_flag)      -- 70	F
			Result.extend (is_upper_flag)                           -- 71	G
			Result.extend (is_upper_flag)                           -- 72	H
			Result.extend (is_upper_flag)                           -- 73	I
			Result.extend (is_upper_flag)                           -- 74	J
			Result.extend (is_upper_flag)                           -- 75	K
			Result.extend (is_upper_flag)                           -- 76	L
			Result.extend (is_upper_flag)                           -- 77	M
			Result.extend (is_upper_flag)                           -- 78	N
			Result.extend (is_upper_flag)                           -- 79	O
			Result.extend (is_upper_flag)                           -- 80	P
			Result.extend (is_upper_flag)                           -- 81	Q
			Result.extend (is_upper_flag)                           -- 82	R
			Result.extend (is_upper_flag)                           -- 83	S
			Result.extend (is_upper_flag)                           -- 84	T
			Result.extend (is_upper_flag)                           -- 85	U
			Result.extend (is_upper_flag)                           -- 86	V
			Result.extend (is_upper_flag)                           -- 87	W
			Result.extend (is_upper_flag)                           -- 88	X
			Result.extend (is_upper_flag)                           -- 89	Y
			Result.extend (is_upper_flag)                           -- 90	Z
			Result.extend (is_punctuation_flag)                     -- 91	[
			Result.extend (is_punctuation_flag)                     -- 92	\
			Result.extend (is_punctuation_flag)                     -- 93	]
			Result.extend (is_punctuation_flag)                     -- 94	^
			Result.extend (is_punctuation_flag)                     -- 95	_
			Result.extend (is_punctuation_flag)                     -- 96	`
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 97	a
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 98	b
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 99	c
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 100	d
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 101	e
			Result.extend (is_lower_flag | is_hexa_digit_flag)      -- 102	f
			Result.extend (is_lower_flag)                           -- 103	g
			Result.extend (is_lower_flag)                           -- 104	h
			Result.extend (is_lower_flag)                           -- 105	i
			Result.extend (is_lower_flag)                           -- 106	j
			Result.extend (is_lower_flag)                           -- 107	k
			Result.extend (is_lower_flag)                           -- 108	l
			Result.extend (is_lower_flag)                           -- 109	m
			Result.extend (is_lower_flag)                           -- 110	n
			Result.extend (is_lower_flag)                           -- 111	o
			Result.extend (is_lower_flag)                           -- 112	p
			Result.extend (is_lower_flag)                           -- 113	q
			Result.extend (is_lower_flag)                           -- 114	r
			Result.extend (is_lower_flag)                           -- 115	s
			Result.extend (is_lower_flag)                           -- 116	t
			Result.extend (is_lower_flag)                           -- 117	u
			Result.extend (is_lower_flag)                           -- 118	v
			Result.extend (is_lower_flag)                           -- 119	w
			Result.extend (is_lower_flag)                           -- 120	x
			Result.extend (is_lower_flag)                           -- 121	y
			Result.extend (is_lower_flag)                           -- 122	z
			Result.extend (is_punctuation_flag)                     -- 123	{
			Result.extend (is_punctuation_flag)                     -- 124	|
			Result.extend (is_punctuation_flag)                     -- 125	}
			Result.extend (is_punctuation_flag)                     -- 126	~
			Result.extend (is_control_flag)                         -- 127	DEL
			Result.fill_with (0, 128, 255)							-- extended ASCII
		ensure
			internal_character_types_not_void: Result /= Void
		end

	is_upper_flag: NATURAL_8 = 0x01

	is_lower_flag: NATURAL_8 = 0x02

	is_digit_flag: NATURAL_8 = 0x04

	is_white_space_flag: NATURAL_8 = 0x08

	is_punctuation_flag: NATURAL_8 = 0x10

	is_control_flag: NATURAL_8 = 0x20

	is_hexa_digit_flag: NATURAL_8 = 0x40

	is_space_flag: NATURAL_8 = 0x80;

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
