%{
note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON

create

	make
%}

HORIZONTAL_BREAK	[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]
BREAK				{HORIZONTAL_BREAK}{+}[\n]
FREEOP_CHAR			[^a-zA-Z0-9_:;,?'"$.=()[\]{}]{-}{BREAK}
CHAR_CODE			[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*

%x BREAK MS MSN VS1 VS2 VS3
%option nodefault line outfile="et_eiffel_scanner.e"

%%

----------/** Eiffel symbols **/------------------------------------------------

[-+*/^=><.;,:!?(){}[\]$~∀∃¦⟳⟲]	{
				last_break_end := 0
				last_comment_end := 0
				process_one_char_symbol (unicode_text_item (1))
			}
[-+*/^=><.;,:!?(){}[\]$~∀∃¦⟳⟲]{BREAK}+	{
				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (unicode_text_item (1))
			}
[+*/^=><.;,:!?(){}[\]$~∀∃¦⟳⟲]({BREAK}|"--".*)+	{
				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (unicode_text_item (1))
			}
"-"{BREAK}({BREAK}|"--".*)+	{
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
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?="){BREAK}+	{
				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			}
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")({BREAK}|"--".*)+	{
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
--
--   f
--      require
--         once "foo" /= Void
--      once
--         do_nothing
--      end
--
-- Also covers the case of typed manifest string:
--
--   f
--      require
--         once {STRING_8} "foo" /= Void
--      once
--         do_nothing
--      end
--
-- although this will produce a syntax error when writing:
--
--   f
--      once
--         {CHARACTER_8}.Max_value.do_nothing
--      end
--
[oO][nN][cC][eE]/["{]	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]{BREAK}+/["{]	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]({BREAK}|"--".*\n)+/["{]	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			}


----------/** Eiffel identifiers **/--------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			}
[a-zA-Z][a-zA-Z0-9_]*/({BREAK}|"--")	{
				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			}


----------/** Eiffel free operators **/-----------------------------------------

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.

-- Legacy: free operators which must start with [@#|&] is not in the standard anymore.
-- Make sure that we don't have a subsequence of the form "--" (beginning of a comment).
[@#|&]([@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~]|\-[@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~])*\-? {
				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			}
[@#|&]([@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~]|\-[@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~])*\-/{BREAK} |
[@#|&]([@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~]|\-[@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~])*/({BREAK}|"--") {
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			}
			
-- Make sure that we don't have a subsequence of the form "--", "->", "<<" or "<<" (which are special symbols).
-- Do not allow breaks (spaces, newlines) either.
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])+({FREEOP_CHAR}{-}[\-]\-|{FREEOP_CHAR}{-}[\->]>|{FREEOP_CHAR}{-}[<]<)? {
				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			}
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])+{FREEOP_CHAR}{-}[\-]\-/{BREAK} |
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])+{FREEOP_CHAR}{-}[\->]>/({BREAK}|"--") |
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])+{FREEOP_CHAR}{-}[<]</({BREAK}|"--") |
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])+/{BREAK} |
({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[>]|<{FREEOP_CHAR}{-}[<])*({FREEOP_CHAR}{-}[\-<>]|\-{FREEOP_CHAR}{-}[\->]|>{FREEOP_CHAR}{-}[\->]|<{FREEOP_CHAR}{-}[\-<])/({BREAK}|"--") {
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
				process_c1_character_constant (unicode_text_item (2))
			}
\'[^%\n]\'{BREAK}+	{
				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			}
\'[^%\n]\'({BREAK}|"--".*)+	{
				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (unicode_text_item (2))
			}
\'%[ABCDFHLNQRSTUV%'"()<>]\'		{
				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			}
\'%[ABCDFHLNQRSTUV%'"()<>]\'{BREAK}+	{
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			}
\'%[ABCDFHLNQRSTUV%'"()<>]\'({BREAK}|"--".*)+	{
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			}

\'%\/{CHAR_CODE}\/\'	{
				last_token := E_CHARACTER
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			}
\'%\/{CHAR_CODE}\/\'/({BREAK}|"--")	{
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			}
\'%\/{CHAR_CODE}	{
					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			}
\'%\/		{
					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			}
\'\'		{
					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			}
\'([^%\n]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{CHAR_CODE}\/)?	{
					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			}


----------/** Eiffel strings **/------------------------------------------------

\"([-+*/^=><.;,:!?(){}[\]$~∀∃¦⟳⟲]|"//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")\" {
					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			}
\"([-+*/^=><.;,:!?(){}[\]$~∀∃¦⟳⟲]|"//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")\"/({BREAK}|"--") {
					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			}
