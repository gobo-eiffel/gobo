indexing

	description:

		"Scanners for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
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
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM

creation

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
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
--|#line 45
-- Ignore separators
else
--|#line 46
eif_lineno := eif_lineno + text_count
end
else
--|#line 51
-- Ignore comments
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 52
eif_lineno := eif_lineno + 1
else
--|#line 57
last_token := Minus_code
end
else
--|#line 58
last_token := Plus_code
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 59
last_token := Star_code
else
--|#line 60
last_token := Slash_code
end
else
--|#line 61
last_token := Caret_code
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 62
last_token := Equal_code
else
--|#line 63
last_token := Greater_than_code
end
else
--|#line 64
last_token := Less_than_code
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 65
last_token := Dot_code
else
--|#line 66
last_token := Semicolon_code
end
else
--|#line 67
last_token := Comma_code
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 68
last_token := Colon_code
else
--|#line 69
last_token := Exclamation_code
end
else
--|#line 70
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 71
last_token := Right_parenthesis_code
else
--|#line 72
last_token := Left_brace_code
end
else
--|#line 73
last_token := Right_brace_code
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 74
last_token := Left_bracket_code
else
--|#line 75
last_token := Right_bracket_code
end
else
--|#line 76
last_token := Dollar_code
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
--|#line 77
last_token := E_DIV
else
--|#line 78
last_token := E_MOD
end
else
--|#line 79
last_token := E_NE
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 80
last_token := E_GE
else
--|#line 81
last_token := E_LE
end
else
--|#line 82
last_token := E_BANGBANG
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 83
last_token := E_ARROW
else
--|#line 84
last_token := E_DOTDOT
end
else
--|#line 85
last_token := E_LARRAY
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 86
last_token := E_RARRAY
else
--|#line 87
last_token := E_ASSIGN
end
else
--|#line 88
last_token := E_REVERSE
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 93
last_token := E_ALIAS
else
--|#line 94
last_token := E_ALL
end
else
--|#line 95
last_token := E_AND
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 96
last_token := E_AS
else
--|#line 97
last_token := E_BITTYPE
end
else
--|#line 98
last_token := E_CHECK
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 99
last_token := E_CLASS
else
--|#line 100
last_token := E_CREATION
end
else
--|#line 101
last_token := E_CURRENT
end
else
if yy_act = 46 then
--|#line 102
last_token := E_DEBUG
else
--|#line 103
last_token := E_DEFERRED
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
--|#line 104
last_token := E_DO
else
--|#line 105
last_token := E_ELSE
end
else
--|#line 106
last_token := E_ELSEIF
end
else
if yy_act <= 52 then
if yy_act = 51 then
--|#line 107
last_token := E_END
else
--|#line 108
last_token := E_ENSURE
end
else
--|#line 109
last_token := E_EXPANDED
end
end
else
if yy_act <= 56 then
if yy_act <= 55 then
if yy_act = 54 then
--|#line 110
last_token := E_EXPORT
else
--|#line 111
last_token := E_EXTERNAL
end
else
--|#line 112
last_token := E_FALSE
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 113
last_token := E_FEATURE
else
--|#line 114
last_token := E_FROM
end
else
--|#line 115
last_token := E_FROZEN
end
end
end
else
if yy_act <= 65 then
if yy_act <= 62 then
if yy_act <= 61 then
if yy_act = 60 then
--|#line 116
last_token := E_IF
else
--|#line 117
last_token := E_IMPLIES
end
else
--|#line 118
last_token := E_INDEXING
end
else
if yy_act <= 64 then
if yy_act = 63 then
--|#line 119

										is_operator := True
										last_token := E_INFIX
									
else
--|#line 123
last_token := E_INHERIT
end
else
--|#line 124
last_token := E_INSPECT
end
end
else
if yy_act <= 68 then
if yy_act <= 67 then
if yy_act = 66 then
--|#line 125
last_token := E_INVARIANT
else
--|#line 126
last_token := E_IS
end
else
--|#line 127
last_token := E_LIKE
end
else
if yy_act = 69 then
--|#line 128
last_token := E_LOCAL
else
--|#line 129
last_token := E_LOOP
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
--|#line 130
last_token := E_NOT
else
--|#line 131
last_token := E_OBSOLETE
end
else
--|#line 132
last_token := E_OLD
end
else
if yy_act <= 75 then
if yy_act = 74 then
--|#line 133
last_token := E_ONCE
else
--|#line 134
last_token := E_OR
end
else
--|#line 135
last_token := E_PRECURSOR
end
end
else
if yy_act <= 79 then
if yy_act <= 78 then
if yy_act = 77 then
--|#line 136

										is_operator := True
										last_token := E_PREFIX
									
