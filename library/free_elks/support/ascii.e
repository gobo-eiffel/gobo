indexing

	description: "[
		The ASCII character set.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	ASCII

feature -- Access

	Character_set_size: INTEGER is 128
	Last_ascii: INTEGER is 127
	First_printable: INTEGER is 32
	Last_printable: INTEGER is 126
	Letter_layout: INTEGER is 70
	Case_diff: INTEGER is 32
			-- `Lower_a' - `Upper_a'

	Buf_overflow: INTEGER is - 9
	Overflow: INTEGER is - 8
	Break: INTEGER is - 7
	Home_arrow: INTEGER is - 6
	Right_arrow: INTEGER is - 5
	Left_arrow: INTEGER is - 4
	Down_arrow: INTEGER is - 3
	Up_arrow: INTEGER is - 2
	Nul: INTEGER is 0
	Ctrl_a: INTEGER is 1 Soh: INTEGER is 1
	Ctrl_b: INTEGER is 2 Stx: INTEGER is 2
	Ctrl_c: INTEGER is 3 Etx: INTEGER is 3
	Ctrl_d: INTEGER is 4 Eot: INTEGER is 4
	Ctrl_e: INTEGER is 5 Enq: INTEGER is 5
	Ctrl_f: INTEGER is 6 Ack: INTEGER is 6
	Ctrl_g: INTEGER is 7 Bel: INTEGER is 7
	Ctrl_h: INTEGER is 8 Bs: INTEGER is 8 Back_space: INTEGER is 8
	Ctrl_i: INTEGER is 9 Ht: INTEGER is 9 Tabulation: INTEGER is 9
	Ctrl_j: INTEGER is 10 Nl: INTEGER is 10 Line_feed: INTEGER is 10
	Ctrl_k: INTEGER is 11 Vt: INTEGER is 11
	Ctrl_l: INTEGER is 12 Np: INTEGER is 12
	Ctrl_m: INTEGER is 13 Cr: INTEGER is 13 Carriage_return: INTEGER is 13
	Ctrl_n: INTEGER is 14 So: INTEGER is 14
	Ctrl_o: INTEGER is 15 Si: INTEGER is 15
	Ctrl_p: INTEGER is 16 Dle: INTEGER is 16
	Ctrl_q: INTEGER is 17 Dc1: INTEGER is 17
	Ctrl_r: INTEGER is 18 Dc2: INTEGER is 18
	Ctrl_s: INTEGER is 19 Dc3: INTEGER is 19
	Ctrl_t: INTEGER is 20 Dc4: INTEGER is 20
	Ctrl_u: INTEGER is 21 Nak: INTEGER is 21
	Ctrl_v: INTEGER is 22 Syn: INTEGER is 22
	Ctrl_w: INTEGER is 23 Etb: INTEGER is 23
	Ctrl_x: INTEGER is 24 Can: INTEGER is 24
	Ctrl_y: INTEGER is 25 Em: INTEGER is 25
	Ctrl_z: INTEGER is 26 Sub: INTEGER is 26
	Ctrl_lbracket: INTEGER is 27 Esc: INTEGER is 27
	Ctrl_backslash: INTEGER is 28 Fs: INTEGER is 28
	Ctrl_rbracket: INTEGER is 29 Gs: INTEGER is 29
	Ctrl_circumflex: INTEGER is 30 Rs: INTEGER is 30
	Ctrl_underlined: INTEGER is 31 Us: INTEGER is 31
	Blank: INTEGER is 32 Sp: INTEGER is 32
	Exclamation: INTEGER is 33
	Doublequote: INTEGER is 34
	Number_sign: INTEGER is 35
	Dollar: INTEGER is 36
	Percent: INTEGER is 37
	Ampersand: INTEGER is 38
	Singlequote: INTEGER is 39
	Lcurly: INTEGER is 40
	Rcurly: INTEGER is 41
	Star: INTEGER is 42
	Plus: INTEGER is 43
	Comma: INTEGER is 44
	Minus: INTEGER is 45
	Dot: INTEGER is 46
	Slash: INTEGER is 47
	Zero: INTEGER is 48
	One: INTEGER is 49
	Two: INTEGER is 50
	Three: INTEGER is 51
	Four: INTEGER is 52
	Five: INTEGER is 53
	Six: INTEGER is 54
	Seven: INTEGER is 55
	Eight: INTEGER is 56
	Nine: INTEGER is 57
	Colon: INTEGER is 58
	Semicolon: INTEGER is 59
	Lessthan: INTEGER is 60
	Equal_sign: INTEGER is 61
	Greaterthan: INTEGER is 62
	Questmark: INTEGER is 63
	Commercial_at: INTEGER is 64
	Upper_a: INTEGER is 65
	Upper_b: INTEGER is 66
	Upper_c: INTEGER is 67
	Upper_d: INTEGER is 68
	Upper_e: INTEGER is 69
	Upper_f: INTEGER is 70
	Upper_g: INTEGER is 71
	Upper_h: INTEGER is 72
	Upper_i: INTEGER is 73
	Upper_j: INTEGER is 74
	Upper_k: INTEGER is 75
	Upper_l: INTEGER is 76
	Upper_m: INTEGER is 77
	Upper_n: INTEGER is 78
	Upper_o: INTEGER is 79
	Upper_p: INTEGER is 80
	Upper_q: INTEGER is 81
	Upper_r: INTEGER is 82
	Upper_s: INTEGER is 83
	Upper_t: INTEGER is 84
	Upper_u: INTEGER is 85
	Upper_v: INTEGER is 86
	Upper_w: INTEGER is 87
	Upper_x: INTEGER is 88
	Upper_y: INTEGER is 89
	Upper_z: INTEGER is 90
	Lbracket: INTEGER is 91
	Backslash: INTEGER is 92
	Rbracket: INTEGER is 93
	Circumflex: INTEGER is 94
	Underlined: INTEGER is 95
	Grave_accent: INTEGER is 96
	Lower_a: INTEGER is 97
	Lower_b: INTEGER is 98
	Lower_c: INTEGER is 99
	Lower_d: INTEGER is 100
	Lower_e: INTEGER is 101
	Lower_f: INTEGER is 102
	Lower_g: INTEGER is 103
	Lower_h: INTEGER is 104
	Lower_i: INTEGER is 105
	Lower_j: INTEGER is 106
	Lower_k: INTEGER is 107
	Lower_l: INTEGER is 108
	Lower_m: INTEGER is 109
	Lower_n: INTEGER is 110
	Lower_o: INTEGER is 111
	Lower_p: INTEGER is 112
	Lower_q: INTEGER is 113
	Lower_r: INTEGER is 114
	Lower_s: INTEGER is 115
	Lower_t: INTEGER is 116
	Lower_u: INTEGER is 117
	Lower_v: INTEGER is 118
	Lower_w: INTEGER is 119
	Lower_x: INTEGER is 120
	Lower_y: INTEGER is 121
	Lower_z: INTEGER is 122
	Opening_brace: INTEGER is 123
	Bar: INTEGER is 124
	Closing_brace: INTEGER is 125
	Tilde: INTEGER is 126
	Ctrl_questmark: INTEGER is 127; Del: INTEGER is 127;

end
