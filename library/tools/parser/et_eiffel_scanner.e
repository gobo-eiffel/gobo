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
			Result := (INITIAL <= sc and sc <= MSN)
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
if yy_act <= 95 then
if yy_act <= 48 then
if yy_act <= 24 then
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 32
column := column + text_count
else
--|#line 33

				line := line + text_count
				column := 1
			
end
else
--|#line 41
column := column + text_count
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 46
process_one_character_symbol (Minus_code)
else
--|#line 47
process_one_character_symbol (Plus_code)
end
else
--|#line 48
process_one_character_symbol (Star_code)
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 49
process_one_character_symbol (Slash_code)
else
--|#line 50
process_one_character_symbol (Caret_code)
end
else
--|#line 51
process_one_character_symbol (Equal_code)
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 52
process_one_character_symbol (Greater_than_code)
else
--|#line 53
process_one_character_symbol (Less_than_code)
end
else
--|#line 54
process_one_character_symbol (Dot_code)
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 55
process_one_character_symbol (Semicolon_code)
else
--|#line 56
process_one_character_symbol (Comma_code)
end
else
--|#line 57
process_one_character_symbol (Colon_code)
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 58
process_one_character_symbol (Exclamation_code)
else
--|#line 59
process_one_character_symbol (Left_parenthesis_code)
end
else
--|#line 60
process_one_character_symbol (Right_parenthesis_code)
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 61
process_one_character_symbol (Left_brace_code)
else
--|#line 62
process_one_character_symbol (Right_brace_code)
end
else
--|#line 63
process_one_character_symbol (Left_bracket_code)
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 64
process_one_character_symbol (Right_bracket_code)
else
--|#line 65
process_one_character_symbol (Dollar_code)
end
else
--|#line 66
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
--|#line 67
process_two_character_symbol (E_MOD)
else
--|#line 68
process_two_character_symbol (E_NE)
end
else
--|#line 69
process_two_character_symbol (E_GE)
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 70
process_two_character_symbol (E_LE)
else
--|#line 71
process_two_character_symbol (E_BANGBANG)
end
else
--|#line 72
process_two_character_symbol (E_ARROW)
end
end
else
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 73
process_two_character_symbol (E_DOTDOT)
else
--|#line 74
process_two_character_symbol (E_LARRAY)
end
else
--|#line 75
process_two_character_symbol (E_RARRAY)
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 76
process_two_character_symbol (E_ASSIGN)
else
--|#line 77
process_two_character_symbol (E_REVERSE)
end
else
--|#line 82

				last_token := E_ALIAS
				last_value := current_position
				column := column + 5
			
end
end
end
else
if yy_act <= 42 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 87

				last_token := E_ALL
				last_value := current_position
				column := column + 3
			
else
--|#line 92

				last_token := E_AND
				last_value := current_position
				column := column + 3
			
end
else
--|#line 97

				last_token := E_AS
				last_value := current_position
				column := column + 2
			
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 102

				last_token := E_CHECK
				last_value := current_position
				column := column + 5
			
else
--|#line 107

				last_token := E_CLASS
				last_value := current_position
				column := column + 5
			
end
else
--|#line 112

				if create_keyword then
					last_token := E_CREATE
					last_value := current_position
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (text)
				end
				column := column + 6
			
end
end
else
if yy_act <= 45 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 122

				last_token := E_CREATION
				last_value := current_position
				column := column + 8
			
else
--|#line 127

				last_token := E_CURRENT
				last_value := current_position
				column := column + 7
			
end
else
--|#line 132

				last_token := E_DEBUG
				last_value := current_position
				column := column + 5
			
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 137

				last_token := E_DEFERRED
				last_value := current_position
				column := column + 8
			
else
--|#line 142

				last_token := E_DO
				last_value := current_position
				column := column + 2
			
end
else
--|#line 147

				last_token := E_ELSE
				last_value := current_position
				column := column + 4
			
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
--|#line 152

				last_token := E_ELSEIF
				last_value := current_position
				column := column + 6
			
else
--|#line 157

				last_token := E_END
				last_value := current_position
				column := column + 3
			
end
else
--|#line 162

				last_token := E_ENSURE
				last_value := current_position
				column := column + 6
			
end
else
if yy_act <= 53 then
if yy_act = 52 then
--|#line 167

				last_token := E_EXPANDED
				last_value := current_position
				column := column + 8
			
else
--|#line 172

				last_token := E_EXPORT
				last_value := current_position
				column := column + 6
			
end
else
--|#line 177

				last_token := E_EXTERNAL
				last_value := current_position
				column := column + 8
			
end
end
else
if yy_act <= 57 then
if yy_act <= 56 then
if yy_act = 55 then
--|#line 182

				last_token := E_FALSE
				last_value := new_false_constant
				column := column + 5
			
else
--|#line 187

				last_token := E_FEATURE
				last_value := current_position
				column := column + 7
			
end
else
--|#line 192

				last_token := E_FROM
				last_value := current_position
				column := column + 4
			
end
else
if yy_act <= 59 then
if yy_act = 58 then
--|#line 197

				last_token := E_FROZEN
				last_value := current_position
				column := column + 6
			
else
--|#line 202

				last_token := E_IF
				last_value := current_position
				column := column + 2
			
end
else
--|#line 207

				last_token := E_IMPLIES
				last_value := current_position
				column := column + 7
			
end
end
end
else
if yy_act <= 66 then
if yy_act <= 63 then
if yy_act <= 62 then
if yy_act = 61 then
--|#line 212

				last_token := E_INDEXING
				last_value := current_position
				column := column + 8
			
else
--|#line 217

				last_token := E_INFIX
				last_value := current_position
				column := column + 5
			
end
else
--|#line 222

				last_token := E_INHERIT
				last_value := current_position
				column := column + 7
			
end
else
if yy_act <= 65 then
if yy_act = 64 then
--|#line 227

				last_token := E_INSPECT
				last_value := current_position
				column := column + 7
			
else
--|#line 232

				last_token := E_INVARIANT
				last_value := current_position
				column := column + 9
			
end
else
--|#line 237

				last_token := E_IS
				last_value := current_position
				column := column + 2
			
end
end
else
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
--|#line 242

				last_token := E_LIKE
				last_value := current_position
				column := column + 4
			
