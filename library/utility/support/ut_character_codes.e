indexing

	description:

		"Character codes"

	note:
		"Character codes are declared as integer constants such as %
		%    Lower_a_code: INTEGER is 97 %
		%rather than once functions such as %
		%    Lower_a_code is once Result := ('a').code end %
		%This is due to the fact that these character codes need to be%
		%integer constants in order to appear in multi-branch instructions."

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_CHARACTER_CODES

feature -- Access

	Lower_a_code: INTEGER is 97					-- 'a'
	Lower_b_code: INTEGER is 98					-- 'b'
	Lower_c_code: INTEGER is 99					-- 'c'
	Lower_d_code: INTEGER is 100				-- 'd'
	Lower_e_code: INTEGER is 101				-- 'e'
	Lower_f_code: INTEGER is 102				-- 'f'
	Lower_g_code: INTEGER is 103				-- 'g'
	Lower_h_code: INTEGER is 104				-- 'h'
	Lower_i_code: INTEGER is 105				-- 'i'
	Lower_j_code: INTEGER is 106				-- 'j'
	Lower_k_code: INTEGER is 107				-- 'k'
	Lower_l_code: INTEGER is 108				-- 'l'
	Lower_m_code: INTEGER is 109				-- 'm'
	Lower_n_code: INTEGER is 110				-- 'n'
	Lower_o_code: INTEGER is 111				-- 'o'
	Lower_p_code: INTEGER is 112				-- 'p'
	Lower_q_code: INTEGER is 113				-- 'q'
	Lower_r_code: INTEGER is 114				-- 'r'
	Lower_s_code: INTEGER is 115				-- 's'
	Lower_t_code: INTEGER is 116				-- 't'
	Lower_u_code: INTEGER is 117				-- 'u'
	Lower_v_code: INTEGER is 118				-- 'v'
	Lower_w_code: INTEGER is 119				-- 'w'
	Lower_x_code: INTEGER is 120				-- 'x'
	Lower_y_code: INTEGER is 121				-- 'y'
	Lower_z_code: INTEGER is 122				-- 'z'

	Upper_a_code: INTEGER is 65					-- 'A'
	Upper_b_code: INTEGER is 66					-- 'B'
	Upper_c_code: INTEGER is 67					-- 'C'
	Upper_d_code: INTEGER is 68					-- 'D'
	Upper_e_code: INTEGER is 69					-- 'E'
	Upper_f_code: INTEGER is 70					-- 'F'
	Upper_g_code: INTEGER is 71					-- 'G'
	Upper_h_code: INTEGER is 72					-- 'H'
	Upper_i_code: INTEGER is 73					-- 'I'
	Upper_j_code: INTEGER is 74					-- 'J'
	Upper_k_code: INTEGER is 75					-- 'K'
	Upper_l_code: INTEGER is 76					-- 'L'
	Upper_m_code: INTEGER is 77					-- 'M'
	Upper_n_code: INTEGER is 78					-- 'N'
	Upper_o_code: INTEGER is 79					-- 'O'
	Upper_p_code: INTEGER is 80					-- 'P'
	Upper_q_code: INTEGER is 81					-- 'Q'
	Upper_r_code: INTEGER is 82					-- 'R'
	Upper_s_code: INTEGER is 83					-- 'S'
	Upper_t_code: INTEGER is 84					-- 'T'
	Upper_u_code: INTEGER is 85					-- 'U'
	Upper_v_code: INTEGER is 86					-- 'V'
	Upper_w_code: INTEGER is 87					-- 'W'
	Upper_x_code: INTEGER is 88					-- 'X'
	Upper_y_code: INTEGER is 89					-- 'Y'
	Upper_z_code: INTEGER is 90					-- 'Z'

	Case_diff: INTEGER is 32					-- ('a').code - ('A').code

	Zero_code: INTEGER is 48					-- '0'
	One_code: INTEGER is 49						-- '1'
	Two_code: INTEGER is 50						-- '2'
	Three_code: INTEGER is 51					-- '3'
	Four_code: INTEGER is 52					-- '4'
	Five_code: INTEGER is 53					-- '5'
	Six_code: INTEGER is 54						-- '6'
	Seven_code: INTEGER is 55					-- '7'
	Eight_code: INTEGER is 56					-- '8'
	Nine_code: INTEGER is 57					-- '9'

	Plus_code: INTEGER is 43					-- '+'
	Minus_code: INTEGER is 45					-- '-'
	Star_code: INTEGER is 42					-- '*'
	Slash_code: INTEGER is 47					-- '/'
	Caret_code: INTEGER is 94					-- '^'
	Less_than_code: INTEGER is 60				-- '<'
	Greater_than_code: INTEGER is 62			-- '>'
	Equal_code: INTEGER is 61					-- '='
	Colon_code: INTEGER is 58					-- ':'
	Semicolon_code: INTEGER is 59				-- ';'
	Comma_code: INTEGER is 44					-- ','
	Dot_code: INTEGER is 46						-- '.'
	Dollar_code: INTEGER is 36					-- '$'
	Exclamation_code: INTEGER is 33				-- '!'
	Question_mark_code: INTEGER is 63			-- '?'
	Single_quote_code: INTEGER is 39			-- '%''
	Double_quote_code: INTEGER is 34			-- '%"'
	Left_parenthesis_code: INTEGER is 40		-- '('
	Right_parenthesis_code: INTEGER is 41		-- ')'
	Left_bracket_code: INTEGER is 91			-- '['
	Right_bracket_code: INTEGER is 93			-- ']'
	Left_brace_code: INTEGER is 123				-- '{'
	Right_brace_code: INTEGER is 125			-- '}'
	Bar_code: INTEGER is 124					-- '|'

	Space_code: INTEGER is 32					-- ' '
	Tabulation_code: INTEGER is 9				-- '%T'
	New_line_code: INTEGER is 10				-- '%N'
	Carriage_return_code: INTEGER is 13			-- '%R'
	Form_feed_code: INTEGER is 12				-- '%F'
	Back_space_code: INTEGER is 8				-- '%B'

invariant

	-- lower_a_code_definition: lower_a_code = ('a').code
	-- Same thing for all other codes.
	-- (see "note" in indexing clause.)

end -- class UT_CHARACTER_CODES
