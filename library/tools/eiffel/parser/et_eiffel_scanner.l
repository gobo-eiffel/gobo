%{
note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON
		redefine
			read_token
		end

create

	make
%}

CHAR_CODE (0*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))

%x BREAK MS MSN VS1 VS2 VS3 LAVS1 LAVS2 LAVS3
%option nodefault line outfile="et_eiffel_scanner.e"

%%

----------/** Eiffel symbols **/------------------------------------------------

[-+*/^=><.;,:!?(){}[\]$~]	{
				last_break_end := 0
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			}
[-+*/^=><.;,:!?(){}[\]$~][ \t\r\n]+	{
				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			}
[+*/^=><.;,:!?(){}[\]$~]([ \t\r\n]|"--".*)+	{
				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (text_item (1))
			}
"-"[ \t\r\n]([ \t\r\n]|"--".*)+	{
				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol ('-')
			}
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")	{
				last_break_end := 0
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			}
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")[ \t\r\n]+	{
				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			}
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")([ \t\r\n]|"--".*)+	{
				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (text_item (1), text_item (2))
			}


----------/** Reserved words **/------------------------------------------------

-- We need to make the distinction between once keywords followed
-- by a manifest string and once keywords introducing a once-routine
-- because otherwise we would need to have two look-ahead tokens
-- to figure out that the first once keyword in the following example
-- in part of a once manifest string expression and the second is
-- part of the compound of the once routine:
--   f
--      require
--         once "foo" /= Void
--      once
--         do_nothing
--      end
[oO][nN][cC][eE]/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE][ \t\r\n]+/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]([ \t\r\n]|"--".*\n)+/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			}


----------/** Eiffel identifiers **/--------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			}
[a-zA-Z][a-zA-Z0-9_]*/([ \t\r\n]|"--")	{
				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			}


----------/** Eiffel free operators **/-----------------------------------------

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.

--[@#|&][^%" \t\r\n]*	{
-- Hack to make it work with SmartEiffel 1.1.
"#" |
"#"[-+*] |
"#"[-+*][^a-zA-Z0-9_%" \t\r\n][^%" \t\r\n]* |
"#"[^+\-*%" \t\r\n][^%" \t\r\n]* |
[@|&][^%" \t\r\n]*	{
				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			}
--[@#|&][^%" \t\r\n]*/[ \t\r\n]	{
-- Hack to make it work with SmartEiffel 1.1.
"#"/[ \t\r\n] |
"#"[-+*]/[ \t\r\n] |
"#"[-+*][^a-zA-Z0-9_%" \t\r\n][^%" \t\r\n]*/[ \t\r\n] |
"#"[^+\-*%" \t\r\n][^%" \t\r\n]*/[ \t\r\n] |
[@|&][^%" \t\r\n]*/[ \t\r\n]	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			}


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n]\'	{
				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			}
\'[^%\n]\'[ \t\r\n]+	{
				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			}
\'[^%\n]\'([ \t\r\n]|"--".*)+	{
				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (text_item (2))
			}
\'%.\'		{
				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			}
\'%.\'[ \t\r\n]+	{
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			}
\'%.\'([ \t\r\n]|"--".*)+	{
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			}

\'%\/{CHAR_CODE}\/\'	{
				last_token := E_CHARACTER
				last_literal_start := 4
				last_literal_end := text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			}
\'%\/{CHAR_CODE}\/\'/[ \t\r\n]	{
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			}

\'%\/[0-9]+\/\'	{
					-- Syntax error: invalid character code (too big)
					-- in special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAO_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			}
\'%\/[0-9]+	{
					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			}
\'%\/		{
					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			}
\'\'		{
					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			}
\'(.|%.|%\/[0-9]+\/)?	{
					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			}


----------/** Eiffel strings **/------------------------------------------------

\"[@#|&][^%" \t\r\n]*\"	{
				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[@#|&][^%" \t\r\n]*\"/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			}

\"[^%\n"]*\"	{
					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			}