\"[@#|&]([@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~]|\-[@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~])*\-?\" |
\"({FREEOP_CHAR}{-}[\-<>%]|\-{FREEOP_CHAR}{-}[\->%]|>{FREEOP_CHAR}{-}[>%]|<{FREEOP_CHAR}{-}[<%])+({FREEOP_CHAR}{-}[\-%]\-|{FREEOP_CHAR}{-}[\->%]>|{FREEOP_CHAR}{-}[<%]<)?\" {
				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[@#|&]([@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~]|\-[@#0-9a-zA-Z_!\$&\'\(\)\*\+\,\./:;<>=\?\[\\\]\^\`\{\}\|\~])*\-?\"/({BREAK}|"--") |
\"({FREEOP_CHAR}{-}[\-<>%]|\-{FREEOP_CHAR}{-}[\->%]|>{FREEOP_CHAR}{-}[>%]|<{FREEOP_CHAR}{-}[<%])+({FREEOP_CHAR}{-}[\-%]\-|{FREEOP_CHAR}{-}[\->%]>|{FREEOP_CHAR}{-}[<%]<)?\"/({BREAK}|"--") {
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			}
\"({FREEOP_CHAR}{-}[\-<>%]|%%|\-({FREEOP_CHAR}{-}[\->%]|%%)|>({FREEOP_CHAR}{-}[>%]|%%)|<({FREEOP_CHAR}{-}[<%]|%%))+(({FREEOP_CHAR}{-}[\-%]|%%)\-|({FREEOP_CHAR}{-}[\->%]|%%)>|({FREEOP_CHAR}{-}[<%]|%%)<)?\" {
				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			}
\"({FREEOP_CHAR}{-}[\-<>%]|%%|\-({FREEOP_CHAR}{-}[\->%]|%%)|>({FREEOP_CHAR}{-}[>%]|%%)|<({FREEOP_CHAR}{-}[<%]|%%))+(({FREEOP_CHAR}{-}[\-%]|%%)\-|({FREEOP_CHAR}{-}[\->%]|%%)>|({FREEOP_CHAR}{-}[<%]|%%)<)?\"/({BREAK}|"--") {
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_freeop_break
				more
				set_start_condition (BREAK)
			}
\"[^%\n"]*\"	{
					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			}
\"[^%\n"]*\"/({BREAK}|"--")	{
					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			}

\"[^\n"]*[{\[]/{HORIZONTAL_BREAK}*\n {
					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			}
<VS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	{HORIZONTAL_BREAK}*\n {
				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			}
	.		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<VS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	{HORIZONTAL_BREAK}*[}\]][^\n"]*\" {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2), verbatim_opening_character = '[', Current)
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					verbatim_open_white_characters := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			}
	{HORIZONTAL_BREAK}*[}\]][^\n"]*\"/({BREAK}|"--") {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2)
					last_text_count := text_count
					if verbatim_opening_character = '{' then
						break_kind := str_verbatim_break
					else
						break_kind := str_left_aligned_verbatim_break
					end
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
	.		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
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
	.		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
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
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"/({BREAK}|"--")	{
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
	%{HORIZONTAL_BREAK}*\n	{
					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			}
	%\/{CHAR_CODE}\/	{
				more
			}
	%\/{CHAR_CODE}	{
					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
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
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	%[abcdfhlnqrstuv]	{
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
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
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/{CHAR_CODE}\/))*\"/({BREAK}|"--")	{
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
				last_detachable_et_position_value := current_position
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
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>		{
					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}

<MSN>{
	{HORIZONTAL_BREAK}*%	{
				more
				set_start_condition (MS)
			}
	{HORIZONTAL_BREAK}*\n	{
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
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>		{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel integers **/-----------------------------------------------

[0-9]+		{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			}
[0-9]+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
[0-9]+(_+[0-9]+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
(_+[0-9]+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			}
([0-9]+_+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX][0-9a-fA-F]+(_+[0-9a-fA-F]+)*/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX](_+[0-9a-fA-F]+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0[xX]([0-9a-fA-F]+_+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC][0-7]+(_+[0-7]+)*/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC](_+[0-7]+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			}
0[cC]([0-7]+_+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB][0-1]+(_+[0-1]+)*/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB](_+[0-1]+)+/({BREAK}|"--")	{
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
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			}
0[bB]([0-1]+_+)+/({BREAK}|"--")	{
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

[0-9]+\./({BREAK}|"--")	|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+/({BREAK}|"--")	|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?/({BREAK}|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			}
[0-9]+\./[^.0-9eE]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			}
[0-9]+(_+[0-9]+)+\./({BREAK}|"--")	|
[0-9]+(_+[0-9]+)*\.([0-9]+(_+[0-9]+)*)?[eE][+-]?[0-9]+(_+[0-9]+)*/({BREAK}|"--")	|
([0-9]+(_+[0-9]+)*)?\.[0-9]+(_+[0-9]+)*([eE][+-]?[0-9]+(_+[0-9]+)*)?/({BREAK}|"--")	{
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			}
[0-9]+(_+[0-9]+)+\./[^.0-9eE]	|
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
				last_detachable_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			}


----------/** Separators **/----------------------------------------------------

{BREAK}+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			}

({BREAK}|"--".*)+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			}

<BREAK>{
	{BREAK}+	{
				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			}
	({BREAK}|"--".*)+	{
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
				last_detachable_et_position_value := current_position
			}

--------------------------------------------------------------------------------
%%

end
