%{
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
%}

%x MS MSN
%option nodefault outfile="et_eiffel_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		column := column + text_count
\n+			{
				line := line + text_count
				column := 1
			}


----------/** Eiffel comments **/-----------------------------------------------

"--".*			column := column + text_count


----------/** Eiffel symbols **/------------------------------------------------

"-"				process_one_character_symbol (Minus_code)
"+"				process_one_character_symbol (Plus_code)
"*"				process_one_character_symbol (Star_code)
"/"				process_one_character_symbol (Slash_code)
"^"				process_one_character_symbol (Caret_code)
"="				process_one_character_symbol (Equal_code)
">"				process_one_character_symbol (Greater_than_code)
"<"				process_one_character_symbol (Less_than_code)
"."				process_one_character_symbol (Dot_code)
";"				process_one_character_symbol (Semicolon_code)
","				process_one_character_symbol (Comma_code)
":"				process_one_character_symbol (Colon_code)
"!"				process_one_character_symbol (Exclamation_code)
"("				process_one_character_symbol (Left_parenthesis_code)
")"				process_one_character_symbol (Right_parenthesis_code)
"{"				process_one_character_symbol (Left_brace_code)
"}"				process_one_character_symbol (Right_brace_code)
"["				process_one_character_symbol (Left_bracket_code)
"]"				process_one_character_symbol (Right_bracket_code)
"$"				process_one_character_symbol (Dollar_code)
"//"			process_two_character_symbol (E_DIV)
"\\\\"			process_two_character_symbol (E_MOD)
"/="			process_two_character_symbol (E_NE)
">="			process_two_character_symbol (E_GE)
"<="			process_two_character_symbol (E_LE)
"!!"			process_two_character_symbol (E_BANGBANG)
"->"			process_two_character_symbol (E_ARROW)
".."			process_two_character_symbol (E_DOTDOT)
"<<"			process_two_character_symbol (E_LARRAY)
">>"			process_two_character_symbol (E_RARRAY)
":="			process_two_character_symbol (E_ASSIGN)
"?="			process_two_character_symbol (E_REVERSE)


----------/** Reserved words **/------------------------------------------------

[aA][lL][iI][aA][sS]	{
				last_token := E_ALIAS
				last_value := current_position
				column := column + 5
			}
[aA][lL][lL]	{
				last_token := E_ALL
				last_value := current_position
				column := column + 3
			}
[aA][nN][dD]	{
				last_token := E_AND
				last_value := current_position
				column := column + 3
			}
[aA][sS]	{
				last_token := E_AS
				last_value := current_position
				column := column + 2
			}
[cC][hH][eE][cC][kK]	{
				last_token := E_CHECK
				last_value := current_position
				column := column + 5
			}
[cC][lL][aA][sS][sS]	{
				last_token := E_CLASS
				last_value := current_position
				column := column + 5
			}
[cC][rR][eE][aA][tT][eE]	{
				if create_keyword then
					last_token := E_CREATE
					last_value := current_position
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (text)
				end
				column := column + 6
			}
[cC][rR][eE][aA][tT][iI][oO][nN]	{
				last_token := E_CREATION
				last_value := current_position
				column := column + 8
			}
[cC][uU][rR][rR][eE][nN][tT]	{
				last_token := E_CURRENT
				last_value := current_position
				column := column + 7
			}
[dD][eE][bB][uU][gG]	{
				last_token := E_DEBUG
				last_value := current_position
				column := column + 5
			}
[dD][eE][fF][eE][rR][rR][eE][dD]	{
				last_token := E_DEFERRED
				last_value := current_position
				column := column + 8
			}
[dD][oO]	{
				last_token := E_DO
				last_value := current_position
				column := column + 2
			}
[eE][lL][sS][eE]	{
				last_token := E_ELSE
				last_value := current_position
				column := column + 4
			}
