note
	description: "[
		The ASCII character set.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	ASCII

feature -- Access

	Character_set_size: INTEGER = 128
	Last_ascii: INTEGER = 127
	First_printable: INTEGER = 32
	Last_printable: INTEGER = 126
	Letter_layout: INTEGER = 70
	Case_diff: INTEGER = 32
			-- `Lower_a' - `Upper_a'

	Buf_overflow: INTEGER = - 9
	Overflow: INTEGER = - 8
	Break: INTEGER = - 7
	Home_arrow: INTEGER = - 6
	Right_arrow: INTEGER = - 5
	Left_arrow: INTEGER = - 4
	Down_arrow: INTEGER = - 3
	Up_arrow: INTEGER = - 2
	Nul: INTEGER = 0
	Ctrl_a: INTEGER = 1 Soh: INTEGER = 1
	Ctrl_b: INTEGER = 2 Stx: INTEGER = 2
	Ctrl_c: INTEGER = 3 Etx: INTEGER = 3
	Ctrl_d: INTEGER = 4 Eot: INTEGER = 4
	Ctrl_e: INTEGER = 5 Enq: INTEGER = 5
	Ctrl_f: INTEGER = 6 Ack: INTEGER = 6
	Ctrl_g: INTEGER = 7 Bel: INTEGER = 7
	Ctrl_h: INTEGER = 8 Bs: INTEGER = 8 Back_space: INTEGER = 8
	Ctrl_i: INTEGER = 9 Ht: INTEGER = 9 Tabulation: INTEGER = 9
	Ctrl_j: INTEGER = 10 Nl: INTEGER = 10 Line_feed: INTEGER = 10
	Ctrl_k: INTEGER = 11 Vt: INTEGER = 11
	Ctrl_l: INTEGER = 12 Np: INTEGER = 12
	Ctrl_m: INTEGER = 13 Cr: INTEGER = 13 Carriage_return: INTEGER = 13
	Ctrl_n: INTEGER = 14 So: INTEGER = 14
	Ctrl_o: INTEGER = 15 Si: INTEGER = 15
	Ctrl_p: INTEGER = 16 Dle: INTEGER = 16
	Ctrl_q: INTEGER = 17 Dc1: INTEGER = 17
	Ctrl_r: INTEGER = 18 Dc2: INTEGER = 18
	Ctrl_s: INTEGER = 19 Dc3: INTEGER = 19
	Ctrl_t: INTEGER = 20 Dc4: INTEGER = 20
	Ctrl_u: INTEGER = 21 Nak: INTEGER = 21
	Ctrl_v: INTEGER = 22 Syn: INTEGER = 22
	Ctrl_w: INTEGER = 23 Etb: INTEGER = 23
	Ctrl_x: INTEGER = 24 Can: INTEGER = 24
	Ctrl_y: INTEGER = 25 Em: INTEGER = 25
	Ctrl_z: INTEGER = 26 Sub: INTEGER = 26
	Ctrl_lbracket: INTEGER = 27 Esc: INTEGER = 27
	Ctrl_backslash: INTEGER = 28 Fs: INTEGER = 28
	Ctrl_rbracket: INTEGER = 29 Gs: INTEGER = 29
	Ctrl_circumflex: INTEGER = 30 Rs: INTEGER = 30
	Ctrl_underlined: INTEGER = 31 Us: INTEGER = 31
	Blank: INTEGER = 32 Sp: INTEGER = 32
	Exclamation: INTEGER = 33
	Doublequote: INTEGER = 34
	Number_sign: INTEGER = 35
	Dollar: INTEGER = 36
	Percent: INTEGER = 37
	Ampersand: INTEGER = 38
	Singlequote: INTEGER = 39
	Lcurly: INTEGER = 40
	Rcurly: INTEGER = 41
	Star: INTEGER = 42
	Plus: INTEGER = 43
	Comma: INTEGER = 44
	Minus: INTEGER = 45
	Dot: INTEGER = 46
	Slash: INTEGER = 47
	Zero: INTEGER = 48
	One: INTEGER = 49
	Two: INTEGER = 50
	Three: INTEGER = 51
	Four: INTEGER = 52
	Five: INTEGER = 53
	Six: INTEGER = 54
	Seven: INTEGER = 55
	Eight: INTEGER = 56
	Nine: INTEGER = 57
	Colon: INTEGER = 58
	Semicolon: INTEGER = 59
	Lessthan: INTEGER = 60
	Equal_sign: INTEGER = 61
	Greaterthan: INTEGER = 62
	Questmark: INTEGER = 63
	Commercial_at: INTEGER = 64
	Upper_a: INTEGER = 65
	Upper_b: INTEGER = 66
	Upper_c: INTEGER = 67
	Upper_d: INTEGER = 68
	Upper_e: INTEGER = 69
	Upper_f: INTEGER = 70
	Upper_g: INTEGER = 71
	Upper_h: INTEGER = 72
	Upper_i: INTEGER = 73
	Upper_j: INTEGER = 74
	Upper_k: INTEGER = 75
	Upper_l: INTEGER = 76
	Upper_m: INTEGER = 77
	Upper_n: INTEGER = 78
	Upper_o: INTEGER = 79
	Upper_p: INTEGER = 80
	Upper_q: INTEGER = 81
	Upper_r: INTEGER = 82
	Upper_s: INTEGER = 83
	Upper_t: INTEGER = 84
	Upper_u: INTEGER = 85
	Upper_v: INTEGER = 86
	Upper_w: INTEGER = 87
	Upper_x: INTEGER = 88
	Upper_y: INTEGER = 89
	Upper_z: INTEGER = 90
	Lbracket: INTEGER = 91
	Backslash: INTEGER = 92
	Rbracket: INTEGER = 93
	Circumflex: INTEGER = 94
	Underlined: INTEGER = 95
	Grave_accent: INTEGER = 96
	Lower_a: INTEGER = 97
	Lower_b: INTEGER = 98
	Lower_c: INTEGER = 99
	Lower_d: INTEGER = 100
	Lower_e: INTEGER = 101
	Lower_f: INTEGER = 102
	Lower_g: INTEGER = 103
	Lower_h: INTEGER = 104
	Lower_i: INTEGER = 105
	Lower_j: INTEGER = 106
	Lower_k: INTEGER = 107
	Lower_l: INTEGER = 108
	Lower_m: INTEGER = 109
	Lower_n: INTEGER = 110
	Lower_o: INTEGER = 111
	Lower_p: INTEGER = 112
	Lower_q: INTEGER = 113
	Lower_r: INTEGER = 114
	Lower_s: INTEGER = 115
	Lower_t: INTEGER = 116
	Lower_u: INTEGER = 117
	Lower_v: INTEGER = 118
	Lower_w: INTEGER = 119
	Lower_x: INTEGER = 120
	Lower_y: INTEGER = 121
	Lower_z: INTEGER = 122
	Opening_brace: INTEGER = 123
	Bar: INTEGER = 124
	Closing_brace: INTEGER = 125
	Tilde: INTEGER = 126
	Ctrl_questmark: INTEGER = 127; Del: INTEGER = 127;

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
