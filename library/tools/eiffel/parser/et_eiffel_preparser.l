%{
indexing

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

creation

	make, make_with_factory
%}

%x MS MSN MSN1 VS1 VS2 VS3
%option nodefault line outfile="et_eiffel_preparser.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		-- Ignore spaces.
\n+				-- Ignore new-lines.


----------/** Eiffel comments **/-----------------------------------------------

"--".*			-- Ignore comments.


----------/** Eiffel symbols **/------------------------------------------------

"-"			{
			}
"+"			{
			}
"*"			{
			}
"/"			{
			}
"^"			{
			}
"="			{
			}
">"			{
			}
"<"			{
			}
"."			{
			}
";"			{
			}
","			{
			}
":"			{
			}
"!"			{
			}
"("			{
			}
")"			{
			}
"{"			{
			}
"}"			{
			}
"["			{
			}
"]"			{
			}
"$"			{
			}
"//"		{
			}
"\\\\"		{
			}
"/="		{
			}
">="		{
			}
"<="		{
			}
"!!"		{
			}
"->"		{
			}
".."		{
			}
"<<"		{
			}
">>"		{
			}
":="		{
			}
"?="		{
			}


----------/** Reserved words **/------------------------------------------------

alias		{
			}
[aA][lL][iI][aA][sS]	{
			}
all			{
			}
[aA][lL][lL]	{
			}
and			{
			}
[aA][nN][dD]	{
			}
as			{
			}
[aA][sS]	{
			}
check		{
			}
[cC][hH][eE][cC][kK]	{
			}
class		{
				class_keyword_found := True
			}
[cC][lL][aA][sS][sS]	{
				class_keyword_found := True
			}
create		{
				if use_create_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			}
[cC][rR][eE][aA][tT][eE]	{
				if use_create_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			}
creation	{
			}
[cC][rR][eE][aA][tT][iI][oO][nN]	{
			}
current		{
			}
Current		{
			}
[cC][uU][rR][rR][eE][nN][tT]	{
			}
debug		{
			}
[dD][eE][bB][uU][gG]	{
			}
deferred	{
			}
[dD][eE][fF][eE][rR][rR][eE][dD]	{
			}
do			{
			}
[dD][oO]	{
			}
else		{
			}
[eE][lL][sS][eE]	{
			}
elseif		{
			}
[eE][lL][sS][eE][iI][fF]	{
			}
end			{
			}
[eE][nN][dD]	{
			}
ensure		{
			}
[eE][nN][sS][uU][rR][eE]	{
			}
expanded	{
			}
[eE][xX][pP][aA][nN][dD][eE][dD]	{
			}
export		{
			}
[eE][xX][pP][oO][rR][tT]	{
			}
external	{
			}
[eE][xX][tT][eE][rR][nN][aA][lL]	{
			}
false		{
			}
False		{
			}
[fF][aA][lL][sS][eE]	{
			}
feature		{
			}
[fF][eE][aA][tT][uU][rR][eE]	{
			}
from		{
			}
[fF][rR][oO][mM]	{
			}
frozen		{
			}
[fF][rR][oO][zZ][eE][nN]	{
			}
if			{
			}
[iI][fF]	{
			}
implies		{
			}
[iI][mM][pP][lL][iI][eE][sS]	{
			}
indexing	{
			}
[iI][nN][dD][eE][xX][iI][nN][gG]	{
			}
infix		{
			}
[iI][nN][fF][iI][xX]	{
			}
inherit		{
			}
[iI][nN][hH][eE][rR][iI][tT]	{
			}
inspect		{
			}
[iI][nN][sS][pP][eE][cC][tT]	{
			}
invariant	{
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	{
			}
is			{
			}
[iI][sS]	{
			}
like		{
			}
[lL][iI][kK][eE]	{
			}
local		{
			}
[lL][oO][cC][aA][lL]	{
			}
loop		{
			}
[lL][oO][oO][pP]	{
			}
not			{
			}
[nN][oO][tT]	{
			}
obsolete	{
			}
[oO][bB][sS][oO][lL][eE][tT][eE]	{
			}
old			{
			}
[oO][lL][dD]	{
			}
once		{
			}
[oO][nN][cC][eE]	{
			}
or			{
			}
[oO][rR]	{
			}
precursor	{
			}
Precursor	{
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR]	{
			}
prefix		{
			}
[pP][rR][eE][fF][iI][xX]	{
			}
redefine	{
			}
[rR][eE][dD][eE][fF][iI][nN][eE]	{
			}
reference	{
				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE] {
				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			}
rename		{
			}
[rR][eE][nN][aA][mM][eE]	{
			}
require		{
			}
[rR][eE][qQ][uU][iI][rR][eE]	{
			}
rescue		{
			}
[rR][eE][sS][cC][uU][eE]	{
			}
result		{
			}
Result		{
			}
[rR][eE][sS][uU][lL][tT]	{
			}
retry		{
			}
[rR][eE][tT][rR][yY]	{
			}
select		{
			}
[sS][eE][lL][eE][cC][tT]	{
			}
separate	{
			}
[sS][eE][pP][aA][rR][aA][tT][eE]	{
			}
strip		{
			}
[sS][tT][rR][iI][pP]	{
			}
then		{
			}
[tT][hH][eE][nN]	{
			}
true		{
			}
True		{
			}
[tT][rR][uU][eE]	{
			}
undefine	{
			}
[uU][nN][dD][eE][fF][iI][nN][eE]	{
			}
unique		{
			}
[uU][nN][iI][qQ][uU][eE]	{
			}
until		{
			}
[uU][nN][tT][iI][lL]	{
			}
variant		{
			}
[vV][aA][rR][iI][aA][nN][tT]	{
			}
when		{
			}
[wW][hH][eE][nN]	{
			}
xor			{
			}
[xX][oO][rR]	{
			}


----------/** Eiffel identifiers **/--------------------------------------------

[bB][iI][tT]	{
			}
[a-zA-Z][a-zA-Z0-9_]*	{
				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			}


----------/** Eiffel free operators **/-----------------------------------------

[@#|&][^%" \t\r\n]*	{
			}

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n']\'	{
			}