[eE][lL][sS][eE][iI][fF]	{
				last_token := E_ELSEIF
				last_value := current_position
				column := column + 6
			}
[eE][nN][dD]	{
				last_token := E_END
				last_value := current_position
				column := column + 3
			}
[eE][nN][sS][uU][rR][eE]	{
				last_token := E_ENSURE
				last_value := current_position
				column := column + 6
			}
[eE][xX][pP][aA][nN][dD][eE][dD]	{
				last_token := E_EXPANDED
				last_value := current_position
				column := column + 8
			}
[eE][xX][pP][oO][rR][tT]	{
				last_token := E_EXPORT
				last_value := current_position
				column := column + 6
			}
[eE][xX][tT][eE][rR][nN][aA][lL]	{
				last_token := E_EXTERNAL
				last_value := current_position
				column := column + 8
			}
[fF][aA][lL][sS][eE]	{
				last_token := E_FALSE
				last_value := new_false_constant
				column := column + 5
			}
[fF][eE][aA][tT][uU][rR][eE]	{
				last_token := E_FEATURE
				last_value := current_position
				column := column + 7
			}
[fF][rR][oO][mM]	{
				last_token := E_FROM
				last_value := current_position
				column := column + 4
			}
[fF][rR][oO][zZ][eE][nN]	{
				last_token := E_FROZEN
				last_value := current_position
				column := column + 6
			}
[iI][fF]	{
				last_token := E_IF
				last_value := current_position
				column := column + 2
			}
[iI][mM][pP][lL][iI][eE][sS]	{
				last_token := E_IMPLIES
				last_value := current_position
				column := column + 7
			}
[iI][nN][dD][eE][xX][iI][nN][gG]	{
				last_token := E_INDEXING
				last_value := current_position
				column := column + 8
			}
[iI][nN][fF][iI][xX]	{
				last_token := E_INFIX
				last_value := current_position
				column := column + 5
			}
[iI][nN][hH][eE][rR][iI][tT]	{
				last_token := E_INHERIT
				last_value := current_position
				column := column + 7
			}
[iI][nN][sS][pP][eE][cC][tT]	{
				last_token := E_INSPECT
				last_value := current_position
				column := column + 7
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_INVARIANT
				last_value := current_position
				column := column + 9
			}
[iI][sS]	{
				last_token := E_IS
				last_value := current_position
				column := column + 2
			}
[lL][iI][kK][eE]	{
				last_token := E_LIKE
				last_value := current_position
				column := column + 4
			}
[lL][oO][cC][aA][lL]	{
				last_token := E_LOCAL
				last_value := current_position
				column := column + 5
			}
[lL][oO][oO][pP]	{
				last_token := E_LOOP
				last_value := current_position
				column := column + 4
			}
[nN][oO][tT]	{
				last_token := E_NOT
				last_value := current_position
				column := column + 3
			}
[oO][bB][sS][oO][lL][eE][tT][eE]	{
				last_token := E_OBSOLETE
				last_value := current_position
				column := column + 8
			}
[oO][lL][dD]	{
				last_token := E_OLD
				last_value := current_position
				column := column + 3
			}
[oO][nN][cC][eE]	{
				last_token := E_ONCE
				last_value := current_position
				column := column + 4
			}
[oO][rR]	{
				last_token := E_OR
				last_value := current_position
				column := column + 2
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR]	{
				last_token := E_PRECURSOR
				last_value := current_position
				column := column + 9
			}
[pP][rR][eE][fF][iI][xX]	{
				last_token := E_PREFIX
				last_value := current_position
				column := column + 6
			}
[rR][eE][dD][eE][fF][iI][nN][eE]	{
				last_token := E_REDEFINE
				last_value := current_position
				column := column + 8
			}
[rR][eE][nN][aA][mM][eE]	{
				last_token := E_RENAME
				last_value := current_position
				column := column + 6
			}
[rR][eE][qQ][uU][iI][rR][eE]	{
				last_token := E_REQUIRE
				last_value := current_position
				column := column + 7
			}
