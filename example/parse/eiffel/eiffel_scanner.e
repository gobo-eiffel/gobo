indexing

	description:

		"Scanners for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class EIFFEL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	EIFFEL_TOKENS
		export
			{NONE} all
		end

	ARGUMENTS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_SHARED_INTEGER_ROUTINES

	KL_SHARED_INPUT_STREAM_ROUTINES

	KL_SHARED_STRING_ROUTINES

	KL_SHARED_PLATFORM

	KL_SHARED_EXCEPTIONS

creation

	make

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 93 then
if yy_act <= 47 then
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 60
eif_lineno := eif_lineno + text_count
else
--|#line 61
;
end
else
--|#line 67
eif_lineno := eif_lineno + 1
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 68
;
else
--|#line 74
last_token := Plus_code
end
else
--|#line 75
last_token := Minus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 76
last_token := Star_code
else
--|#line 77
last_token := Slash_code
end
else
--|#line 78
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 79
last_token := E_DIV
else
--|#line 80
last_token := E_MOD
end
else
--|#line 81
last_token := Equal_code
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 82
last_token := E_NE
else
--|#line 83
last_token := Greater_than_code
end
else
--|#line 84
last_token := E_GE
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 85
last_token := Less_than_code
else
--|#line 86
last_token := E_LE
end
else
--|#line 87
last_token := Dot_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 88
last_token := Semicolon_code
else
--|#line 89
last_token := Comma_code
end
else
--|#line 90
last_token := Colon_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 91
last_token := Exclamation_code
else
--|#line 92
last_token := E_BANGBANG
end
else
--|#line 93
last_token := E_ARROW
end
end
end
end
else
if yy_act <= 36 then
if yy_act <= 30 then
if yy_act <= 27 then
if yy_act <= 26 then
if yy_act = 25 then
--|#line 94
last_token := E_DOTDOT
else
--|#line 95
last_token := Left_parenthesis_code
end
else
--|#line 96
last_token := Right_parenthesis_code
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 97
last_token := Left_bracket_code
else
--|#line 98
last_token := Right_bracket_code
end
else
--|#line 99
last_token := Left_brace_code
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 100
last_token := Right_brace_code
else
--|#line 101
last_token := E_LARRAY
end
else
--|#line 102
last_token := E_RARRAY
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 103
last_token := E_ASSIGN
else
--|#line 104
last_token := E_REVERSE
end
else
--|#line 105
last_token := Dollar_code
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 111
last_token := E_ALIAS
else
--|#line 112
last_token := E_ALL
end
else
--|#line 113
last_token := E_AND
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 114
last_token := E_AS
else
--|#line 115
last_token := E_CHECK
end
else
--|#line 116
last_token := E_CLASS
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 117
last_token := E_CREATION
else
--|#line 118
last_token := E_DEBUG
end
else
--|#line 119
last_token := E_DEFERRED
end
else
if yy_act = 46 then
--|#line 120
last_token := E_DO
else
--|#line 121
last_token := E_ELSE
end
end
end
end
end
else
if yy_act <= 70 then
if yy_act <= 59 then
if yy_act <= 53 then
if yy_act <= 50 then
if yy_act <= 49 then
if yy_act = 48 then
--|#line 122
last_token := E_ELSEIF
else
--|#line 123
last_token := E_END
end
else
--|#line 124
last_token := E_ENSURE
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 125
last_token := E_EXPANDED
else
--|#line 126
last_token := E_EXPORT
end
else
--|#line 127
last_token := E_EXTERNAL
end
end
else
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 128
last_token := E_FALSE
else
--|#line 129
last_token := E_FEATURE
end
else
--|#line 130
last_token := E_FROM
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 131
last_token := E_FROZEN
else
--|#line 132
last_token := E_IF
end
else
--|#line 133
last_token := E_IMPLIES
end
end
end
else
if yy_act <= 65 then
if yy_act <= 62 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 134
last_token := E_INDEXING
else
--|#line 135
last_token := E_INFIX
end
else
--|#line 136
last_token := E_INHERIT
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 137
last_token := E_INSPECT
else
--|#line 138
last_token := E_INVARIANT
end
else
--|#line 139
last_token := E_IS
end
end
else
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 140
last_token := E_LIKE
else
--|#line 141
last_token := E_LOCAL
end
else
--|#line 142
last_token := E_LOOP
end
else
if yy_act = 69 then
--|#line 143
last_token := E_NOT
else
--|#line 144
last_token := E_OBSOLETE
end
end
end
end
else
if yy_act <= 82 then
if yy_act <= 76 then
if yy_act <= 73 then
if yy_act <= 72 then
if yy_act = 71 then
--|#line 145
last_token := E_OLD
else
--|#line 146
last_token := E_ONCE
end
else
--|#line 147
last_token := E_OR
end
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 148
last_token := E_PREFIX
else
--|#line 149
last_token := E_REDEFINE
end
else
--|#line 150
last_token := E_RENAME
end
end
else
if yy_act <= 79 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 151
last_token := E_REQUIRE
else
--|#line 152
last_token := E_RESCUE
end
else
--|#line 153
last_token := E_RETRY
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 154
last_token := E_SELECT
else
--|#line 155
last_token := E_SEPARATE
end
else
--|#line 156
last_token := E_STRIP
end
end
end
else
if yy_act <= 88 then
if yy_act <= 85 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 157
last_token := E_THEN
else
--|#line 158
last_token := E_TRUE
end
else
--|#line 159
last_token := E_UNDEFINE
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 160
last_token := E_UNIQUE
else
--|#line 161
last_token := E_UNTIL
end
else
--|#line 162
last_token := E_VARIANT
end
end
else
if yy_act <= 91 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 163
last_token := E_WHEN
else
--|#line 164
last_token := E_XOR
end
else
--|#line 165
last_token := E_CURRENT
end
else
if yy_act = 92 then
--|#line 166
last_token := E_RESULT
else
--|#line 172

							last_token := E_IDENTIFIER
							last_value := text
						
