indexing

	description:

		"PCRE escape character constants"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_PCRE_ESCAPE_CONSTANTS

inherit

	ANY

	UT_CHARACTER_CODES
		export {NONE} all end

feature -- Access

	escape_character (a_code: INTEGER): INTEGER is
			-- Code of escape character for character with code `a_code';
			-- Return 0 if not escaped.
		require
			a_code_positive: a_code >= 0
		do
			inspect a_code
			when Colon_code then
				Result := Colon_code
			when Semicolon_code then
				Result := Semicolon_code
			when Less_than_code then
				Result := Less_than_code
			when Equal_code then
				Result := Equal_code
			when Greater_than_code then
				Result := Greater_than_code
			when Question_mark_code then
				Result := Question_mark_code
			when At_code then
				Result := At_code
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
				Result := Left_bracket_code
			when Backslash_code then
				Result := Backslash_code
			when Right_bracket_code then
				Result := Right_bracket_code
			when Caret_code then
				Result := Caret_code
			when Underscore_code then
				Result := Underscore_code
			when Backquote_code then
				Result := Backquote_code
			when Lower_a_code then
				Result := 7
			when Lower_b_code then
				Result := -esc_lcb
			when Lower_d_code then
				Result := -esc_lcd
			when Lower_e_code then
				Result := 27
			when Lower_f_code then
				Result := Form_feed_code
			when Lower_n_code then
				Result := New_line_code
			when Lower_r_code then
				Result := Carriage_return_code
			when Lower_s_code then
				Result := -esc_lcs
			when Lower_t_code then
				Result := Tabulation_code
			when Lower_w_code then
				Result := -esc_lcw
			when Lower_z_code then
				Result := -esc_lcz
			else
				Result := 0
			end
		end

feature -- Constants

	esc_uca: INTEGER is 1

	esc_ucb: INTEGER is 2

	esc_lcb: INTEGER is 3

	esc_ucd: INTEGER is 4

	esc_lcd: INTEGER is 5

	esc_ucs: INTEGER is 6

	esc_lcs: INTEGER is 7

	esc_ucw: INTEGER is 8

	esc_lcw: INTEGER is 9

	esc_ucz: INTEGER is 10

	esc_lcz: INTEGER is 11

	esc_ref: INTEGER is 12

end
