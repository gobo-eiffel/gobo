%{
note

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

create

	make
%}

UTF8_BOM (\xEF\xBB\xBF)

%x MS MSN MSN1 VS1 VS2 VS3 LAVS1 LAVS2 LAVS3
%option nodefault line outfile="et_eiffel_preparser.e"

%%

----------/** BOM **/-----------------------------------------------------------

{UTF8_BOM}	{
				-- Ignore byte order mark (BOM).
				-- See http://en.wikipedia.org/wiki/Byte_order_mark
			}


----------/** Separators, Comments, Symbols **/----------------------------------------------------

([ \t\r\n]|"--".*)+	|
[-+*/^=><.;,:!?(){}[\]$~]	|
("//"|"\\\\"|"/="|"/~"|">="|"<="|"->"|".."|"<<"|">>"|":="|"?=")	{
			}

----------/** Reserved words **/------------------------------------------------

[aA][gG][eE][nN][tT]	|
[aA][lL][iI][aA][sS]	|
[aA][lL][lL]	|
[aA][nN][dD]	|
[aA][sS]	|
[aA][sS][sS][iI][gG][nN]	|
[cC][hH][eE][cC][kK]	|
[cC][oO][nN][vV][eE][rR][tT]	|
[cC][rR][eE][aA][tT][eE]	|
[cC][rR][eE][aA][tT][iI][oO][nN]	|
[cC][uU][rR][rR][eE][nN][tT]	|
[dD][eE][bB][uU][gG]	|
[dD][eE][fF][eE][rR][rR][eE][dD]	|
[dD][oO]	|
[eE][lL][sS][eE]	|
[eE][lL][sS][eE][iI][fF]	|
[eE][nN][dD]	|
[eE][nN][sS][uU][rR][eE]	|
[eE][xX][pP][aA][nN][dD][eE][dD]	|
[eE][xX][pP][oO][rR][tT]	|
[eE][xX][tT][eE][rR][nN][aA][lL]	|
[fF][aA][lL][sS][eE]	|
[fF][eE][aA][tT][uU][rR][eE]	|
[fF][rR][oO][mM]	|
[fF][rR][oO][zZ][eE][nN]	|
[iI][fF]	|
[iI][mM][pP][lL][iI][eE][sS]	|
[iI][nN][dD][eE][xX][iI][nN][gG]	|
[iI][nN][fF][iI][xX]	|
[iI][nN][hH][eE][rR][iI][tT]	|
[iI][nN][sS][pP][eE][cC][tT]	|
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	|
[iI][sS]	|
[lL][iI][kK][eE]	|
[lL][oO][cC][aA][lL]	|
[lL][oO][oO][pP]	|
[nN][oO][tT]	|
[oO][bB][sS][oO][lL][eE][tT][eE]	|
[oO][lL][dD]	|
[oO][nN][cC][eE]	|
[oO][rR]	|
[pP][rR][eE][cC][uU][rR][sS][oO][rR]	|
[pP][rR][eE][fF][iI][xX]	|
[rR][eE][dD][eE][fF][iI][nN][eE]	|
[rR][eE][nN][aA][mM][eE]	|
[rR][eE][qQ][uU][iI][rR][eE]	|
[rR][eE][sS][cC][uU][eE]	|
[rR][eE][sS][uU][lL][tT]	|
[rR][eE][tT][rR][yY]	|
[sS][eE][lL][eE][cC][tT]	|
[sS][eE][pP][aA][rR][aA][tT][eE]	|
[sS][tT][rR][iI][pP]	|
[tT][hH][eE][nN]	|
[tT][rR][uU][eE]	|
[uU][nN][dD][eE][fF][iI][nN][eE]	|
[uU][nN][iI][qQ][uU][eE]	|
[uU][nN][tT][iI][lL]	|
[vV][aA][rR][iI][aA][nN][tT]	|
[vV][oO][iI][dD]	|
[wW][hH][eE][nN]	|
[xX][oO][rR]	{
			}