\'\'\'		{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
--				column := column + 1
--				error_handler.report_SCTQ_error (current_position)
--				column := column - 1
			}

\'%A\'		{
			}
\'%B\'		{
			}
\'%C\'		{
			}
\'%D\'		{
			}
\'%F\'		{
			}
\'%H\'		{
			}
\'%L\'		{
			}
\'%N\'		{
			}
\'%Q\'		{
			}
\'%R\'		{
			}
\'%S\'		{
			}
\'%T\'		{
			}
\'%U\'		{
			}
\'%V\'		{
			}
\'%%\'		{
			}
\'%\'\'		{
			}
\'%\"\'		{
			}
\'%\(\'		{
			}
\'%\)\'		{
			}
\'%<\'		{
			}
\'%>\'		{
			}

\'%\/[0-9]+\/\'	{
			}
			`
\'%a\'		{
			}
\'%b\'		{
			}
\'%c\'		{
			}
\'%d\'		{
			}
\'%f\'		{
			}
\'%h\'		{
			}
\'%l\'		{
			}
\'%n\'		{
			}
\'%q\'		{
			}
\'%r\'		{
			}
\'%s\'		{
			}
\'%t\'		{
			}
\'%u\'		{
			}
\'%v\'		{
			}

\'%.\'		{
					-- Syntax error: invalid special character
					-- %l in character constant.
--				column := column + 2
--				error_handler.report_SCSC_error (current_position)
--				column := column - 2
			}

\'%\/[0-9]+	{
					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				error_handler.report_SCAS_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			}
\'%\/		{
					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				error_handler.report_SCAC_error (current_position)
				column := column - 3

				last_token := E_CHARERR
			}
\'\'		{
					-- Syntax error: missing character between quotes.
				column := column + 1
				error_handler.report_SCQQ_error (current_position)
				column := column - 1

				last_token := E_CHARERR
			}
\'(.|%.|%\/[0-9]+\/)?	{
					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				error_handler.report_SCEQ_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			}


----------/** Eiffel strings **/------------------------------------------------

\"\+\"		{
			}
\"-\"		{
			}
\"\*\"		{
			}
\"\/\"		{
			}
\"\/\/\"	{
			}
\"\\\\\"	{
			}
\"^\"		{
			}
\"<\"		{
			}
\"<=\"		{
			}
\">\"		{
			}
\">=\"		{
			}
\"[nN][oO][tT]\"	{
			}
\"[aA][nN][dD]\"	{
			}
\"[oO][rR]\"	{
			}
\"[xX][oO][rR]\"	{
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"	{
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"	{
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"	{
			}
\"[@#|&][^%" \t\r\n]*\"	{
			}

\"[^%\n"]*\"	{
			}

\"[^\n"%]*\[/[ \t\r]*\n {
					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			}
<VS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	[ \t\r]*\n {
				vs_count := 0
				set_start_condition (VS2)
			}
	.		{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}
<VS2>{
		-- Read one line of a verbatim string body
		-- from the beginning of line.
	[ \t\r]*\][^%\n"]*\" {
				if is_verbatim_string_closer (vs_count + 1, text_count - 1) then
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
				vs_count := text_count - 2
			}
	[^"\n]*\n {
				more
				vs_count := text_count - 1
			}
	[^"\n]* {
					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
}
<VS3>{
		-- Read remaining characters of a line
		-- in verbatim string body.
	.*\r\n	{
				more
				vs_count := text_count - 2
				set_start_condition (VS2)
			}
	.*\n	{
				more
				vs_count := text_count - 1
				set_start_condition (VS2)
			}
	.*		{
					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- No final bracket-double-quote.
				last_token := E_STRERR
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
--				error_handler.report_SSNS_error (current_position)
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
--				error_handler.report_SSAS_error (current_position)
				column := ms_column
				line := ms_line

				more
			}
	%\/		{
					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				error_handler.report_SSAC_error (current_position)
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
--				error_handler.report_SSCU_error (current_position)
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
--				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				more
			}
	%		{
					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			}
	\n		{
					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				error_handler.report_SSNL_error (current_position)
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
				error_handler.report_SSEQ_error (current_position)
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
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
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
--				error_handler.report_SSEL_error (current_position)
				column := ms_column
				line := ms_line

				more
			}
	.		{
					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSNP_error (current_position)
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
				error_handler.report_SSNP_error (current_position)
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
[0-9]{1,3}(_[0-9]{3})+	{
			}
_(_*[0-9_]+_*)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTERR
			}
(_*[0-9]+_*)+	{
					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTERR
			}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./[^.0-9]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
			}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
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

end -- class ET_EIFFEL_PREPARSER
