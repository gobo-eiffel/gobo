note

	description:

		"Character codes"

	remark:

		"Character codes are declared as integer constants such as %
		% Lower_a_code: NATURAL_32 = 97 %
		%rather than once functions such as %
		% Lower_a_code: NATURAL_32 once Result := ({CHARACTER_32} 'a').natural_32_code end %
		%This is due to the fact that these character codes need to be %
		%integer constants in order to appear in multi-branch instructions."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_CHARACTER_CODES

feature -- Access

	Lower_a_code: NATURAL_32 = 97
			-- 'a'

	Lower_b_code: NATURAL_32 = 98
			-- 'b'

	Lower_c_code: NATURAL_32 = 99
			-- 'c'

	Lower_d_code: NATURAL_32 = 100
			-- 'd'

	Lower_e_code: NATURAL_32 = 101
			-- 'e'

	Lower_f_code: NATURAL_32 = 102
			-- 'f'

	Lower_g_code: NATURAL_32 = 103
			-- 'g'

	Lower_h_code: NATURAL_32 = 104
			-- 'h'

	Lower_i_code: NATURAL_32 = 105
			-- 'i'

	Lower_j_code: NATURAL_32 = 106
			-- 'j'

	Lower_k_code: NATURAL_32 = 107
			-- 'k'

	Lower_l_code: NATURAL_32 = 108
			-- 'l'

	Lower_m_code: NATURAL_32 = 109
			-- 'm'

	Lower_n_code: NATURAL_32 = 110
			-- 'n'

	Lower_o_code: NATURAL_32 = 111
			-- 'o'

	Lower_p_code: NATURAL_32 = 112
			-- 'p'

	Lower_q_code: NATURAL_32 = 113
			-- 'q'

	Lower_r_code: NATURAL_32 = 114
			-- 'r'

	Lower_s_code: NATURAL_32 = 115
			-- 's'

	Lower_t_code: NATURAL_32 = 116
			-- 't'

	Lower_u_code: NATURAL_32 = 117
			-- 'u'

	Lower_v_code: NATURAL_32 = 118
			-- 'v'

	Lower_w_code: NATURAL_32 = 119
			-- 'w'

	Lower_x_code: NATURAL_32 = 120
			-- 'x'

	Lower_y_code: NATURAL_32 = 121
			-- 'y'

	Lower_z_code: NATURAL_32 = 122
			-- 'z'

	Upper_a_code: NATURAL_32 = 65
			-- 'A'

	Upper_b_code: NATURAL_32 = 66
			-- 'B'

	Upper_c_code: NATURAL_32 = 67
			-- 'C'

	Upper_d_code: NATURAL_32 = 68
			-- 'D'

	Upper_e_code: NATURAL_32 = 69
			-- 'E'

	Upper_f_code: NATURAL_32 = 70
			-- 'F'

	Upper_g_code: NATURAL_32 = 71
			-- 'G'

	Upper_h_code: NATURAL_32 = 72
			-- 'H'

	Upper_i_code: NATURAL_32 = 73
			-- 'I'

	Upper_j_code: NATURAL_32 = 74
			-- 'J'

	Upper_k_code: NATURAL_32 = 75
			-- 'K'

	Upper_l_code: NATURAL_32 = 76
			-- 'L'

	Upper_m_code: NATURAL_32 = 77
			-- 'M'

	Upper_n_code: NATURAL_32 = 78
			-- 'N'

	Upper_o_code: NATURAL_32 = 79
			-- 'O'

	Upper_p_code: NATURAL_32 = 80
			-- 'P'

	Upper_q_code: NATURAL_32 = 81
			-- 'Q'

	Upper_r_code: NATURAL_32 = 82
			-- 'R'

	Upper_s_code: NATURAL_32 = 83
			-- 'S'

	Upper_t_code: NATURAL_32 = 84
			-- 'T'

	Upper_u_code: NATURAL_32 = 85
			-- 'U'

	Upper_v_code: NATURAL_32 = 86
			-- 'V'

	Upper_w_code: NATURAL_32 = 87
			-- 'W'

	Upper_x_code: NATURAL_32 = 88
			-- 'X'

	Upper_y_code: NATURAL_32 = 89
			-- 'Y'

	Upper_z_code: NATURAL_32 = 90
			-- 'Z'

	Case_diff: NATURAL_32 = 32
			-- ('a').natural_32_code - ('A').natural_32_code

	Zero_code: NATURAL_32 = 48
			-- '0'

	One_code: NATURAL_32 = 49
			-- '1'

	Two_code: NATURAL_32 = 50
			-- '2'

	Three_code: NATURAL_32 = 51
			-- '3'

	Four_code: NATURAL_32 = 52
			-- '4'

	Five_code: NATURAL_32 = 53
			-- '5'

	Six_code: NATURAL_32 = 54
			-- '6'

	Seven_code: NATURAL_32 = 55
			-- '7'

	Eight_code: NATURAL_32 = 56
			-- '8'

	Nine_code: NATURAL_32 = 57
			-- '9'

	Plus_code: NATURAL_32 = 43
			-- '+'

	Minus_code: NATURAL_32 = 45
			-- '-'

	Star_code: NATURAL_32 = 42
			-- '*'

	Slash_code: NATURAL_32 = 47
			-- '/'

	Backslash_code: NATURAL_32 = 92
			-- '\'

	Caret_code: NATURAL_32 = 94
			-- '^'

	Underscore_code: NATURAL_32 = 95
			-- '_'

	Backquote_code: NATURAL_32 = 96
			-- '`'

	Less_than_code: NATURAL_32 = 60
			-- '<'

	Greater_than_code: NATURAL_32 = 62
			-- '>'

	Equal_code: NATURAL_32 = 61
			-- '='

	Colon_code: NATURAL_32 = 58
			-- ':'

	Semicolon_code: NATURAL_32 = 59
			-- ';'

	Comma_code: NATURAL_32 = 44
			-- ','

	Dot_code: NATURAL_32 = 46
			-- '.'

	Dollar_code: NATURAL_32 = 36
			-- '$'

	Exclamation_code: NATURAL_32 = 33
			-- '!'

	Question_mark_code: NATURAL_32 = 63
			-- '?'

	Single_quote_code: NATURAL_32 = 39
			-- '%''

	Double_quote_code: NATURAL_32 = 34
			-- '%"'

	Left_parenthesis_code: NATURAL_32 = 40
			-- '('

	Right_parenthesis_code: NATURAL_32 = 41
			-- ')'

	Left_bracket_code: NATURAL_32 = 91
			-- '['

	Right_bracket_code: NATURAL_32 = 93
			-- ']'

	Left_brace_code: NATURAL_32 = 123
			-- '{'

	Right_brace_code: NATURAL_32 = 125
			-- '}'

	Pound_code: NATURAL_32 = 35
			-- '#'

	At_code: NATURAL_32 = 64
			-- '@'

	Bar_code: NATURAL_32 = 124
			-- '|'

	Tilde_code: NATURAL_32 = 126
			-- '~'

	Space_code: NATURAL_32 = 32
			-- ' '

	Tabulation_code: NATURAL_32 = 9
			-- '%T'

	New_line_code: NATURAL_32 = 10
			-- '%N'

	Carriage_return_code: NATURAL_32 = 13
			-- '%R'

	Form_feed_code: NATURAL_32 = 12
			-- '%F'

	Back_space_code: NATURAL_32 = 8
			-- '%B'

	Esc_code: NATURAL_32 = 27
			-- Escape

	Bel_code: NATURAL_32 = 7
			-- Bel

invariant

	-- lower_a_code_definition: lower_a_code = ({CHARACTER_32} 'a').natural_32_code
	-- Same thing for all other codes.
	-- (see "remark" in note clause.)

end