end
end
end
end
end
end
else
if yy_act <= 139 then
if yy_act <= 116 then
if yy_act <= 105 then
if yy_act <= 99 then
if yy_act <= 96 then
if yy_act <= 95 then
if yy_act = 94 then
--|#line 180

							last_token := E_FREEOP
							last_value := text
						
else
--|#line 188
last_token := E_CHARACTER; last_value := text_item (2)
end
else
--|#line 189
last_token := E_CHARACTER; last_value := '%A'
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 190
last_token := E_CHARACTER; last_value := '%B'
else
--|#line 191
last_token := E_CHARACTER; last_value := '%C'
end
else
--|#line 192
last_token := E_CHARACTER; last_value := '%D'
end
end
else
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 193
last_token := E_CHARACTER; last_value := '%F'
else
--|#line 194
last_token := E_CHARACTER; last_value := '%H'
end
else
--|#line 195
last_token := E_CHARACTER; last_value := '%L'
end
else
if yy_act <= 104 then
if yy_act = 103 then
--|#line 196
last_token := E_CHARACTER; last_value := '%N'
else
--|#line 197
last_token := E_CHARACTER; last_value := '%Q'
end
else
--|#line 198
last_token := E_CHARACTER; last_value := '%R'
end
end
end
else
if yy_act <= 111 then
if yy_act <= 108 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 199
last_token := E_CHARACTER; last_value := '%S'
else
--|#line 200
last_token := E_CHARACTER; last_value := '%T'
end
else
--|#line 201
last_token := E_CHARACTER; last_value := '%U'
end
else
if yy_act <= 110 then
if yy_act = 109 then
--|#line 202
last_token := E_CHARACTER; last_value := '%V'
else
--|#line 203
last_token := E_CHARACTER; last_value := '%%'
end
else
--|#line 204
last_token := E_CHARACTER; last_value := '%''
end
end
else
if yy_act <= 114 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 205
last_token := E_CHARACTER; last_value := '%"'
else
--|#line 206
last_token := E_CHARACTER; last_value := '%('
end
else
--|#line 207
last_token := E_CHARACTER; last_value := '%)'
end
else
if yy_act = 115 then
--|#line 208
last_token := E_CHARACTER; last_value := '%<'
else
--|#line 209
last_token := E_CHARACTER; last_value := '%>'
end
end
end
end
else
if yy_act <= 128 then
if yy_act <= 122 then
if yy_act <= 119 then
if yy_act <= 118 then
if yy_act = 117 then
--|#line 210

						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > platform_.Maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_value := integer_.to_character (code_)
						end
					
else
--|#line 219
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
else
--|#line 220
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 226
last_token := process_operator (E_STRPLUS)
else
--|#line 227
last_token := process_operator (E_STRMINUS)
end
else
--|#line 228
last_token := process_operator (E_STRSTAR)
end
end
else
if yy_act <= 125 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 229
last_token := process_operator (E_STRSLASH)
else
--|#line 230
last_token := process_operator (E_STRDIV)
end
else
--|#line 231
last_token := process_operator (E_STRMOD)
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 232
last_token := process_operator (E_STRPOWER)
else
--|#line 233
last_token := process_operator (E_STRLT)
end
else
--|#line 234
last_token := process_operator (E_STRLE)
end
end
end
else
if yy_act <= 134 then
if yy_act <= 131 then
if yy_act <= 130 then
if yy_act = 129 then
--|#line 235
last_token := process_operator (E_STRGT)
else
--|#line 236
last_token := process_operator (E_STRGE)
end
else
--|#line 237
last_token := process_operator (E_STRNOT)
end
else
if yy_act <= 133 then
if yy_act = 132 then
--|#line 238
last_token := process_operator (E_STRAND)
else
--|#line 239
last_token := process_operator (E_STROR)
end
else
--|#line 240
last_token := process_operator (E_STRXOR)
end
end
else
if yy_act <= 137 then
if yy_act <= 136 then
if yy_act = 135 then
--|#line 241
last_token := process_operator (E_STRANDTHEN)
else
--|#line 242
last_token := process_operator (E_STRORELSE)
end
else
--|#line 243
last_token := process_operator (E_STRIMPLIES)
end
else
if yy_act = 138 then
--|#line 244

			if is_operator then
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_value := text_substring (2, text_count - 1)
		
else
--|#line 252

				last_token := E_STRING
				last_value := text_substring (2, text_count - 1)
			
