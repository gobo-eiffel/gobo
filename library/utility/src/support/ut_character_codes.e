note

	description:

		"Character codes"

	remark:

		"Character codes are declared as integer constants such as %
		% Lower_a_code: INTEGER = 97 %
		%rather than once functions such as %
		% Lower_a_code once Result := ('a').code end %
		%This is due to the fact that these character codes need to be %
		%integer constants in order to appear in multi-branch instructions."

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CHARACTER_CODES

feature -- Access

	Lower_a_code: INTEGER = 97
			-- 'a'

	Lower_b_code: INTEGER = 98
			-- 'b'

	Lower_c_code: INTEGER = 99
			-- 'c'

	Lower_d_code: INTEGER = 100
			-- 'd'

	Lower_e_code: INTEGER = 101
			-- 'e'

	Lower_f_code: INTEGER = 102
			-- 'f'

	Lower_g_code: INTEGER = 103
			-- 'g'

	Lower_h_code: INTEGER = 104
			-- 'h'

	Lower_i_code: INTEGER = 105
			-- 'i'

	Lower_j_code: INTEGER = 106
			-- 'j'

	Lower_k_code: INTEGER = 107
			-- 'k'

	Lower_l_code: INTEGER = 108
			-- 'l'

	Lower_m_code: INTEGER = 109
			-- 'm'

	Lower_n_code: INTEGER = 110
			-- 'n'

	Lower_o_code: INTEGER = 111
			-- 'o'

	Lower_p_code: INTEGER = 112
			-- 'p'

	Lower_q_code: INTEGER = 113
			-- 'q'

	Lower_r_code: INTEGER = 114
			-- 'r'

	Lower_s_code: INTEGER = 115
			-- 's'

	Lower_t_code: INTEGER = 116
			-- 't'

	Lower_u_code: INTEGER = 117
			-- 'u'

	Lower_v_code: INTEGER = 118
			-- 'v'

	Lower_w_code: INTEGER = 119
			-- 'w'

	Lower_x_code: INTEGER = 120
			-- 'x'

	Lower_y_code: INTEGER = 121
			-- 'y'

	Lower_z_code: INTEGER = 122
			-- 'z'

	Upper_a_code: INTEGER = 65
			-- 'A'

	Upper_b_code: INTEGER = 66
			-- 'B'

	Upper_c_code: INTEGER = 67
			-- 'C'

	Upper_d_code: INTEGER = 68
			-- 'D'

	Upper_e_code: INTEGER = 69
			-- 'E'

	Upper_f_code: INTEGER = 70
			-- 'F'

	Upper_g_code: INTEGER = 71
			-- 'G'

	Upper_h_code: INTEGER = 72
			-- 'H'

	Upper_i_code: INTEGER = 73
			-- 'I'

	Upper_j_code: INTEGER = 74
			-- 'J'

	Upper_k_code: INTEGER = 75
			-- 'K'

	Upper_l_code: INTEGER = 76
			-- 'L'

	Upper_m_code: INTEGER = 77
			-- 'M'

	Upper_n_code: INTEGER = 78
			-- 'N'

	Upper_o_code: INTEGER = 79
			-- 'O'

	Upper_p_code: INTEGER = 80
			-- 'P'

	Upper_q_code: INTEGER = 81
			-- 'Q'

	Upper_r_code: INTEGER = 82
			-- 'R'

	Upper_s_code: INTEGER = 83
			-- 'S'

	Upper_t_code: INTEGER = 84
			-- 'T'

	Upper_u_code: INTEGER = 85
			-- 'U'

	Upper_v_code: INTEGER = 86
			-- 'V'

	Upper_w_code: INTEGER = 87
			-- 'W'

	Upper_x_code: INTEGER = 88
			-- 'X'

	Upper_y_code: INTEGER = 89
			-- 'Y'

	Upper_z_code: INTEGER = 90
			-- 'Z'

	Case_diff: INTEGER = 32
			-- ('a').code - ('A').code

	Zero_code: INTEGER = 48
			-- '0'

	One_code: INTEGER = 49
			-- '1'

	Two_code: INTEGER = 50
			-- '2'

	Three_code: INTEGER = 51
			-- '3'

	Four_code: INTEGER = 52
			-- '4'

	Five_code: INTEGER = 53
			-- '5'

	Six_code: INTEGER = 54
			-- '6'

	Seven_code: INTEGER = 55
			-- '7'

	Eight_code: INTEGER = 56
			-- '8'

	Nine_code: INTEGER = 57
			-- '9'

	Plus_code: INTEGER = 43
			-- '+'

	Minus_code: INTEGER = 45
			-- '-'

	Star_code: INTEGER = 42
			-- '*'

	Slash_code: INTEGER = 47
			-- '/'

	Backslash_code: INTEGER = 92
			-- '\'

	Caret_code: INTEGER = 94
			-- '^'

	Underscore_code: INTEGER = 95
			-- '_'

	Backquote_code: INTEGER = 96
			-- '`'

	Less_than_code: INTEGER = 60
			-- '<'

	Greater_than_code: INTEGER = 62
			-- '>'

	Equal_code: INTEGER = 61
			-- '='

	Colon_code: INTEGER = 58
			-- ':'

	Semicolon_code: INTEGER = 59
			-- ';'

	Comma_code: INTEGER = 44
			-- ','

	Dot_code: INTEGER = 46
			-- '.'

	Dollar_code: INTEGER = 36
			-- '$'

	Exclamation_code: INTEGER = 33
			-- '!'

	Question_mark_code: INTEGER = 63
			-- '?'

	Single_quote_code: INTEGER = 39
			-- '%''

	Double_quote_code: INTEGER = 34
			-- '%"'

	Left_parenthesis_code: INTEGER = 40
			-- '('

	Right_parenthesis_code: INTEGER = 41
			-- ')'

	Left_bracket_code: INTEGER = 91
			-- '['

	Right_bracket_code: INTEGER = 93
			-- ']'

	Left_brace_code: INTEGER = 123
			-- '{'

	Right_brace_code: INTEGER = 125
			-- '}'

	Pound_code: INTEGER = 35
			-- '#'

	At_code: INTEGER = 64
			-- '@'

	Bar_code: INTEGER = 124
			-- '|'

	Tilde_code: INTEGER = 126
			-- '~'

	Space_code: INTEGER = 32
			-- ' '

	Tabulation_code: INTEGER = 9
			-- '%T'

	New_line_code: INTEGER = 10
			-- '%N'

	Carriage_return_code: INTEGER = 13
			-- '%R'

	Form_feed_code: INTEGER = 12
			-- '%F'

	Back_space_code: INTEGER = 8
			-- '%B'

invariant

	-- lower_a_code_definition: lower_a_code = ('a').code
	-- Same thing for all other codes.
	-- (see "remark" in note clause.)

end
