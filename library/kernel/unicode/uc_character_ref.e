indexing

	description:

	"Reference class for UC_CHARACTER";

	library:		"Gobo Eiffel Unicode Library"
	author:		"michael kretschmar <majkel.kretschmar@epost.de>"
	copyright:	"Copyright (c) 2001, michael kretschmar and others"
	license:		"Eiffel Forum License v1 (see forum.txt)"
	date:			"$Date$"
	revision:	"$Revision$"

class UC_CHARACTER_REF

inherit
	HASHABLE
		redefine
			out, is_equal
		end
	COMPARABLE
		redefine
			out, is_equal
		end
	UC_CONSTANTS
		redefine
	out, is_equal
		end

	KL_SHARED_PLATFORM
		undefine
			out, is_equal
		end

	KL_IMPORTED_INTEGER_ROUTINES
		undefine
			out, is_equal
		end

creation
	make_from_integer, make_from_character

feature

	make_from_integer (i: INTEGER) is
	-- Initialize from code `i'
		require
	valid_code: valid_code(i);
		do
	set_code(i)
		end

	make_from_character (c: CHARACTER) is
	-- create new ucchar from `c'
		do
	set_code(c.code)
		end

feature -- Access

	item : UC_CHARACTER is
	-- `UC_CHARACTER' value
		do
	!!Result
			Result.set_code(code)
		end

	code: INTEGER is
	-- Associated integer value
		do
	Result := i_code
		ensure
	valid_code: valid_code(i_code);
		end

	hash_code : INTEGER is
		do
	Result := code + 1
		end

feature -- Comparison

	infix "<" (other : like Current) : BOOLEAN is
	-- Is current ucchar less than `other' ?
		do
	Result := code < other.code
		end

	is_equal (other: like Current): BOOLEAN is
		do
	Result := Current = other or else code = other.code
		end

feature -- Element change

	set_item (c : UC_CHARACTER) is
	-- Make `c' the associated character value
		do
	i_code := c.code
		ensure
	item_set: item.is_equal(c);
		end

	set_code (c: INTEGER) is
		require
	valid_code: valid_code(c);
		do
	i_code := c
		end

feature -- Output

	out: STRING is
		do
	!!Result.make(0)
	if code <= Platform.Maximum_character_code then
		Result.append_character(as_character)
	else
		Result.append_string("\u")
		Result.append_string(as_hexadecimal)
		Result.append_character(';')
	end
		end

feature -- Conversion

	as_character: CHARACTER is
			-- Corresponding character representation
		require
			code_large_enough: code >= Platform.Minimum_character_code;
			code_small_enough: code <= Platform.Maximum_character_code;
		do
	Result := code_to_character(code)
		end

	as_hexadecimal: STRING is
			-- Hexadecimal representation of current character
		do
			Result := INTEGER_.to_hexadecimal (code, False)
		end

	to_upper is
	-- convert to upper case
		do
	set_item(ctype.to_upper(item))
		end

	to_lower is
	-- convert to lower case
		do
	set_item(ctype.to_lower(item))
		end

	to_title is
	-- convert to title case
		do
	set_item(ctype.to_title(item))
		end

	general_category: INTEGER is
	-- the unicode general category of `current'
		do
	Result := ctype.general_category(item)
		end

feature --

	valid_code (i: INTEGER): BOOLEAN is
	-- is `i' valid unicode-code?
		do
	Result := 0 <= i and i <= maximum_uc_character_code
		ensure
	Result = (0 <= i and i <= maximum_uc_character_code)
		end

	maximum_uc_character_code: INTEGER is
	-- maximal uc_character code
		once
	Result := 2_147_483_647
		end

feature {UC_CHARACTER_REF} -- Implementation

	i_code: INTEGER

	hex_representation (c: INTEGER): STRING is
	-- convert `c' into 4-digit hexadecimal string
		local
	cc, i: INTEGER
		do
	Result := clone ("1234")
	from
		i := 4
		cc := c
	until
		i < 1
	loop
		Result.put(hex_digit_string.item(cc\\16+1), i)
		cc := cc // 16;
		i := i - 1
	end
		end

	hex_digit_string: STRING is
		once
	Result := "0123456789abcdef"
		end

	ctype: UC_CTYPE is
			-- the unicode database, character types
		once
	!!Result
		end

	code_to_character (i: INTEGER): CHARACTER is
			-- convert code position `i' to `CHARACTER'
		do
	Result := INTEGER_.to_character (i)
		end

feature -- new features

	-- categories

	is_other: BOOLEAN is
	-- is this character an other? (category gc_other_*)
		do
	inspect ctype.general_category(item)
	when
		gc_other_control,
		gc_other_format,
		gc_other_surrogate,
		gc_other_private_use,
		gc_other_not_assigned
	then
		Result := true
	else
		Result := false
	end
		end

	is_punctuation: BOOLEAN is
	-- is character a punctuation? (Category gc_punctuation_*)
		do
	inspect ctype.general_category(item)
	when
		gc_punctuation_connector,
		gc_punctuation_dash,
		gc_punctuation_open,
		gc_punctuation_close,
		gc_punctuation_initial_quote,
		gc_punctuation_final_quote,
		gc_punctuation_other
	then
		Result := true
	else
		Result := false
	end
		end

	is_symbol: BOOLEAN is
	-- is character a symbol? (Category gc_symbol_*)
		do
	inspect ctype.general_category(item)
	when
		gc_symbol_math,
		gc_symbol_currency,
		gc_symbol_modifier,
		gc_symbol_other
	then
		Result := true
	else
		Result := false
	end
		end

	is_separator: BOOLEAN is
	-- is the character a sparator character? (Category
	-- gc_separator_*)
		do
	inspect ctype.general_category(item)
	when
		gc_separator_space,
		gc_separator_line,
		gc_separator_paragraph
	then
		Result := true
	else
		Result := false
	end
		end

	is_mark: BOOLEAN is
	-- is this character a mark ? (Category gc_mark_*)
		do
	inspect ctype.general_category(item)
	when
		gc_mark_nonspacing,
		gc_mark_space_combining,
		gc_mark_enclosing
	then
		Result := true
	else
		Result := false
	end
		end

	is_letter: BOOLEAN is
	-- is this character a letter? (Category gc_letter_*)
		do
	inspect ctype.general_category(item)
	when
		gc_letter_uppercase,
		gc_letter_lowercase,
		gc_letter_titlecase,
		gc_letter_modifier,
		gc_letter_other
	then
		Result := true
	else
		Result := false
	end
		end

	is_number: BOOLEAN is
	-- is this character a number (Category gc_number_*)
		do
	inspect ctype.general_category(item)
	when
		gc_number_decimal_digit,
		gc_number_letter,
		gc_number_other
	then
		Result := true
	else
		Result := false
	end
		end

--	digit_value: INTEGER
	-- returns the numeric value of the digit
	-- require: is a digit

--	is_mirrored: BOOLEAN
	-- is this character a mirrored character? (one that should
	-- be reversed if the text direction is reversed)

end