[rR][eE][sS][cC][uU][eE]	{
				last_token := E_RESCUE
				last_value := current_position
				column := column + 6
			}
[rR][eE][sS][uU][lL][tT]	{
				last_token := E_RESULT
				last_value := current_position
				column := column + 6
			}
[rR][eE][tT][rR][yY]	{
				last_token := E_RETRY
				last_value := current_position
				column := column + 5
			}
[sS][eE][lL][eE][cC][tT]	{
				last_token := E_SELECT
				last_value := current_position
				column := column + 6
			}
[sS][eE][pP][aA][rR][aA][tT][eE]	{
				last_token := E_SEPARATE
				last_value := current_position
				column := column + 8
			}
[sS][tT][rR][iI][pP]	{
				last_token := E_STRIP
				last_value := current_position
				column := column + 5
			}
[tT][hH][eE][nN]	{
				last_token := E_THEN
				last_value := current_position
				column := column + 4
			}
[tT][rR][uU][eE]	{
				last_token := E_TRUE
				last_value := new_true_constant
				column := column + 4
			}
[uU][nN][dD][eE][fF][iI][nN][eE]	{
				last_token := E_UNDEFINE
				last_value := current_position
				column := column + 8
			}
[uU][nN][iI][qQ][uU][eE]	{
				last_token := E_UNIQUE
				last_value := current_position
				column := column + 6
			}
[uU][nN][tT][iI][lL]	{
				last_token := E_UNTIL
				last_value := current_position
				column := column + 5
			}
[vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_VARIANT
				last_value := current_position
				column := column + 7
			}
[wW][hH][eE][nN]	{
				last_token := E_WHEN
				last_value := current_position
				column := column + 4
			}
[xX][oO][rR]	{
				last_token := E_XOR
				last_value := current_position
				column := column + 3
			}


----------/** Eiffel identifiers **/--------------------------------------------

[bB][iI][tT]	{
				last_token := E_BITTYPE
				last_value := new_identifier (text)
				column := column + 3
			}
[a-zA-Z][a-zA-Z0-9_]*	{
				last_token := E_IDENTIFIER
				last_value := new_identifier (text)
				column := column + text_count
			}


----------/** Eiffel free operators **/-----------------------------------------

[@#|&][^%" \t\r\n]*	{
				last_token := E_FREEOP
				last_value := new_token (text)
				column := column + text_count
			}

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n']\'	{
				last_token := E_CHARACTER
				last_value := new_character_constant (text_item (2))
				column := column + 3
			}
\'\'\'		{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)

				column := column - 1
				last_token := E_CHARACTER
				last_value := new_character_constant ('%'')
				column := column + 3
			}

\'%A\'			process_c2_character_constant ('%A')
\'%B\'			process_c2_character_constant ('%B')
\'%C\'			process_c2_character_constant ('%C')
\'%D\'			process_c2_character_constant ('%D')
\'%F\'			process_c2_character_constant ('%F')
\'%H\'			process_c2_character_constant ('%H')
\'%L\'			process_c2_character_constant ('%L')
\'%N\'			process_c2_character_constant ('%N')
\'%Q\'			process_c2_character_constant ('%Q')
\'%R\'			process_c2_character_constant ('%R')
\'%S\'			process_c2_character_constant ('%S')
\'%T\'			process_c2_character_constant ('%T')
\'%U\'			process_c2_character_constant ('%U')
\'%V\'			process_c2_character_constant ('%V')
\'%%\'			process_c2_character_constant ('%%')
\'%\'\'			process_c2_character_constant ('%'')
\'%\"\'			process_c2_character_constant ('%"')
\'%\(\'			process_c2_character_constant ('%(')
\'%\)\'			process_c2_character_constant ('%)')
\'%<\'			process_c2_character_constant ('%<')
\'%>\'			process_c2_character_constant ('%>')