else
--|#line 140
last_token := E_REDEFINE
end
else
--|#line 141
last_token := E_RENAME
end
else
if yy_act <= 81 then
if yy_act = 80 then
--|#line 142
last_token := E_REQUIRE
else
--|#line 143
last_token := E_RESCUE
end
else
--|#line 144
last_token := E_RESULT
end
end
end
else
if yy_act <= 88 then
if yy_act <= 85 then
if yy_act <= 84 then
if yy_act = 83 then
--|#line 145
last_token := E_RETRY
else
--|#line 146
last_token := E_SELECT
end
else
--|#line 147
last_token := E_SEPARATE
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 148
last_token := E_STRIP
else
--|#line 149
last_token := E_THEN
end
else
--|#line 150
last_token := E_TRUE
end
end
else
if yy_act <= 91 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 151
last_token := E_UNDEFINE
else
--|#line 152
last_token := E_UNIQUE
end
else
--|#line 153
last_token := E_UNTIL
end
else
if yy_act = 92 then
--|#line 154
last_token := E_VARIANT
else
--|#line 155
last_token := E_WHEN
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
--|#line 156
last_token := E_XOR
else
--|#line 161

				last_token := E_IDENTIFIER
				last_value := text
			
end
else
--|#line 169

				last_token := E_FREEOP
				last_value := text
			
end
else
if yy_act <= 98 then
if yy_act = 97 then
--|#line 180
last_token := E_CHARACTER; last_value := text_item (2)
else
--|#line 183
last_token := E_CHARACTER; last_value := '%''
end
else
--|#line 184
last_token := E_CHARACTER; last_value := '%A'
end
end
else
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
--|#line 185
last_token := E_CHARACTER; last_value := '%B'
else
--|#line 186
last_token := E_CHARACTER; last_value := '%C'
end
else
--|#line 187
last_token := E_CHARACTER; last_value := '%D'
end
else
if yy_act <= 104 then
if yy_act = 103 then
--|#line 188
last_token := E_CHARACTER; last_value := '%F'
else
--|#line 189
last_token := E_CHARACTER; last_value := '%H'
end
else
--|#line 190
last_token := E_CHARACTER; last_value := '%L'
end
end
end
else
if yy_act <= 111 then
if yy_act <= 108 then
if yy_act <= 107 then
if yy_act = 106 then
--|#line 191
last_token := E_CHARACTER; last_value := '%N'
else
--|#line 192
last_token := E_CHARACTER; last_value := '%Q'
end
else
--|#line 193
last_token := E_CHARACTER; last_value := '%R'
end
else
if yy_act <= 110 then
if yy_act = 109 then
--|#line 194
last_token := E_CHARACTER; last_value := '%S'
else
--|#line 195
last_token := E_CHARACTER; last_value := '%T'
end
else
--|#line 196
last_token := E_CHARACTER; last_value := '%U'
end
end
else
if yy_act <= 114 then
if yy_act <= 113 then
if yy_act = 112 then
--|#line 197
last_token := E_CHARACTER; last_value := '%V'
else
--|#line 198
last_token := E_CHARACTER; last_value := '%%'
end
else
--|#line 199
last_token := E_CHARACTER; last_value := '%''
end
else
if yy_act = 115 then
--|#line 200
last_token := E_CHARACTER; last_value := '%"'
else
--|#line 201
last_token := E_CHARACTER; last_value := '%('
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
--|#line 202
last_token := E_CHARACTER; last_value := '%)'
else
--|#line 203
last_token := E_CHARACTER; last_value := '%<'
end
else
--|#line 204
last_token := E_CHARACTER; last_value := '%>'
end
else
if yy_act <= 121 then
if yy_act = 120 then
--|#line 205

						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > Platform.Maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_value := INTEGER_.to_character (code_)
						end
					
else
--|#line 216
last_token := E_CHARACTER; last_value := text_item (3)
end
else
--|#line 218
last_token := E_CHARERR	-- Catch-all rules (no backing up)
end
end
else
if yy_act <= 125 then
if yy_act <= 124 then
if yy_act = 123 then
--|#line 219
last_token := E_CHARERR	-- Catch-all rules (no backing up)
else
--|#line 224
last_token := process_operator (E_STRPLUS)
end
else
--|#line 225
last_token := process_operator (E_STRMINUS)
end
else
if yy_act <= 127 then
if yy_act = 126 then
--|#line 226
last_token := process_operator (E_STRSTAR)
else
--|#line 227
last_token := process_operator (E_STRSLASH)
end
else
--|#line 228
last_token := process_operator (E_STRDIV)
end
end
end
else
if yy_act <= 134 then
if yy_act <= 131 then
if yy_act <= 130 then
if yy_act = 129 then
--|#line 229
last_token := process_operator (E_STRMOD)
else
--|#line 230
last_token := process_operator (E_STRPOWER)
end
else
--|#line 231
last_token := process_operator (E_STRLT)
end
else
if yy_act <= 133 then
if yy_act = 132 then
--|#line 232
last_token := process_operator (E_STRLE)
else
--|#line 233
last_token := process_operator (E_STRGT)
end
else
--|#line 234
last_token := process_operator (E_STRGE)
end
end
else
if yy_act <= 137 then
if yy_act <= 136 then
if yy_act = 135 then
--|#line 235
last_token := process_operator (E_STRNOT)
else
--|#line 236
last_token := process_operator (E_STRAND)
end
else
--|#line 237
last_token := process_operator (E_STROR)
end
else
if yy_act = 138 then
--|#line 238
last_token := process_operator (E_STRXOR)
else
--|#line 239
last_token := process_operator (E_STRANDTHEN)
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
--|#line 240
last_token := process_operator (E_STRORELSE)
else
--|#line 241
last_token := process_operator (E_STRIMPLIES)
end
else
--|#line 242

			if is_operator then
				is_operator := False
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_value := text_substring (2, text_count - 1)
		