else
--|#line 247

				last_token := E_LOCAL
				last_value := current_position
				column := column + 5
			
end
else
--|#line 252

				last_token := E_LOOP
				last_value := current_position
				column := column + 4
			
end
else
if yy_act <= 71 then
if yy_act = 70 then
--|#line 257

				last_token := E_NOT
				last_value := current_position
				column := column + 3
			
else
--|#line 262

				last_token := E_OBSOLETE
				last_value := current_position
				column := column + 8
			
end
else
--|#line 267

				last_token := E_OLD
				last_value := current_position
				column := column + 3
			
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
--|#line 272

				last_token := E_ONCE
				last_value := current_position
				column := column + 4
			
else
--|#line 277

				last_token := E_OR
				last_value := current_position
				column := column + 2
			
end
else
--|#line 282

				last_token := E_PRECURSOR
				last_value := current_position
				column := column + 9
			
end
else
if yy_act <= 77 then
if yy_act = 76 then
--|#line 287

				last_token := E_PREFIX
				last_value := current_position
				column := column + 6
			
else
--|#line 292

				last_token := E_REDEFINE
				last_value := current_position
				column := column + 8
			
end
else
--|#line 297

				last_token := E_RENAME
				last_value := current_position
				column := column + 6
			
end
end
else
if yy_act <= 81 then
if yy_act <= 80 then
if yy_act = 79 then
--|#line 302

				last_token := E_REQUIRE
				last_value := current_position
				column := column + 7
			
else
--|#line 307

				last_token := E_RESCUE
				last_value := current_position
				column := column + 6
			
end
else
--|#line 312

				last_token := E_RESULT
				last_value := current_position
				column := column + 6
			
end
else
if yy_act <= 83 then
if yy_act = 82 then
--|#line 317

				last_token := E_RETRY
				last_value := current_position
				column := column + 5
			
else
--|#line 322

				last_token := E_SELECT
				last_value := current_position
				column := column + 6
			
end
else
--|#line 327

				last_token := E_SEPARATE
				last_value := current_position
				column := column + 8
			
end
end
end
else
if yy_act <= 90 then
if yy_act <= 87 then
if yy_act <= 86 then
if yy_act = 85 then
--|#line 332

				last_token := E_STRIP
				last_value := current_position
				column := column + 5
			
else
--|#line 337

				last_token := E_THEN
				last_value := current_position
				column := column + 4
			
end
else
--|#line 342

				last_token := E_TRUE
				last_value := new_true_constant
				column := column + 4
			
end
else
if yy_act <= 89 then
if yy_act = 88 then
--|#line 347

				last_token := E_UNDEFINE
				last_value := current_position
				column := column + 8
			
else
--|#line 352

				last_token := E_UNIQUE
				last_value := current_position
				column := column + 6
			
end
else
--|#line 357

				last_token := E_UNTIL
				last_value := current_position
				column := column + 5
			
end
end
else
if yy_act <= 93 then
if yy_act <= 92 then
if yy_act = 91 then
--|#line 362

				last_token := E_VARIANT
				last_value := current_position
				column := column + 7
			
else
--|#line 367

				last_token := E_WHEN
				last_value := current_position
				column := column + 4
			
end
else
--|#line 372

				last_token := E_XOR
				last_value := current_position
				column := column + 3
			
end
else
if yy_act = 94 then
--|#line 381

				last_token := E_BITTYPE
				last_value := new_identifier (text)
				column := column + 3
			
else
--|#line 386

				last_token := E_IDENTIFIER
				last_value := new_identifier (text)
				column := column + text_count
			
end
end
end
end
end
end
else
if yy_act <= 142 then
if yy_act <= 119 then
if yy_act <= 107 then
if yy_act <= 101 then
if yy_act <= 98 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 395

				last_token := E_FREEOP
				last_value := new_token (text)
				column := column + text_count
			
else
--|#line 407

				last_token := E_CHARACTER
				last_value := new_character_constant (text_item (2))
				column := column + 3
			