\"[^%\n"]*\"/([ \t\r\n]|"--")	{
					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			}

\"[^\n"]*"{"/[ \t\r]*\n {
					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			}
<VS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	[ \t\r]*\n {
				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			}
	.		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<VS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	[ \t\r]*"}"[^\n"]*\" {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), False, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			}
	[ \t\r]*"}"[^\n"]*\"/([ \t\r\n]|"--") {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2)
					last_text_count := text_count
					break_kind := str_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (VS3)
				end
			}
	[^"\n]*\" {
				more
				set_start_condition (VS3)
			}
	[^"\n]*\r\n {
				more
				last_literal_end := text_count - 2
			}
	[^"\n]*\n {
				more
				last_literal_end := text_count - 1
			}
	[^"\n]* {
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<VS3>{
		-- Read remaining characters of a line
		-- in verbatim string body.
	.*\r\n	{
				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			}
	.*\n	{
				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			}
	.*		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}

\"[^\n"]*\[/[ \t\r]*\n {
					-- Left-aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			}
<LAVS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	[ \t\r]*\n {
				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			}
	.		{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<LAVS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	[ \t\r]*\][^\n"]*\" {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), True, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			}
	[ \t\r]*\][^\n"]*\"/([ \t\r\n]|"--") {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2)
					last_text_count := text_count
					break_kind := str_left_aligned_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (LAVS3)
				end
			}
	[^"\n]*\" {
				more
				set_start_condition (LAVS3)
			}
	[^"\n]*\r\n {
				more
				last_literal_end := text_count - 2
			}
	[^"\n]*\n {
				more
				last_literal_end := text_count - 1
			}
	[^"\n]* {
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<LAVS3>{
		-- Read remaining characters of a line
		-- in verbatim string body.
	.*\r\n	{
				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			}
	.*\n	{
				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			}
	.*		{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}

\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"	{
					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"/([ \t\r\n]|"--")	{
					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*	{
					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			}

<MS>{
	%[ \t\r]*\n	{
					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			}
	%\/{CHAR_CODE}\/	{
				more
			}
	%\/[0-9]+\/	{
					-- Syntax error: invalid character code (too big) in special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAO_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	%\/[0-9]+	{
					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAS_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	%\/		{
					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAC_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	%[abcdfhlnqrstuv]	{
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))+	{
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"	{
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			}
	%.		{
					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			}
	%		{
					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	\n		{
					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNL_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSEQ_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}

<MSN>{
	[ \r\t]*%	{
				more
				set_start_condition (MS)
			}
	[ \r\t]*\n	{
					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				column := 1
				line := yy_line - 1
				set_syntax_error
				error_handler.report_SSEL_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			}
	.		{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel bits **/---------------------------------------------------

[0-1]+[bB]	{
				last_token := E_BIT
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_bit_constant_value := ast_factory.new_bit_constant (Current)
			}
[0-1]+[bB]/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := bit_break
				more
				set_start_condition (BREAK)
			}


----------/** Eiffel integers **/-----------------------------------------------

[0-9]+		{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			}
[0-9]+/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			}
[0-9]+(_+[0-9]+)+	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
[0-9]+(_+[0-9]+)+/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			}
(_+[0-9]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
(_+[0-9]+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			}
([0-9]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
([0-9]+_+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			}
0[xX][0-9a-fA-F]+(_+[0-9a-fA-F]+)*	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX][0-9a-fA-F]+(_+[0-9a-fA-F]+)*/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			}
0[xX](_+[0-9a-fA-F]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX](_+[0-9a-fA-F]+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			}
0[xX]([0-9a-fA-F]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX]([0-9a-fA-F]+_+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			}
0[cC][0-7]+(_+[0-7]+)*	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC][0-7]+(_+[0-7]+)*/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			}
0[cC](_+[0-7]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC](_+[0-7]+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			}
0[cC]([0-7]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC]([0-7]+_+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			}
0[bB][0-1]+(_+[0-1]+)*	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB][0-1]+(_+[0-1]+)*/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			}
0[bB](_+[0-1]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB](_+[0-1]+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			}
0[bB]([0-1]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB]([0-1]+_+)+/([ \t\r\n]|"--")	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./([ \t\r\n]|"--")	|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+/([ \t\r\n]|"--")	|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			}
[0-9]+\./[^.0-9]	|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+	|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			}
[0-9]+(_+[0-9]+)+\./([ \t\r\n]|"--")	|
[0-9]+(_+[0-9]+)*\.([0-9]+(_+[0-9]+)*)?[eE][+-]?[0-9]+(_+[0-9]+)*/([ \t\r\n]|"--")	|
([0-9]+(_+[0-9]+)*)?\.[0-9]+(_+[0-9]+)*([eE][+-]?[0-9]+(_+[0-9]+)*)?/([ \t\r\n]|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			}
[0-9]+(_+[0-9]+)+\./[^.0-9]	|
[0-9]+(_+[0-9]+)*\.([0-9]+(_+[0-9]+)*)?[eE][+-]?[0-9]+(_+[0-9]+)*	|
([0-9]+(_+[0-9]+)*)?\.[0-9]+(_+[0-9]+)*([eE][+-]?[0-9]+(_+[0-9]+)*)?	{
		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			}


----------/** Separators **/----------------------------------------------------

[ \t\r\n]+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			}