[cC][lL][aA][sS][sS]	{
				class_keyword_found := True
			}
[aA][tT][tT][aA][cC][hH][eE][dD]	{
				if use_attached_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}
[aA][tT][tT][rR][iI][bB][uU][tT][eE]	{
				if use_attribute_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}
[dD][eE][tT][aA][cC][hH][aA][bB][lL][eE]	{
				if use_detachable_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}
[nN][oO][tT][eE]	{
				if use_note_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 4
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE] {
				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}


----------/** Eiffel identifiers **/--------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := text_count
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			}


----------/** Eiffel free operators **/-----------------------------------------

[@#|&][^%" \t\r\n]*	{
			}

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n]\'	|
\'%.\'		|
\'%\/[0-9]+\/\'	{
			}

\'%\/[0-9]+	{
					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			}
\'%\/		{
					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				column := column - 3
				last_token := E_CHARERR
			}
\'\'		{
					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				column := column - 1
				last_token := E_CHARERR
			}
\'(.|%.|%\/[0-9]+\/)?	{
					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			}


----------/** Eiffel strings **/------------------------------------------------

\"[^%\n"]*\"	{
			}

\"[^\n"%]*\{/[ \t\r]*\n {
					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			}
<VS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	[ \t\r]*\n {
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			}
	.		{
					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<VS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	[ \t\r]*\}[^%\n"]*\" {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
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
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
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
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}

\"[^\n"%]*\[/[ \t\r]*\n {
					-- Left aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			}
<LAVS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	[ \t\r]*\n {
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			}
	.		{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}
<LAVS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	[ \t\r]*\][^%\n"]*\" {
				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
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
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
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
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
}

\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"	{
					-- Manifest string with special characters.
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*	{
					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			}

<MS>{
	%\r?\n	{
					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			}
	%[ \t\r]/[ \t\r]*\n	{
					-- Multi-line manifest string.

					-- Syntax error: no space allowed after character
					-- % at end of line in multi-line manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSNS_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
				set_start_condition (MSN1)
			}
	%\/[0-9]+\/	{
				more
			}
	%\/[0-9]+	{
					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAS_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			}
	%\/		{
					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAC_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			}
	%[abcdfhlnqrstuv]	{
					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))+	{
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"	{
				set_start_condition (INITIAL)
			}
	%.		{
					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSSC_error (filename, current_position)
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
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}

<MSN1>{
	[ \t\r]*\n	{
				more
				set_start_condition (MSN)
			}
	.		{
					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
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
--				set_syntax_error
--				error_handler.report_SSEL_error (filename, current_position)
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
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel bits **/---------------------------------------------------

[0-1]+[bB]	{
			}


----------/** Eiffel integers **/-----------------------------------------------

[0-9]+		{
			}
[0-9]+(_+[0-9]+)+	{
			}
(_+[0-9]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			}
([0-9]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[xX][0-9a-fA-F]+(_+[0-9a-fA-F]+)*	{
			}
0[xX](_+[0-9a-fA-F]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[xX]([0-9a-fA-F]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[cC][0-7]+(_+[0-7]+)*	{
			}
0[cC](_+[0-7]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[cC]([0-7]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[bB][0-1]+(_+[0-1]+)*	{
			}
0[bB](_+[0-1]+)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			}
0[bB]([0-1]+_+)+	{
					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./[^.0-9]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
			}
[0-9]+(_+[0-9]+)+\./[^.0-9]	|
[0-9]+(_+[0-9]+)*\.([0-9]+(_+[0-9]+)*)?[eE][+-]?[0-9]+(_+[0-9]+)*	|
([0-9]+(_+[0-9]+)*)?\.[0-9]+(_+[0-9]+)*([eE][+-]?[0-9]+(_+[0-9]+)*)?	{
			}

		-- The first and fourth expressions use a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.

--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
			}

--------------------------------------------------------------------------------
%%

end
