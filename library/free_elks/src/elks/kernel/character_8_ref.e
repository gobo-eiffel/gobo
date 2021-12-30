note
	description: "References to objects containing a character value"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2020-07-03 18:42:10 +0000 (Fri, 03 Jul 2020) $"
	revision: "$Revision: 104530 $"

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

	minus alias "-" alias "−" (decr: INTEGER): CHARACTER_8
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
			-- Uppercase value of `item'.
			-- Returns `item' if not `is_lower'.
			-- Caveat: not all upper-case values fit into `CHARACTER_8`. Use `CHARACTER_32` instead.
		do
			Result := upper_value [natural_32_code.as_integer_32]
		end

	as_lower, lower: CHARACTER_8
			-- Lowercase value of `item'
			-- Returns `item' if not `is_upper'
		do
			Result := lower_value [natural_32_code.as_integer_32]
		end

	to_hexa_digit: NATURAL_8
			-- Convert a hexadecimal unicode digit character to the corresponding numeric value.
		require
			is_hexa_digit
		local
			mask: NATURAL_8
		do
				-- Mask out numbers.
			Result := natural_32_code.to_natural_8 & 0x4F
				-- Convert hexadecimal digits.
			mask := ((Result |<< 1).to_integer_8 |>> 7).to_natural_8
			Result := (Result & mask.bit_not) | ((Result - 55) & mask)
		ensure
			range: 0 <= Result and Result < 16
			value: ("0123456789ABCDEF") [Result + 1] = as_upper
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
			Result.extend (is_control_flag | is_white_space_flag)   -- 28	file separator
			Result.extend (is_control_flag | is_white_space_flag)   -- 29	group separator
			Result.extend (is_control_flag | is_white_space_flag)   -- 30	record separator
			Result.extend (is_control_flag | is_white_space_flag)   -- 31	unit separator
			Result.extend (is_space_flag   | is_white_space_flag)   -- 32	Space
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
			Result.extend (is_control_flag)                         -- 128	
			Result.extend (is_control_flag)                         -- 129	
			Result.extend (is_control_flag)                         -- 130	
			Result.extend (is_control_flag)                         -- 131	
			Result.extend (is_control_flag)                         -- 132	
			Result.extend (is_control_flag | is_space_flag | is_white_space_flag) -- 133	
			Result.extend (is_control_flag)                         -- 134	
			Result.extend (is_control_flag)                         -- 135	
			Result.extend (is_control_flag)                         -- 136	
			Result.extend (is_control_flag)                         -- 137	
			Result.extend (is_control_flag)                         -- 138	
			Result.extend (is_control_flag)                         -- 139	
			Result.extend (is_control_flag)                         -- 140	
			Result.extend (is_control_flag)                         -- 141	
			Result.extend (is_control_flag)                         -- 142	
			Result.extend (is_control_flag)                         -- 143	
			Result.extend (is_control_flag)                         -- 144	
			Result.extend (is_control_flag)                         -- 145	
			Result.extend (is_control_flag)                         -- 146	
			Result.extend (is_control_flag)                         -- 147	
			Result.extend (is_control_flag)                         -- 148	
			Result.extend (is_control_flag)                         -- 149	
			Result.extend (is_control_flag)                         -- 150	
			Result.extend (is_control_flag)                         -- 151	
			Result.extend (is_control_flag)                         -- 152	
			Result.extend (is_control_flag)                         -- 153	
			Result.extend (is_control_flag)                         -- 154	
			Result.extend (is_control_flag)                         -- 155	
			Result.extend (is_control_flag)                         -- 156	
			Result.extend (is_control_flag)                         -- 157	
			Result.extend (is_control_flag)                         -- 158	
			Result.extend (is_control_flag)                         -- 159	
			Result.extend (is_space_flag | is_white_space_flag)     -- 160
			Result.extend (is_punctuation_flag)                     -- 161	¡
			Result.extend (0)                         -- 162	¢
			Result.extend (0)                         -- 163	£
			Result.extend (0)                         -- 164	¤
			Result.extend (0)                         -- 165	¥
			Result.extend (0)                         -- 166	¦
			Result.extend (is_punctuation_flag)       -- 167	§
			Result.extend (0)                         -- 168	¨
			Result.extend (0)                         -- 169	©
			Result.extend (0)                         -- 170	ª
			Result.extend (is_punctuation_flag)       -- 171	«
			Result.extend (0)                         -- 172	¬
			Result.extend (0)                         -- 173	­
			Result.extend (0)                         -- 174	®
			Result.extend (0)                         -- 175	¯
			Result.extend (0)                         -- 176	°
			Result.extend (0)                         -- 177	±
			Result.extend (0)                         -- 178	²
			Result.extend (0)                         -- 179	³
			Result.extend (0)                         -- 180	´
			Result.extend (is_lower_flag)             -- 181	µ
			Result.extend (is_punctuation_flag)       -- 182	¶
			Result.extend (is_punctuation_flag)       -- 183	·
			Result.extend (0)                         -- 184	¸
			Result.extend (0)                         -- 185	¹
			Result.extend (0)                         -- 186	º
			Result.extend (is_punctuation_flag)       -- 187	»
			Result.extend (0)                         -- 188	¼
			Result.extend (0)                         -- 189	½
			Result.extend (0)                         -- 190	¾
			Result.extend (is_punctuation_flag)       -- 191	¿
			Result.extend (is_upper_flag)             -- 192	À
			Result.extend (is_upper_flag)             -- 193	Á
			Result.extend (is_upper_flag)             -- 194	Â
			Result.extend (is_upper_flag)             -- 195	Ã
			Result.extend (is_upper_flag)             -- 196	Ä
			Result.extend (is_upper_flag)             -- 197	Å
			Result.extend (is_upper_flag)             -- 198	Æ
			Result.extend (is_upper_flag)             -- 199	Ç
			Result.extend (is_upper_flag)             -- 200	È
			Result.extend (is_upper_flag)             -- 201	É
			Result.extend (is_upper_flag)             -- 202	Ê
			Result.extend (is_upper_flag)             -- 203	Ë
			Result.extend (is_upper_flag)             -- 204	Ì
			Result.extend (is_upper_flag)             -- 205	Í
			Result.extend (is_upper_flag)             -- 206	Î
			Result.extend (is_upper_flag)             -- 207	Ï
			Result.extend (is_upper_flag)             -- 208	Ð
			Result.extend (is_upper_flag)             -- 209	Ñ
			Result.extend (is_upper_flag)             -- 210	Ò
			Result.extend (is_upper_flag)             -- 211	Ó
			Result.extend (is_upper_flag)             -- 212	Ô
			Result.extend (is_upper_flag)             -- 213	Õ
			Result.extend (is_upper_flag)             -- 214	Ö
			Result.extend (0)                         -- 215	×
			Result.extend (is_upper_flag)             -- 216	Ø
			Result.extend (is_upper_flag)             -- 217	Ù
			Result.extend (is_upper_flag)             -- 218	Ú
			Result.extend (is_upper_flag)             -- 219	Û
			Result.extend (is_upper_flag)             -- 220	Ü
			Result.extend (is_upper_flag)             -- 221	Ý
			Result.extend (is_upper_flag)             -- 222	Þ
			Result.extend (is_lower_flag)             -- 223	ß
			Result.extend (is_lower_flag)             -- 224	à
			Result.extend (is_lower_flag)             -- 225	á
			Result.extend (is_lower_flag)             -- 226	â
			Result.extend (is_lower_flag)             -- 227	ã
			Result.extend (is_lower_flag)             -- 228	ä
			Result.extend (is_lower_flag)             -- 229	å
			Result.extend (is_lower_flag)             -- 230	æ
			Result.extend (is_lower_flag)             -- 231	ç
			Result.extend (is_lower_flag)             -- 232	è
			Result.extend (is_lower_flag)             -- 233	é
			Result.extend (is_lower_flag)             -- 234	ê
			Result.extend (is_lower_flag)             -- 235	ë
			Result.extend (is_lower_flag)             -- 236	ì
			Result.extend (is_lower_flag)             -- 237	í
			Result.extend (is_lower_flag)             -- 238	î
			Result.extend (is_lower_flag)             -- 239	ï
			Result.extend (is_lower_flag)             -- 240	ð
			Result.extend (is_lower_flag)             -- 241	ñ
			Result.extend (is_lower_flag)             -- 242	ò
			Result.extend (is_lower_flag)             -- 243	ó
			Result.extend (is_lower_flag)             -- 244	ô
			Result.extend (is_lower_flag)             -- 245	õ
			Result.extend (is_lower_flag)             -- 246	ö
			Result.extend (0)                         -- 247	÷
			Result.extend (is_lower_flag)             -- 248	ø
			Result.extend (is_lower_flag)             -- 249	ù
			Result.extend (is_lower_flag)             -- 250	ú
			Result.extend (is_lower_flag)             -- 251	û
			Result.extend (is_lower_flag)             -- 252	ü
			Result.extend (is_lower_flag)             -- 253	ý
			Result.extend (is_lower_flag)             -- 254	þ
			Result.extend (is_lower_flag)             -- 255	ÿ
		ensure
			internal_character_types_not_void: Result /= Void
		end

	lower_value: SPECIAL [CHARACTER_8]
			-- Lower value indexed by code point.
		once
			Result :=
				("%/0c000/%/0c001/%/0c002/%/0c003/%/0c004/%/0c005/%/0c006/%/0c007/%/0c010/%/0c011/%/0c012/%/0c013/%/0c014/%/0c015/%/0c016/%/0c017/%
				%%/0c020/%/0c021/%/0c022/%/0c023/%/0c024/%/0c025/%/0c026/%/0c027/%/0c030/%/0c031/%/0c032/%/0c033/%/0c034/%/0c035/%/0c036/%/0c037/%
				% !%"#$%%&'()*+,-./0123456789:;<=>?%
				%@abcdefghijklmnopqrstuvwxyz[\]^_%
				%`abcdefghijklmnopqrstuvwxyz{|}~%/0c177/%
				%%/0c200/%/0c201/%/0c202/%/0c203/%/0c204/%/0c205/%/0c206/%/0c207/%/0c210/%/0c211/%/0c212/%/0c213/%/0c214/%/0c215/%/0c216/%/0c217/%
				%%/0c220/%/0c221/%/0c222/%/0c223/%/0c224/%/0c225/%/0c226/%/0c227/%/0c230/%/0c231/%/0c232/%/0c233/%/0c234/%/0c235/%/0c236/%/0c237/%
				%%/0c240/%/0c241/%/0c242/%/0c243/%/0c244/%/0c245/%/0c246/%/0c247/%/0c250/%/0c251/%/0c252/%/0c253/%/0c254/%/0c255/%/0c256/%/0c257/%
				%%/0c260/%/0c261/%/0c262/%/0c263/%/0c264/%/0c265/%/0c266/%/0c267/%/0c270/%/0c271/%/0c272/%/0c273/%/0c274/%/0c275/%/0c276/%/0c277/%
				%%/0c340/%/0c341/%/0c342/%/0c343/%/0c344/%/0c345/%/0c346/%/0c347/%/0c350/%/0c351/%/0c352/%/0c353/%/0c354/%/0c355/%/0c356/%/0c357/%
				%%/0c360/%/0c361/%/0c362/%/0c363/%/0c364/%/0c365/%/0c366/%/0c327/%/0c370/%/0c371/%/0c372/%/0c373/%/0c374/%/0c375/%/0c376/%/0c337/%
				%%/0c340/%/0c341/%/0c342/%/0c343/%/0c344/%/0c345/%/0c346/%/0c347/%/0c350/%/0c351/%/0c352/%/0c353/%/0c354/%/0c355/%/0c356/%/0c357/%
				%%/0c360/%/0c361/%/0c362/%/0c363/%/0c364/%/0c365/%/0c366/%/0c367/%/0c370/%/0c371/%/0c372/%/0c373/%/0c374/%/0c375/%/0c376/%/0c377/").area
		end

	upper_value: SPECIAL [CHARACTER_8]
			-- Upper value indexed by code point.
		once
			Result :=
				("%/0c000/%/0c001/%/0c002/%/0c003/%/0c004/%/0c005/%/0c006/%/0c007/%/0c010/%/0c011/%/0c012/%/0c013/%/0c014/%/0c015/%/0c016/%/0c017/%
				%%/0c020/%/0c021/%/0c022/%/0c023/%/0c024/%/0c025/%/0c026/%/0c027/%/0c030/%/0c031/%/0c032/%/0c033/%/0c034/%/0c035/%/0c036/%/0c037/%
				% !%"#$%%&'()*+,-./0123456789:;<=>?%
				%@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_%
				%`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~%/0c177/%
				%%/0c200/%/0c201/%/0c202/%/0c203/%/0c204/%/0c205/%/0c206/%/0c207/%/0c210/%/0c211/%/0c212/%/0c213/%/0c214/%/0c215/%/0c216/%/0c217/%
				%%/0c220/%/0c221/%/0c222/%/0c223/%/0c224/%/0c225/%/0c226/%/0c227/%/0c230/%/0c231/%/0c232/%/0c233/%/0c234/%/0c235/%/0c236/%/0c237/%
				%%/0c240/%/0c241/%/0c242/%/0c243/%/0c244/%/0c245/%/0c246/%/0c247/%/0c250/%/0c251/%/0c252/%/0c253/%/0c254/%/0c255/%/0c256/%/0c257/%
				%%/0c260/%/0c261/%/0c262/%/0c263/%/0c264/%/0c265/%/0c266/%/0c267/%/0c270/%/0c271/%/0c272/%/0c273/%/0c274/%/0c275/%/0c276/%/0c277/%
				%%/0c300/%/0c301/%/0c302/%/0c303/%/0c304/%/0c305/%/0c306/%/0c307/%/0c310/%/0c311/%/0c312/%/0c313/%/0c314/%/0c315/%/0c316/%/0c317/%
				%%/0c320/%/0c321/%/0c322/%/0c323/%/0c324/%/0c325/%/0c326/%/0c327/%/0c330/%/0c331/%/0c332/%/0c333/%/0c334/%/0c335/%/0c336/%/0c337/%
				%%/0c300/%/0c301/%/0c302/%/0c303/%/0c304/%/0c305/%/0c306/%/0c307/%/0c310/%/0c311/%/0c312/%/0c313/%/0c314/%/0c315/%/0c316/%/0c317/%
				%%/0c320/%/0c321/%/0c322/%/0c323/%/0c324/%/0c325/%/0c326/%/0c367/%/0c330/%/0c331/%/0c332/%/0c333/%/0c334/%/0c335/%/0c336/%/0c377/").area
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
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