end
end
end
end
end
else
if yy_act <= 162 then
if yy_act <= 151 then
if yy_act <= 145 then
if yy_act <= 142 then
if yy_act <= 141 then
if yy_act = 140 then
--|#line 256

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 262
eif_buffer.append_string (text)
end
else
--|#line 263
eif_buffer.append_character ('%A')
end
else
if yy_act <= 144 then
if yy_act = 143 then
--|#line 264
eif_buffer.append_character ('%B')
else
--|#line 265
eif_buffer.append_character ('%C')
end
else
--|#line 266
eif_buffer.append_character ('%D')
end
end
else
if yy_act <= 148 then
if yy_act <= 147 then
if yy_act = 146 then
--|#line 267
eif_buffer.append_character ('%F')
else
--|#line 268
eif_buffer.append_character ('%H')
end
else
--|#line 269
eif_buffer.append_character ('%L')
end
else
if yy_act <= 150 then
if yy_act = 149 then
--|#line 270
eif_buffer.append_character ('%N')
else
--|#line 271
eif_buffer.append_character ('%Q')
end
else
--|#line 272
eif_buffer.append_character ('%R')
end
end
end
else
if yy_act <= 157 then
if yy_act <= 154 then
if yy_act <= 153 then
if yy_act = 152 then
--|#line 273
eif_buffer.append_character ('%S')
else
--|#line 274
eif_buffer.append_character ('%T')
end
else
--|#line 275
eif_buffer.append_character ('%U')
end
else
if yy_act <= 156 then
if yy_act = 155 then
--|#line 276
eif_buffer.append_character ('%V')
else
--|#line 277
eif_buffer.append_character ('%%')
end
else
--|#line 278
eif_buffer.append_character ('%'')
end
end
else
if yy_act <= 160 then
if yy_act <= 159 then
if yy_act = 158 then
--|#line 279
eif_buffer.append_character ('%"')
else
--|#line 280
eif_buffer.append_character ('%(')
end
else
--|#line 281
eif_buffer.append_character ('%)')
end
else
if yy_act = 161 then
--|#line 282
eif_buffer.append_character ('%<')
else
--|#line 283
eif_buffer.append_character ('%>')
end
end
end
end
else
if yy_act <= 174 then
if yy_act <= 168 then
if yy_act <= 165 then
if yy_act <= 164 then
if yy_act = 163 then
--|#line 284

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > platform_.Maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (integer_.to_character (code_))
			end
		
else
--|#line 293
eif_lineno := eif_lineno + 1
end
else
--|#line 294

			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := string_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_value := str_
			set_start_condition (INITIAL)
		
end
else
if yy_act <= 167 then
if yy_act = 166 then
--|#line 305
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 306
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
--|#line 307
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
end
else
if yy_act <= 171 then
if yy_act <= 170 then
if yy_act = 169 then
--|#line 317
last_token := E_BIT; last_value := text
else
--|#line 318
last_token := E_BITTYPE; last_value := text
end
else
--|#line 319

								last_token := E_IDENTIFIER
								last_value := text_substring (1, 3)
							
end
else
if yy_act <= 173 then
if yy_act = 172 then
--|#line 328

						last_token := E_INTEGER
						last_value := text.to_integer
					
else
--|#line 332

						last_token := E_INTEGER
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end 
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_integer
						eif_buffer.wipe_out
					
end
else
--|#line 346
last_token := E_INTERR	-- Catch-all rule (no backing up)
end
end
end
else
if yy_act <= 180 then
if yy_act <= 177 then
if yy_act <= 176 then
if yy_act = 175 then
	yy_position := yy_position - 1
--|#line 352

						last_token := E_REAL
						last_value := text.to_double
					
else
--|#line 353

						last_token := E_REAL
						last_value := text.to_double
					
end
else
--|#line 354

						last_token := E_REAL
						last_value := text.to_double
					
end
else
if yy_act <= 179 then
if yy_act = 178 then
	yy_position := yy_position - 1
--|#line 358

						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_double
						eif_buffer.wipe_out
					
else
--|#line 359

						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_double
						eif_buffer.wipe_out
					
end
else
--|#line 360

						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_double
						eif_buffer.wipe_out
					
end
end
else
if yy_act <= 183 then
if yy_act <= 182 then
if yy_act = 181 then
	yy_position := yy_position - 1
--|#line 374
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
else
--|#line 375
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
end
else
--|#line 376
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
end
else
if yy_act = 184 then
--|#line 383
last_token := E_UNKNOWN
else
--|#line 0
fatal_error ("scanner jammed")
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0
terminate
when 1 then
--|#line 0
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    6,    7,    8,    7,    6,    7,    9,   10,   11,
			   12,    6,   13,   14,   15,   16,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   36,   37,   36,   36,
			   38,   36,   39,   40,   41,   36,   42,   43,   44,   45,
			   46,   47,   48,   36,   36,   49,   50,   51,   52,   53,
			   30,   31,   32,   33,   34,   35,   36,   36,   37,   36,
			   36,   38,   36,   39,   40,   41,   36,   42,   43,   44,
			   45,   46,   54,   11,   55,   57,   57,   81,   82,   83,
			   58,   58,  320,   59,   59,   60,  320,   60,   84,   60,

			   64,   65,   85,   88,   86,   86,  105,   66,   67,   89,
			   68,   90,   69,   91,   92,   96,   97,   70,  171,   71,
			  534,   72,   93,   90,  527,   92,   92,   98,   99,   73,
			  172,  102,  526,  103,   74,   75,  106,  105,  104,  124,
			  107,  122,   87,  455,   76,  110,  108,  123,   77,  109,
			   78,   94,   72,   93,  426,  111,  112,  115,  113,  415,
			   73,  116,  102,   94,  103,   74,   75,  106,  114,  104,
			  124,  107,  122,  129,  117,   65,  110,  108,  123,  130,
			  109,  135,  136,  118,  131,  125,  111,  112,  115,  113,
			  119,  120,  116,  133,  137,  126,  121,  127,  138,  132,

			  173,  128,  175,  134,  129,  117,  140,   64,  141,  141,
			  130,   64,  135,  136,  118,  131,  125,   64,  174,   64,
			  176,  119,  120,  403,  133,  137,  126,  121,  127,  138,
			  132,   60,  128,   60,  134,   60,  271,  271,  402,  209,
			  209,  177,  278,  365,  279,  366,  141,  144,  222,  370,
			  178,  210,  145,  368,  179,  146,  147,  148,  149,  182,
			  287,  287,  386,  386,  150,   90,  223,  218,  218,  151,
			  303,  152,  177,  153,  154,  155,  156,  211,  157,  222,
			  158,  178,  210,  302,  159,  179,  160,  301,  300,  161,
			  162,  163,  164,  165,  166,   63,   63,  223,   63,   65,

			   65,   65,  167,   65,   65,   94,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   64,
			   64,   87,   87,  214,  214,   90,  299,  217,  218,  140,
			  298,  219,  219,  212,  297,  215,   93,  220,  296,  224,

			  221,  225,  226,  227,  228,  230,  233,  235,  229,  236,
			  234,  237,  238,  244,  247,  181,  295,  180,  294,   87,
			  248,  216,  293,  292,  212,   94,  215,   93,  220,  141,
			  224,  221,  225,  226,  227,  228,  230,  233,  235,  229,
			  236,  234,  237,  238,  244,  247,  181,  231,  180,  186,
			  291,  248,  187,  188,  189,  190,  208,  290,  208,  289,
			  208,  191,  232,  249,  288,  250,  192,  286,  193,  251,
			  194,  195,  196,  197,  285,  198,  284,  199,  231,  259,
			  239,  200,  240,  201,  241,  245,  202,  203,  204,  205,
			  206,  207,  252,  232,  249,  242,  250,  246,  243,  257,

			  251,  260,  253,  258,  261,  254,  265,  255,  256,  262,
			  259,  239,  266,  240,  263,  241,  245,  267,   64,  268,
			  268,   64,  283,  252,   64,  264,  242,   64,  246,  243,
			  257,  269,  260,  253,  258,  261,  254,  265,  255,  256,
			  262,  282,  275,  266,  140,  263,  141,  141,  267,  144,
			  281,  144,  319,  144,  274,  273,  264,  268,  270,  272,
			  276,  277,  269,  304,  304,  280,  305,  321,  305,  308,
			  308,  306,  306,  275,  307,  210,  307,  309,  309,  307,
			  307,  212,  322,  319,  141,  268,  268,  143,  312,  310,
			  312,  276,  277,  313,  313,  323,  280,  315,  321,  324,

			   90,  211,  316,  317,  325,  326,  210,   87,  327,  307,
			  328,   93,  212,  322,  331,  311,   90,  307,  317,  317,
			  310,  332,  140,  268,  318,  318,  323,  333,  315,  329,
			  324,  314,  336,  334,  337,  325,  326,  338,  339,  327,
			   94,  328,   93,  330,  340,  331,  335,  341,  342,  343,
			  344,  345,  332,  346,  347,  348,   94,  349,  333,  350,
			  329,  353,  141,  336,  334,  337,  354,  355,  338,  339,
			  356,  351,  357,  358,  330,  340,  359,  360,  341,  342,
			  343,  344,  345,  361,  346,  347,  348,  362,  349,  352,
			  350,  363,  353,  268,  268,   64,   64,  354,  355,  372,

			  372,  356,  351,  357,  358,  315,  208,  359,  360,  185,
			  314,  210,  314,  183,  361,  314,  314,  170,  362,  169,
			  352,  369,  363,  364,  271,  271,  168,  367,  371,  287,
			  287,  268,  306,  306,  373,  373,  315,  211,  307,  307,
			  313,  313,  210,  375,  375,  376,  376,  381,  381,  380,
			  380,  385,  369,  314,  377,  212,  377,  310,  367,  378,
			  378,  315,  314,  314,  383,  387,  317,  317,   64,  379,
			  307,  379,  374,   61,  379,  379,  307,  140,  314,  384,
			  384,   87,  385,  311,  143,  382,  212,  268,  310,  388,
			  389,  383,  315,  316,  317,  320,  387,  379,  390,  320,

			  314,  391,   93,  392,  141,  393,  394,  395,  396,  397,
			  398,  399,  379,  400,  386,  386,  401,  141,  404,  405,
			  388,  389,  406,  407,  408,  409,  410,  411,  412,  390,
			  413,  141,  391,   93,  392,  414,  393,  394,  395,  396,
			  397,  398,  399,  416,  400,  417,  418,  401,  419,  404,
			  405,  420,  421,  406,  407,  408,  409,  410,  411,  412,
			  422,  413,   64,   64,   64,  139,  414,  100,  372,  372,
			  428,  428,  429,  429,  416,   95,  417,  418,  439,  419,
			  427,  440,  420,  421,  378,  378,  430,  430,  431,  431,
			  441,  422,  424,   62,  432,  432,  425,  442,  212,  443,

			  310,   61,  423,  379,  379,  536,   87,  536,  374,  439,
			  307,  427,  440,  434,  434,  435,  435,  436,  436,  444,
			  536,  441,  379,  424,   87,  315,  311,  425,  442,  212,
			  443,  310,  433,  423,  431,  431,  438,  445,  141,  141,
			  446,  379,  447,  448,  449,   64,  437,  450,  451,  452,
			  444,  268,  453,  382,  454,  314,  315,  456,  457,  458,
			  459,  460,  461,  462,  463,  464,  465,  536,  445,  484,
			   64,  446,  216,  447,  448,  449,   94,  437,  450,  451,
			  452,   64,  536,  453,  468,  454,  470,  470,  456,  457,
			  458,  459,  460,  461,  462,  463,  464,  465,  466,  469,

			  484,  469,  471,  471,  470,  470,  467,   87,   87,  431,
			  431,  474,  474,  475,  475,  468,  476,  476,  536,  472,
			  536,  473,  477,  477,  374,  478,  478,  485,  315,  466,
			  479,  486,  479,  487,  488,  477,  477,  467,  489,  490,
			  307,  491,  307,  481,  481,  211,  492,  268,  493,  433,
			  472,  379,  473,  494,  268,  482,  495,  496,  485,  315,
			  382,  497,  486,  314,  487,  488,  498,  499,  500,  489,
			  490,   64,  491,  314,   64,   64,  536,  492,  536,  493,
			  536,  483,  470,  470,  494,  536,  482,  495,  496,  536,
			  470,  470,  497,  536,  504,  504,  501,  498,  499,  500,

			  503,  536,  505,  536,  505,  508,  508,  506,  506,  507,
			  515,  507,  536,  502,  508,  508,  509,  509,  268,  268,
			  307,  477,  477,  536,  511,  511,  516,  501,  307,  536,
			  510,  503,  307,  477,  477,  512,  512,  268,  268,  517,
			   64,  515,  536,  433,  502,  307,  518,  510,  519,  315,
			  520,  521,  379,  522,  379,  523,  311,  516,  513,  314,
			  513,  510,  314,  514,  514,  524,  307,  307,  506,  506,
			  517,  314,  536,  311,  525,  268,  536,  518,  510,  519,
			  315,  520,  521,  536,  522,  533,  523,  528,  528,  508,
			  508,  508,  508,  529,  529,  536,  524,  530,  536,  530,

			  536,  314,  531,  531,  374,  525,  307,  314,  314,  476,
			  476,  514,  514,  532,  532,  536,  533,  504,  504,  379,
			  379,  510,  531,  531,  536,  374,  536,  379,  536,  379,
			  536,  379,  535,  535,  511,  511,  529,  529,   79,   79,
			  379,   79,   79,   79,   79,  382,  536,  311,  536,  314,
			  536,  382,  510,  536,  536,  374,   63,  433,   63,   63,
			  379,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			  433,  536,  382,  536,  433,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   80,
			  536,   80,   80,   80,   80,   80,   80,   80,   80,   80,

			   80,   80,   80,  101,  101,  101,  101,  101,  101,  101,
			  101,  142,  536,  142,  142,  536,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  184,  536,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,  213,  213,  213,  213,  213,  536,  213,
			  213,  213,  213,  213,  213,  213,  213,  480,  480,  480,
			  480,  480,  536,  480,  480,  480,  480,  480,  480,  480,
			  480,    5,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,   13,   13,   19,
			    3,    4,  223,    3,    4,    7,  223,    7,   19,    7,

			   10,   10,   20,   21,   20,   20,   31,   10,   10,   21,
			   10,   22,   10,   22,   22,   26,   26,   10,   69,   10,
			  525,   10,   22,   23,  503,   23,   23,   28,   28,   10,
			   69,   30,  502,   30,   10,   10,   32,   31,   30,   39,
			   32,   38,   20,  409,   10,   33,   32,   38,   10,   32,
			   10,   22,   10,   22,  371,   33,   34,   35,   34,  353,
			   10,   35,   30,   23,   30,   10,   10,   32,   34,   30,
			   39,   32,   38,   41,   35,   10,   33,   32,   38,   42,
			   32,   45,   46,   37,   43,   40,   33,   34,   35,   34,
			   37,   37,   35,   44,   47,   40,   37,   40,   48,   43,

			   70,   40,   71,   44,   41,   35,   53,   72,   53,   53,
			   42,   77,   45,   46,   37,   43,   40,   73,   70,   74,
			   71,   37,   37,  338,   44,   47,   40,   37,   40,   48,
			   43,   60,   40,   60,   44,   60,  150,  150,  337,   86,
			   86,   72,  180,  275,  180,  275,   53,   59,  103,  280,
			   73,   86,   59,  277,   74,   59,   59,   59,   59,   77,
			  191,  191,  386,  386,   59,   92,  105,   92,   92,   59,
			  207,   59,   72,   59,   59,   59,   59,   86,   59,  103,
			   59,   73,   86,  206,   59,   74,   59,  205,  204,   59,
			   59,   59,   59,   59,   59,   65,   65,  105,   65,   65,

			   65,   65,   65,   65,   65,   92,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   75,
			   76,   87,   87,   90,   90,   91,  203,   91,   91,   94,
			  202,   94,   94,   87,  201,   90,   91,  102,  200,  106,

			  102,  107,  108,  109,  110,  112,  114,  115,  110,  116,
			  114,  117,  119,  122,  124,   76,  199,   75,  198,   87,
			  125,   90,  197,  196,   87,   91,   90,   91,  102,   94,
			  106,  102,  107,  108,  109,  110,  112,  114,  115,  110,
			  116,  114,  117,  119,  122,  124,   76,  113,   75,   81,
			  195,  125,   81,   81,   81,   81,  208,  194,  208,  193,
			  208,   81,  113,  126,  192,  127,   81,  190,   81,  129,
			   81,   81,   81,   81,  189,   81,  188,   81,  113,  132,
			  120,   81,  120,   81,  120,  123,   81,   81,   81,   81,
			   81,   81,  130,  113,  126,  120,  127,  123,  120,  131,

			  129,  133,  130,  131,  134,  130,  136,  130,  130,  135,
			  132,  120,  137,  120,  135,  120,  123,  138,  177,  140,
			  140,  179,  187,  130,  178,  135,  120,  181,  123,  120,
			  131,  140,  133,  130,  131,  134,  130,  136,  130,  130,
			  135,  186,  177,  137,  141,  135,  141,  141,  138,  144,
			  182,  144,  220,  144,  176,  174,  135,  140,  144,  172,
			  178,  179,  140,  209,  209,  181,  210,  224,  210,  211,
			  211,  210,  210,  177,  212,  209,  212,  214,  214,  212,
			  212,  211,  225,  220,  141,  216,  216,  142,  215,  214,
			  215,  178,  179,  215,  215,  226,  181,  216,  224,  227,

			  217,  209,  217,  217,  228,  229,  209,  211,  230,  210,
			  232,  217,  211,  225,  234,  214,  218,  212,  218,  218,
			  214,  235,  219,  216,  219,  219,  226,  236,  216,  233,
			  227,  215,  238,  237,  239,  228,  229,  240,  241,  230,
			  217,  232,  217,  233,  242,  234,  237,  243,  244,  245,
			  246,  248,  235,  250,  251,  252,  218,  253,  236,  254,
			  233,  256,  219,  238,  237,  239,  257,  258,  240,  241,
			  259,  255,  260,  261,  233,  242,  262,  263,  243,  244,
			  245,  246,  248,  264,  250,  251,  252,  265,  253,  255,
			  254,  266,  256,  268,  268,  276,  278,  257,  258,  304,

			  304,  259,  255,  260,  261,  268,   83,  262,  263,   80,
			  269,  304,  269,   78,  264,  269,  269,   68,  265,   67,
			  255,  278,  266,  271,  271,  271,   66,  276,  287,  287,
			  287,  268,  305,  305,  306,  306,  268,  304,  307,  307,
			  312,  312,  304,  308,  308,  309,  309,  313,  313,  311,
			  311,  319,  278,  269,  310,  308,  310,  309,  276,  310,
			  310,  311,  314,  314,  317,  321,  317,  317,   63,  315,
			  305,  315,  306,   61,  315,  315,  307,  318,  312,  318,
			  318,  308,  319,  309,   56,  313,  308,  311,  309,  322,
			  323,  316,  311,  316,  316,  320,  321,  310,  324,  320,

			  314,  325,  316,  326,  317,  327,  328,  329,  330,  331,
			  332,  333,  315,  335,  320,  320,  336,  318,  339,  340,
			  322,  323,  341,  343,  345,  347,  348,  349,  350,  324,
			  351,  316,  325,  316,  326,  352,  327,  328,  329,  330,
			  331,  332,  333,  354,  335,  355,  356,  336,  359,  339,
			  340,  360,  361,  341,  343,  345,  347,  348,  349,  350,
			  362,  351,  365,  367,  369,   50,  352,   29,  372,  372,
			  373,  373,  374,  374,  354,   24,  355,  356,  389,  359,
			  372,  390,  360,  361,  377,  377,  375,  375,  376,  376,
			  392,  362,  367,    9,  378,  378,  369,  393,  375,  394,

			  376,    8,  365,  379,  379,    5,  372,    0,  373,  389,
			  374,  372,  390,  380,  380,  381,  381,  382,  382,  395,
			    0,  392,  377,  367,  375,  380,  376,  369,  393,  375,
			  394,  376,  378,  365,  383,  383,  384,  396,  384,  384,
			  397,  379,  399,  400,  401,  425,  383,  402,  404,  405,
			  395,  380,  406,  381,  408,  382,  380,  410,  411,  412,
			  413,  414,  416,  417,  419,  420,  422,    0,  396,  439,
			  423,  397,  383,  399,  400,  401,  384,  383,  402,  404,
			  405,  424,    0,  406,  425,  408,  428,  428,  410,  411,
			  412,  413,  414,  416,  417,  419,  420,  422,  423,  427,

			  439,  427,  429,  429,  427,  427,  424,  430,  430,  431,
			  431,  432,  432,  433,  433,  425,  434,  434,    0,  430,
			    0,  431,  435,  435,  428,  436,  436,  440,  434,  423,
			  437,  441,  437,  444,  446,  437,  437,  424,  447,  449,
			  429,  450,  427,  438,  438,  430,  451,  431,  452,  432,
			  430,  433,  431,  453,  434,  438,  454,  456,  440,  434,
			  435,  458,  441,  436,  444,  446,  462,  463,  465,  447,
			  449,  466,  450,  437,  467,  468,    0,  451,    0,  452,
			    0,  438,  469,  469,  453,    0,  438,  454,  456,    0,
			  470,  470,  458,    0,  471,  471,  466,  462,  463,  465,

			  468,    0,  472,    0,  472,  474,  474,  472,  472,  473,
			  484,  473,    0,  467,  473,  473,  475,  475,  476,  476,
			  469,  477,  477,    0,  478,  478,  486,  466,  470,    0,
			  476,  468,  471,  479,  479,  481,  481,  483,  483,  487,
			  501,  484,    0,  474,  467,  472,  488,  481,  491,  483,
			  494,  495,  473,  496,  475,  498,  476,  486,  482,  477,
			  482,  476,  478,  482,  482,  499,  504,  504,  505,  505,
			  487,  479,    0,  481,  501,  483,    0,  488,  481,  491,
			  483,  494,  495,    0,  496,  520,  498,  506,  506,  507,
			  507,  508,  508,  509,  509,    0,  499,  510,    0,  510,

			    0,  482,  510,  510,  504,  501,  505,  511,  511,  512,
			  512,  513,  513,  514,  514,    0,  520,  528,  528,  529,
			  529,  512,  530,  530,    0,  506,    0,  507,    0,  508,
			    0,  509,  531,  531,  532,  532,  535,  535,  539,  539,
			  510,  539,  539,  539,  539,  511,    0,  512,    0,  513,
			    0,  514,  512,    0,    0,  528,  538,  529,  538,  538,
			  530,  538,  538,  538,  538,  538,  538,  538,  538,  538,
			  531,    0,  532,    0,  535,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  540,
			    0,  540,  540,  540,  540,  540,  540,  540,  540,  540,

			  540,  540,  540,  541,  541,  541,  541,  541,  541,  541,
			  541,  542,    0,  542,  542,    0,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  543,    0,  543,  543,  543,
			  543,  543,  543,  543,  543,  543,  543,  543,  543,  544,
			  544,  544,  544,  544,  544,  544,  544,  544,  544,  544,
			  544,  544,  544,  545,  545,  545,  545,  545,    0,  545,
			  545,  545,  545,  545,  545,  545,  545,  546,  546,  546,
			  546,  546,    0,  546,  546,  546,  546,  546,  546,  546,
			  546,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    0,   82,   83,  905, 1381,   93,  898,  886,
			   92,    0, 1381,   76, 1381, 1381, 1381, 1381, 1381,   71,
			   83,   83,   92,  104,  849, 1381,   90, 1381,  101,  841,
			   91,   69,  100,  112,  116,  128,    0,  149,  104,   96,
			  155,  127,  146,  151,  157,  139,  153,  158,  155, 1381,
			  809, 1381, 1381,  187, 1381, 1381,  776, 1381, 1381,  244,
			  229,  770, 1381,  760, 1381,  294,  718,  711,  709,  110,
			  192,  194,  199,  209,  211,  371,  372,  203,  705,    0,
			  697,  441,    0,  703, 1381, 1381,  218,  360, 1381, 1381,
			  362,  366,  246, 1381,  370, 1381, 1381, 1381, 1381, 1381,

			 1381,    0,  360,  216,    0,  218,  366,  372,  369,  357,
			  374,    0,  358,  415,  362,  367,  380,  368,    0,  368,
			  448,    0,  374,  454,  366,  373,  431,  434,    0,  436,
			  460,  459,  433,  468,  455,  477,  460,  479,  471, 1381,
			  498,  525,  579, 1381,  547, 1381, 1381, 1381, 1381, 1381,
			  215, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381,
			 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381,
			 1381, 1381,  551, 1381,  547, 1381,  546,  510,  516,  513,
			  236,  519,  542, 1381, 1381, 1381,  529,  510,  464,  462,
			  455,  239,  452,  447,  445,  438,  411,  410,  406,  404,

			  386,  382,  378,  374,  276,  275,  271,  258,  454,  542,
			  550,  548,  558, 1381,  556,  572,  564,  581,  597,  603,
			  523,    0,    0,   90,  536,  535,  566,  553,  555,  572,
			  575,    0,  561,  600,  581,  574,  579,  592,  592,  601,
			  600,  605,  600,  618,  615,  620,  606,    0,  608,    0,
			  620,  620,  622,  628,  610,  640,  615,  633,  638,  633,
			  630,  640,  643,  632,  646,  650,  649,    0,  672,  694,
			 1381,  703, 1381, 1381, 1381,  237,  687,  245,  688, 1381,
			  241, 1381, 1381, 1381, 1381, 1381, 1381,  708, 1381, 1381,
			 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381, 1381,

			 1381, 1381, 1381, 1381,  678,  711,  713,  717,  722,  724,
			  738,  728,  719,  726,  741,  753,  772,  745,  758,  704,
			  793,  726,  742,  742,  765,  766,  757,  768,  760,  765,
			  762,  763,  777,  762,    0,  780,  779,  186,  171,  772,
			  786,  776,    0,  783,    0,  784,    0,  788,  792,  786,
			  791,  781,  795,  106,  812,  799,  802,    0,    0,  814,
			  802,  812,  831,    0, 1381,  854, 1381,  855, 1381,  856,
			 1381,  142,  847,  849,  851,  865,  867,  863,  873,  882,
			  892,  894,  896,  913,  917,    0,  241,    0,    0,  841,
			  839,    0,  844,  863,  866,  887,  889,  898,    0,  896,

			  901,  911,  910,    0,  911,  918,  915,    0,  921,   91,
			  920,  925,  913,  927,  913,    0,  914,  934,    0,  927,
			  932,    0,  924,  962,  973,  937, 1381,  983,  965,  981,
			  986,  988,  990,  992,  995, 1001, 1004, 1014, 1022,  926,
			  979,  998,    0,    0, 1000,    0, 1005, 1005,    0,  992,
			  999,  998, 1000, 1024, 1008,    0, 1015,    0, 1028,    0,
			    0,    0, 1018, 1025,    0, 1020, 1063, 1066, 1067, 1061,
			 1069, 1073, 1086, 1093, 1084, 1095, 1097, 1100, 1103, 1112,
			 1381, 1114, 1142, 1116, 1068,    0, 1094, 1107, 1106,    0,
			    0, 1113,    0,    0, 1108, 1118, 1120,    0, 1122, 1132,

			    0, 1132,  124,  116, 1145, 1147, 1166, 1168, 1170, 1172,
			 1181, 1186, 1188, 1190, 1192,    0,    0,    0,    0,    0,
			 1137,    0,    0,    0,    0,  112, 1381, 1381, 1196, 1198,
			 1201, 1211, 1213,    0, 1381, 1215, 1381, 1274, 1255, 1235,
			 1288, 1296, 1310, 1324, 1338, 1352, 1366>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,  536,    1,  537,  537,  536,  536,  536,  536,  536,
			  538,  539,  536,  540,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  536,
			  536,  536,  536,  536,  536,  536,  542,  536,  536,  536,
			  536,  536,  536,  538,  536,  536,  538,  538,  538,  538,
			  538,  538,  538,  538,  538,  538,  538,  538,  538,  539,
			  543,  543,  543,  544,  536,  536,  536,  536,  536,  536,
			  545,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  536,
			  536,  536,  542,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  538,  536,  538,  536,  538,  538,  538,  538,
			  538,  538,  538,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  536,  536,
			  536,  536,  536,  536,  536,  538,  538,  538,  538,  536,
			  538,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  541,
			  536,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  536,  538,  536,  538,  536,  538,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  545,  536,  541,  536,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,

			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  538,  538,  538,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  546,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  538,  538,  538,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,

			  541,  538,  538,  538,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  538,  536,  536,  536,  536,
			  536,  536,  536,  541,  536,  536,    0,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    5,    5,    5,
			    5,    5,    6,    7,    8,    9,   10,   11,    9,   12,
			   13,   14,   15,   16,   17,   18,   19,   20,   21,   21,
			   22,   22,   22,   22,   22,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,    9,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,
			   44,   45,   46,   47,   48,   49,   50,   51,   52,   53,
			   54,   55,   56,   57,   58,   59,    1,   60,   61,   62,

			   63,   64,   65,   66,   67,   68,   69,   70,   71,   72,
			   73,   74,   75,   76,   77,   78,   79,   80,   81,   51,
			   52,   53,   54,   82,   83,   84,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,

			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    2,    1,    3,    3,    4,    1,    3,
			    3,    5,    3,    3,    3,    3,    3,    3,    3,    6,
			    3,    7,    8,    3,    3,    3,    3,    3,    3,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    9,   10,   10,   11,   12,    1,    1,    1,    1,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   13,   14,    1,    1,    1>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    0,    0,    0,  186,  184,    2,    1,   22,
			  140,   94,   36,  184,   26,   27,    7,    5,   20,    6,
			   18,    8,  172,  172,   21,   19,   16,   12,   14,  184,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   28,
			  184,   29,    9,  174,   30,   31,  141,  185,  165,  166,
			    2,    1,   23,  140,  139,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,   94,
			  118,  118,  118,    4,   24,   25,  177,  183,   10,   13,
			  181,  172,  172,  169,  174,   34,   32,   17,   15,   33,

			   35,   93,   93,   93,   40,   93,   93,   93,   93,   93,
			   93,   46,   93,   93,   93,   93,   93,   93,   58,   93,
			   93,   65,   93,   93,   93,   93,   93,   93,   73,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   11,
			  181,  174,  141,  165,  167,  158,  156,  157,  159,  160,
			  168,  161,  162,  142,  143,  144,  145,  146,  147,  148,
			  149,  150,  151,  152,  153,  154,  155,  138,  122,  120,
			  121,  123,  140,  127,  140,  129,  140,  140,  140,  140,
			  140,  140,  140,  126,  118,   95,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,

			  118,  118,  118,  118,  118,  118,  118,  118,    3,  177,
			  183,  183,  183,  175,  177,  175,  175,  172,  172,  174,
			   93,   38,   39,   93,   93,   93,   93,   93,   93,   93,
			   93,   49,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   69,   93,   71,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   90,  183,  182,
			  164,  168,  124,  128,  130,  140,  140,  140,  140,  133,
			  140,  125,  112,  110,  111,  113,  114,  119,  115,  116,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,

			  106,  107,  108,  109,  177,  183,  177,  183,  183,  177,
			  182,  183,  182,  176,  182,  182,  172,  172,  174,   93,
			  171,   93,   93,   93,   93,   93,   93,   47,   93,   93,
			   93,   93,   93,   93,   56,   93,   93,   93,   93,   93,
			   93,   93,   66,   93,   68,   93,   72,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   83,   84,   93,
			   93,   93,   93,   89,  163,  140,  132,  140,  131,  140,
			  134,  119,  177,  177,  183,  183,  177,  182,  176,  182,
			  183,  176,  182,  181,  173,   37,  170,   41,   42,   93,
			   93,   44,   93,   93,   93,   93,   93,   93,   54,   93,

			   93,   93,   93,   61,   93,   93,   93,   67,   93,   93,
			   93,   93,   93,   93,   93,   79,   93,   93,   82,   93,
			   93,   87,   93,  140,  140,  140,  117,  183,  177,  183,
			  180,  177,  176,  182,  183,  176,  182,  175,  181,   93,
			   93,   93,   48,   50,   93,   52,   93,   93,   57,   93,
			   93,   93,   93,   93,   93,   74,   93,   76,   93,   78,
			   92,   80,   93,   93,   86,   93,  140,  140,  140,  183,
			  177,  183,  183,  182,  176,  182,  180,  176,  182,  182,
			  178,  180,  178,  178,   93,   91,   93,   93,   93,   55,
			   59,   93,   62,   63,   93,   93,   93,   77,   93,   93,

			   88,  140,  140,  140,  180,  183,  180,  182,  176,  182,
			  182,  179,  180,  182,  179,   43,   45,   51,   53,   60,
			   93,   70,   75,   81,   85,  140,  137,  136,  180,  179,
			  182,  179,  179,   64,  135,  179,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1381
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 536
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 537
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyEnd_of_buffer: INTEGER is 186
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel scanner.
		do
			make_compressed_scanner_skeleton
			eif_buffer := string_.make (Init_buffer_size)
			eif_lineno := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			eif_lineno := 1
			eif_buffer.wipe_out
		end

feature -- Access

	last_value: ANY
			-- Semantic value to be passed to the parser

	eif_buffer: STRING
			-- Buffer for lexial tokens

	eif_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Processing

	process_operator (op: INTEGER): INTEGER is
			-- Process current token as operator `op' or as
			-- an Eiffel string depending on the context
		require
			text_count_large_enough: text_count > 2
		do
			if is_operator then
				Result := op
			else
				Result := E_STRING
				last_value := text_substring (2, text_count - 1)
			end
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `eif_buffer'

invariant

	eif_buffer_not_void: eif_buffer /= Void

end -- class EIFFEL_SCANNER
