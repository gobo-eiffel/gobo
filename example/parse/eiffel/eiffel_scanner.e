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

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_SHARED_INTEGER_ROUTINES

	KL_SHARED_STRING_ROUTINES

	KL_SHARED_PLATFORM

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
--|#line 51
eif_lineno := eif_lineno + text_count
else
--|#line 52
;
end
else
--|#line 58
eif_lineno := eif_lineno + 1
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 59
;
else
--|#line 65
last_token := Plus_code
end
else
--|#line 66
last_token := Minus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 67
last_token := Star_code
else
--|#line 68
last_token := Slash_code
end
else
--|#line 69
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 70
last_token := E_DIV
else
--|#line 71
last_token := E_MOD
end
else
--|#line 72
last_token := Equal_code
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 73
last_token := E_NE
else
--|#line 74
last_token := Greater_than_code
end
else
--|#line 75
last_token := E_GE
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 76
last_token := Less_than_code
else
--|#line 77
last_token := E_LE
end
else
--|#line 78
last_token := Dot_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 79
last_token := Semicolon_code
else
--|#line 80
last_token := Comma_code
end
else
--|#line 81
last_token := Colon_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 82
last_token := Exclamation_code
else
--|#line 83
last_token := E_BANGBANG
end
else
--|#line 84
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
--|#line 85
last_token := E_DOTDOT
else
--|#line 86
last_token := Left_parenthesis_code
end
else
--|#line 87
last_token := Right_parenthesis_code
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 88
last_token := Left_bracket_code
else
--|#line 89
last_token := Right_bracket_code
end
else
--|#line 90
last_token := Left_brace_code
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 91
last_token := Right_brace_code
else
--|#line 92
last_token := E_LARRAY
end
else
--|#line 93
last_token := E_RARRAY
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 94
last_token := E_ASSIGN
else
--|#line 95
last_token := E_REVERSE
end
else
--|#line 96
last_token := Dollar_code
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 102
last_token := E_ALIAS
else
--|#line 103
last_token := E_ALL
end
else
--|#line 104
last_token := E_AND
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 105
last_token := E_AS
else
--|#line 106
last_token := E_CHECK
end
else
--|#line 107
last_token := E_CLASS
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 108
last_token := E_CREATION
else
--|#line 109
last_token := E_DEBUG
end
else
--|#line 110
last_token := E_DEFERRED
end
else
if yy_act = 46 then
--|#line 111
last_token := E_DO
else
--|#line 112
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
--|#line 113
last_token := E_ELSEIF
else
--|#line 114
last_token := E_END
end
else
--|#line 115
last_token := E_ENSURE
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 116
last_token := E_EXPANDED
else
--|#line 117
last_token := E_EXPORT
end
else
--|#line 118
last_token := E_EXTERNAL
end
end
else
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 119
last_token := E_FALSE
else
--|#line 120
last_token := E_FEATURE
end
else
--|#line 121
last_token := E_FROM
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 122
last_token := E_FROZEN
else
--|#line 123
last_token := E_IF
end
else
--|#line 124
last_token := E_IMPLIES
end
end
end
else
if yy_act <= 65 then
if yy_act <= 62 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 125
last_token := E_INDEXING
else
--|#line 126

										is_operator := True
										last_token := E_INFIX
									
end
else
--|#line 130
last_token := E_INHERIT
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 131
last_token := E_INSPECT
else
--|#line 132
last_token := E_INVARIANT
end
else
--|#line 133
last_token := E_IS
end
end
else
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 134
last_token := E_LIKE
else
--|#line 135
last_token := E_LOCAL
end
else
--|#line 136
last_token := E_LOOP
end
else
if yy_act = 69 then
--|#line 137
last_token := E_NOT
else
--|#line 138
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
--|#line 139
last_token := E_OLD
else
--|#line 140
last_token := E_ONCE
end
else
--|#line 141
last_token := E_OR
end
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 142

										is_operator := True
										last_token := E_PREFIX
									
