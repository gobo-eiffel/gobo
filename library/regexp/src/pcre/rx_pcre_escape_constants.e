note

	description:

		"PCRE escape character constants"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2019, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_ESCAPE_CONSTANTS

inherit

	ANY

	UT_CHARACTER_32_CODES
		export {NONE} all end

feature -- Access

	escape_character (a_code: NATURAL_32): INTEGER_64
			-- Code of escape character for character with code `a_code';
			-- Return 0 if not escaped.
		require
			a_code_positive: a_code >= 0
		do
			inspect a_code
			when Colon_code then
				Result := Colon_code.to_integer_64
			when Semicolon_code then
				Result := Semicolon_code.to_integer_64
			when Less_than_code then
				Result := Less_than_code.to_integer_64
			when Equal_code then
				Result := Equal_code.to_integer_64
			when Greater_than_code then
				Result := Greater_than_code.to_integer_64
			when Question_mark_code then
				Result := Question_mark_code.to_integer_64
			when At_code then
				Result := At_code.to_integer_64
			when Upper_a_code then
				Result := -esc_uca
			when Upper_b_code then
				Result := -esc_ucb
			when Upper_d_code then
				Result := -esc_ucd
			when Upper_s_code then
				Result := -esc_ucs
			when Upper_w_code then
				Result := -esc_ucw
			when Upper_z_code then
				Result := -esc_ucz
			when Left_bracket_code then
				Result := Left_bracket_code.to_integer_64
			when Backslash_code then
				Result := Backslash_code.to_integer_64
			when Right_bracket_code then
				Result := Right_bracket_code.to_integer_64
			when Caret_code then
				Result := Caret_code.to_integer_64
			when Underscore_code then
				Result := Underscore_code.to_integer_64
			when Backquote_code then
				Result := Backquote_code.to_integer_64
			when Lower_a_code then
				Result := Bel_code.to_integer_64
			when Lower_b_code then
				Result := -esc_lcb
			when Lower_d_code then
				Result := -esc_lcd
			when Lower_e_code then
				Result := Esc_code.to_integer_64
			when Lower_f_code then
				Result := Form_feed_code.to_integer_64
			when Lower_n_code then
				Result := New_line_code.to_integer_64
			when Lower_r_code then
				Result := Carriage_return_code.to_integer_64
			when Lower_s_code then
				Result := -esc_lcs
			when Lower_t_code then
				Result := Tabulation_code.to_integer_64
			when Lower_w_code then
				Result := -esc_lcw
			when Lower_z_code then
				Result := -esc_lcz
			else
				Result := 0
			end
		ensure
			instance_free: class
			natural_32_if_not_negative: Result >= 0 implies Result <= {NATURAL_32}.max_value
		end

feature -- Constants

	esc_uca: INTEGER_64 = 1

	esc_ucb: INTEGER_64 = 2

	esc_lcb: INTEGER_64 = 3

	esc_ucd: INTEGER_64 = 4

	esc_lcd: INTEGER_64 = 5

	esc_ucs: INTEGER_64 = 6

	esc_lcs: INTEGER_64 = 7

	esc_ucw: INTEGER_64 = 8

	esc_lcw: INTEGER_64 = 9

	esc_ucz: INTEGER_64 = 10

	esc_lcz: INTEGER_64 = 11

	esc_ref: INTEGER_64 = 12

end
