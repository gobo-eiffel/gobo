indexing

	description:

		"Scanners for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON

creation

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= MSN1)
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
if yy_act <= 96 then
if yy_act <= 48 then
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 32
-- Ignore spaces.
else
yy_set_line (0)
--|#line 33
-- Ignore new-lines.
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 38
-- Ignore comments.
end
else
if yy_act <= 5 then
if yy_act = 4 then
	yy_column := yy_column + 1
--|#line 43
process_one_character_symbol (Minus_code)
else
	yy_column := yy_column + 1
--|#line 44
process_one_character_symbol (Plus_code)
end
else
	yy_column := yy_column + 1
--|#line 45
process_one_character_symbol (Star_code)
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
	yy_column := yy_column + 1
--|#line 46
process_one_character_symbol (Slash_code)
else
	yy_column := yy_column + 1
--|#line 47
process_one_character_symbol (Caret_code)
end
else
	yy_column := yy_column + 1
--|#line 48
process_one_character_symbol (Equal_code)
end
else
if yy_act <= 11 then
if yy_act = 10 then
	yy_column := yy_column + 1
--|#line 49
process_one_character_symbol (Greater_than_code)
else
	yy_column := yy_column + 1
--|#line 50
process_one_character_symbol (Less_than_code)
end
else
	yy_column := yy_column + 1
--|#line 51
process_one_character_symbol (Dot_code)
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
	yy_column := yy_column + 1
--|#line 52
process_one_character_symbol (Semicolon_code)
else
	yy_column := yy_column + 1
--|#line 53
process_one_character_symbol (Comma_code)
end
else
	yy_column := yy_column + 1
--|#line 54
process_one_character_symbol (Colon_code)
end
else
if yy_act <= 17 then
if yy_act = 16 then
	yy_column := yy_column + 1
--|#line 55
process_one_character_symbol (Exclamation_code)
else
	yy_column := yy_column + 1
--|#line 56
process_one_character_symbol (Left_parenthesis_code)
end
else
	yy_column := yy_column + 1
--|#line 57
process_one_character_symbol (Right_parenthesis_code)
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
	yy_column := yy_column + 1
--|#line 58
process_one_character_symbol (Left_brace_code)
else
	yy_column := yy_column + 1
--|#line 59
process_one_character_symbol (Right_brace_code)
end
else
	yy_column := yy_column + 1
--|#line 60
process_one_character_symbol (Left_bracket_code)
end
else
if yy_act <= 23 then
if yy_act = 22 then
	yy_column := yy_column + 1
--|#line 61
process_one_character_symbol (Right_bracket_code)
else
	yy_column := yy_column + 1
--|#line 62
process_one_character_symbol (Dollar_code)
end
else
	yy_column := yy_column + 2
--|#line 63
process_two_character_symbol (E_DIV)
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
	yy_column := yy_column + 2
--|#line 64
process_two_character_symbol (E_MOD)
else
	yy_column := yy_column + 2
--|#line 65
process_two_character_symbol (E_NE)
end
else
	yy_column := yy_column + 2
--|#line 66
process_two_character_symbol (E_GE)
end
else
if yy_act <= 29 then
if yy_act = 28 then
	yy_column := yy_column + 2
--|#line 67
process_two_character_symbol (E_LE)
else
	yy_column := yy_column + 2
--|#line 68
process_two_character_symbol (E_BANGBANG)
end
else
	yy_column := yy_column + 2
--|#line 69
process_two_character_symbol (E_ARROW)
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
	yy_column := yy_column + 2
--|#line 70
process_two_character_symbol (E_DOTDOT)
else
	yy_column := yy_column + 2
--|#line 71
process_two_character_symbol (E_LARRAY)
end
else
	yy_column := yy_column + 2
--|#line 72
process_two_character_symbol (E_RARRAY)
end
else
if yy_act <= 35 then
if yy_act = 34 then
	yy_column := yy_column + 2
--|#line 73
process_two_character_symbol (E_ASSIGN)
else
	yy_column := yy_column + 2
--|#line 74
process_two_character_symbol (E_REVERSE)
end
else
	yy_column := yy_column + 5
--|#line 79

				last_token := E_ALIAS
				last_value := current_position
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
	yy_column := yy_column + 3
--|#line 83

				last_token := E_ALL
				last_value := current_position
			
else
	yy_column := yy_column + 3
--|#line 87

				last_token := E_AND
				last_value := current_position
			
end
else
	yy_column := yy_column + 2
--|#line 91

				last_token := E_AS
				last_value := current_position
			
end
else
if yy_act <= 41 then
if yy_act = 40 then
	yy_column := yy_column + 5
--|#line 95

				last_token := E_CHECK
				last_value := current_position
			
else
	yy_column := yy_column + 5
--|#line 99

				last_token := E_CLASS
				last_value := current_position
			
end
else
	yy_column := yy_column + 6
--|#line 103

				if create_keyword then
					last_token := E_CREATE
					last_value := current_position
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (text)
				end
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
	yy_column := yy_column + 8
--|#line 112

				last_token := E_CREATION
				last_value := current_position
			
else
	yy_column := yy_column + 7
--|#line 116

				last_token := E_CURRENT
				last_value := current_position
			
end
else
	yy_column := yy_column + 5
--|#line 120

				last_token := E_DEBUG
				last_value := current_position
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
	yy_column := yy_column + 8
--|#line 124

				last_token := E_DEFERRED
				last_value := current_position
			
else
	yy_column := yy_column + 2
--|#line 128

				last_token := E_DO
				last_value := current_position
			
end
else
	yy_column := yy_column + 4
--|#line 132

				last_token := E_ELSE
				last_value := current_position
			
end
end
end
end
end
else
if yy_act <= 72 then
if yy_act <= 60 then
if yy_act <= 54 then
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
	yy_column := yy_column + 6
--|#line 136

				last_token := E_ELSEIF
				last_value := current_position
			
else
	yy_column := yy_column + 3
--|#line 140

				last_token := E_END
				last_value := current_position
			
end
else
	yy_column := yy_column + 6
--|#line 144

				last_token := E_ENSURE
				last_value := current_position
			
end
else
if yy_act <= 53 then
if yy_act = 52 then
	yy_column := yy_column + 8
--|#line 148

				last_token := E_EXPANDED
				last_value := current_position
			
else
	yy_column := yy_column + 6
--|#line 152

				last_token := E_EXPORT
				last_value := current_position
			
end
else
	yy_column := yy_column + 8
--|#line 156

				last_token := E_EXTERNAL
				last_value := current_position
			
end
end
else
if yy_act <= 57 then
if yy_act <= 56 then
if yy_act = 55 then
	yy_column := yy_column + 5
--|#line 160

				last_token := E_FALSE
				last_value := new_false_constant
			
else
	yy_column := yy_column + 7
--|#line 164

				last_token := E_FEATURE
				last_value := current_position
			