([ \t\r\n]|"--".*)+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			}

<BREAK>{
	[ \t\r\n]+	{
				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			}
}


--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
				last_et_position_value := current_position
			}

--------------------------------------------------------------------------------
%%

feature -- Scanning

	read_token
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_COMPRESSED_SCANNER_SKELETON CLASS, FOR OPTIMISATION
			-- WITH ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_COMPRESSED_SCANNER_SKELETON).)

			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		local
			yy_cp, yy_bp: INTEGER
			yy_current_state: INTEGER
			yy_next_state: INTEGER
			yy_matched_count: INTEGER
			yy_act: INTEGER
			yy_goto: INTEGER
			yy_c: INTEGER
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
			yy_done: BOOLEAN
			l_content_area: like yy_content_area
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast scanning routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				last_token := yyUnknown_token
				yy_goto := yyNext_token
			until
				last_token /= yyUnknown_token
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := yy_end - yy_start
						yy_more_flag := False
					else
						yy_more_len := 0
						line := yy_line
						column := yy_column
						position := yy_position
					end
					yy_cp := yy_end
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
					-- START INLINING 'yy_at_beginning_of_line'
					-- yy_current_state := yy_start_state + yy_at_beginning_of_line
					if input_buffer.beginning_of_line then
						yy_current_state := yy_start_state + 1
					else
						yy_current_state := yy_start_state
					end
					-- END INLINING 'yy_at_beginning_of_line'
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						yy_state_stack.put (yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
					l_content_area := yy_content_area
						-- Find the next match.
					from
						yy_done := False
					until
						yy_done
					loop
						if yy_ec /= Void then
							if l_content_area /= Void then
								yy_c := yy_ec.item (l_content_area.item (yy_cp).code)
							else
								yy_c := yy_ec.item (yy_content.item (yy_cp).code)
							end
						else
							if l_content_area /= Void then
								yy_c := l_content_area.item (yy_cp).code
							else
								yy_c := yy_content.item (yy_cp).code
							end
						end
						if
							not yyReject_or_variable_trail_context and then
							yy_accept.item (yy_current_state) /= 0
						then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if
								yy_meta /= Void and then
								yy_current_state >= yyTemplate_mark
							then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_stack.put (yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
						yy_done := (yy_current_state = yyJam_state)
					end
					if not yyReject_or_variable_trail_context then
							-- Do the guaranteed-needed backing up
							-- to find out the match.
						yy_cp := yy_last_accepting_cpos
						yy_current_state := yy_last_accepting_state
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
						yy_goto := yyDo_action
					else
						yy_state_count := yy_state_count - 1
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_lp := yy_accept.item (yy_current_state)
						yy_goto := yyFind_rule
					end
				when yyFind_rule then
						-- We branch here when backing up.
					check reject_used: yyReject_or_variable_trail_context end
					from yy_found := False until yy_found loop
						if
							yy_lp /= 0 and
							yy_lp < yy_accept.item (yy_current_state + 1)
						then
							yy_act := yy_acclist.item (yy_lp)
							if yyVariable_trail_context then
								if
									yy_act < - yyNb_rules or
									yy_looking_for_trail_begin /= 0
								then
									if yy_act = yy_looking_for_trail_begin then
										yy_looking_for_trail_begin := 0
										yy_act := - yy_act - yyNb_rules
										yy_found := True
									else
										yy_lp := yy_lp + 1
									end
								elseif yy_act < 0 then
									yy_looking_for_trail_begin := yy_act - yyNb_rules
									if yyReject_used then
											-- Remember matched text in case
											-- we back up due to `reject'.
										yy_full_match := yy_cp
										yy_full_state := yy_state_count
										yy_full_lp := yy_lp
									end
									yy_lp := yy_lp + 1
								else
									yy_full_match := yy_cp
									yy_full_state := yy_state_count
									yy_full_lp := yy_lp
									yy_found := True
								end
							else
								yy_full_match := yy_cp
								yy_found := True
							end
						else
							yy_cp := yy_cp - 1
							yy_state_count := yy_state_count - 1
							yy_current_state := yy_state_stack.item (yy_state_count)
							yy_lp := yy_accept.item (yy_current_state)
						end
					end
					yy_rejected_line := yy_line
					yy_rejected_column := yy_column
					yy_rejected_position := yy_position
					yy_goto := yyDo_action
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
							-- Must back up.
						if not yyReject_or_variable_trail_context then
								-- Backing-up info for compressed tables is
								-- taken after `yy_cp' has been incremented
								-- for the next state.
							yy_cp := yy_last_accepting_cpos
							yy_bp := yy_bp + yy_more_len
							yy_current_state := yy_last_accepting_state
							yy_goto := yyFind_action
						else
							last_token := yyError_token
							fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_end' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_end' will already have been 
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the 
							-- end-of-buffer state). Contrast this with the
							-- test in `read_character'.
						if yy_end <= input_buffer.count + 1 then
								-- This was really a NULL character.
							yy_end := yy_bp + yy_matched_count
							yy_current_state := yy_previous_state
								-- We're now positioned to make the NULL
								-- transition. We couldn't have
								-- `yy_previous_state' go ahead and do it
								-- for us because it doesn't know how to deal
								-- with the possibility of jamming (and we
								-- don't want to build jamming into it because
								-- then it will run more slowly).
							yy_next_state := yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								if yyReject_or_variable_trail_context then
										-- Still need to initialize `yy_cp',
										-- though `yy_current_state' was set
										-- up by `yy_previous_state'.
									yy_cp := yy_end
										-- Remove the state which was inserted
										-- in `yy_state_stack' by the call to
										-- `yy_null_trans_state'.
									yy_state_count := yy_state_count - 1
								else
										-- Do the guaranteed-needed backing up
										-- then figure out the match.
									yy_cp := yy_last_accepting_cpos
									yy_current_state := yy_last_accepting_state
								end
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_end := yy_end - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyMatch
							elseif
								yy_end - yy_start - yy_more_len /= 0
							then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched, 
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start
									yy_cp := yy_end
									yy_execute_eof_action ((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
							yy_line := yy_rejected_line
							yy_column := yy_rejected_column
							yy_position := yy_rejected_position
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state := yy_state_stack.item (yy_state_count - 1)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
			debug ("GELEX")
				print_last_token
			end
		end

end