end
else
--|#line 412

					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)

				column := column - 1
				last_token := E_CHARACTER
				last_value := new_character_constant ('%'')
				column := column + 3
			
end
else
if yy_act <= 100 then
if yy_act = 99 then
--|#line 424
process_c2_character_constant ('%A')
else
--|#line 425
process_c2_character_constant ('%B')
end
else
--|#line 426
process_c2_character_constant ('%C')
end
end
else
if yy_act <= 104 then
if yy_act <= 103 then
if yy_act = 102 then
--|#line 427
process_c2_character_constant ('%D')
else
--|#line 428
process_c2_character_constant ('%F')
end
else
--|#line 429
process_c2_character_constant ('%H')
end
else
if yy_act <= 106 then
if yy_act = 105 then
--|#line 430
process_c2_character_constant ('%L')
else
--|#line 431
process_c2_character_constant ('%N')
end
else
--|#line 432
process_c2_character_constant ('%Q')
end
end
end
else
if yy_act <= 113 then
if yy_act <= 110 then
if yy_act <= 109 then
if yy_act = 108 then
--|#line 433
process_c2_character_constant ('%R')
else
--|#line 434
process_c2_character_constant ('%S')
end
else
--|#line 435
process_c2_character_constant ('%T')
end
else
if yy_act <= 112 then
if yy_act = 111 then
--|#line 436
process_c2_character_constant ('%U')
else
--|#line 437
process_c2_character_constant ('%V')
end
else
--|#line 438
process_c2_character_constant ('%%')
end
end
else
if yy_act <= 116 then
if yy_act <= 115 then
if yy_act = 114 then
--|#line 439
process_c2_character_constant ('%'')
else
--|#line 440
process_c2_character_constant ('%"')
end
else
--|#line 441
process_c2_character_constant ('%(')
end
else
if yy_act <= 118 then
if yy_act = 117 then
--|#line 442
process_c2_character_constant ('%)')
else
--|#line 443
process_c2_character_constant ('%<')
end
else
--|#line 444
process_c2_character_constant ('%>')
end
end
end
end
else
if yy_act <= 131 then
if yy_act <= 125 then
if yy_act <= 122 then
if yy_act <= 121 then
if yy_act = 120 then
--|#line 446

				last_token := E_CHARACTER
				last_value := new_c3_character_constant (text_substring (4, text_count - 2))
				column := column + text_count
			
else
--|#line 451

end
else
--|#line 452
process_lower_case_c2_character_constant ('%A')
end
else
if yy_act <= 124 then
if yy_act = 123 then
--|#line 453
process_lower_case_c2_character_constant ('%B')
else
--|#line 454
process_lower_case_c2_character_constant ('%C')
end
else
--|#line 455
process_lower_case_c2_character_constant ('%D')
end
end
else
if yy_act <= 128 then
if yy_act <= 127 then
if yy_act = 126 then
--|#line 456
process_lower_case_c2_character_constant ('%F')
else
--|#line 457
process_lower_case_c2_character_constant ('%H')
end
else
--|#line 458
process_lower_case_c2_character_constant ('%L')
end
else
if yy_act <= 130 then
if yy_act = 129 then
--|#line 459
process_lower_case_c2_character_constant ('%N')
else
--|#line 460
process_lower_case_c2_character_constant ('%Q')
end
else
--|#line 461
process_lower_case_c2_character_constant ('%R')
end
end
end
else
if yy_act <= 137 then
if yy_act <= 134 then
if yy_act <= 133 then
if yy_act = 132 then
--|#line 462
process_lower_case_c2_character_constant ('%S')
else
--|#line 463
process_lower_case_c2_character_constant ('%T')
end
else
--|#line 464
process_lower_case_c2_character_constant ('%U')
end
else
if yy_act <= 136 then
if yy_act = 135 then
--|#line 465
process_lower_case_c2_character_constant ('%V')
else
--|#line 467

					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)

				column := column - 2
				last_token := E_CHARACTER
				last_value := new_c2_character_constant (text_item (3))
				column := column + 4
			
end
else
--|#line 479

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				error_handler.report_SCAS_error (current_position)

				last_token := E_CHARERR
			
end
end
else
if yy_act <= 140 then
if yy_act <= 139 then
if yy_act = 138 then
--|#line 487

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				error_handler.report_SCAC_error (current_position)

				last_token := E_CHARERR
			
else
--|#line 495

					-- Syntax error: missing character between quotes.
				column := column + 1
				error_handler.report_SCQQ_error (current_position)

				column := column + 1
				last_token := E_CHARERR
			
end
else
--|#line 503

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				error_handler.report_SCEQ_error (current_position)

				last_token := E_CHARERR
			
end
else
if yy_act = 141 then
--|#line 515

				last_token := E_STRPLUS
				last_value := new_manifest_string ("+")
				column := column + 3
			
else
--|#line 520

				last_token := E_STRMINUS
				last_value := new_manifest_string ("-")
				column := column + 3
			
end
end
end
end
end
else
if yy_act <= 166 then
if yy_act <= 154 then
if yy_act <= 148 then
if yy_act <= 145 then
if yy_act <= 144 then
if yy_act = 143 then
--|#line 525

				last_token := E_STRSTAR
				last_value := new_manifest_string ("*")
				column := column + 3
			
else
--|#line 530

				last_token := E_STRSLASH
				last_value := new_manifest_string ("/")
				column := column + 3
			
end
else
--|#line 535

				last_token := E_STRDIV
				last_value := new_manifest_string ("//")
				column := column + 4
			
end
else
if yy_act <= 147 then
if yy_act = 146 then
--|#line 540

				last_token := E_STRMOD
				last_value := new_manifest_string ("\\")
				column := column + 4
			
else
--|#line 545

				last_token := E_STRPOWER
				last_value := new_manifest_string ("^")
				column := column + 3
			
end
else
--|#line 550

				last_token := E_STRLT
				last_value := new_manifest_string ("<")
				column := column + 3
			
end
end
else
if yy_act <= 151 then
if yy_act <= 150 then
if yy_act = 149 then
--|#line 555

				last_token := E_STRLE
				last_value := new_manifest_string ("<=")
				column := column + 4
			
else
--|#line 560

				last_token := E_STRGT
				last_value := new_manifest_string (">")
				column := column + 3
			
end
else
--|#line 565

				last_token := E_STRGE
				last_value := new_manifest_string (">=")
				column := column + 4
			
end
else
if yy_act <= 153 then
if yy_act = 152 then
--|#line 570

				last_token := E_STRNOT
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			
else
--|#line 575

				last_token := E_STRAND
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			
end
else
--|#line 580

				last_token := E_STROR
				last_value := new_manifest_string (text_substring (2, 3))
				column := column + 4
			
end
end
end
else
if yy_act <= 160 then
if yy_act <= 157 then
if yy_act <= 156 then
if yy_act = 155 then
--|#line 585

				last_token := E_STRXOR
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			
else
--|#line 590

				last_token := E_STRANDTHEN
				last_value := new_manifest_string (text_substring (2, 9))
				column := column + 10
			
end
else
--|#line 595

				last_token := E_STRORELSE
				last_value := new_manifest_string (text_substring (2, 8))
				column := column + 9
			
end
else
if yy_act <= 159 then
if yy_act = 158 then
--|#line 600

				last_token := E_STRIMPLIES
				last_value := new_manifest_string (text_substring (2, 8))
				column := column + 9
			
else
--|#line 605

				last_token := E_STRFREEOP
				last_value := new_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			
end
else
--|#line 611

					-- Regular manifest string.
				last_token := E_STRING
				last_value := new_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			
end
end
else
if yy_act <= 163 then
if yy_act <= 162 then
if yy_act = 161 then
--|#line 618

					-- Manifest string with special characters.
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			
else
--|#line 624

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				ms_count := text_count
				column := column + ms_count
				more
				set_start_condition (MS)
			
end
else
--|#line 637

					-- Multi-line manifest string.
				line := line + 1
				column := 1
				ms_count := text_count
				more
				set_start_condition (MSN)
			
end
else
if yy_act <= 165 then
if yy_act = 164 then
--|#line 645

					-- Multi-line manifest string.

					-- Syntax error: no space allowed after character
					-- % at end of line in multi-line manifest strings.
				column := column + 1
				error_handler.report_SSNS_error (current_position)

				line := line + 1
				column := 1
				ms_count := text_count
				more
				set_start_condition (MSN)
			
else
--|#line 659

				column := column + (text_count - ms_count)
				ms_count := text_count
				more
			
end
else
--|#line 664

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := column + (text_count - ms_count)
				error_handler.report_SSAS_error (current_position)

				ms_count := text_count
				more
			
end
end
end
end
else
if yy_act <= 178 then
if yy_act <= 172 then
if yy_act <= 169 then
if yy_act <= 168 then
if yy_act = 167 then
--|#line 673

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := column + 2
				error_handler.report_SSAC_error (current_position)

				ms_count := ms_count + 2
				more
			
else
--|#line 682

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := column + 1
				error_handler.report_SSCU_error (current_position)

				column := column + 1
				ms_count := ms_count + 2
				more
			
end
else
--|#line 693

				column := column + (text_count - ms_count)
				ms_count := text_count
				more
			
end
else
if yy_act <= 171 then
if yy_act = 170 then
--|#line 698

				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				column := column + (text_count - ms_count)
				set_start_condition (INITIAL)
			
else
--|#line 704

					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := column + 1
				error_handler.report_SSSC_error (current_position)

				column := column + 1
				ms_count := text_count
				more
			
end
else
--|#line 714

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				error_handler.report_SSSC_error (current_position)

				last_token := E_STRERR
				column := column + 1
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 175 then
if yy_act <= 174 then
if yy_act = 173 then
--|#line 723

					-- Syntax error: Invalid new-line in manifest string.
				error_handler.report_SSNL_error (current_position)

				last_token := E_STRERR
				line := line + 1
				column := 1
				set_start_condition (INITIAL)
			
else
--|#line 743

				column := column + (text_count - ms_count)
				ms_count := text_count
				more
				set_start_condition (MS)
			
end
else
--|#line 749

					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				error_handler.report_SSEL_error (current_position)

				line := line + 1
				column := 1
				ms_count := text_count
				more
			
end
else
if yy_act <= 177 then
if yy_act = 176 then
--|#line 759

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				error_handler.report_SSNP_error (current_position)

				last_token := E_STRERR
				column := column + 1
				set_start_condition (INITIAL)
			
else
--|#line 781

				last_token := E_BIT
				last_value := new_bit_constant (text)
				column := column + text_count
			
end
else
--|#line 790

				last_token := E_INTEGER
				last_value := new_integer_constant (text)
				column := column + text_count
			
end
end
end
else
if yy_act <= 184 then
if yy_act <= 181 then
if yy_act <= 180 then
if yy_act = 179 then
--|#line 795

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			
else
--|#line 800

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			
end
else
--|#line 809

					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			
end
else
if yy_act <= 183 then
if yy_act = 182 then
	yy_position := yy_position - 1
--|#line 823

				last_token := E_REAL
				last_value := new_real_constant (text)
				column := column + text_count
			
else
--|#line 824

				last_token := E_REAL
				last_value := new_real_constant (text)
				column := column + text_count
			
end
else
--|#line 825

				last_token := E_REAL
				last_value := new_real_constant (text)
				column := column + text_count
			
end
end
else
if yy_act <= 187 then
if yy_act <= 186 then
if yy_act = 185 then
	yy_position := yy_position - 1
--|#line 830

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
				column := column + text_count
			
else
--|#line 831

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
				column := column + text_count
			
end
else
--|#line 832

				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
				column := column + text_count
			
end
else
if yy_act = 188 then
--|#line 845

				last_token := E_UNKNOWN
				last_value := current_position
				column := column + 1
			
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

					-- Syntax error: missing double quote at
					-- end of manifest string.
				error_handler.report_SSEQ_error (current_position)

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 2 then
--|#line 0

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				error_handler.report_SSNP_error (current_position)

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
			    0,    8,    9,   10,    9,    9,   11,   12,   13,   14,
			    8,   15,   16,   17,   18,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   38,   39,   38,   38,   40,
			   38,   41,   42,   43,   38,   44,   45,   46,   47,   48,
			   49,   50,   38,   38,   51,   52,   53,   54,   55,   56,
			   32,   33,   34,   35,   37,   38,   40,   41,   38,   44,
			   45,   46,   47,   48,   57,   58,   60,   60,   89,   90,
			   61,   61,  458,   62,   62,   64,   65,   64,   64,   64,
			   65,   64,   64,   66,  136,   91,   67,   66,   67,   67,

			   71,   72,  407,   73,   92,  103,  104,   74,   75,   95,
			   76,   93,   77,   94,   94,   96,  464,   78,  136,   79,
			  465,   80,   97,  142,   98,   99,  105,  106,   97,   81,
			   99,   99,  117,  100,   82,   83,  109,  138,  110,  400,
			  129,  113,  118,  111,   84,  114,  130,  144,   85,  142,
			   86,  115,  139,   80,  116,  150,  143,  119,  151,  120,
			   82,  552,  101,  109,  110,  100,  122,  111,  101,  121,
			  123,  113,  114,  551,  125,  115,  139,  144,  116,  140,
			  132,  126,  127,  124,  119,  120,  233,  128,  143,  141,
			  133,  550,  134,  147,  147,  549,  135,   67,  122,   67,

			   67,   71,  548,  165,   73,  125,   73,  124,  127,  140,
			  233,  128,  132,  141,  224,  224,  166,  133,  134,   73,
			  135,  159,  160,  159,  159,  167,  225,  180,   73,  161,
			   73,  148,  152,  153,  154,  155,  153,  152,  156,  152,
			  152,  156,  156,  156,  156,  152,  152,  152,  152,  152,
			  157,  152,  152,  152,  152,  156,  152,  156,  152,  156,
			  156,  156,  156,  152,  156,  152,  156,  152,  152,  152,
			  156,  152,  156,  152,  152,  156,  156,  156,  156,  156,
			  156,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  158,  158,  158,  158,  158,  152,  152,   70,  168,   70,
			   70,   73,  162,  170,  172,   73,   73,   73,   71,  232,
			  169,   73,   71,   71,   71,   73,   73,   73,  220,  220,
			   71,  171,  173,   73,   71,  235,   97,   73,  226,  227,
			  221,   97,  245,  227,  227,  228,  228,  100,  237,  240,
			  230,  232,  174,  231,  546,  175,  243,  246,  176,  524,
			  244,  257,  177,  282,  282,  178,  222,  235,  150,  245,
			  515,  151,  237,  240,  150,  513,  101,  151,  174,  100,
			  231,  101,  179,  229,  244,  257,  177,  182,  182,  246,
			  182,  182,  182,  183,  182,  182,  184,  185,  186,  187,

			  182,  182,  182,  182,  182,  188,  182,  182,  182,  182,
			  189,  182,  190,  182,  191,  192,  193,  194,  182,  195,
			  182,  196,  182,  182,  182,  197,  182,  198,  182,  182,
			  199,  200,  201,  202,  203,  204,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  205,  206,  207,  208,
			  209,  210,  211,  212,  213,  214,  215,  216,  217,  218,
			  182,  182,  238,  241,  255,  258,  239,  249,  269,  250,
			  358,  251,  259,  260,  283,  512,  256,   73,  242,  271,
			  267,  510,  252,  359,  268,  253,  147,  147,  275,  258,
			  147,  147,  269,  277,  238,  241,  255,  239,  262,  249,

			  250,  251,  242,  271,  259,  260,  252,  267,  263,  253,
			  272,  264,  275,  265,  266,  273,  491,  277,  279,  280,
			  279,  279,  284,  284,  147,  346,  274,  490,  148,  285,
			  262,  295,   73,  286,  263,  264,   73,  265,  266,  348,
			  301,  301,  272,  279,  281,  279,  279,  335,  335,  346,
			  274,  159,  160,  159,  159,  287,  349,   71,   73,  161,
			   73,   71,   71,  348,   73,   73,  291,   71,  292,  294,
			   73,   73,   73,  332,  332,  344,  486,  333,  345,  333,
			  349,  288,  334,  334,  347,  221,  336,  336,  339,  365,
			  339,  352,  360,  340,  340,  343,  343,  289,  337,  229,

			  229,   97,  290,  341,  342,  293,   97,  344,  342,  342,
			  345,  222,  100,  288,  356,  352,  347,  353,  357,  360,
			  367,  365,  371,  374,  338,  372,  290,  375,  380,  293,
			  376,  354,  431,  229,  378,  382,  484,  229,  356,  385,
			  388,  101,  357,  483,  100,  391,  101,  392,  377,  353,
			   73,  375,  367,  482,  371,  374,  372,  480,  378,  431,
			  380,  382,  376,  385,  389,  389,  388,  279,  280,  279,
			  279,  479,  377,  390,  282,  282,  163,  284,  284,   71,
			  394,   71,   73,   73,   73,  396,  398,  398,   73,  397,
			  301,  301,  334,  334,  399,  399,  401,  401,  221,  405,

			  405,  402,  402,  403,  419,  403,  395,  410,  404,  404,
			  412,  393,  413,  337,  340,  340,  406,  406,  408,  416,
			  341,  342,  418,  408,  222,  342,  342,  409,  409,  100,
			  419,  410,  400,  420,  412,  421,  413,  441,  393,  338,
			  423,  477,  428,  416,  430,  432,  418,  433,  435,  438,
			  439,  442,  444,  447,  407,  446,  445,  420,  229,  421,
			  467,  100,  476,  229,  423,  229,  428,  150,  430,  441,
			  151,  433,  432,  438,  475,  442,  469,  439,   71,  435,
			  445,   73,  446,  444,  467,  447,  149,  389,  389,   71,
			   71,  466,   73,   73,  398,  398,  453,  453,  454,  454,

			  455,  455,  456,  456,  404,  404,  452,  457,  457,  459,
			  459,  460,  460,  468,  337,  461,  461,  466,  448,  449,
			  470,  450,  471,  456,  456,  463,  473,  229,  229,  472,
			  474,  478,  489,  481,  400,  462,  485,  487,  488,  451,
			  338,  492,  448,  443,  468,  458,  471,  440,  450,  407,
			  473,   71,  470,  437,   73,  472,  474,  481,  497,  497,
			  485,  487,  488,  478,  489,  101,   71,  492,   71,   73,
			  496,   73,  496,  498,  498,  497,  497,  499,  511,  493,
			  456,  456,  501,  501,  502,  502,  503,  503,  504,  504,
			  514,  494,  500,  505,  505,  506,  400,  506,  508,  508,

			  504,  504,  511,  222,  516,  518,  517,  495,  520,  493,
			  509,  519,  521,  522,  525,  523,  526,  497,  497,  527,
			  458,   71,  514,  436,   73,  537,  407,   71,  516,  518,
			   73,  495,  517,  497,  497,  519,  521,  522,  525,  434,
			  520,  523,  526,  527,   71,  543,  528,   73,  531,  531,
			  532,  338,  532,  535,  535,  533,  533,  534,  545,  534,
			  536,  536,  535,  535,  504,  504,  529,  538,  538,  530,
			  504,  504,  539,  539,  540,  542,  540,  543,  547,  541,
			  541,  544,  429,   71,  537,  545,   73,  533,  533,  554,
			  529,  458,   73,  555,  556,  556,   73,  535,  535,  535,

			  535,  542,  557,  557,  547,  561,  558,  562,  558,  427,
			  338,  559,  559,  544,  503,  503,  426,  553,  541,  541,
			  560,  560,  563,  531,  531,   73,  537,  559,  559,  561,
			  425,  562,  400,  564,  564,  538,  538,  557,  557,  424,
			  422,  417,  415,  553,  414,  411,  387,  386,  384,  383,
			  381,  379,  338,  373,  370,  369,  368,  366,  407,  364,
			  363,  400,  362,  361,  355,  351,  350,  331,  330,  329,
			  328,  458,  327,  407,  326,  458,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   63,

			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   70,   70,  325,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   87,  324,  323,  322,  321,
			  320,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   88,   88,
			  319,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,  108,  108,  318,  317,  108,  108,  108,  108,  108,

			  108,  108,  108,  108,  108,  149,  149,  316,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,   72,   72,
			  315,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,  163,  163,  163,  163,  314,  313,  312,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,   91,   91,  311,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			  223,  223,  223,  223,  223,  223,  223,  223,  310,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  149,  149,  149,  149,  309,  308,  307,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  163,
			  163,  306,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  507,  507,  507,  507,  507,  507,  507,  507,
			  305,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  507,  304,  303,  302,  300,  299,
			  298,  297,  296,  295,  278,  276,  270,  261,  254,  248,
			  247,  236,  234,  219,  181,  164,   68,  146,  145,  137,

			  131,  112,  107,  102,   69,   68,  565,    7,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565>>)
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
			    1,    1,    1,    1,    1,    1,    3,    4,   15,   15,
			    3,    4,  557,    3,    4,    5,    5,    5,    5,    6,
			    6,    6,    6,    5,   43,   21,    9,    6,    9,    9,

			   12,   12,  538,   12,   21,   28,   28,   12,   12,   23,
			   12,   22,   12,   22,   22,   23,  413,   12,   43,   12,
			  413,   12,   24,   47,   24,   24,   30,   30,   25,   12,
			   25,   25,   35,   24,   12,   12,   32,   45,   32,  531,
			   40,   34,   35,   32,   12,   34,   40,   49,   12,   47,
			   12,   34,   45,   12,   34,   59,   48,   36,   59,   36,
			   12,  526,   24,   32,   32,   24,   37,   32,   25,   36,
			   37,   34,   34,  525,   39,   34,   45,   49,   34,   46,
			   42,   39,   39,   37,   36,   36,  112,   39,   48,   46,
			   42,  523,   42,   55,   55,  522,   42,   67,   37,   67,

			   67,   70,  521,   74,   70,   39,   74,   37,   39,   46,
			  112,   39,   42,   46,   97,   97,   75,   42,   42,   75,
			   42,   64,   64,   64,   64,   76,   97,   86,   76,   64,
			   86,   55,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,

			   62,   62,   62,   62,   62,   62,   62,   72,   77,   72,
			   72,   77,   72,   78,   79,   72,   78,   79,   80,  110,
			   77,   80,   81,   82,   83,   81,   82,   83,   94,   94,
			   84,   78,   79,   84,   85,  114,   98,   85,   98,   98,
			   94,   99,  122,   99,   99,  101,  101,   98,  116,  119,
			  109,  110,   80,  109,  517,   81,  121,  123,   82,  485,
			  121,  131,   83,  157,  157,   84,   94,  114,  149,  122,
			  473,  149,  116,  119,  156,  470,   98,  156,   80,   98,
			  109,   99,   85,  101,  121,  131,   83,   89,   89,  123,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,  117,  120,  130,  132,  117,  127,  139,  127,
			  247,  127,  133,  134,  163,  467,  130,  163,  120,  141,
			  138,  465,  127,  247,  138,  127,  147,  147,  143,  132,
			  148,  148,  139,  145,  117,  120,  130,  117,  137,  127,

			  127,  127,  120,  141,  133,  134,  127,  138,  137,  127,
			  142,  137,  143,  137,  137,  142,  445,  145,  153,  153,
			  153,  153,  164,  164,  147,  235,  142,  444,  148,  169,
			  137,  188,  169,  171,  137,  137,  171,  137,  137,  237,
			  188,  188,  142,  155,  155,  155,  155,  222,  222,  235,
			  142,  159,  159,  159,  159,  173,  238,  174,  173,  159,
			  174,  175,  176,  237,  175,  176,  177,  178,  177,  179,
			  178,  177,  179,  220,  220,  230,  438,  221,  234,  221,
			  238,  174,  221,  221,  236,  220,  224,  224,  225,  253,
			  225,  242,  248,  225,  225,  228,  228,  175,  224,  229,

			  229,  226,  176,  226,  226,  178,  227,  230,  227,  227,
			  234,  220,  226,  174,  245,  242,  236,  243,  246,  248,
			  255,  253,  261,  263,  224,  261,  176,  264,  268,  178,
			  265,  243,  367,  228,  266,  270,  436,  229,  245,  273,
			  276,  226,  246,  435,  226,  288,  227,  288,  265,  243,
			  288,  264,  255,  434,  261,  263,  261,  432,  266,  367,
			  268,  270,  265,  273,  278,  278,  276,  279,  279,  279,
			  279,  430,  265,  282,  282,  282,  284,  284,  284,  289,
			  290,  291,  289,  290,  291,  293,  332,  332,  293,  301,
			  301,  301,  333,  333,  334,  334,  335,  335,  332,  338,

			  338,  336,  336,  337,  353,  337,  291,  344,  337,  337,
			  346,  289,  347,  336,  339,  339,  340,  340,  341,  350,
			  341,  341,  352,  342,  332,  342,  342,  343,  343,  341,
			  353,  344,  334,  354,  346,  355,  347,  379,  289,  336,
			  357,  428,  363,  350,  365,  369,  352,  371,  373,  376,
			  377,  380,  384,  387,  340,  386,  385,  354,  341,  355,
			  416,  341,  426,  342,  357,  343,  363,  390,  365,  379,
			  390,  371,  369,  376,  425,  380,  418,  377,  391,  373,
			  385,  391,  386,  384,  416,  387,  389,  389,  389,  395,
			  393,  414,  395,  393,  398,  398,  399,  399,  400,  400,

			  401,  401,  402,  402,  403,  403,  398,  404,  404,  405,
			  405,  406,  406,  417,  402,  407,  407,  414,  391,  393,
			  419,  395,  420,  408,  408,  409,  423,  409,  409,  421,
			  424,  429,  442,  433,  399,  408,  437,  439,  441,  397,
			  402,  447,  391,  381,  417,  404,  420,  378,  395,  406,
			  423,  448,  419,  375,  448,  421,  424,  433,  453,  453,
			  437,  439,  441,  429,  442,  409,  449,  447,  450,  449,
			  452,  450,  452,  454,  454,  452,  452,  455,  466,  448,
			  456,  456,  457,  457,  458,  458,  459,  459,  460,  460,
			  472,  449,  456,  461,  461,  462,  453,  462,  463,  463,

			  462,  462,  466,  455,  475,  477,  476,  450,  479,  448,
			  463,  478,  480,  481,  489,  483,  490,  496,  496,  492,
			  457,  493,  472,  374,  493,  503,  460,  494,  475,  477,
			  494,  450,  476,  497,  497,  478,  480,  481,  489,  372,
			  479,  483,  490,  492,  495,  512,  493,  495,  498,  498,
			  499,  503,  499,  501,  501,  499,  499,  500,  514,  500,
			  502,  502,  500,  500,  504,  504,  494,  505,  505,  495,
			  506,  506,  508,  508,  509,  510,  509,  512,  520,  509,
			  509,  513,  364,  528,  508,  514,  528,  532,  532,  529,
			  494,  501,  529,  530,  533,  533,  530,  534,  534,  535,

			  535,  510,  536,  536,  520,  547,  537,  549,  537,  362,
			  508,  537,  537,  513,  539,  539,  361,  528,  540,  540,
			  541,  541,  553,  556,  556,  553,  539,  558,  558,  547,
			  360,  549,  533,  559,  559,  560,  560,  564,  564,  359,
			  356,  351,  349,  528,  348,  345,  275,  274,  272,  271,
			  269,  267,  539,  262,  260,  258,  256,  254,  541,  252,
			  251,  556,  250,  249,  244,  240,  239,  218,  217,  216,
			  215,  559,  214,  560,  213,  564,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  567,

			  567,  567,  567,  567,  567,  567,  567,  567,  567,  567,
			  567,  567,  567,  567,  567,  567,  567,  567,  567,  567,
			  567,  567,  568,  568,  212,  568,  568,  568,  568,  568,
			  568,  568,  568,  568,  568,  568,  568,  568,  568,  568,
			  568,  568,  568,  568,  568,  569,  211,  210,  209,  208,
			  207,  569,  569,  569,  569,  569,  569,  569,  569,  569,
			  569,  569,  569,  569,  569,  569,  569,  569,  570,  570,
			  206,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  571,  571,  205,  204,  571,  571,  571,  571,  571,

			  571,  571,  571,  571,  571,  572,  572,  203,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  573,  573,
			  202,  573,  573,  573,  573,  573,  573,  573,  573,  573,
			  573,  573,  573,  573,  573,  573,  573,  573,  573,  573,
			  573,  574,  574,  574,  574,  201,  200,  199,  574,  574,
			  574,  574,  574,  574,  574,  574,  574,  575,  575,  198,
			  575,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  575,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  576,  576,  576,  576,  576,  576,  576,  576,  197,  576,

			  576,  576,  576,  576,  576,  576,  576,  576,  576,  576,
			  576,  576,  576,  577,  577,  577,  577,  196,  195,  194,
			  577,  577,  577,  577,  577,  577,  577,  577,  577,  578,
			  578,  193,  578,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  578,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  579,  579,  579,  579,  579,  579,  579,  579,
			  192,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  191,  190,  189,  187,  186,
			  185,  184,  183,  182,  151,  144,  140,  136,  129,  126,
			  124,  115,  113,   90,   88,   73,   68,   52,   50,   44,

			   41,   33,   31,   26,   11,   10,    7,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   73,   74,   83,   87, 1406, 1407,   94,
			 1402, 1398,   93,    0, 1407,   68, 1407, 1407, 1407, 1407,
			 1407,   78,   93,   90,  104,  110, 1378, 1407,   81, 1407,
			  101, 1377,   97, 1365,  106,  100,  118,  138,    0,  141,
			  104, 1358,  151,   49, 1367,  105,  144,   82,  128,  112,
			 1356, 1407, 1342, 1407, 1407,  173, 1407, 1407, 1407,  148,
			 1407, 1407,  231, 1407,  219, 1407, 1407,  195, 1393, 1407,
			  194, 1407,  305, 1376,  196,  209,  218,  301,  306,  307,
			  311,  315,  316,  317,  323,  327,  220,    0, 1383,  386,
			 1382,    0, 1407, 1407,  308, 1407, 1407,  194,  318,  323,

			 1407,  325, 1407, 1407, 1407, 1407, 1407, 1407,    0,  314,
			  288,    0,  139, 1360,  307, 1359,  303,  433,    0,  303,
			  432,  313,  303,  329, 1348,    0, 1346,  436,    0, 1350,
			  434,  314,  419,  441,  443,    0, 1355,  467,  441,  423,
			 1354,  431,  479,  443, 1353,  448, 1407,  466,  470,  361,
			 1407, 1365, 1407,  516, 1407,  541,  367,  343, 1407,  549,
			 1407, 1407, 1407,  467,  502, 1407, 1407, 1407, 1407,  522,
			 1407,  526, 1407,  548,  550,  554,  555,  561,  560,  562,
			 1407, 1407, 1372, 1371, 1370, 1369, 1368, 1367,  520, 1366,
			 1365, 1364, 1349, 1320, 1308, 1307, 1306, 1287, 1258, 1246,

			 1245, 1244, 1219, 1196, 1183, 1182, 1159, 1139, 1138, 1137,
			 1136, 1135, 1113, 1063, 1061, 1059, 1058, 1057, 1056, 1407,
			  553,  562,  527, 1407,  566,  573,  583,  588,  575,  579,
			  547,    0,    0,    0,  548,  479,  556,  494,  508, 1034,
			 1033,    0,  543,  589, 1032,  568,  571,  430,  553, 1031,
			 1026, 1028, 1016,  561, 1025,  592, 1013,    0, 1013,    0,
			 1022,  592, 1021,  595,  579,  600,  589, 1019,  600, 1014,
			  594, 1017, 1016,  595, 1011, 1010,  599,    0,  644,  665,
			 1407, 1407,  654, 1407,  657, 1407, 1407, 1407,  640,  672,
			  673,  674, 1407,  678, 1407, 1407, 1407, 1407, 1407, 1407,

			 1407,  670, 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407,
			 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407,
			 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407, 1407,
			 1407, 1407,  666,  672,  674,  676,  681,  688,  679,  694,
			  696,  700,  705,  707,  661, 1007,  664,  665, 1012, 1008,
			  674, 1005,  677,  663,  688,  690, 1008,  692,    0, 1007,
			  994,  965,  958,  697,  950,  699,    0,  593,    0,  706,
			    0,  699,  903,  715,  883,  817,  701,  711,  795,  707,
			  706,  800,    0,    0,  719,  708,  716,  725,    0,  767,
			  760,  771, 1407,  783, 1407,  782, 1407,  828,  774,  776,

			  778,  780,  782,  784,  787,  789,  791,  795,  803,  807,
			    0,    0,    0,   84,  750,    0,  715,  780,  744,  789,
			  775,  788,    0,  781,  789,  742,  726,    0,  705,  801,
			  635,    0,  625,  788,  602,  607,  604,  791,  544,  790,
			    0,  791,  804,    0,  491,  484,    0,  800,  844,  859,
			  861, 1407,  855,  838,  853,  845,  860,  862,  864,  866,
			  868,  873,  880,  878,    0,  439,  831,  443,    0,    0,
			  343,    0,  862,  338,    0,  858,  865,  858,  864,  880,
			  865,  867,    0,  874,    0,  327,    0,    0,    0,  867,
			  875,    0,  872,  914,  920,  937,  897,  913,  928,  935,

			  942,  933,  940,  893,  944,  947,  950, 1407,  952,  959,
			  934,    0,  914,  950,  919,    0,    0,  320,    0,    0,
			  937,  170,  153,  159,    0,  141,  129,    0,  976,  982,
			  986,   81,  967,  974,  977,  979,  982,  991,   44,  994,
			  998, 1000,    0,    0,    0,    0,    0,  958,    0,  962,
			    0,    0,    0, 1015, 1407, 1407, 1003,   24, 1007, 1013,
			 1015,    0,    0, 1407, 1017, 1407, 1075, 1098, 1121, 1144,
			 1167, 1181, 1204, 1227, 1246, 1266, 1289, 1308, 1328, 1351>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  565,    1,  566,  566,  567,  567,  565,  565,  565,
			  565,  565,  568,  569,  565,  570,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  565,  565,  565,  565,  565,  565,  565,  565,  572,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  568,  565,  573,  574,  568,  568,  568,  568,  568,  568,
			  568,  568,  568,  568,  568,  568,  568,  569,  565,  565,
			  565,  575,  565,  565,  565,  565,  565,  576,  565,  565,

			  565,  565,  565,  565,  565,  565,  565,  565,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  565,  565,  565,  572,
			  565,  577,  565,  565,  565,  565,  572,  565,  565,  565,
			  565,  565,  565,  578,  565,  565,  565,  565,  565,  568,
			  565,  568,  565,  568,  568,  568,  568,  568,  568,  568,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,

			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  568,  568,
			  568,  568,  565,  568,  565,  565,  565,  565,  565,  565,

			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  565,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  565,
			  572,  568,  565,  568,  565,  568,  565,  565,  565,  565,

			  565,  565,  565,  565,  565,  565,  565,  565,  576,  565,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  568,  568,
			  568,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  565,  579,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  568,  568,  568,  565,  565,  565,  565,

			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  568,  568,
			  568,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  568,  565,  565,  565,  565,  565,  565,
			  565,  571,  571,  565,  565,    0,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565>>)
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
			    0,    0,    0,    0,    0,    0,    0,  190,  188,    1,
			    2,   16,  162,   96,   23,  140,   17,   18,    6,    5,
			   14,    4,   12,    7,  178,  178,   15,   13,   11,    9,
			   10,  188,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   21,  188,   22,    8,  188,  121,   19,   20,  169,
			  173,  170,  172,  176,  176,  175,  174,    1,    2,   29,
			  162,  160,  162,    0,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,   96,  140,  140,
			  139,    3,   30,   31,  184,   24,   26,    0,  178,  178,

			  177,  181,   34,   32,   28,   27,   33,   35,   95,   95,
			   95,   39,   95,   95,   95,   95,   95,   95,   47,   95,
			   95,   95,   95,   95,   95,   59,   95,   95,   66,   95,
			   95,   95,   95,   95,   95,   74,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   25,  180,  180,  169,
			  170,    0,  171,  171,  163,  171,  169,  167,  168,    0,
			  175,  174,  159,  162,    0,  143,  141,  142,  144,  162,
			  148,  162,  150,  162,  162,  162,  162,  162,  162,  162,
			  147,   97,  140,  140,  140,  140,  140,  140,  138,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,

			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,   98,
			  184,    0,    0,  182,  184,  182,  178,  178,  181,  181,
			   95,   37,   38,   94,   95,   95,   95,   95,   95,   95,
			   95,   50,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   70,   95,   72,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   93,    0,    0,
			  164,  163,  166,  161,    0,  145,  149,  151,  162,  162,
			  162,  162,  154,  162,  146,  136,  115,  113,  114,  116,

			  117,  137,  118,  119,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,  109,  110,  111,  112,  122,  123,
			  124,  125,  126,  127,  128,  129,  130,  131,  132,  133,
			  134,  135,  184,    0,  184,    0,  184,    0,    0,    0,
			  183,  178,  178,  181,   95,   95,   95,   95,   95,   95,
			   95,   48,   95,   95,   95,   95,   95,   95,   57,   95,
			   95,   95,   95,   95,   95,   95,   67,   95,   69,   95,
			   73,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   86,   87,   95,   95,   95,   95,   92,    0,
			  165,  162,  153,  162,  152,  162,  155,  140,  184,  184,

			    0,    0,  184,    0,  183,    0,  183,    0,    0,  179,
			   36,   40,   41,   95,   95,   45,   95,   95,   95,   95,
			   95,   95,   55,   95,   95,   95,   95,   62,   95,   95,
			   95,   68,   95,   95,   95,   95,   95,   95,   95,   95,
			   82,   95,   95,   85,   95,   95,   90,   95,  162,  162,
			  162,  120,    0,  184,    0,  187,  184,  183,    0,    0,
			  183,    0,  182,    0,   42,   95,   95,   95,   49,   51,
			   95,   53,   95,   95,   58,   95,   95,   95,   95,   95,
			   95,   95,   76,   95,   78,   95,   80,   81,   83,   95,
			   95,   89,   95,  162,  162,  162,    0,  184,    0,    0,

			    0,  183,    0,  187,  183,    0,    0,  185,  187,  185,
			   95,   44,   95,   95,   95,   56,   60,   95,   63,   64,
			   95,   95,   95,   95,   79,   95,   95,   91,  162,  162,
			  162,  187,    0,  187,    0,  183,    0,    0,  186,  187,
			    0,  186,   43,   46,   52,   54,   61,   95,   71,   95,
			   77,   84,   88,  162,  158,  157,  187,  186,    0,  186,
			  186,   65,   75,  156,  186,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1407
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 565
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 566
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

	yyNb_rules: INTEGER is 189
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 190
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	MS: INTEGER is 1
	MSN: INTEGER is 2
			-- Start condition codes

feature -- User-defined features



end -- class ET_EIFFEL_SCANNER