end
else
	yy_column := yy_column + 4
--|#line 168

				last_token := E_FROM
				last_value := current_position
			
end
else
if yy_act <= 59 then
if yy_act = 58 then
	yy_column := yy_column + 6
--|#line 172

				last_token := E_FROZEN
				last_value := current_position
			
else
	yy_column := yy_column + 2
--|#line 176

				last_token := E_IF
				last_value := current_position
			
end
else
	yy_column := yy_column + 7
--|#line 180

				last_token := E_IMPLIES
				last_value := current_position
			
end
end
end
else
if yy_act <= 66 then
if yy_act <= 63 then
if yy_act <= 62 then
if yy_act = 61 then
	yy_column := yy_column + 8
--|#line 184

				last_token := E_INDEXING
				last_value := current_position
			
else
	yy_column := yy_column + 5
--|#line 188

				last_token := E_INFIX
				last_value := current_position
			
end
else
	yy_column := yy_column + 7
--|#line 192

				last_token := E_INHERIT
				last_value := current_position
			
end
else
if yy_act <= 65 then
if yy_act = 64 then
	yy_column := yy_column + 7
--|#line 196

				last_token := E_INSPECT
				last_value := current_position
			
else
	yy_column := yy_column + 9
--|#line 200

				last_token := E_INVARIANT
				last_value := current_position
			
end
else
	yy_column := yy_column + 2
--|#line 204

				last_token := E_IS
				last_value := current_position
			
end
end
else
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
	yy_column := yy_column + 4
--|#line 208

				last_token := E_LIKE
				last_value := current_position
			
else
	yy_column := yy_column + 5
--|#line 212

				last_token := E_LOCAL
				last_value := current_position
			
end
else
	yy_column := yy_column + 4
--|#line 216

				last_token := E_LOOP
				last_value := current_position
			
end
else
if yy_act <= 71 then
if yy_act = 70 then
	yy_column := yy_column + 3
--|#line 220

				last_token := E_NOT
				last_value := current_position
			
else
	yy_column := yy_column + 8
--|#line 224

				last_token := E_OBSOLETE
				last_value := current_position
			
end
else
	yy_column := yy_column + 3
--|#line 228

				last_token := E_OLD
				last_value := current_position
			
end
end
end
end
else
if yy_act <= 84 then
if yy_act <= 78 then
if yy_act <= 75 then
if yy_act <= 74 then
if yy_act = 73 then
	yy_column := yy_column + 4
--|#line 232

				last_token := E_ONCE
				last_value := current_position
			
else
	yy_column := yy_column + 2
--|#line 236

				last_token := E_OR
				last_value := current_position
			
end
else
	yy_column := yy_column + 9
--|#line 240

				last_token := E_PRECURSOR
				last_value := current_position
			
end
else
if yy_act <= 77 then
if yy_act = 76 then
	yy_column := yy_column + 6
--|#line 244

				last_token := E_PREFIX
				last_value := current_position
			
else
	yy_column := yy_column + 8
--|#line 248

				last_token := E_REDEFINE
				last_value := current_position
			
end
else
	yy_column := yy_column + 6
--|#line 252

				last_token := E_RENAME
				last_value := current_position
			
end
end
else
if yy_act <= 81 then
if yy_act <= 80 then
if yy_act = 79 then
	yy_column := yy_column + 7
--|#line 256

				last_token := E_REQUIRE
				last_value := current_position
			
else
	yy_column := yy_column + 6
--|#line 260

				last_token := E_RESCUE
				last_value := current_position
			
end
else
	yy_column := yy_column + 6
--|#line 264

				last_token := E_RESULT
				last_value := current_position
			
end
else
if yy_act <= 83 then
if yy_act = 82 then
	yy_column := yy_column + 5
--|#line 268

				last_token := E_RETRY
				last_value := current_position
			
else
	yy_column := yy_column + 6
--|#line 272

				last_token := E_SELECT
				last_value := current_position
			
end
else
	yy_column := yy_column + 8
--|#line 276

				last_token := E_SEPARATE
				last_value := current_position
			
end
end
end
else
if yy_act <= 90 then
if yy_act <= 87 then
if yy_act <= 86 then
if yy_act = 85 then
	yy_column := yy_column + 5
--|#line 280

				last_token := E_STRIP
				last_value := current_position
			
else
	yy_column := yy_column + 4
--|#line 284

				last_token := E_THEN
				last_value := current_position
			
end
else
	yy_column := yy_column + 4
--|#line 288

				last_token := E_TRUE
				last_value := new_true_constant
			
end
else
if yy_act <= 89 then
if yy_act = 88 then
	yy_column := yy_column + 8
--|#line 292

				last_token := E_UNDEFINE
				last_value := current_position
			
else
	yy_column := yy_column + 6
--|#line 296

				last_token := E_UNIQUE
				last_value := current_position
			
end
else
	yy_column := yy_column + 5
--|#line 300

				last_token := E_UNTIL
				last_value := current_position
			
end
end
else
if yy_act <= 93 then
if yy_act <= 92 then
if yy_act = 91 then
	yy_column := yy_column + 7
--|#line 304

				last_token := E_VARIANT
				last_value := current_position
			
else
	yy_column := yy_column + 4
--|#line 308

				last_token := E_WHEN
				last_value := current_position
			
end
else
	yy_column := yy_column + 3
--|#line 312

				last_token := E_XOR
				last_value := current_position
			
end
else
if yy_act <= 95 then
if yy_act = 94 then
	yy_column := yy_column + 3
--|#line 320

				last_token := E_BITTYPE
				last_value := new_identifier (text)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 324

				last_token := E_IDENTIFIER
				last_value := new_identifier (text)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 332

				last_token := E_FREEOP
				last_value := new_token (text)
			
end
end
end
end
end
end
else
if yy_act <= 144 then
if yy_act <= 120 then
if yy_act <= 108 then
if yy_act <= 102 then
if yy_act <= 99 then
if yy_act <= 98 then
if yy_act = 97 then
	yy_column := yy_column + 3
--|#line 343

				last_token := E_CHARACTER
				last_value := new_character_constant (text_item (2))
			
else
	yy_column := yy_column + 3