end
else
if yy_act <= 144 then
if yy_act = 143 then
--|#line 251

				last_token := E_STRING
				last_value := text_substring (2, text_count - 1)
			
else
--|#line 255

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
--|#line 261
eif_buffer.append_string (text)
end
end
else
if yy_act <= 148 then
if yy_act <= 147 then
if yy_act = 146 then
--|#line 262
eif_buffer.append_character ('%A')
else
--|#line 263
eif_buffer.append_character ('%B')
end
else
--|#line 264
eif_buffer.append_character ('%C')
end
else
if yy_act <= 150 then
if yy_act = 149 then
--|#line 265
eif_buffer.append_character ('%D')
else
--|#line 266
eif_buffer.append_character ('%F')
end
else
--|#line 267
eif_buffer.append_character ('%H')
end
end
end
else
if yy_act <= 157 then
if yy_act <= 154 then
if yy_act <= 153 then
if yy_act = 152 then
--|#line 268
eif_buffer.append_character ('%L')
else
--|#line 269
eif_buffer.append_character ('%N')
end
else
--|#line 270
eif_buffer.append_character ('%Q')
end
else
if yy_act <= 156 then
if yy_act = 155 then
--|#line 271
eif_buffer.append_character ('%R')
else
--|#line 272
eif_buffer.append_character ('%S')
end
else
--|#line 273
eif_buffer.append_character ('%T')
end
end
else
if yy_act <= 160 then
if yy_act <= 159 then
if yy_act = 158 then
--|#line 274
eif_buffer.append_character ('%U')
else
--|#line 275
eif_buffer.append_character ('%V')
end
else
--|#line 276
eif_buffer.append_character ('%%')
end
else
if yy_act = 161 then
--|#line 277
eif_buffer.append_character ('%'')
else
--|#line 278
eif_buffer.append_character ('%"')
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
--|#line 279
eif_buffer.append_character ('%(')
else
--|#line 280
eif_buffer.append_character ('%)')
end
else
--|#line 281
eif_buffer.append_character ('%<')
end
else
if yy_act <= 167 then
if yy_act = 166 then
--|#line 282
eif_buffer.append_character ('%>')
else
--|#line 283

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
end
else
--|#line 296
eif_lineno := eif_lineno + 1
end
end
else
if yy_act <= 171 then
if yy_act <= 170 then
if yy_act = 169 then
--|#line 297

			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := STRING_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_value := str_
			set_start_condition (INITIAL)
		
else
--|#line 310
eif_buffer.append_character (text_item (2))
end
else
--|#line 312
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
if yy_act <= 173 then
if yy_act = 172 then
--|#line 313
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 314
	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						
end
else
--|#line 323
last_token := E_BIT; last_value := text
end
end
end
else
if yy_act <= 180 then
if yy_act <= 177 then
if yy_act <= 176 then
if yy_act = 175 then
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
else
if yy_act <= 179 then
if yy_act = 178 then
	yy_position := yy_position - 1
--|#line 351

						last_token := E_REAL
						last_value := text.to_double
					
else
--|#line 352

						last_token := E_REAL
						last_value := text.to_double
					
end
else
--|#line 353

						last_token := E_REAL
						last_value := text.to_double
					
end
end
else
if yy_act <= 183 then
if yy_act <= 182 then
if yy_act = 181 then
	yy_position := yy_position - 1
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
if yy_act = 184 then
--|#line 381
last_token := text_item (1).code
else
--|#line 0
last_token := yyError_token
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

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    6,    7,    8,    7,    9,   10,   11,   12,    6,
			   13,   14,   15,   16,   17,   18,   19,   20,   21,   22,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   36,   37,   36,   36,   38,   36,
			   39,   40,   41,   36,   42,   43,   44,   45,   46,   47,
			   48,   36,   36,   49,   50,   51,   52,   53,   30,   31,
			   32,   33,   35,   36,   38,   39,   36,   42,   43,   44,
			   45,   46,   54,   55,   57,   57,  173,   58,   58,  429,
			   59,   59,   60,  533,   60,   64,   65,   81,   82,   83,
			   87,  109,   66,   67,  174,   68,   88,   69,   84,   95,

			   96,  110,   70,  121,   71,   85,   72,   86,   86,  122,
			   89,  135,   90,   91,   73,   89,  130,   91,   91,   74,
			   75,   92,   97,   98,   60,  128,   60,   64,  132,   76,
			  378,  131,  101,   77,  102,   78,  105,   72,  133,  103,
			  106,  111,  135,  112,   74,  136,  107,  114,  128,  108,
			   93,  115,   92,  113,  131,   93,  134,  132,  101,  102,
			  178,  133,  103,  117,  116,  105,  106,  111,  112,  107,
			  118,  119,  108,  124,  136,   64,  120,  175,  114,  139,
			  139,  134,   63,  125,   63,  126,  167,  116,  171,  127,
			   64,  371,   64,  117,   64,  176,  119,   64,  223,  120,

			  172,  525,  215,  215,  124,  270,  270,  227,  230,  125,
			  126,  222,  127,  180,  216,  219,  219,  139,  143,  144,
			  143,  223,  145,  524,  177,  146,  147,  148,  149,  179,
			  227,  230,  181,  354,  150,   89,  180,  218,  218,  151,
			  182,  152,  222,  153,  154,  155,  156,  225,  157,  177,
			  158,  360,  220,  139,  159,  221,  160,  247,  354,  161,
			  162,  163,  164,  165,  166,  187,  235,  522,  188,  189,
			  190,  191,  521,  211,  211,   93,  360,  192,  225,  228,
			  247,  221,  193,  229,  194,  212,  195,  196,  197,  198,
			  233,  199,  235,  200,  234,  236,  248,  201,   89,  202,

			  217,  218,  203,  204,  205,  206,  207,  208,  231,   92,
			  228,  213,  239,  229,  240,  330,  241,  234,  249,  248,
			  245,  250,  277,  232,  278,  259,  236,  242,  331,  257,
			  243,  261,  246,  258,   64,  265,  267,   64,   93,  231,
			   92,  139,  139,  239,  240,  241,  232,  252,  259,  249,
			  242,  245,  250,  243,  261,  257,  262,  253,  265,  267,
			  254,  263,  255,  256,  268,  144,  268,  144,   64,  144,
			  275,   64,  264,  210,  269,  210,  520,  276,  252,  139,
			  281,  519,  253,  254,  316,  255,  256,  262,  518,  287,
			  287,  516,  274,  304,  304,  264,  305,   64,  305,  317,

			  276,  306,  306,  307,  307,  212,  308,  308,  311,  279,
			  311,  315,  315,  312,  312,  316,  318,   89,  309,  313,
			  314,  319,   89,  274,  314,  314,  420,  320,   92,  325,
			  317,  213,  279,  321,  337,  324,  494,  339,  328,  318,
			  329,  332,  343,  326,  310,  344,  346,  347,  348,  139,
			  320,  350,  319,  352,  485,  357,  321,   93,  324,   92,
			  325,  328,   93,  329,   64,  337,  349,  332,  339,  362,
			  347,  363,   64,  343,  350,  344,  483,  346,  357,  348,
			  268,  144,  268,  482,  352,  361,  270,  270,  480,  349,
			  368,  287,  287,  369,  369,  461,  364,  366,  306,  306,

			  370,  370,  372,  372,  460,  212,  373,  373,  374,  390,
			  374,  376,  376,  375,  375,  312,  312,  381,  309,  377,
			  377,  379,  364,  313,  314,  379,  383,  314,  314,  380,
			  380,  213,   92,  384,  390,  387,  389,  391,  371,  392,
			  381,  394,   64,  399,  310,  401,  402,  403,  404,  383,
			  406,  409,  410,  412,  413,  415,  384,  378,  387,  389,
			  391,  139,  392,   92,  394,  139,  399,  139,  401,  416,
			  417,  404,  402,  403,  409,  418,   64,  413,  410,  456,
			  406,  454,  419,  453,  412,  415,  369,  369,  424,  424,
			  425,  425,  416,  426,  426,  438,  417,  436,  423,  427,

			  427,  375,  375,  428,  428,  419,  418,  437,  421,  430,
			  430,  309,  431,  431,  432,  432,  427,  427,  434,  441,
			  139,  139,  436,  440,  442,  438,  371,   64,  433,  443,
			  437,  444,  448,  459,  421,  462,  451,  310,  455,  457,
			   64,  429,  441,  458,   64,  468,  468,  467,  467,  442,
			  378,  469,  443,  481,  440,  463,  444,  452,   93,  451,
			  462,  455,  457,  448,  459,  464,  458,  466,  484,  466,
			  427,  427,  467,  467,  471,  471,  481,  213,  472,  472,
			  473,  473,  470,  465,  463,  371,  474,  474,  475,  475,
			  476,  486,  476,  478,  478,  474,  474,  487,  488,  484,

			  489,  490,  491,  492,  493,  479,  465,  495,  496,   64,
			   64,  497,  429,   64,  486,  467,  467,  467,  467,  501,
			  501,  488,  487,  489,  378,  491,  492,  505,  505,  493,
			  495,  507,  490,  496,  497,  498,  515,  502,  500,  502,
			  506,  506,  503,  503,  504,  513,  504,  512,  499,  505,
			  505,  474,  474,  508,  508,  474,  474,  310,  509,  509,
			  514,  510,  515,  510,  517,  429,  511,  511,   64,  531,
			  507,  499,  512,  503,  503,  450,  513,  526,  526,  505,
			  505,  505,  505,  527,  527,  473,  473,  532,  528,  517,
			  528,  514,  531,  529,  529,  449,  310,  507,  511,  511,

			  530,  530,  523,  501,  501,  529,  529,  534,  534,  447,
			  532,  508,  508,  527,  527,  371,  100,  100,  100,  100,
			  100,  100,   79,  310,  446,  445,  439,  523,   79,   79,
			   79,   79,   79,   79,   79,  435,  422,  414,  378,  411,
			  408,  371,  407,  405,  400,  429,  398,  397,  396,  378,
			  395,  429,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   63,   63,  393,   63,   63,
			  388,   63,   63,   63,   63,   63,   63,   63,   80,   80,
			  386,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,  140,  140,  385,  140,  140,  382,  140,  140,  140,

			  140,  140,  140,  140,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,   65,   65,  367,
			   65,   65,  365,   65,   65,   65,   65,   65,   65,   65,
			  184,  184,  359,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  186,  186,  358,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,  214,
			  214,  214,  214,  214,  214,  356,  214,  214,  214,  214,
			  214,  214,  477,  477,  477,  477,  477,  477,  355,  477,
			  477,  477,  477,  477,  477,  353,  351,  345,  342,  341,

			  340,  338,  336,  335,  334,  333,  327,  323,  322,  303,
			  302,  301,  300,  299,  298,  297,  296,  295,  294,  293,
			  292,  291,  290,  289,  288,  286,  285,  284,  283,  282,
			  281,  280,  273,  272,  271,  141,  266,  260,  251,  244,
			  238,  237,  226,  224,  210,  209,  185,  183,  170,  169,
			  168,   64,   61,  141,  138,  137,  129,  123,  104,   99,
			   94,   62,   61,  535,    5,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,

			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    4,   70,    3,    4,  527,
			    3,    4,    7,  523,    7,   10,   10,   13,   13,   19,
			   21,   33,   10,   10,   70,   10,   21,   10,   19,   26,

			   26,   33,   10,   38,   10,   20,   10,   20,   20,   38,
			   22,   46,   22,   22,   10,   23,   43,   23,   23,   10,
			   10,   22,   28,   28,   60,   41,   60,   73,   44,   10,
			  508,   43,   30,   10,   30,   10,   32,   10,   44,   30,
			   32,   34,   46,   34,   10,   47,   32,   35,   41,   32,
			   22,   35,   22,   34,   43,   23,   45,   44,   30,   30,
			   73,   44,   30,   37,   35,   32,   32,   34,   34,   32,
			   37,   37,   32,   40,   47,   75,   37,   71,   35,   53,
			   53,   45,   65,   40,   65,   40,   65,   35,   69,   40,
			   72,  501,   77,   37,   74,   71,   37,   76,  104,   37,

			   69,  500,   89,   89,   40,  150,  150,  108,  111,   40,
			   40,  102,   40,   75,   89,   93,   93,   53,   59,   59,
			   59,  104,   59,  499,   72,   59,   59,   59,   59,   74,
			  108,  111,   76,  260,   59,   91,   75,   91,   91,   59,
			   77,   59,  102,   59,   59,   59,   59,  106,   59,   72,
			   59,  266,  101,   93,   59,  101,   59,  123,  260,   59,
			   59,   59,   59,   59,   59,   81,  114,  496,   81,   81,
			   81,   81,  495,   86,   86,   91,  266,   81,  106,  109,
			  123,  101,   81,  109,   81,   86,   81,   81,   81,   81,
			  113,   81,  114,   81,  113,  115,  124,   81,   90,   81,

			   90,   90,   81,   81,   81,   81,   81,   81,  112,   90,
			  109,   86,  119,  109,  119,  237,  119,  113,  125,  124,
			  122,  126,  180,  112,  180,  131,  115,  119,  237,  130,
			  119,  133,  122,  130,  178,  135,  137,  179,   90,  112,
			   90,  139,  139,  119,  119,  119,  112,  129,  131,  125,
			  119,  122,  126,  119,  133,  130,  134,  129,  135,  137,
			  129,  134,  129,  129,  143,  143,  143,  144,  177,  144,
			  178,  181,  134,  210,  144,  210,  493,  179,  129,  139,
			  192,  492,  129,  129,  220,  129,  129,  134,  491,  192,
			  192,  487,  177,  211,  211,  134,  212,  364,  212,  224,

			  179,  212,  212,  213,  213,  211,  215,  215,  216,  181,
			  216,  219,  219,  216,  216,  220,  225,  217,  215,  217,
			  217,  226,  218,  177,  218,  218,  364,  227,  217,  233,
			  224,  211,  181,  228,  243,  232,  455,  245,  235,  225,
			  236,  238,  251,  233,  215,  251,  253,  254,  255,  219,
			  227,  256,  226,  258,  443,  263,  228,  217,  232,  217,
			  233,  235,  218,  236,  275,  243,  255,  238,  245,  274,
			  254,  274,  277,  251,  256,  251,  440,  253,  263,  255,
			  268,  268,  268,  437,  258,  270,  270,  270,  435,  255,
			  287,  287,  287,  304,  304,  416,  275,  277,  305,  305,

			  306,  306,  307,  307,  415,  304,  308,  308,  309,  325,
			  309,  310,  310,  309,  309,  311,  311,  316,  308,  312,
			  312,  313,  275,  313,  313,  314,  318,  314,  314,  315,
			  315,  304,  313,  319,  325,  322,  324,  326,  306,  327,
			  316,  329,  362,  335,  308,  337,  339,  341,  343,  318,
			  345,  348,  349,  351,  352,  356,  319,  312,  322,  324,
			  326,  313,  327,  313,  329,  314,  335,  315,  337,  357,
			  358,  343,  339,  341,  348,  359,  366,  352,  349,  409,
			  345,  407,  362,  406,  351,  356,  369,  369,  370,  370,
			  371,  371,  357,  372,  372,  388,  358,  385,  369,  373,

			  373,  374,  374,  375,  375,  362,  359,  387,  366,  376,
			  376,  373,  377,  377,  378,  378,  379,  379,  380,  391,
			  380,  380,  385,  390,  392,  388,  370,  419,  379,  394,
			  387,  395,  400,  413,  366,  418,  404,  373,  408,  410,
			  420,  375,  391,  412,  421,  425,  425,  424,  424,  392,
			  377,  426,  394,  436,  390,  419,  395,  405,  380,  404,
			  418,  408,  410,  400,  413,  420,  412,  423,  442,  423,
			  427,  427,  423,  423,  428,  428,  436,  426,  429,  429,
			  430,  430,  427,  421,  419,  424,  431,  431,  432,  432,
			  433,  445,  433,  434,  434,  433,  433,  446,  447,  442,

			  448,  449,  450,  451,  453,  434,  421,  459,  460,  464,
			  463,  462,  428,  465,  445,  466,  466,  467,  467,  468,
			  468,  447,  446,  448,  431,  450,  451,  471,  471,  453,
			  459,  473,  449,  460,  462,  463,  484,  469,  465,  469,
			  472,  472,  469,  469,  470,  482,  470,  480,  464,  470,
			  470,  474,  474,  475,  475,  476,  476,  473,  478,  478,
			  483,  479,  484,  479,  490,  471,  479,  479,  498,  517,
			  478,  464,  480,  502,  502,  403,  482,  503,  503,  504,
			  504,  505,  505,  506,  506,  509,  509,  519,  507,  490,
			  507,  483,  517,  507,  507,  401,  478,  509,  510,  510,

			  511,  511,  498,  526,  526,  528,  528,  529,  529,  399,
			  519,  530,  530,  534,  534,  503,  540,  540,  540,  540,
			  540,  540,  538,  509,  397,  396,  389,  498,  538,  538,
			  538,  538,  538,  538,  538,  384,  368,  353,  511,  350,
			  347,  526,  346,  344,  336,  529,  334,  333,  332,  530,
			  331,  534,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  536,  537,  537,  328,  537,  537,
			  323,  537,  537,  537,  537,  537,  537,  537,  539,  539,
			  321,  539,  539,  539,  539,  539,  539,  539,  539,  539,
			  539,  541,  541,  320,  541,  541,  317,  541,  541,  541,

			  541,  541,  541,  541,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  543,  543,  279,
			  543,  543,  276,  543,  543,  543,  543,  543,  543,  543,
			  544,  544,  265,  544,  544,  544,  544,  544,  544,  544,
			  544,  544,  544,  545,  545,  264,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  547,
			  547,  547,  547,  547,  547,  262,  547,  547,  547,  547,
			  547,  547,  548,  548,  548,  548,  548,  548,  261,  548,
			  548,  548,  548,  548,  548,  259,  257,  252,  250,  248,

			  246,  244,  242,  241,  240,  239,  234,  230,  229,  208,
			  207,  206,  205,  204,  203,  202,  201,  200,  199,  198,
			  197,  196,  195,  194,  193,  191,  190,  189,  188,  187,
			  186,  182,  176,  174,  172,  140,  136,  132,  128,  121,
			  118,  116,  107,  105,   83,   82,   80,   78,   68,   67,
			   66,   63,   61,   56,   50,   48,   42,   39,   31,   29,
			   24,    9,    8,    5,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,

			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   71,   72, 1063, 1064,   80, 1059, 1056,
			   79,    0, 1064,   78, 1064, 1064, 1064, 1064, 1064,   73,
			   88,   72,   93,   98, 1036, 1064,   76, 1064,   98, 1035,
			   94, 1023,  102,   60,  103,  120,    0,  131,   68, 1016,
			  145,   81, 1025,   85,   94,  116,   84,  111, 1014, 1064,
			 1000, 1064, 1064,  160, 1064, 1064, 1047, 1064, 1064,  216,
			  122, 1049, 1064, 1045, 1064,  180, 1044, 1043, 1042,  182,
			   70,  171,  184,  121,  188,  169,  191,  186, 1041,    0,
			 1036,  259, 1035, 1041, 1064, 1064,  254, 1064, 1064,  183,
			  281,  218, 1064,  196, 1064, 1064, 1064, 1064, 1064, 1064,

			    0,  217,  181,    0,  152, 1012,  220, 1011,  163,  251,
			    0,  163,  278,  248,  228,  268, 1000,    0,  998,  282,
			    0, 1002,  291,  211,  251,  288,  292,    0, 1007,  317,
			  291,  281, 1006,  284,  326,  291, 1005,  292, 1064,  322,
			 1029, 1064, 1064,  362,  365, 1064, 1064, 1064, 1064, 1064,
			  186, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,
			 1064, 1064, 1028, 1064, 1027, 1064, 1026,  362,  328,  331,
			  318,  365, 1025, 1064, 1064, 1064, 1020, 1019, 1018, 1017,
			 1016, 1015,  370, 1014, 1013, 1012, 1011, 1010, 1009, 1008,

			 1007, 1006, 1005, 1004, 1003, 1002, 1001, 1000,  999, 1064,
			  371,  374,  382,  384, 1064,  387,  394,  400,  405,  392,
			  357,    0,    0,    0,  370,  371,  394,  383,  386,  977,
			  976,    0,  388,  402,  975,  393,  394,  276,  403,  974,
			  969,  972,  960,  407,  970,  410,  958,    0,  958,    0,
			  967,  413,  966,  419,  400,  419,  407,  965,  426,  960,
			  193,  957,  944,  412,  910,  897,  211,    0,  478, 1064,
			  467, 1064, 1064, 1064,  465,  458,  916,  466, 1064,  913,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064,  472, 1064, 1064,
			 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064, 1064,

			 1064, 1064, 1064, 1064,  474,  479,  481,  483,  487,  494,
			  492,  496,  500,  504,  508,  510,  472,  859,  481,  487,
			  862,  847,  491,  835,  492,  469,  493,  495,  836,  494,
			    0,  819,  813,  797,  796,  499,  813,  501,    0,  508,
			    0,  509,    0,  501,  808,  518,  803,  805,  504,  514,
			  788,  524,  510,  795,    0,    0,  523,  522,  532,  548,
			    0, 1064,  536, 1064,  391, 1064,  570, 1064,  826,  567,
			  569,  571,  574,  580,  582,  584,  590,  593,  595,  597,
			  601,    0,    0,    0,  800,  557,    0,  563,  563,  795,
			  593,  573,  584,    0,  585,  591,  794,  789,    0,  774,

			  603,  760,    0,  744,  592,  607,  548,  550,  594,  548,
			  593,    0,  597,  606,    0,  469,  464,    0,  595,  621,
			  634,  638, 1064,  653,  628,  626,  620,  651,  655,  659,
			  661,  667,  669,  676,  674,  447,  607,  452,    0,    0,
			  445,    0,  641,  423,    0,  646,  657,  652,  654,  674,
			  656,  658,    0,  664,    0,  405,    0,    0,    0,  661,
			  668,    0,  665,  704,  703,  707,  696,  698,  700,  723,
			  730,  708,  721,  700,  732,  734,  736, 1064,  739,  747,
			  707,    0,  715,  730,  698,    0,    0,  358,    0,    0,
			  724,  357,  340,  345,    0,  241,  236,    0,  762,  217,

			  195,  134,  754,  758,  760,  762,  764,  774,   73,  766,
			  779,  781,    0,    0,    0,    0,    0,  723,    0,  743,
			    0,    0,    0,   77, 1064, 1064,  784,   22,  786,  788,
			  792,    0,    0, 1064,  794, 1064,  851,  864,  821,  877,
			  808,  890,  903,  916,  929,  942,  955,  968,  981>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  535,    1,  536,  536,  535,  535,  535,  535,  535,
			  537,  538,  535,  539,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  535,
			  535,  535,  535,  535,  535,  535,  541,  535,  535,  542,
			  535,  535,  535,  537,  535,  543,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  538,
			  544,  545,  544,  546,  535,  535,  535,  535,  535,  547,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,

			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  535,  535,
			  541,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  537,  535,  537,  535,  537,  537,  537,  537,
			  537,  537,  537,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,

			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  535,  535,
			  535,  535,  535,  535,  537,  537,  537,  537,  535,  537,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,

			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  535,  537,  535,  537,  535,  537,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  547,
			  535,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,

			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  537,
			  537,  537,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  548,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  537,  537,  537,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  537,  537,

			  537,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  535,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  537,  535,  535,  535,  535,  535,  535,
			  535,  540,  540,  535,  535,    0,  535,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  535>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    5,    6,    7,    8,    9,    7,   10,
			   11,   12,   13,   14,   15,   16,   17,   18,   19,   19,
			   20,   20,   20,   20,   20,   20,   20,   20,   21,   22,
			   23,   24,   25,   26,    7,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   47,   48,   49,   50,   51,
			   52,   53,   54,   55,   56,   57,    1,   58,   59,   60,

			   61,   31,   62,   33,   63,   35,   36,   37,   64,   39,
			   65,   41,   42,   66,   67,   68,   69,   70,   71,   49,
			   50,   51,   52,   72,    7,   73,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    1,    5,    1,    1,    6,
			    1,    1,    1,    1,    1,    1,    1,    7,    1,    8,
			    9,    1,    1,    1,    1,    1,    1,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,   10,   11,    1,    1,    1,    1,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			   12,   13,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,  186,  184,    1,    2,   17,
			  144,   96,   24,  184,   18,   19,    7,    6,   15,    5,
			   13,    8,  175,  175,   16,   14,   12,   10,   11,  184,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   22,
			  184,   23,    9,  177,   20,   21,  145,  171,  169,  171,
			    1,    2,   30,  144,  143,  144,  144,  144,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,   96,
			  122,  122,  122,    3,   31,   32,  180,   25,   27,    0,
			  175,  175,  174,  177,   35,   33,   29,   28,   34,   36,

			   95,   95,   95,   40,   95,   95,   95,   95,   95,   95,
			   48,   95,   95,   95,   95,   95,   95,   60,   95,   95,
			   67,   95,   95,   95,   95,   95,   95,   75,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   26,  177,
			  145,  169,  170,  170,  172,  162,  160,  161,  163,  164,
			  170,  165,  166,  146,  147,  148,  149,  150,  151,  152,
			  153,  154,  155,  156,  157,  158,  159,  142,  126,  124,
			  125,  127,  144,  131,  144,  133,  144,  144,  144,  144,
			  144,  144,  144,  130,  122,   97,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  122,

			  122,  122,  122,  122,  122,  122,  122,  122,  122,   98,
			    4,  180,    0,    0,  178,  180,  178,  175,  175,  177,
			   95,   38,   39,   41,   95,   95,   95,   95,   95,   95,
			   95,   51,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   71,   95,   73,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   94,    0,  168,
			  173,  128,  132,  134,  144,  144,  144,  144,  137,  144,
			  129,  121,  115,  113,  114,  116,  117,  123,  118,  119,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,

			  109,  110,  111,  112,  180,    0,  180,    0,  180,    0,
			    0,    0,  179,  175,  175,  177,   95,   95,   95,   95,
			   95,   95,   95,   49,   95,   95,   95,   95,   95,   95,
			   58,   95,   95,   95,   95,   95,   95,   95,   68,   95,
			   70,   95,   74,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   87,   88,   95,   95,   95,   95,
			   93,  167,  144,  136,  144,  135,  144,  138,  123,  180,
			  180,    0,    0,  180,    0,  179,    0,  179,    0,    0,
			  176,   37,   42,   43,   95,   95,   46,   95,   95,   95,
			   95,   95,   95,   56,   95,   95,   95,   95,   63,   95,

			   95,   95,   69,   95,   95,   95,   95,   95,   95,   95,
			   95,   83,   95,   95,   86,   95,   95,   91,   95,  144,
			  144,  144,  120,    0,  180,    0,  183,  180,  179,    0,
			    0,  179,    0,  178,    0,   95,   95,   95,   50,   52,
			   95,   54,   95,   95,   59,   95,   95,   95,   95,   95,
			   95,   95,   77,   95,   79,   95,   81,   82,   84,   95,
			   95,   90,   95,  144,  144,  144,    0,  180,    0,    0,
			    0,  179,    0,  183,  179,    0,    0,  181,  183,  181,
			   95,   45,   95,   95,   95,   57,   61,   95,   64,   65,
			   95,   95,   95,   95,   80,   95,   95,   92,  144,  144,

			  144,  183,    0,  183,    0,  179,    0,    0,  182,  183,
			    0,  182,   44,   47,   53,   55,   62,   95,   72,   95,
			   78,   85,   89,  144,  141,  140,  183,  182,    0,  182,
			  182,   66,   76,  139,  182,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1064
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 535
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 536
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
			make_with_buffer (Empty_buffer)
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