\'%\/[0-9]+\/\'	{
				last_token := E_CHARACTER
				last_value := new_c3_character_constant (text_substring (4, text_count - 2))
				column := column + text_count
			}
			`
\'%a\'			process_lower_case_c2_character_constant ('%A')
\'%b\'			process_lower_case_c2_character_constant ('%B')
\'%c\'			process_lower_case_c2_character_constant ('%C')
\'%d\'			process_lower_case_c2_character_constant ('%D')
\'%f\'			process_lower_case_c2_character_constant ('%F')
\'%h\'			process_lower_case_c2_character_constant ('%H')
\'%l\'			process_lower_case_c2_character_constant ('%L')
\'%n\'			process_lower_case_c2_character_constant ('%N')
\'%q\'			process_lower_case_c2_character_constant ('%Q')
\'%r\'			process_lower_case_c2_character_constant ('%R')
\'%s\'			process_lower_case_c2_character_constant ('%S')
\'%t\'			process_lower_case_c2_character_constant ('%T')
\'%u\'			process_lower_case_c2_character_constant ('%U')
\'%v\'			process_lower_case_c2_character_constant ('%V')

\'%.\'		{
					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)

				column := column - 2
				last_token := E_CHARACTER
				last_value := new_c2_character_constant (text_item (3))
				column := column + 4
			}

\'%\/[0-9]+	{
					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				error_handler.report_SCAS_error (current_position)

				last_token := E_CHARERR
			}
\'%\/		{
					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				error_handler.report_SCAC_error (current_position)

				last_token := E_CHARERR
			}
\'\'		{
					-- Syntax error: missing character between quotes.
				column := column + 1
				error_handler.report_SCQQ_error (current_position)

				column := column + 1
				last_token := E_CHARERR
			}
\'(.|%.|%\/[0-9]+\/)?	{
					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				error_handler.report_SCEQ_error (current_position)

				last_token := E_CHARERR
			}


----------/** Eiffel strings **/------------------------------------------------

\"\+\"		{
				last_token := E_STRPLUS
				last_value := new_manifest_string ("+")
				column := column + 3
			}
\"-\"		{
				last_token := E_STRMINUS
				last_value := new_manifest_string ("-")
				column := column + 3
			}
\"\*\"		{
				last_token := E_STRSTAR
				last_value := new_manifest_string ("*")
				column := column + 3
			}
\"\/\"		{
				last_token := E_STRSLASH
				last_value := new_manifest_string ("/")
				column := column + 3
			}
\"\/\/\"	{
				last_token := E_STRDIV
				last_value := new_manifest_string ("//")
				column := column + 4
			}
\"\\\\\"	{
				last_token := E_STRMOD
				last_value := new_manifest_string ("\\")
				column := column + 4
			}
\"^\"		{
				last_token := E_STRPOWER
				last_value := new_manifest_string ("^")
				column := column + 3
			}
\"<\"		{
				last_token := E_STRLT
				last_value := new_manifest_string ("<")
				column := column + 3
			}
\"<=\"		{
				last_token := E_STRLE
				last_value := new_manifest_string ("<=")
				column := column + 4
			}
\">\"		{
				last_token := E_STRGT
				last_value := new_manifest_string (">")
				column := column + 3
			}
\">=\"		{
				last_token := E_STRGE
				last_value := new_manifest_string (">=")
				column := column + 4
			}
\"[nN][oO][tT]\"	{
				last_token := E_STRNOT
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			}
\"[aA][nN][dD]\"	{
				last_token := E_STRAND
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			}
\"[oO][rR]\"	{
				last_token := E_STROR
				last_value := new_manifest_string (text_substring (2, 3))
				column := column + 4
			}
\"[xX][oO][rR]\"	{
				last_token := E_STRXOR
				last_value := new_manifest_string (text_substring (2, 4))
				column := column + 5
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"	{
				last_token := E_STRANDTHEN
				last_value := new_manifest_string (text_substring (2, 9))
				column := column + 10
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"	{
				last_token := E_STRORELSE
				last_value := new_manifest_string (text_substring (2, 8))
				column := column + 9
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"	{
				last_token := E_STRIMPLIES
				last_value := new_manifest_string (text_substring (2, 8))
				column := column + 9
			}
\"[@#|&][^%" \t\r\n]*\"	{
				last_token := E_STRFREEOP
				last_value := new_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			}

\"[^%\n"]*\"	{
					-- Regular manifest string.
				last_token := E_STRING
				last_value := new_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			}

\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"	{
					-- Manifest string with special characters.
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				column := column + text_count
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*	{
					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				ms_count := text_count
				column := column + ms_count
				more
				set_start_condition (MS)
			}

<MS>{
	%\r?\n	{
					-- Multi-line manifest string.
				line := line + 1
				column := 1
				ms_count := text_count
				more
				set_start_condition (MSN)
			}
	%[ \t\r]+\n	{
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
			}
	%\/[0-9]+\/	{
				column := column + (text_count - ms_count)
				ms_count := text_count
				more
			}
	%\/[0-9]+	{
					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := column + (text_count - ms_count)
				error_handler.report_SSAS_error (current_position)

				ms_count := text_count
				more
			}
	%\/		{
					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := column + 2
				error_handler.report_SSAC_error (current_position)

				ms_count := ms_count + 2
				more
			}
	%[abcdfhlnqrstuv]	{
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := column + 1
				error_handler.report_SSCU_error (current_position)

				column := column + 1
				ms_count := ms_count + 2
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))+	{
				column := column + (text_count - ms_count)
				ms_count := text_count
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"	{
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				column := column + (text_count - ms_count)
				set_start_condition (INITIAL)
			}
	%.		{
					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := column + 1
				error_handler.report_SSSC_error (current_position)

				column := column + 1
				ms_count := text_count
				more
			}
	%		{
					-- Syntax error: invalid special character
					-- %l in manifest strings.
				error_handler.report_SSSC_error (current_position)

				last_token := E_STRERR
				column := column + 1
				set_start_condition (INITIAL)
			}
	\n		{
					-- Syntax error: Invalid new-line in manifest string.
				error_handler.report_SSNL_error (current_position)

				last_token := E_STRERR
				line := line + 1
				column := 1
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Syntax error: missing double quote at
					-- end of manifest string.
				error_handler.report_SSEQ_error (current_position)

				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}

<MSN>{
	[ \r\t]*%	{
				column := column + (text_count - ms_count)
				ms_count := text_count
				more
				set_start_condition (MS)
			}
	[ \r\t]*\n	{
					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				error_handler.report_SSEL_error (current_position)

				line := line + 1
				column := 1
				ms_count := text_count
				more
			}
	.		{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				error_handler.report_SSNP_error (current_position)

				last_token := E_STRERR
				column := column + 1
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				error_handler.report_SSNP_error (current_position)

				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel bits **/---------------------------------------------------

[0-1]+[bB]	{
				last_token := E_BIT
				last_value := new_bit_constant (text)
				column := column + text_count
			}


----------/** Eiffel integers **/-----------------------------------------------

[0-9]+		{
				last_token := E_INTEGER
				last_value := new_integer_constant (text)
				column := column + text_count
			}
[0-9]{1,3}(_[0-9]{3})+	{
				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			}
_(_*[0-9_]+_*)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			}
(_*[0-9]+_*)+	{
					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
				column := column + text_count
			}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./[^.0-9]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
				last_token := E_REAL
				last_value := new_real_constant (text)
				column := column + text_count
			}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
				column := column + text_count
			}

		-- The first and fourth expressions use a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.

--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
				last_value := current_position
				column := column + 1
			}

--------------------------------------------------------------------------------
%%

end -- class ET_EIFFEL_SCANNER