else
--|#line 146
last_token := E_REDEFINE
end
else
--|#line 147
last_token := E_RENAME
end
end
else
if yy_act <= 79 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 148
last_token := E_REQUIRE
else
--|#line 149
last_token := E_RESCUE
end
else
--|#line 150
last_token := E_RETRY
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 151
last_token := E_SELECT
else
--|#line 152
last_token := E_SEPARATE
end
else
--|#line 153
last_token := E_STRIP
end
end
end
else
if yy_act <= 88 then
if yy_act <= 85 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 154
last_token := E_THEN
else
--|#line 155
last_token := E_TRUE
end
else
--|#line 156
last_token := E_UNDEFINE
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 157
last_token := E_UNIQUE
else
--|#line 158
last_token := E_UNTIL
end
else
--|#line 159
last_token := E_VARIANT
end
end
else
if yy_act <= 91 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 160
last_token := E_WHEN
else
--|#line 161
last_token := E_XOR
end
else
--|#line 162
last_token := E_CURRENT
end
else
if yy_act = 92 then
--|#line 163
last_token := E_RESULT
else
--|#line 169

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
--|#line 177

							last_token := E_FREEOP
							last_value := text
						
else
--|#line 185
last_token := E_CHARACTER; last_value := text_item (2)
end
else
--|#line 186
last_token := E_CHARACTER; last_value := '%A'
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 187
last_token := E_CHARACTER; last_value := '%B'
else
--|#line 188
last_token := E_CHARACTER; last_value := '%C'
end
else
--|#line 189
last_token := E_CHARACTER; last_value := '%D'
end
end
else
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 190
last_token := E_CHARACTER; last_value := '%F'
else
--|#line 191
last_token := E_CHARACTER; last_value := '%H'
end
else
--|#line 192
last_token := E_CHARACTER; last_value := '%L'
end
else
if yy_act <= 104 then
if yy_act = 103 then
--|#line 193
last_token := E_CHARACTER; last_value := '%N'
else
--|#line 194
last_token := E_CHARACTER; last_value := '%Q'
end
else
--|#line 195
last_token := E_CHARACTER; last_value := '%R'
end
end
end
else
if yy_act <= 111 then
if yy_act <= 108 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 196
last_token := E_CHARACTER; last_value := '%S'
else
--|#line 197
last_token := E_CHARACTER; last_value := '%T'
end
else
--|#line 198
last_token := E_CHARACTER; last_value := '%U'
end
else
if yy_act <= 110 then
if yy_act = 109 then
--|#line 199
last_token := E_CHARACTER; last_value := '%V'
else
--|#line 200
last_token := E_CHARACTER; last_value := '%%'
end
else
--|#line 201
last_token := E_CHARACTER; last_value := '%''
end
end
else
if yy_act <= 114 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 202
last_token := E_CHARACTER; last_value := '%"'
else
--|#line 203
last_token := E_CHARACTER; last_value := '%('
end
else
--|#line 204
last_token := E_CHARACTER; last_value := '%)'
end
else
if yy_act = 115 then
--|#line 205
last_token := E_CHARACTER; last_value := '%<'
else
--|#line 206
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
--|#line 207

						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > Platform.maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_value := INTEGER_.to_character (code_)
						end
					
else
--|#line 216
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
else
--|#line 217
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 223
last_token := process_operator (E_STRPLUS)
else
--|#line 224
last_token := process_operator (E_STRMINUS)
end
else
--|#line 225
last_token := process_operator (E_STRSTAR)
end
end
else
if yy_act <= 125 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 226
last_token := process_operator (E_STRSLASH)
else
--|#line 227
last_token := process_operator (E_STRDIV)
end
else
--|#line 228
last_token := process_operator (E_STRMOD)
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 229
last_token := process_operator (E_STRPOWER)
else
--|#line 230
last_token := process_operator (E_STRLT)
end
else
--|#line 231
last_token := process_operator (E_STRLE)
end
end
end
else
if yy_act <= 134 then
if yy_act <= 131 then
if yy_act <= 130 then
if yy_act = 129 then
--|#line 232
last_token := process_operator (E_STRGT)
else
--|#line 233
last_token := process_operator (E_STRGE)
end
else
--|#line 234
last_token := process_operator (E_STRNOT)
end
else
if yy_act <= 133 then
if yy_act = 132 then
--|#line 235
last_token := process_operator (E_STRAND)
else
--|#line 236
last_token := process_operator (E_STROR)
end
else
--|#line 237
last_token := process_operator (E_STRXOR)
end
end
else
if yy_act <= 137 then
if yy_act <= 136 then
if yy_act = 135 then
--|#line 238
last_token := process_operator (E_STRANDTHEN)
else
--|#line 239
last_token := process_operator (E_STRORELSE)
end
else
--|#line 240
last_token := process_operator (E_STRIMPLIES)
end
else
if yy_act = 138 then
--|#line 241

			if is_operator then
				is_operator := False
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_value := text_substring (2, text_count - 1)
		