--|#line 347

					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)
				column := column - 1

				last_token := E_CHARACTER
				last_value := new_character_constant ('%'')
			
end
else
	yy_column := yy_column + 4
--|#line 358
process_c2_character_constant ('%A')
end
else
if yy_act <= 101 then
if yy_act = 100 then
	yy_column := yy_column + 4
--|#line 359
process_c2_character_constant ('%B')
else
	yy_column := yy_column + 4
--|#line 360
process_c2_character_constant ('%C')
end
else
	yy_column := yy_column + 4
--|#line 361
process_c2_character_constant ('%D')
end
end
else
if yy_act <= 105 then
if yy_act <= 104 then
if yy_act = 103 then
	yy_column := yy_column + 4
--|#line 362
process_c2_character_constant ('%F')
else
	yy_column := yy_column + 4
--|#line 363
process_c2_character_constant ('%H')
end
else
	yy_column := yy_column + 4
--|#line 364
process_c2_character_constant ('%L')
end
else
if yy_act <= 107 then
if yy_act = 106 then
	yy_column := yy_column + 4
--|#line 365
process_c2_character_constant ('%N')
else
	yy_column := yy_column + 4
--|#line 366
process_c2_character_constant ('%Q')
end
else
	yy_column := yy_column + 4
--|#line 367
process_c2_character_constant ('%R')
end
end
end
else
if yy_act <= 114 then
if yy_act <= 111 then
if yy_act <= 110 then
if yy_act = 109 then
	yy_column := yy_column + 4
--|#line 368
process_c2_character_constant ('%S')
else
	yy_column := yy_column + 4
--|#line 369
process_c2_character_constant ('%T')
end
else
	yy_column := yy_column + 4
--|#line 370
process_c2_character_constant ('%U')
end
else
if yy_act <= 113 then
if yy_act = 112 then
	yy_column := yy_column + 4
--|#line 371
process_c2_character_constant ('%V')
else
	yy_column := yy_column + 4
--|#line 372
process_c2_character_constant ('%%')
end
else
	yy_column := yy_column + 4
--|#line 373
process_c2_character_constant ('%'')
end
end
else
if yy_act <= 117 then
if yy_act <= 116 then
if yy_act = 115 then
	yy_column := yy_column + 4
--|#line 374
process_c2_character_constant ('%"')
else
	yy_column := yy_column + 4
--|#line 375
process_c2_character_constant ('%(')
end
else
	yy_column := yy_column + 4
--|#line 376
process_c2_character_constant ('%)')
end
else
if yy_act <= 119 then
if yy_act = 118 then
	yy_column := yy_column + 4
--|#line 377
process_c2_character_constant ('%<')
else
	yy_column := yy_column + 4
--|#line 378
process_c2_character_constant ('%>')
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 380

				last_token := E_CHARACTER
				last_value := new_c3_character_constant (text_substring (4, text_count - 2))
			
end
end
end
end
else
if yy_act <= 132 then
if yy_act <= 126 then
if yy_act <= 123 then
if yy_act <= 122 then
if yy_act = 121 then
	yy_column := yy_column + 1
--|#line 384

else
	yy_column := yy_column + 4
--|#line 385
process_lower_case_c2_character_constant ('%A')
end
else
	yy_column := yy_column + 4
--|#line 386
process_lower_case_c2_character_constant ('%B')
end
else
if yy_act <= 125 then
if yy_act = 124 then
	yy_column := yy_column + 4
--|#line 387
process_lower_case_c2_character_constant ('%C')
else
	yy_column := yy_column + 4
--|#line 388
process_lower_case_c2_character_constant ('%D')
end
else
	yy_column := yy_column + 4
--|#line 389
process_lower_case_c2_character_constant ('%F')
end
end
else
if yy_act <= 129 then
if yy_act <= 128 then
if yy_act = 127 then
	yy_column := yy_column + 4
--|#line 390
process_lower_case_c2_character_constant ('%H')
else
	yy_column := yy_column + 4
--|#line 391
process_lower_case_c2_character_constant ('%L')
end
else
	yy_column := yy_column + 4
--|#line 392
process_lower_case_c2_character_constant ('%N')
end
else
if yy_act <= 131 then
if yy_act = 130 then
	yy_column := yy_column + 4
--|#line 393
process_lower_case_c2_character_constant ('%Q')
else
	yy_column := yy_column + 4
--|#line 394
process_lower_case_c2_character_constant ('%R')
end
else
	yy_column := yy_column + 4
--|#line 395
process_lower_case_c2_character_constant ('%S')
end
end
end
else
if yy_act <= 138 then
if yy_act <= 135 then
if yy_act <= 134 then
if yy_act = 133 then
	yy_column := yy_column + 4
--|#line 396
process_lower_case_c2_character_constant ('%T')
else
	yy_column := yy_column + 4
--|#line 397
process_lower_case_c2_character_constant ('%U')
end
else
	yy_column := yy_column + 4
--|#line 398
process_lower_case_c2_character_constant ('%V')
end
else
if yy_act <= 137 then
if yy_act = 136 then
	yy_column := yy_column + 4
--|#line 400

					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)
				column := column - 2

				last_token := E_CHARACTER
				last_value := new_c2_character_constant (text_item (3))
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 411

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				error_handler.report_SCAS_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			
end
else
	yy_column := yy_column + 3
--|#line 420

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				error_handler.report_SCAC_error (current_position)
				column := column - 3

				last_token := E_CHARERR
			
end
end
else
if yy_act <= 141 then
if yy_act <= 140 then
if yy_act = 139 then
	yy_column := yy_column + 2
--|#line 429

					-- Syntax error: missing character between quotes.
				column := column + 1
				error_handler.report_SCQQ_error (current_position)
				column := column - 1

				last_token := E_CHARERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 437

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				error_handler.report_SCEQ_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			
end
else
	yy_column := yy_column + 3
--|#line 450

				last_token := E_STRPLUS
				last_value := new_manifest_string ("+")
			
end
else
if yy_act <= 143 then
if yy_act = 142 then
	yy_column := yy_column + 3
--|#line 454

				last_token := E_STRMINUS
				last_value := new_manifest_string ("-")
			
else
	yy_column := yy_column + 3
--|#line 458

				last_token := E_STRSTAR
				last_value := new_manifest_string ("*")
			
end
else
	yy_column := yy_column + 3
--|#line 462

				last_token := E_STRSLASH
				last_value := new_manifest_string ("/")
			
end
end
end
end
end
else
if yy_act <= 168 then
if yy_act <= 156 then
if yy_act <= 150 then
if yy_act <= 147 then
if yy_act <= 146 then
if yy_act = 145 then
	yy_column := yy_column + 4
--|#line 466

				last_token := E_STRDIV
				last_value := new_manifest_string ("//")
			
else
	yy_column := yy_column + 4
--|#line 470

				last_token := E_STRMOD
				last_value := new_manifest_string ("\\")
			
end
else
	yy_column := yy_column + 3
--|#line 474

				last_token := E_STRPOWER
				last_value := new_manifest_string ("^")
			
end
else
if yy_act <= 149 then
if yy_act = 148 then
	yy_column := yy_column + 3
--|#line 478

				last_token := E_STRLT
				last_value := new_manifest_string ("<")
			
else
	yy_column := yy_column + 4
--|#line 482

				last_token := E_STRLE
				last_value := new_manifest_string ("<=")
			
end
else
	yy_column := yy_column + 3
--|#line 486

				last_token := E_STRGT
				last_value := new_manifest_string (">")
			
end
end
else
if yy_act <= 153 then
if yy_act <= 152 then
if yy_act = 151 then
	yy_column := yy_column + 4
--|#line 490

				last_token := E_STRGE
				last_value := new_manifest_string (">=")
			
else
	yy_column := yy_column + 5
--|#line 494

				last_token := E_STRNOT
				last_value := new_manifest_string (text_substring (2, 4))
			
end
else
	yy_column := yy_column + 5
--|#line 498

				last_token := E_STRAND
				last_value := new_manifest_string (text_substring (2, 4))
			
end
else
if yy_act <= 155 then
if yy_act = 154 then
	yy_column := yy_column + 4
--|#line 502

				last_token := E_STROR
				last_value := new_manifest_string (text_substring (2, 3))
			
else
	yy_column := yy_column + 5
--|#line 506

				last_token := E_STRXOR
				last_value := new_manifest_string (text_substring (2, 4))
			
end
else
	yy_column := yy_column + 10
--|#line 510

				last_token := E_STRANDTHEN
				last_value := new_manifest_string (text_substring (2, 9))
			
end
end
end
else
if yy_act <= 162 then
if yy_act <= 159 then
if yy_act <= 158 then
if yy_act = 157 then
	yy_column := yy_column + 9
--|#line 514

				last_token := E_STRORELSE
				last_value := new_manifest_string (text_substring (2, 8))
			
else
	yy_column := yy_column + 9
--|#line 518

				last_token := E_STRIMPLIES
				last_value := new_manifest_string (text_substring (2, 8))
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 522

				last_token := E_STRFREEOP
				last_value := new_manifest_string (text_substring (2, text_count - 1))
			
end
else
if yy_act <= 161 then
if yy_act = 160 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 527

					-- Regular manifest string.
				last_token := E_STRING
				last_value := new_manifest_string (text_substring (2, text_count - 1))
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 533

					-- Manifest string with special characters.
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 538

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
end
end
else
if yy_act <= 165 then
if yy_act <= 164 then
if yy_act = 163 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 549

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
else
	yy_end := yy_start + yy_more_len + 2
	yy_column := yy_column + 2
--|#line 554

					-- Multi-line manifest string.

					-- Syntax error: no space allowed after character
					-- % at end of line in multi-line manifest strings.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSNS_error (current_position)
				column := ms_column
				line := ms_line

				more
				set_start_condition (MSN1)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 568

				more
			
end
else
if yy_act <= 167 then
if yy_act = 166 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 571

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSAS_error (current_position)
				column := ms_column
				line := ms_line

				more
			
else
	yy_column := yy_column + 2
--|#line 582

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSAC_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
else
	yy_column := yy_column + 2
--|#line 593

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSCU_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
end
end
end
else
if yy_act <= 180 then
if yy_act <= 174 then
if yy_act <= 171 then
if yy_act <= 170 then
if yy_act = 169 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 605

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 608

				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				set_start_condition (INITIAL)
			
end
else
	yy_column := yy_column + 2
--|#line 613

					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
else
if yy_act <= 173 then
if yy_act = 172 then
	yy_column := yy_column + 1
--|#line 624

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 636

					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				error_handler.report_SSNL_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 662

				more
				set_start_condition (MSN)
			
end
end
else
if yy_act <= 177 then
if yy_act <= 176 then
if yy_act = 175 then
	yy_column := yy_column + 1
--|#line 666

					-- Should never happen.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 679

				more
				set_start_condition (MS)
			
end
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 683

					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				column := 1
				line := yy_line - 1
				error_handler.report_SSEL_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
else
if yy_act <= 179 then
if yy_act = 178 then
	yy_column := yy_column + 1
--|#line 694

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSNP_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 723

				last_token := E_BIT
				last_value := new_bit_constant (text)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 731

				last_token := E_INTEGER
				last_value := new_integer_constant (text)
			
end
end
end
else
if yy_act <= 186 then
if yy_act <= 183 then
if yy_act <= 182 then
if yy_act = 181 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 735

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 739

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 747

					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			
end
else
if yy_act <= 185 then
if yy_act = 184 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 760

				last_token := E_REAL
				last_value := new_real_constant (text)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 761

				last_token := E_REAL
				last_value := new_real_constant (text)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 762

				last_token := E_REAL
				last_value := new_real_constant (text)
			
end
end
else
if yy_act <= 189 then
if yy_act <= 188 then
if yy_act = 187 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 766

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 767

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 768

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
			
end
else
if yy_act = 190 then
	yy_column := yy_column + 1
--|#line 780

				last_token := E_UNKNOWN
				last_value := current_position
			
else
yy_set_line_column
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

					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSEQ_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 2 then
--|#line 0

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSNP_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 3 then
--|#line 0

					-- Should never happen.
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
			    0,   10,   11,   12,   11,   11,   13,   14,   15,   16,
			   10,   17,   18,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   40,   41,   40,   40,   42,
			   40,   43,   44,   45,   40,   46,   47,   48,   49,   50,
			   51,   52,   40,   40,   53,   54,   55,   56,   57,   58,
			   34,   35,   36,   37,   39,   40,   42,   43,   40,   46,
			   47,   48,   49,   50,   59,   60,   62,   62,   94,   95,
			   63,   63,  465,   64,   64,   66,   67,   66,   66,   66,
			   67,   66,   66,   68,  108,  109,  414,   68,   70,   71,

			   70,   70,   70,   71,   70,   70,   72,   96,   72,   72,
			   76,   77,   98,   78,   99,   99,   97,   79,   80,  100,
			   81,  102,   82,  103,  104,  101,  147,   83,  134,   84,
			  148,   85,  105,  102,  135,  104,  104,  110,  111,   86,
			  114,  122,  115,  239,   87,   88,  118,  116,  407,  127,
			  119,  123,  147,  128,   89,  141,  120,  242,   90,  121,
			   91,  106,  148,   85,  105,  149,  129,  114,  115,  559,
			   87,  116,  124,  106,  125,  239,  118,  119,  130,  141,
			  120,  127,  137,  121,  126,  131,  132,  143,  558,  242,
			  129,  133,  138,  145,  139,  149,  152,  152,  140,  124,

			  125,  155,  144,  146,  156,  164,  165,  164,  164,  130,
			  289,  289,  132,  166,  137,  133,  291,  291,   76,  138,
			  139,   78,  140,  145,  342,  342,  144,  146,  167,  168,
			  167,  167,  396,  396,  153,  157,  158,  159,  160,  158,
			  157,  161,  157,  157,  161,  161,  161,  161,  157,  157,
			  157,  157,  157,  162,  157,  157,  157,  157,  161,  157,
			  161,  157,  161,  161,  161,  161,  157,  161,  157,  161,
			  157,  157,  157,  161,  157,  161,  157,  157,  161,  161,
			  161,  161,  161,  161,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  163,  163,  163,  163,  163,  163,

			  163,  163,  163,  163,  163,  163,  163,  163,  157,  157,
			   72,  557,   72,   72,   75,  172,   75,   75,   78,  169,
			  173,  174,   78,   78,   78,  175,  177,  179,   78,   78,
			   78,   76,   76,   76,   78,   78,   78,  176,   76,   76,
			   76,   78,   78,   78,  178,  180,  187,  227,  227,   78,
			  231,  231,  102,  240,  233,  234,  235,  235,  102,  228,
			  234,  234,  232,  105,  253,  181,  182,  183,  155,  237,
			  556,  156,  238,  244,  185,  155,  184,  240,  156,  247,
			  286,  287,  286,  286,  290,  229,  292,   78,  186,   78,
			  293,  181,  106,   78,  236,  105,  253,  244,  106,  238,

			  184,  189,  189,  247,  189,  189,  189,  190,  189,  189,
			  191,  192,  193,  194,  189,  189,  189,  189,  189,  195,
			  189,  189,  189,  189,  196,  189,  197,  189,  198,  199,
			  200,  201,  189,  202,  189,  203,  189,  189,  189,  204,
			  189,  205,  189,  189,  206,  207,  208,  209,  210,  211,
			  189,  189,  189,  189,  189,  189,  189,  189,  189,  189,
			  212,  213,  214,  215,  216,  217,  218,  219,  220,  221,
			  222,  223,  224,  225,  189,  189,  245,  248,  250,  555,
			  246,  262,  251,  252,  553,  256,  531,  257,  264,  258,
			  265,  266,  249,  263,  267,  274,  276,  278,  522,  275,

			  259,  152,  152,  260,  152,  152,  251,  520,  245,  248,
			  252,  246,  264,  262,  265,  269,  249,  256,  257,  258,
			  276,  278,  274,  266,  259,  270,  267,  260,  271,  279,
			  272,  273,  282,  284,  280,  286,  288,  286,  286,  152,
			  294,   76,  153,   78,   78,  281,   76,  269,  298,   78,
			  299,  270,  271,   78,  272,  273,  282,  284,  302,  519,
			  353,  279,  164,  165,  164,  164,  517,  308,  308,  281,
			  166,  167,  168,  167,  167,   76,   76,  296,   78,   78,
			  301,  339,  339,   78,  353,  340,  297,  340,  343,  343,
			  341,  341,  346,  228,  346,  350,  350,  347,  347,  295,

			  344,  102,  351,  348,  349,  102,  355,  349,  349,  498,
			  297,  352,  105,  356,  300,  236,  236,  354,  359,  229,
			  341,  341,  360,  363,  364,  367,  345,  365,  372,  374,
			  355,  295,  378,  236,  351,  379,  361,  356,  300,  381,
			  366,  106,  359,  352,  105,  106,  382,  363,  364,  354,
			  383,  385,  367,  236,  360,  387,  392,  389,  395,  471,
			  372,  374,   76,  472,  378,   78,  379,  497,  384,  448,
			  382,  381,  397,  289,  289,  385,  286,  287,  286,  286,
			  392,  493,  383,  389,  395,  406,  406,  387,  170,  291,
			  291,  398,  384,  399,  400,  401,   78,   76,   78,  403,

			   78,  448,   78,  404,  308,  308,  405,  405,  408,  408,
			  412,  412,  409,  409,  410,  417,  410,  419,  228,  411,
			  411,  400,  402,  407,  344,  347,  347,  413,  413,  415,
			  420,  348,  349,  415,  423,  349,  349,  416,  416,  417,
			  105,  419,  425,  427,  229,  426,  428,  438,  491,  454,
			  345,  439,  430,  435,  420,  437,  440,  442,  423,  445,
			  446,  449,  451,  453,  552,  414,  425,  427,  452,  236,
			  428,  426,  105,  236,  438,  236,  430,  435,  439,  437,
			  440,  454,  490,  445,  489,  449,  155,  446,  442,  156,
			  453,  552,  452,  451,  154,  396,  396,   76,   76,   76,

			   78,   78,   78,  405,  405,  460,  460,  461,  461,  462,
			  462,  463,  463,  411,  411,  459,  464,  464,  466,  466,
			  473,  467,  467,  344,  468,  468,  474,  456,  463,  463,
			  470,  457,  236,  236,  475,  477,  478,  455,  479,  480,
			  469,  485,  481,  407,  496,  488,  473,  492,  494,  345,
			  474,  495,  499,   76,  465,  487,   78,  486,  457,  414,
			  478,  455,  484,  480,  479,  475,  506,  477,  481,  488,
			  106,  492,  494,  485,   76,  495,  496,   78,  499,   76,
			  518,  500,   78,  503,  483,  503,  504,  504,  504,  504,
			  505,  505,  229,  463,  463,  508,  508,  509,  509,  501,

			  510,  510,  511,  511,  518,  507,  512,  512,  513,  521,
			  513,  500,  523,  511,  511,  515,  515,  524,  502,  527,
			  525,  526,  528,  529,  407,  532,  530,  516,  533,  534,
			  482,   76,   76,  465,   78,   78,  523,  504,  504,  476,
			  414,  521,  502,  524,  525,  526,  528,  529,  458,  532,
			  450,  527,  530,  534,  533,   76,  535,  544,   78,  504,
			  504,  538,  538,  539,  550,  539,  542,  542,  540,  540,
			  541,  536,  541,  543,  543,  542,  542,  511,  511,  549,
			  537,  545,  545,  345,  511,  511,  546,  546,  547,  551,
			  547,  554,  447,  548,  548,  536,  550,   76,  544,  561,

			   78,  444,   78,  562,  465,  549,   78,  540,  540,  563,
			  563,  542,  542,  542,  542,  564,  564,  554,  510,  510,
			  565,  551,  565,  443,  345,  566,  566,  548,  548,  568,
			  544,  560,  567,  567,  569,  570,  538,  538,   78,  566,
			  566,  571,  571,  545,  545,  564,  564,  407,  441,  436,
			  434,  433,  432,  568,  431,  429,  345,  560,  569,  424,
			  422,  421,  418,  394,  393,  391,  390,  388,  386,  380,
			  414,  377,  376,  375,  407,  373,  371,  370,  369,  465,
			  368,  414,  362,  465,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,

			   61,   61,   61,   61,   61,   61,   61,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   75,   75,  358,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   92,  357,  338,  337,
			  336,  335,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   93,

			   93,  334,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,  113,  113,  333,  332,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  154,  154,  331,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,   77,
			   77,  330,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,  170,  170,  170,  170,  329,  328,  327,  170,
			  170,  170,  170,  170,  170,  170,  170,  170,   96,   96,

			  326,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,  230,  230,  230,  230,  230,  230,  230,  230,  325,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  154,  154,  154,  154,  324,  323,
			  322,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  170,  170,  321,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  170,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  170,  514,  514,  514,  514,  514,  514,  514,
			  514,  320,  514,  514,  514,  514,  514,  514,  514,  514,

			  514,  514,  514,  514,  514,  514,  319,  318,  317,  316,
			  315,  314,  313,  312,  311,  310,  309,  307,  306,  305,
			  304,  303,  302,  285,  283,  277,  268,  261,  255,  254,
			  243,  241,  226,  188,  171,   73,  151,  150,  142,  136,
			  117,  112,  107,   74,   73,  572,    9,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,

			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572>>)
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
			    1,    1,    1,    1,    1,    1,    3,    4,   17,   17,
			    3,    4,  564,    3,    4,    5,    5,    5,    5,    6,
			    6,    6,    6,    5,   30,   30,  545,    6,    7,    7,

			    7,    7,    8,    8,    8,    8,   11,   23,   11,   11,
			   14,   14,   24,   14,   24,   24,   23,   14,   14,   25,
			   14,   26,   14,   26,   26,   25,   49,   14,   42,   14,
			   50,   14,   26,   27,   42,   27,   27,   32,   32,   14,
			   34,   37,   34,  115,   14,   14,   36,   34,  538,   39,
			   36,   37,   49,   39,   14,   45,   36,  119,   14,   36,
			   14,   26,   50,   14,   26,   51,   39,   34,   34,  533,
			   14,   34,   38,   27,   38,  115,   36,   36,   41,   45,
			   36,   39,   44,   36,   38,   41,   41,   47,  532,  119,
			   39,   41,   44,   48,   44,   51,   57,   57,   44,   38,

			   38,   61,   47,   48,   61,   66,   66,   66,   66,   41,
			  162,  162,   41,   66,   44,   41,  171,  171,   75,   44,
			   44,   75,   44,   48,  229,  229,   47,   48,   70,   70,
			   70,   70,  285,  285,   57,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,

			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   72,  530,   72,   72,   77,   79,   77,   77,   79,   77,
			   80,   81,   77,   80,   81,   82,   83,   84,   82,   83,
			   84,   85,   87,   86,   85,   87,   86,   82,   88,   89,
			   90,   88,   89,   90,   83,   84,   91,   99,   99,   91,
			  102,  102,  103,  117,  103,  103,  106,  106,  104,   99,
			  104,  104,  102,  103,  128,   85,   86,   87,  154,  114,
			  529,  154,  114,  121,   89,  161,   88,  117,  161,  124,
			  158,  158,  158,  158,  170,   99,  176,  170,   90,  176,
			  178,   85,  103,  178,  106,  103,  128,  121,  104,  114,

			   88,   94,   94,  124,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,  122,  125,  126,  528,
			  122,  135,  126,  127,  524,  132,  492,  132,  136,  132,
			  137,  138,  125,  135,  139,  143,  144,  146,  480,  143,

			  132,  152,  152,  132,  153,  153,  126,  477,  122,  125,
			  127,  122,  136,  135,  137,  142,  125,  132,  132,  132,
			  144,  146,  143,  138,  132,  142,  139,  132,  142,  147,
			  142,  142,  148,  150,  147,  160,  160,  160,  160,  152,
			  180,  182,  153,  180,  182,  147,  183,  142,  184,  183,
			  184,  142,  142,  184,  142,  142,  148,  150,  195,  474,
			  242,  147,  164,  164,  164,  164,  472,  195,  195,  147,
			  164,  167,  167,  167,  167,  181,  185,  182,  181,  185,
			  186,  227,  227,  186,  242,  228,  183,  228,  231,  231,
			  228,  228,  232,  227,  232,  235,  235,  232,  232,  181,

			  231,  233,  237,  233,  233,  234,  244,  234,  234,  452,
			  183,  241,  233,  245,  185,  236,  236,  243,  249,  227,
			  340,  340,  250,  252,  253,  255,  231,  254,  260,  262,
			  244,  181,  268,  235,  237,  268,  250,  245,  185,  270,
			  254,  233,  249,  241,  233,  234,  271,  252,  253,  243,
			  272,  273,  255,  236,  250,  275,  280,  277,  283,  420,
			  260,  262,  296,  420,  268,  296,  268,  451,  272,  386,
			  271,  270,  289,  289,  289,  273,  286,  286,  286,  286,
			  280,  445,  272,  277,  283,  341,  341,  275,  291,  291,
			  291,  295,  272,  295,  296,  297,  295,  298,  297,  300,

			  298,  386,  300,  308,  308,  308,  339,  339,  342,  342,
			  345,  345,  343,  343,  344,  351,  344,  353,  339,  344,
			  344,  296,  298,  341,  343,  346,  346,  347,  347,  348,
			  354,  348,  348,  349,  357,  349,  349,  350,  350,  351,
			  348,  353,  359,  361,  339,  360,  362,  374,  443,  394,
			  343,  376,  364,  370,  354,  372,  378,  380,  357,  383,
			  384,  387,  391,  393,  521,  347,  359,  361,  392,  348,
			  362,  360,  348,  349,  374,  350,  364,  370,  376,  372,
			  378,  394,  442,  383,  441,  387,  397,  384,  380,  397,
			  393,  521,  392,  391,  396,  396,  396,  398,  400,  402,

			  398,  400,  402,  405,  405,  406,  406,  407,  407,  408,
			  408,  409,  409,  410,  410,  405,  411,  411,  412,  412,
			  421,  413,  413,  409,  414,  414,  423,  400,  415,  415,
			  416,  402,  416,  416,  424,  426,  427,  398,  428,  430,
			  415,  436,  431,  406,  449,  440,  421,  444,  446,  409,
			  423,  448,  454,  455,  411,  439,  455,  437,  402,  413,
			  427,  398,  435,  430,  428,  424,  462,  426,  431,  440,
			  416,  444,  446,  436,  456,  448,  449,  456,  454,  457,
			  473,  455,  457,  459,  433,  459,  460,  460,  459,  459,
			  461,  461,  462,  463,  463,  464,  464,  465,  465,  456,

			  466,  466,  467,  467,  473,  463,  468,  468,  469,  479,
			  469,  455,  482,  469,  469,  470,  470,  483,  457,  486,
			  484,  485,  487,  488,  460,  496,  490,  470,  497,  499,
			  432,  500,  501,  464,  500,  501,  482,  503,  503,  425,
			  467,  479,  457,  483,  484,  485,  487,  488,  404,  496,
			  388,  486,  490,  499,  497,  502,  500,  510,  502,  504,
			  504,  505,  505,  506,  519,  506,  508,  508,  506,  506,
			  507,  501,  507,  509,  509,  507,  507,  511,  511,  517,
			  502,  512,  512,  510,  513,  513,  515,  515,  516,  520,
			  516,  527,  385,  516,  516,  501,  519,  535,  515,  536,

			  535,  382,  536,  537,  508,  517,  537,  539,  539,  540,
			  540,  541,  541,  542,  542,  543,  543,  527,  546,  546,
			  544,  520,  544,  381,  515,  544,  544,  547,  547,  554,
			  546,  535,  548,  548,  556,  560,  563,  563,  560,  565,
			  565,  566,  566,  567,  567,  571,  571,  540,  379,  371,
			  369,  368,  367,  554,  366,  363,  546,  535,  556,  358,
			  356,  355,  352,  282,  281,  279,  278,  276,  274,  269,
			  548,  267,  265,  263,  563,  261,  259,  258,  257,  566,
			  256,  567,  251,  571,  573,  573,  573,  573,  573,  573,
			  573,  573,  573,  573,  573,  573,  573,  573,  573,  573,

			  573,  573,  573,  573,  573,  573,  573,  574,  574,  574,
			  574,  574,  574,  574,  574,  574,  574,  574,  574,  574,
			  574,  574,  574,  574,  574,  574,  574,  574,  574,  574,
			  575,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  575,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  575,  575,  575,  576,  576,  247,  576,  576,  576,  576,
			  576,  576,  576,  576,  576,  576,  576,  576,  576,  576,
			  576,  576,  576,  576,  576,  576,  577,  246,  225,  224,
			  223,  222,  577,  577,  577,  577,  577,  577,  577,  577,
			  577,  577,  577,  577,  577,  577,  577,  577,  577,  578,

			  578,  221,  578,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  578,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  579,  579,  220,  219,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  580,  580,  218,  580,
			  580,  580,  580,  580,  580,  580,  580,  580,  580,  580,
			  580,  580,  580,  580,  580,  580,  580,  580,  580,  581,
			  581,  217,  581,  581,  581,  581,  581,  581,  581,  581,
			  581,  581,  581,  581,  581,  581,  581,  581,  581,  581,
			  581,  581,  582,  582,  582,  582,  216,  215,  214,  582,
			  582,  582,  582,  582,  582,  582,  582,  582,  583,  583,

			  213,  583,  583,  583,  583,  583,  583,  583,  583,  583,
			  583,  583,  583,  583,  583,  583,  583,  583,  583,  583,
			  583,  584,  584,  584,  584,  584,  584,  584,  584,  212,
			  584,  584,  584,  584,  584,  584,  584,  584,  584,  584,
			  584,  584,  584,  584,  585,  585,  585,  585,  211,  210,
			  209,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  586,  586,  208,  586,  586,  586,  586,  586,  586,  586,
			  586,  586,  586,  586,  586,  586,  586,  586,  586,  586,
			  586,  586,  586,  587,  587,  587,  587,  587,  587,  587,
			  587,  207,  587,  587,  587,  587,  587,  587,  587,  587,

			  587,  587,  587,  587,  587,  587,  206,  205,  204,  203,
			  202,  201,  200,  199,  198,  197,  196,  194,  193,  192,
			  191,  190,  189,  156,  149,  145,  141,  134,  131,  129,
			  120,  118,   95,   93,   78,   73,   54,   52,   46,   43,
			   35,   33,   28,   13,   12,    9,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,

			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   73,   74,   83,   87,   96,  100, 1445,
			 1446,  104, 1441, 1437,  103,    0, 1446,   68, 1446, 1446,
			 1446, 1446, 1446,   90,   94,  100,  103,  115, 1417, 1446,
			   70, 1446,  112, 1416,  101, 1404,  111,  109,  133,  121,
			    0,  145,   92, 1397,  153,  110, 1406,  155,  158,   85,
			  102,  130, 1395, 1446, 1381, 1446, 1446,  176, 1446, 1446,
			 1446,  194, 1446, 1446,  234, 1446,  203, 1446, 1446, 1446,
			  226, 1446,  308, 1432, 1446,  211, 1446,  312, 1415,  308,
			  313,  314,  318,  319,  320,  324,  326,  325,  331,  332,
			  333,  339,    0, 1422,  400, 1421,    0, 1446, 1446,  327,

			 1446, 1446,  330,  334,  340, 1446,  336, 1446, 1446, 1446,
			 1446, 1446, 1446,    0,  333,  112,    0,  306, 1399,  129,
			 1398,  328,  447,    0,  333,  446,  435,  444,  336, 1387,
			    0, 1385,  454,    0, 1389,  451,  441,  444,  460,  464,
			    0, 1394,  484,  456,  451, 1393,  449,  498,  487, 1392,
			  488, 1446,  481,  484,  361, 1446, 1404, 1446,  378, 1446,
			  533,  368,  190, 1446,  560, 1446, 1446,  569, 1446, 1446,
			  377,  196, 1446, 1446, 1446, 1446,  379, 1446,  383, 1446,
			  533,  568,  534,  539,  543,  569,  573, 1446, 1446, 1411,
			 1410, 1409, 1408, 1407, 1406,  547, 1405, 1404, 1403, 1402,

			 1401, 1400, 1399, 1398, 1397, 1396, 1395, 1380, 1351, 1339,
			 1338, 1337, 1318, 1289, 1277, 1276, 1275, 1250, 1227, 1214,
			 1213, 1190, 1170, 1169, 1168, 1167, 1446,  561,  570,  204,
			 1446,  568,  577,  583,  587,  575,  595,  574,    0,    0,
			    0,  581,  514,  589,  561,  565, 1145, 1123,    0,  570,
			  594, 1050,  577,  577,  587,  586, 1048, 1042, 1045, 1033,
			  600, 1043,  601, 1030,    0, 1030,    0, 1039,  602, 1037,
			  611,  598,  620,  606, 1036,  627, 1031,  616, 1034, 1033,
			  612, 1028, 1027,  617,    0,  212,  674, 1446, 1446,  653,
			 1446,  669, 1446, 1446, 1446,  686,  655,  688,  690, 1446,

			  692, 1446, 1446, 1446, 1446, 1446, 1446, 1446,  684, 1446,
			 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446,
			 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446,
			 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446, 1446,  686,
			  600,  665,  688,  692,  699,  690,  705,  707,  711,  715,
			  717,  669, 1024,  671,  683, 1029, 1026,  689, 1023,  697,
			  704,  698,  701, 1023,  704,    0, 1022, 1016, 1000,  999,
			  708, 1017,  710,    0,  708,    0,  712,    0,  708, 1012,
			  724,  983,  965,  711,  721,  940,  639,  716,  907,    0,
			    0,  729,  720,  724,  721,    0,  775,  779,  790, 1446,

			  791, 1446,  792, 1446,  937,  783,  785,  787,  789,  791,
			  793,  796,  798,  801,  804,  808,  812,    0,    0,    0,
			  627,  779,    0,  781,  801,  907,  804,  789,  797,    0,
			  794,  801,  898,  848,    0,  826,  811,  821,    0,  823,
			  800,  733,  746,  716,  802,  649,  801,    0,  804,  816,
			    0,  631,  577,    0,  811,  846,  867,  872, 1446,  868,
			  866,  870,  834,  873,  875,  877,  880,  882,  886,  893,
			  895,    0,  524,  833,  527,    0,    0,  475,    0,  881,
			  466,    0,  866,  876,  873,  874,  891,  875,  877,    0,
			  885,    0,  454,    0,    0,    0,  878,  887,    0,  882,

			  924,  925,  948,  917,  939,  941,  948,  955,  946,  953,
			  925,  957,  961,  964, 1446,  966,  973,  938,    0,  933,
			  958,  725,    0,    0,  450,    0,    0,  950,  447,  328,
			  279,    0,  156,  137,    0,  990,  992,  996,   90,  987,
			  989,  991,  993,  995, 1005,   38,  998, 1007, 1012,    0,
			    0,    0,    0,    0,  982,    0,  989,    0,    0,    0,
			 1028, 1446, 1446, 1016,   24, 1019, 1021, 1023,    0,    0,
			 1446, 1025, 1446, 1083, 1106, 1129, 1152, 1175, 1198, 1212,
			 1235, 1258, 1277, 1297, 1320, 1339, 1359, 1382>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  572,    1,  573,  573,  574,  574,  575,  575,  572,
			  572,  572,  572,  572,  576,  577,  572,  578,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  572,  572,  572,  572,  572,  572,  572,
			  572,  580,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  576,  572,  581,  582,  576,
			  576,  576,  576,  576,  576,  576,  576,  576,  576,  576,
			  576,  576,  577,  572,  572,  572,  583,  572,  572,  572,

			  572,  572,  584,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  572,  572,  572,  580,  572,  585,  572,  572,  572,
			  572,  580,  572,  572,  572,  572,  572,  572,  572,  572,
			  586,  572,  572,  572,  572,  572,  576,  572,  576,  572,
			  576,  576,  576,  576,  576,  576,  576,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,

			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  576,  576,  576,  576,  572,

			  576,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  572,  580,  576,  572,

			  576,  572,  576,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  584,  572,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  576,  576,  576,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  587,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,

			  576,  576,  576,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  576,  576,  576,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  576,  572,  572,  572,  572,  572,  572,  572,  579,  579,
			  572,  572,    0,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,   10,    8,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   21,   21,   21,   21,   21,   21,   21,   21,   22,   23,
			   24,   25,   26,   27,    8,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   49,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,   59,   60,   61,   62,

			   63,   32,   64,   34,   65,   36,   37,   38,   66,   40,
			   67,   42,   43,   68,   69,   70,   71,   72,   73,   50,
			   51,   52,   53,   74,    8,   75,    1,    1,    1,    1,
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
			    0,    1,    2,    3,    2,    4,    1,    5,    1,    1,
			    6,    7,    7,    8,    1,    1,    1,    1,    9,    7,
			   10,   11,    1,    1,   12,    1,   13,    1,   14,   14,
			   14,   15,   10,   16,   10,   17,   10,   10,   10,   18,
			   10,   19,   10,   10,   14,   14,   14,   14,   14,   20,
			   10,   10,   10,   21,    1,    1,    1,    1,   22,    1,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   23,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  192,
			  190,    1,    2,   16,  162,   96,   23,  140,   17,   18,
			    6,    5,   14,    4,   12,    7,  180,  180,   15,   13,
			   11,    9,   10,  190,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   21,  190,   22,    8,  190,  121,   19,
			   20,  169,  173,  170,  172,  178,  178,  177,  176,  175,
			  175,  174,    1,    2,   29,  162,  160,  162,    0,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,   96,  140,  140,  139,    3,   30,   31,  186,

			   24,   26,    0,  180,  180,  179,  183,   34,   32,   28,
			   27,   33,   35,   95,   95,   95,   39,   95,   95,   95,
			   95,   95,   95,   47,   95,   95,   95,   95,   95,   95,
			   59,   95,   95,   66,   95,   95,   95,   95,   95,   95,
			   74,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   25,  182,  182,  169,  170,    0,  171,  171,  163,
			  171,  169,  167,  168,    0,  177,  176,    0,  174,  159,
			  162,    0,  143,  141,  142,  144,  162,  148,  162,  150,
			  162,  162,  162,  162,  162,  162,  162,  147,   97,  140,
			  140,  140,  140,  140,  140,  138,  140,  140,  140,  140,

			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,   98,  186,    0,    0,
			  184,  186,  184,  180,  180,  183,  183,   95,   37,   38,
			   94,   95,   95,   95,   95,   95,   95,   95,   50,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   70,   95,   72,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   93,    0,    0,  164,  163,  166,
			  161,    0,  145,  149,  151,  162,  162,  162,  162,  154,

			  162,  146,  136,  115,  113,  114,  116,  117,  137,  118,
			  119,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,  112,  122,  123,  124,  125,  126,
			  127,  128,  129,  130,  131,  132,  133,  134,  135,  186,
			    0,  186,    0,  186,    0,    0,    0,  185,  180,  180,
			  183,   95,   95,   95,   95,   95,   95,   95,   48,   95,
			   95,   95,   95,   95,   95,   57,   95,   95,   95,   95,
			   95,   95,   95,   67,   95,   69,   95,   73,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   86,
			   87,   95,   95,   95,   95,   92,    0,  165,  162,  153,

			  162,  152,  162,  155,  140,  186,  186,    0,    0,  186,
			    0,  185,    0,  185,    0,    0,  181,   36,   40,   41,
			   95,   95,   45,   95,   95,   95,   95,   95,   95,   55,
			   95,   95,   95,   95,   62,   95,   95,   95,   68,   95,
			   95,   95,   95,   95,   95,   95,   95,   82,   95,   95,
			   85,   95,   95,   90,   95,  162,  162,  162,  120,    0,
			  186,    0,  189,  186,  185,    0,    0,  185,    0,  184,
			    0,   42,   95,   95,   95,   49,   51,   95,   53,   95,
			   95,   58,   95,   95,   95,   95,   95,   95,   95,   76,
			   95,   78,   95,   80,   81,   83,   95,   95,   89,   95,

			  162,  162,  162,    0,  186,    0,    0,    0,  185,    0,
			  189,  185,    0,    0,  187,  189,  187,   95,   44,   95,
			   95,   95,   56,   60,   95,   63,   64,   95,   95,   95,
			   95,   79,   95,   95,   91,  162,  162,  162,  189,    0,
			  189,    0,  185,    0,    0,  188,  189,    0,  188,   43,
			   46,   52,   54,   61,   95,   71,   95,   77,   84,   88,
			  162,  158,  157,  189,  188,    0,  188,  188,   65,   75,
			  156,  188,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1446
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 572
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 573
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

	yyNb_rules: INTEGER is 191
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 192
			-- End of buffer rule code

	yyLine_used: BOOLEAN is true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	MS: INTEGER is 1
	MSN: INTEGER is 2
	MSN1: INTEGER is 3
			-- Start condition codes

feature -- User-defined features



end -- class ET_EIFFEL_SCANNER