else
--|#line 250

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
--|#line 254

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 260
eif_buffer.append_string (text)
end
else
--|#line 261
eif_buffer.append_character ('%A')
end
else
if yy_act <= 144 then
if yy_act = 143 then
--|#line 262
eif_buffer.append_character ('%B')
else
--|#line 263
eif_buffer.append_character ('%C')
end
else
--|#line 264
eif_buffer.append_character ('%D')
end
end
else
if yy_act <= 148 then
if yy_act <= 147 then
if yy_act = 146 then
--|#line 265
eif_buffer.append_character ('%F')
else
--|#line 266
eif_buffer.append_character ('%H')
end
else
--|#line 267
eif_buffer.append_character ('%L')
end
else
if yy_act <= 150 then
if yy_act = 149 then
--|#line 268
eif_buffer.append_character ('%N')
else
--|#line 269
eif_buffer.append_character ('%Q')
end
else
--|#line 270
eif_buffer.append_character ('%R')
end
end
end
else
if yy_act <= 157 then
if yy_act <= 154 then
if yy_act <= 153 then
if yy_act = 152 then
--|#line 271
eif_buffer.append_character ('%S')
else
--|#line 272
eif_buffer.append_character ('%T')
end
else
--|#line 273
eif_buffer.append_character ('%U')
end
else
if yy_act <= 156 then
if yy_act = 155 then
--|#line 274
eif_buffer.append_character ('%V')
else
--|#line 275
eif_buffer.append_character ('%%')
end
else
--|#line 276
eif_buffer.append_character ('%'')
end
end
else
if yy_act <= 160 then
if yy_act <= 159 then
if yy_act = 158 then
--|#line 277
eif_buffer.append_character ('%"')
else
--|#line 278
eif_buffer.append_character ('%(')
end
else
--|#line 279
eif_buffer.append_character ('%)')
end
else
if yy_act = 161 then
--|#line 280
eif_buffer.append_character ('%<')
else
--|#line 281
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
--|#line 282

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
else
--|#line 291
eif_lineno := eif_lineno + 1
end
else
--|#line 292

			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := STRING_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_value := str_
			set_start_condition (INITIAL)
		
end
else
if yy_act <= 167 then
if yy_act = 166 then
--|#line 303
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 304
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
--|#line 305
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
end
else
if yy_act <= 171 then
if yy_act <= 170 then
if yy_act = 169 then
--|#line 315
last_token := E_BIT; last_value := text
else
--|#line 316
last_token := E_BITTYPE; last_value := text
end
else
--|#line 317

								last_token := E_IDENTIFIER
								last_value := text_substring (1, 3)
							
end
else
if yy_act <= 173 then
if yy_act = 172 then
--|#line 326

						last_token := E_INTEGER
						last_value := text.to_integer
					
else
--|#line 330

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
--|#line 344
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
--|#line 350

						last_token := E_REAL
						last_value := text.to_double
					
else
--|#line 351

						last_token := E_REAL
						last_value := text.to_double
					
end
else
--|#line 352

						last_token := E_REAL
						last_value := text.to_double
					
end
else
if yy_act <= 179 then
if yy_act = 178 then
	yy_position := yy_position - 1
--|#line 356

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
--|#line 357

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
					
end
end
else
if yy_act <= 183 then
if yy_act <= 182 then
if yy_act = 181 then
	yy_position := yy_position - 1
--|#line 372
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
else
--|#line 373
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
end
else
--|#line 374
	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					
end
else
if yy_act = 184 then
--|#line 381
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
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    6,    7,    8,    7,    7,    9,   10,   11,   12,
			    6,   13,   14,   15,   16,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   36,   37,   36,   36,   38,
			   36,   39,   40,   41,   36,   42,   43,   44,   45,   46,
			   47,   48,   36,   36,   49,   50,   51,   52,   53,   30,
			   31,   32,   33,   35,   36,   38,   39,   36,   42,   43,
			   44,   45,   46,   54,   55,   57,   57,   81,   82,   58,
			   58,   83,   59,   59,   60,  129,   60,   60,   64,   65,
			   84,   85,  137,   86,   86,   66,   67,   88,   68,   90,

			   69,   91,   92,   89,  135,   70,  122,   71,  129,   72,
			   93,   90,  123,   92,   92,   96,   97,   73,   98,   99,
			  110,  137,   74,   75,  271,  271,  102,  131,  103,  135,
			  111,   87,   76,  104,  171,  534,   77,  136,   78,   94,
			   72,   93,  132,  112,  106,  113,  172,   74,  107,  173,
			   64,   94,  102,  103,  108,  114,  104,  109,  115,   64,
			   64,   60,  116,   60,   60,  132,  133,  174,  136,  112,
			  113,  118,  175,  106,  107,  117,  134,  108,  119,  120,
			  109,  125,   64,  140,  121,  141,  141,   64,  180,  115,
			  176,  126,  178,  127,  177,  133,  357,  128,  117,  134,

			   63,  118,   63,   63,  120,  167,   64,  121,  287,  287,
			  220,  180,  125,  221,  527,  209,  209,  126,  127,  177,
			  128,  357,  179,  141,  144,   87,   87,  210,  145,  526,
			  182,  146,  147,  148,  149,  223,  227,  212,  230,  221,
			  150,  181,  222,  214,  214,  151,  235,  152,  225,  153,
			  154,  155,  156,  211,  157,  215,  158,  247,  223,  227,
			  159,  230,  160,   87,  524,  161,  162,  163,  164,  165,
			  166,  186,  235,  222,  187,  188,  189,  190,  523,  225,
			  247,  216,   90,  191,  218,  218,  522,  228,  192,   64,
			  193,  229,  194,  195,  196,  197,  236,  198,  140,  199,

			  219,  219,  231,  200,   90,  201,  217,  218,  202,  203,
			  204,  205,  206,  207,  248,   93,  233,  232,  228,  245,
			  234,  229,   94,  249,  239,  276,  240,  236,  241,  250,
			  259,  246,  278,  231,  279,  521,  261,  248,  141,  242,
			  232,  257,  243,  234,   94,  258,   93,  265,  252,  267,
			  245,   64,   64,  259,  249,  239,  240,  241,  253,  261,
			  250,  254,  242,  255,  256,  243,  262,  257,  268,  268,
			  265,  263,  267,  140,   64,  141,  141,  519,  319,  252,
			  269,  322,  264,  253,  254,  336,  255,  256,  144,  280,
			  144,  144,  277,  497,  324,  321,  270,  262,  275,  208,

			  320,  208,  208,  320,  322,  264,  268,  304,  304,  319,
			  323,  336,  280,  141,  489,  277,  305,  324,  305,  210,
			  325,  306,  306,  308,  308,  307,  321,  307,  487,  275,
			  307,  307,  309,  309,  312,  212,  312,  268,  268,  313,
			  313,  323,  329,  325,  310,  211,  328,  341,  332,  315,
			  343,   90,  347,  316,  317,   90,  330,  317,  317,  307,
			  333,   87,   93,  140,  350,  318,  318,  334,  307,  328,
			  311,  332,  363,  329,  349,  268,  351,  314,  341,  353,
			  335,  343,  347,  333,  355,  360,   64,  350,  268,  268,
			  365,   94,  366,   93,  352,   94,   64,  363,  306,  306,

			  315,  416,  353,  141,  314,  349,  314,  351,  360,  314,
			  314,  364,  271,  271,  486,  355,  484,  352,  367,  372,
			  372,  369,  371,  287,  287,  422,  268,  373,  373,  307,
			  307,  210,  416,  375,  375,  407,  307,  376,  376,  313,
			  313,  380,  380,  395,  367,  212,  377,  314,  377,  310,
			  385,  378,  378,  315,  381,  381,  422,  211,  314,  314,
			  383,  407,  317,  317,  379,  374,  379,  307,  395,  379,
			  379,   87,  388,  385,  389,  311,  392,  314,  394,  268,
			  383,  410,  316,  317,  140,  320,  384,  384,  320,  379,
			  396,   93,  382,  397,  399,  388,  314,  389,  404,  392,

			  141,  394,  406,  386,  386,  408,  413,  379,  414,  417,
			  419,  410,  420,  396,   64,  421,  397,  399,   64,  464,
			  141,  404,   93,   64,  141,  406,  372,  372,  463,  413,
			  459,  408,  417,  442,  414,  420,  428,  428,  427,  457,
			  419,  421,  429,  429,  430,  430,  456,  424,  431,  431,
			  378,  378,  432,  432,  423,  425,  212,  379,  379,  440,
			  310,  434,  434,  442,   87,  435,  435,  436,  436,  386,
			  386,  431,  431,  315,  374,  441,  438,  423,  141,  141,
			  307,  425,   87,  437,  440,  445,  311,  444,  379,  446,
			  433,  452,  447,   64,  448,  379,  462,  458,  441,  268,

			  460,  461,   64,  382,  465,  314,   64,  491,  445,  216,
			  470,  470,  455,  454,  446,  447,   94,  453,  444,  448,
			  458,  466,  452,  460,  461,  471,  471,  462,  469,  465,
			  469,  467,  491,  470,  470,   87,   87,  431,  431,  474,
			  474,  468,  475,  475,  476,  476,  485,  472,  374,  473,
			  466,  477,  477,  478,  478,  479,  315,  479,  481,  481,
			  477,  477,  488,  307,  468,  490,  494,  492,  518,  485,
			  482,  307,  493,  211,   64,  268,  495,  433,  496,  498,
			  379,  499,  268,   64,  500,   64,  470,  470,  490,  382,
			  492,  314,  515,  488,  518,  493,  483,  494,  314,  495,

			  470,  470,  498,  496,  504,  504,  499,  500,  501,  505,
			  503,  505,  451,  502,  506,  506,  507,  515,  507,  508,
			  508,  508,  508,  516,  307,  509,  509,  268,  268,  477,
			  477,  511,  511,  477,  477,  513,  502,  513,  307,  510,
			  514,  514,  307,  512,  512,  517,  268,  268,  520,   64,
			  307,  307,  307,  450,  516,  510,  449,  433,  315,  379,
			  506,  506,  443,  379,  533,  311,  439,  314,  426,  314,
			  418,  314,  415,  520,  528,  528,  517,  412,  314,  508,
			  508,  311,  411,  525,  268,  508,  508,  533,  374,  529,
			  529,  530,  409,  530,  314,  314,  531,  531,  307,  476,

			  476,  514,  514,  532,  532,  504,  504,  405,  525,  379,
			  379,  510,  374,  531,  531,  535,  535,  379,  511,  511,
			  529,  529,  403,  379,  402,  401,  400,  379,  398,  393,
			  391,  390,  382,  387,  379,  370,  368,  311,  362,  314,
			  361,  382,  359,  374,  358,  356,  354,  433,  348,  346,
			  345,  379,  344,  433,  342,  340,  382,  339,  433,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   63,   63,  338,   63,   63,  337,   63,   63,
			   63,   63,   63,   63,   63,   79,  331,  327,  326,  303,
			  302,   79,   79,   79,   79,   79,   79,   79,   80,   80,

			  301,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,  101,  101,  101,  101,  101,  101,  142,  142,  300,
			  142,  142,  299,  142,  142,  142,  142,  142,  142,  142,
			   65,   65,  298,   65,   65,  297,   65,   65,   65,   65,
			   65,   65,   65,  184,  184,  296,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,  213,
			  213,  213,  213,  213,  213,  295,  213,  213,  213,  213,
			  213,  213,  480,  480,  480,  480,  480,  480,  294,  480,
			  480,  480,  480,  480,  480,  293,  292,  291,  290,  289,

			  288,  286,  285,  284,  283,  282,  281,  274,  273,  272,
			  143,  266,  260,  251,  244,  238,  237,  226,  224,  208,
			  185,  183,  170,  169,  168,   64,   61,  143,  139,  138,
			  130,  124,  105,  100,   95,   62,   61,  536,    5,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    4,   13,   13,    3,
			    4,   19,    3,    4,    7,   41,    7,    7,   10,   10,
			   19,   20,   47,   20,   20,   10,   10,   21,   10,   22,

			   10,   22,   22,   21,   45,   10,   38,   10,   41,   10,
			   22,   23,   38,   23,   23,   26,   26,   10,   28,   28,
			   33,   47,   10,   10,  150,  150,   30,   43,   30,   45,
			   33,   20,   10,   30,   69,  525,   10,   46,   10,   22,
			   10,   22,   43,   34,   32,   34,   69,   10,   32,   70,
			   75,   23,   30,   30,   32,   34,   30,   32,   35,   73,
			   72,   60,   35,   60,   60,   43,   44,   70,   46,   34,
			   34,   37,   71,   32,   32,   35,   44,   32,   37,   37,
			   32,   40,   77,   53,   37,   53,   53,   74,   75,   35,
			   71,   40,   73,   40,   72,   44,  260,   40,   35,   44,

			   65,   37,   65,   65,   37,   65,   76,   37,  191,  191,
			  102,   75,   40,  102,  503,   86,   86,   40,   40,   72,
			   40,  260,   74,   53,   59,   87,   87,   86,   59,  502,
			   77,   59,   59,   59,   59,  105,  109,   87,  112,  102,
			   59,   76,  103,   90,   90,   59,  115,   59,  107,   59,
			   59,   59,   59,   86,   59,   90,   59,  124,  105,  109,
			   59,  112,   59,   87,  499,   59,   59,   59,   59,   59,
			   59,   81,  115,  103,   81,   81,   81,   81,  498,  107,
			  124,   90,   92,   81,   92,   92,  496,  110,   81,  178,
			   81,  110,   81,   81,   81,   81,  116,   81,   94,   81,

			   94,   94,  113,   81,   91,   81,   91,   91,   81,   81,
			   81,   81,   81,   81,  125,   91,  114,  113,  110,  123,
			  114,  110,   92,  126,  120,  178,  120,  116,  120,  127,
			  132,  123,  180,  113,  180,  495,  134,  125,   94,  120,
			  113,  131,  120,  114,   91,  131,   91,  136,  130,  138,
			  123,  181,  179,  132,  126,  120,  120,  120,  130,  134,
			  127,  130,  120,  130,  130,  120,  135,  131,  140,  140,
			  136,  135,  138,  141,  177,  141,  141,  491,  220,  130,
			  140,  225,  135,  130,  130,  238,  130,  130,  144,  181,
			  144,  144,  179,  458,  227,  224,  144,  135,  177,  208,

			  223,  208,  208,  223,  225,  135,  140,  209,  209,  220,
			  226,  238,  181,  141,  447,  179,  210,  227,  210,  209,
			  228,  210,  210,  211,  211,  212,  224,  212,  444,  177,
			  212,  212,  214,  214,  215,  211,  215,  216,  216,  215,
			  215,  226,  233,  228,  214,  209,  232,  243,  235,  216,
			  245,  217,  251,  217,  217,  218,  233,  218,  218,  210,
			  236,  211,  217,  219,  254,  219,  219,  237,  212,  232,
			  214,  235,  266,  233,  253,  216,  255,  215,  243,  256,
			  237,  245,  251,  236,  258,  263,  276,  254,  268,  268,
			  275,  217,  275,  217,  255,  218,  278,  266,  305,  305,

			  268,  354,  256,  219,  269,  253,  269,  255,  263,  269,
			  269,  271,  271,  271,  441,  258,  439,  255,  276,  304,
			  304,  278,  287,  287,  287,  362,  268,  306,  306,  307,
			  307,  304,  354,  308,  308,  343,  305,  309,  309,  312,
			  312,  311,  311,  329,  276,  308,  310,  269,  310,  309,
			  319,  310,  310,  311,  313,  313,  362,  304,  314,  314,
			  317,  343,  317,  317,  315,  306,  315,  307,  329,  315,
			  315,  308,  322,  319,  323,  309,  326,  312,  328,  311,
			  316,  348,  316,  316,  318,  320,  318,  318,  320,  310,
			  330,  316,  313,  331,  333,  322,  314,  323,  339,  326,

			  317,  328,  341,  320,  320,  345,  351,  315,  352,  355,
			  359,  348,  360,  330,  365,  361,  331,  333,  367,  420,
			  316,  339,  316,  369,  318,  341,  372,  372,  419,  351,
			  413,  345,  355,  393,  352,  360,  373,  373,  372,  411,
			  359,  361,  374,  374,  375,  375,  410,  367,  376,  376,
			  377,  377,  378,  378,  365,  369,  375,  379,  379,  390,
			  376,  380,  380,  393,  372,  381,  381,  382,  382,  386,
			  386,  383,  383,  380,  373,  392,  384,  365,  384,  384,
			  374,  369,  375,  383,  390,  396,  376,  395,  377,  397,
			  378,  405,  399,  423,  400,  379,  417,  412,  392,  380,

			  414,  416,  425,  381,  422,  382,  424,  450,  396,  383,
			  428,  428,  409,  408,  397,  399,  384,  406,  395,  400,
			  412,  423,  405,  414,  416,  429,  429,  417,  427,  422,
			  427,  424,  450,  427,  427,  430,  430,  431,  431,  432,
			  432,  425,  433,  433,  434,  434,  440,  430,  428,  431,
			  423,  435,  435,  436,  436,  437,  434,  437,  438,  438,
			  437,  437,  446,  429,  425,  449,  453,  451,  488,  440,
			  438,  427,  452,  430,  467,  431,  454,  432,  456,  462,
			  433,  463,  434,  466,  465,  468,  469,  469,  449,  435,
			  451,  436,  484,  446,  488,  452,  438,  453,  437,  454,

			  470,  470,  462,  456,  471,  471,  463,  465,  466,  472,
			  468,  472,  404,  467,  472,  472,  473,  484,  473,  474,
			  474,  473,  473,  486,  469,  475,  475,  476,  476,  477,
			  477,  478,  478,  479,  479,  482,  467,  482,  470,  476,
			  482,  482,  471,  481,  481,  487,  483,  483,  494,  501,
			  504,  504,  472,  402,  486,  481,  401,  474,  483,  473,
			  505,  505,  394,  475,  520,  476,  389,  477,  371,  478,
			  356,  479,  353,  494,  506,  506,  487,  350,  482,  507,
			  507,  481,  349,  501,  483,  508,  508,  520,  504,  509,
			  509,  510,  347,  510,  511,  511,  510,  510,  505,  512,

			  512,  513,  513,  514,  514,  528,  528,  340,  501,  529,
			  529,  512,  506,  530,  530,  531,  531,  507,  532,  532,
			  535,  535,  338,  508,  337,  336,  335,  509,  332,  327,
			  325,  324,  511,  321,  510,  280,  277,  512,  265,  513,
			  264,  514,  262,  528,  261,  259,  257,  529,  252,  250,
			  248,  530,  246,  531,  244,  242,  532,  241,  535,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  538,  538,  240,  538,  538,  239,  538,  538,
			  538,  538,  538,  538,  538,  539,  234,  230,  229,  207,
			  206,  539,  539,  539,  539,  539,  539,  539,  540,  540,

			  205,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  541,  541,  541,  541,  541,  541,  542,  542,  204,
			  542,  542,  203,  542,  542,  542,  542,  542,  542,  542,
			  543,  543,  202,  543,  543,  201,  543,  543,  543,  543,
			  543,  543,  543,  544,  544,  200,  544,  544,  544,  544,
			  544,  544,  544,  544,  544,  544,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  545,  545,  545,  546,
			  546,  546,  546,  546,  546,  199,  546,  546,  546,  546,
			  546,  546,  547,  547,  547,  547,  547,  547,  198,  547,
			  547,  547,  547,  547,  547,  197,  196,  195,  194,  193,

			  192,  190,  189,  188,  187,  186,  182,  176,  174,  172,
			  142,  137,  133,  129,  122,  119,  117,  108,  106,   83,
			   80,   78,   68,   67,   66,   63,   61,   56,   50,   48,
			   42,   39,   31,   29,   24,    9,    8,    5,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,

			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    0,    0,   72,   73, 1137, 1138,   82, 1133, 1129,
			   81,    0, 1138,   67, 1138, 1138, 1138, 1138, 1138,   64,
			   73,   78,   81,   93, 1109, 1138,   91, 1138,   93, 1108,
			   87, 1096,  109,   88,  104,  130,    0,  138,   70, 1089,
			  152,   40, 1098,   95,  131,   63,  109,   57, 1087, 1138,
			 1073, 1138, 1138,  165, 1138, 1138, 1120, 1138, 1138,  221,
			  159, 1123, 1138, 1118, 1138,  198, 1117, 1116, 1115,  127,
			  142,  165,  153,  152,  180,  143,  199,  175, 1114,    0,
			 1109,  264,    0, 1116, 1138, 1138,  195,  205, 1138, 1138,
			  223,  286,  264, 1138,  280, 1138, 1138, 1138, 1138, 1138,

			 1138,    0,  174,  211,    0,  188, 1086,  220, 1085,  191,
			  258,    0,  192,  271,  273,  207,  268, 1074,    0, 1072,
			  293,    0, 1076,  289,  210,  268,  292,  299,    0, 1081,
			  317,  302,  285, 1080,  288,  335,  302, 1079,  304, 1138,
			  348,  355, 1103, 1138,  386, 1138, 1138, 1138, 1138, 1138,
			  104, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138,
			 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138,
			 1138, 1138, 1102, 1138, 1101, 1138, 1100,  367,  282,  345,
			  327,  344, 1099, 1138, 1138, 1138, 1094, 1093, 1092, 1091,
			 1090,  188, 1089, 1088, 1087, 1086, 1085, 1084, 1077, 1064,

			 1034, 1024, 1021, 1011, 1008,  989,  979,  978,  397,  387,
			  401,  403,  410, 1138,  412,  419,  417,  433,  437,  445,
			  350,    0,    0,  398,  365,  335,  382,  349,  372,  956,
			  955,    0,  398,  414,  954,  402,  413,  427,  346,  945,
			  938,  925,  912,  419,  922,  422,  909,    0,  908,    0,
			  917,  419,  916,  446,  416,  446,  434,  914,  456,  909,
			  155,  912,  910,  441,  904,  902,  431,    0,  468,  489,
			 1138,  492, 1138, 1138, 1138,  485,  479,  929,  489, 1138,
			  928, 1138, 1138, 1138, 1138, 1138, 1138,  503, 1138, 1138,
			 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138, 1138,

			 1138, 1138, 1138, 1138,  499,  478,  507,  509,  513,  517,
			  531,  521,  519,  534,  538,  549,  562,  542,  566,  504,
			  583,  895,  526,  527,  899,  896,  531,  893,  533,  502,
			  545,  548,  896,  546,    0,  894,  889,  873,  871,  553,
			  875,  557,    0,  496,    0,  566,    0,  856,  548,  842,
			  841,  558,  569,  820,  471,  564,  827,    0,    0,  577,
			  564,  576,  497,    0, 1138,  607, 1138,  611, 1138,  616,
			 1138,  857,  606,  616,  622,  624,  628,  630,  632,  637,
			  641,  645,  647,  651,  658,    0,  649,    0,    0,  830,
			  618,    0,  630,  600,  830,  656,  638,  648,    0,  647,

			  653,  824,  817,    0,  776,  661,  681,    0,  681,  661,
			  610,  607,  652,  598,  653,    0,  654,  668,    0,  592,
			  587,    0,  663,  686,  699,  695, 1138,  713,  690,  705,
			  715,  717,  719,  722,  724,  731,  733,  740,  738,  474,
			  699,  482,    0,    0,  396,    0,  734,  382,    0,  719,
			  666,  720,  725,  738,  729,    0,  737,    0,  361,    0,
			    0,    0,  732,  740,    0,  737,  776,  767,  778,  766,
			  780,  784,  794,  801,  799,  805,  807,  809,  811,  813,
			 1138,  823,  820,  826,  751,    0,  792,  814,  729,    0,
			    0,  343,    0,    0,  807,  303,  254,    0,  246,  232,

			    0,  842,  222,  207,  830,  840,  854,  859,  865,  869,
			  876,  874,  879,  881,  883,    0,    0,    0,    0,    0,
			  817,    0,    0,    0,    0,  128, 1138, 1138,  885,  889,
			  893,  895,  898,    0, 1138,  900, 1138,  958,  971,  984,
			  997, 1003, 1016, 1029, 1042, 1055, 1068, 1081>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,  536,    1,  537,  537,  536,  536,  536,  536,  536,
			  538,  539,  536,  540,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  536,
			  536,  536,  536,  536,  536,  536,  542,  536,  536,  536,
			  536,  536,  536,  538,  536,  543,  538,  538,  538,  538,
			  538,  538,  538,  538,  538,  538,  538,  538,  538,  539,
			  544,  544,  544,  545,  536,  536,  536,  536,  536,  536,
			  546,  536,  536,  536,  536,  536,  536,  536,  536,  536,

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
			  536,  536,  536,  546,  536,  541,  536,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,

			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  538,  538,  538,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  536,  536,  536,  547,  541,
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
			  536,  536,  536,  536,  536,  536,  536,  536>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,   10,    8,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   21,   21,   21,   21,   21,   21,   21,   21,   22,   23,
			   24,   25,   26,   27,    8,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   49,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,    1,   59,   60,   61,

			   62,   32,   63,   34,   64,   36,   37,   38,   65,   40,
			   66,   42,   43,   67,   68,   69,   70,   71,   72,   50,
			   51,   52,   53,   73,    8,   74,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    2,    3,    2,    4,    1,    5,    1,    1,
			    6,    1,    1,    1,    1,    1,    1,    1,    7,    1,
			    8,    9,    1,    1,    1,    1,    1,    1,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,   10,   11,    1,    1,    1,    1,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,   12,   13,    1,    1>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
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

	yyJam_base: INTEGER is 1138
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

	yyNb_rules: INTEGER is 185
			-- Number of rules

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
			eif_buffer := STRING_.make (Init_buffer_size)
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
				is_operator := False
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
