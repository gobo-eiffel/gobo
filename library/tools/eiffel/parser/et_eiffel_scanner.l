%{
indexing

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON

creation

	make, make_with_factory
%}

%x MS MSN MSN1 VS1 VS2 VS3
%option nodefault line outfile="et_eiffel_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		-- Ignore spaces.
\n+				-- Ignore new-lines.


----------/** Eiffel comments **/-----------------------------------------------

"--".*			-- Ignore comments.


----------/** Eiffel symbols **/------------------------------------------------

"-"			{
				last_token := Minus_code
				last_value := new_minus_symbol
			}
"+"			{
				last_token := Plus_code
				last_value := new_plus_symbol
			}
"*"			{
				last_token := Star_code
				last_value := new_infix_times_operator
			}
"/"			{
				last_token := Slash_code
				last_value := new_infix_divide_operator
			}
"^"			{
				last_token := Caret_code
				last_value := new_infix_power_operator
			}
"="			{
				last_token := Equal_code
				last_value := new_equal_symbol
			}
">"			{
				last_token := Greater_than_code
				last_value := new_infix_gt_operator
			}
"<"			{
				last_token := Less_than_code
				last_value := new_infix_lt_operator
			}
"."				process_one_character_symbol (Dot_code)
";"			{
				last_token := Semicolon_code
				last_value := new_semicolon_symbol
			}
","				process_one_character_symbol (Comma_code)
":"				process_one_character_symbol (Colon_code)
"!"				process_one_character_symbol (Exclamation_code)
"?"				process_one_character_symbol (Question_mark_code)
"("				process_one_character_symbol (Left_parenthesis_code)
")"				process_one_character_symbol (Right_parenthesis_code)
"{"				process_one_character_symbol (Left_brace_code)
"}"				process_one_character_symbol (Right_brace_code)
"["				process_one_character_symbol (Left_bracket_code)
"]"				process_one_character_symbol (Right_bracket_code)
"$"				process_one_character_symbol (Dollar_code)
"//"		{
				last_token := E_DIV
				last_value := new_infix_div_operator
			}
"\\\\"		{
				last_token := E_MOD
				last_value := new_infix_mod_operator
			}
"/="		{
				last_token := E_NE
				last_value := new_not_equal_symbol
			}
">="		{
				last_token := E_GE
				last_value := new_infix_ge_operator
			}
"<="		{
				last_token := E_LE
				last_value := new_infix_le_operator
			}
"!!"			process_two_character_symbol (E_BANGBANG)
"->"			process_two_character_symbol (E_ARROW)
".."			process_two_character_symbol (E_DOTDOT)
"<<"			process_two_character_symbol (E_LARRAY)
">>"			process_two_character_symbol (E_RARRAY)
":="			process_two_character_symbol (E_ASSIGN)
"?="			process_two_character_symbol (E_REVERSE)


----------/** Reserved words **/------------------------------------------------

agent		{
				last_token := E_AGENT
				last_value := new_token (agent_keyword)
			}
[aA][gG][eE][nN][tT]	{
				last_token := E_AGENT
				last_value := new_token (text)
			}
alias		{
				last_token := E_ALIAS
				last_value := new_token (alias_keyword)
			}
[aA][lL][iI][aA][sS]	{
				last_token := E_ALIAS
				last_value := new_token (text)
			}
all			{
				last_token := E_ALL
				last_value := new_token (all_keyword)
			}
[aA][lL][lL]	{
				last_token := E_ALL
				last_value := new_token (text)
			}
and			{
				last_token := E_AND
				last_value := new_infix_and_operator (and_keyword)
			}
[aA][nN][dD]	{
				last_token := E_AND
				last_value := new_infix_and_operator (text)
			}
as			{
				last_token := E_AS
				last_value := new_token (as_keyword)
			}
[aA][sS]	{
				last_token := E_AS
				last_value := new_token (text)
			}
check		{
				last_token := E_CHECK
				last_value := new_token (check_keyword)
			}
[cC][hH][eE][cC][kK]	{
				last_token := E_CHECK
				last_value := new_token (text)
			}
class		{
				last_token := E_CLASS
				last_value := new_token (class_keyword)
			}
[cC][lL][aA][sS][sS]	{
				last_token := E_CLASS
				last_value := new_token (text)
			}
create		{
				if use_create_keyword then
					last_token := E_CREATE
					last_value := new_token (create_keyword)
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (create_keyword)
				end
			}
[cC][rR][eE][aA][tT][eE]	{
				if use_create_keyword then
					last_token := E_CREATE
					last_value := new_token (text)
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (text)
				end
			}
creation	{
				last_token := E_CREATION
				last_value := new_token (creation_keyword)
			}
[cC][rR][eE][aA][tT][iI][oO][nN]	{
				last_token := E_CREATION
				last_value := new_token (text)
			}
current		{
				last_token := E_CURRENT
				last_value := new_current (current_keyword)
			}
Current		{
				last_token := E_CURRENT
				last_value := new_current (capitalized_current_keyword)
			}
[cC][uU][rR][rR][eE][nN][tT]	{
				last_token := E_CURRENT
				last_value := new_current (text)
			}
debug		{
				last_token := E_DEBUG
				last_value := new_token (debug_keyword)
			}
[dD][eE][bB][uU][gG]	{
				last_token := E_DEBUG
				last_value := new_token (text)
			}
deferred	{
				last_token := E_DEFERRED
				last_value := new_token (deferred_keyword)
			}
[dD][eE][fF][eE][rR][rR][eE][dD]	{
				last_token := E_DEFERRED
				last_value := new_token (text)
			}
do			{
				last_token := E_DO
				last_value := new_token (do_keyword)
			}
[dD][oO]	{
				last_token := E_DO
				last_value := new_token (text)
			}
else		{
				last_token := E_ELSE
				last_value := new_token (else_keyword)
			}
[eE][lL][sS][eE]	{
				last_token := E_ELSE
				last_value := new_token (text)
			}
elseif		{
				last_token := E_ELSEIF
				last_value := new_token (elseif_keyword)
			}
[eE][lL][sS][eE][iI][fF]	{
				last_token := E_ELSEIF
				last_value := new_token (text)
			}
end			{
				last_token := E_END
				last_value := new_token (end_keyword)
			}
[eE][nN][dD]	{
				last_token := E_END
				last_value := new_token (text)
			}
ensure		{
				last_token := E_ENSURE
				last_value := new_token (ensure_keyword)
			}
[eE][nN][sS][uU][rR][eE]	{
				last_token := E_ENSURE
				last_value := new_token (text)
			}
expanded	{
				last_token := E_EXPANDED
				last_value := new_expanded_mark (expanded_keyword)
			}
[eE][xX][pP][aA][nN][dD][eE][dD]	{
				last_token := E_EXPANDED
				last_value := new_expanded_mark (text)
			}
export		{
				last_token := E_EXPORT
				last_value := new_token (export_keyword)
			}
[eE][xX][pP][oO][rR][tT]	{
				last_token := E_EXPORT
				last_value := new_token (text)
			}
external	{
				last_token := E_EXTERNAL
				last_value := new_token (external_keyword)
			}
[eE][xX][tT][eE][rR][nN][aA][lL]	{
				last_token := E_EXTERNAL
				last_value := new_token (text)
			}
false		{
				last_token := E_FALSE
				last_value := new_false_constant (false_keyword)
			}
False		{
				last_token := E_FALSE
				last_value := new_false_constant (capitalized_false_keyword)
			}
[fF][aA][lL][sS][eE]	{
				last_token := E_FALSE
				last_value := new_false_constant (text)
			}
feature		{
				last_token := E_FEATURE
				last_value := new_token (feature_keyword)
			}
[fF][eE][aA][tT][uU][rR][eE]	{
				last_token := E_FEATURE
				last_value := new_token (text)
			}
from		{
				last_token := E_FROM
				last_value := new_token (from_keyword)
			}
[fF][rR][oO][mM]	{
				last_token := E_FROM
				last_value := new_token (text)
			}
frozen		{
				last_token := E_FROZEN
				last_value := new_token (frozen_keyword)
			}
[fF][rR][oO][zZ][eE][nN]	{
				last_token := E_FROZEN
				last_value := new_token (text)
			}
if			{
				last_token := E_IF
				last_value := new_token (if_keyword)
			}
[iI][fF]	{
				last_token := E_IF
				last_value := new_token (text)
			}
implies		{
				last_token := E_IMPLIES
				last_value := new_infix_implies_operator (implies_keyword)
			}
[iI][mM][pP][lL][iI][eE][sS]	{
				last_token := E_IMPLIES
				last_value := new_infix_implies_operator (text)
			}
indexing	{
				last_token := E_INDEXING
				last_value := new_token (indexing_keyword)
			}
[iI][nN][dD][eE][xX][iI][nN][gG]	{
				last_token := E_INDEXING
				last_value := new_token (text)
			}
infix		{
				last_token := E_INFIX
				last_value := new_token (infix_keyword)
			}
[iI][nN][fF][iI][xX]	{
				last_token := E_INFIX
				last_value := new_token (text)
			}
inherit		{
				last_token := E_INHERIT
				last_value := new_token (inherit_keyword)
			}
[iI][nN][hH][eE][rR][iI][tT]	{
				last_token := E_INHERIT
				last_value := new_token (text)
			}
inspect		{
				last_token := E_INSPECT
				last_value := new_token (inspect_keyword)
			}
[iI][nN][sS][pP][eE][cC][tT]	{
				last_token := E_INSPECT
				last_value := new_token (text)
			}
invariant	{
				last_token := E_INVARIANT
				last_value := new_token (invariant_keyword)
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_INVARIANT
				last_value := new_token (text)
			}
is			{
				last_token := E_IS
				last_value := new_token (is_keyword)
			}
[iI][sS]	{
				last_token := E_IS
				last_value := new_token (text)
			}
like		{
				last_token := E_LIKE
				last_value := new_token (like_keyword)
			}
[lL][iI][kK][eE]	{
				last_token := E_LIKE
				last_value := new_token (text)
			}
local		{
				last_token := E_LOCAL
				last_value := new_token (local_keyword)
			}
[lL][oO][cC][aA][lL]	{
				last_token := E_LOCAL
				last_value := new_token (text)
			}
loop		{
				last_token := E_LOOP
				last_value := new_token (loop_keyword)
			}
[lL][oO][oO][pP]	{
				last_token := E_LOOP
				last_value := new_token (text)
			}
not			{
				last_token := E_NOT
				last_value := new_prefix_not_operator (not_keyword)
			}
[nN][oO][tT]	{
				last_token := E_NOT
				last_value := new_prefix_not_operator (text)
			}
obsolete	{
				last_token := E_OBSOLETE
				last_value := new_token (obsolete_keyword)
			}
[oO][bB][sS][oO][lL][eE][tT][eE]	{
				last_token := E_OBSOLETE
				last_value := new_token (text)
			}
old			{
				last_token := E_OLD
				last_value := new_token (old_keyword)
			}
[oO][lL][dD]	{
				last_token := E_OLD
				last_value := new_token (text)
			}
once		{
				last_token := E_ONCE
				last_value := new_token (once_keyword)
			}
[oO][nN][cC][eE]	{
				last_token := E_ONCE
				last_value := new_token (text)
			}
or			{
				last_token := E_OR
				last_value := new_infix_or_operator (or_keyword)
			}
[oO][rR]	{
				last_token := E_OR
				last_value := new_infix_or_operator (text)
			}
precursor	{
				last_token := E_PRECURSOR
				last_value := new_token (precursor_keyword)
			}
Precursor	{
				last_token := E_PRECURSOR
				last_value := new_token (capitalized_precursor_keyword)
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR]	{
				last_token := E_PRECURSOR
				last_value := new_token (text)
			}
prefix		{
				last_token := E_PREFIX
				last_value := new_token (prefix_keyword)
			}
[pP][rR][eE][fF][iI][xX]	{
				last_token := E_PREFIX
				last_value := new_token (text)
			}
redefine	{
				last_token := E_REDEFINE
				last_value := new_token (redefine_keyword)
			}
[rR][eE][dD][eE][fF][iI][nN][eE]	{
				last_token := E_REDEFINE
				last_value := new_token (text)
			}
reference	{
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := new_reference_mark (reference_keyword)
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (reference_keyword)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE] {
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := new_reference_mark (text)
				else
					last_token := E_IDENTIFIER
					last_value := new_identifier (text)
				end
			}
rename		{
				last_token := E_RENAME
				last_value := new_token (rename_keyword)
			}
[rR][eE][nN][aA][mM][eE]	{
				last_token := E_RENAME
				last_value := new_token (text)
			}
require		{
				last_token := E_REQUIRE
				last_value := new_token (require_keyword)
			}
[rR][eE][qQ][uU][iI][rR][eE]	{
				last_token := E_REQUIRE
				last_value := new_token (text)
			}
rescue		{
				last_token := E_RESCUE
				last_value := new_token (rescue_keyword)
			}
[rR][eE][sS][cC][uU][eE]	{
				last_token := E_RESCUE
				last_value := new_token (text)
			}
result		{
				last_token := E_RESULT
				last_value := new_result (result_keyword)
			}
Result		{
				last_token := E_RESULT
				last_value := new_result (capitalized_result_keyword)
			}
[rR][eE][sS][uU][lL][tT]	{
				last_token := E_RESULT
				last_value := new_result (text)
			}
retry		{
				last_token := E_RETRY
				last_value := new_retry_instruction (retry_keyword)
			}
[rR][eE][tT][rR][yY]	{
				last_token := E_RETRY
				last_value := new_retry_instruction (text)
			}
select		{
				last_token := E_SELECT
				last_value := new_token (select_keyword)
			}
[sS][eE][lL][eE][cC][tT]	{
				last_token := E_SELECT
				last_value := new_token (text)
			}
separate	{
				last_token := E_SEPARATE
				last_value := new_separate_mark (separate_keyword)
			}
[sS][eE][pP][aA][rR][aA][tT][eE]	{
				last_token := E_SEPARATE
				last_value := new_separate_mark (text)
			}
strip		{
				last_token := E_STRIP
				last_value := new_token (strip_keyword)
			}
[sS][tT][rR][iI][pP]	{
				last_token := E_STRIP
				last_value := new_token (text)
			}
then		{
				last_token := E_THEN
				last_value := new_token (then_keyword)
			}
[tT][hH][eE][nN]	{
				last_token := E_THEN
				last_value := new_token (text)
			}
true		{
				last_token := E_TRUE
				last_value := new_true_constant (true_keyword)
			}
True		{
				last_token := E_TRUE
				last_value := new_true_constant (capitalized_true_keyword)
			}
[tT][rR][uU][eE]	{
				last_token := E_TRUE
				last_value := new_true_constant (text)
			}
undefine	{
				last_token := E_UNDEFINE
				last_value := new_token (undefine_keyword)
			}
[uU][nN][dD][eE][fF][iI][nN][eE]	{
				last_token := E_UNDEFINE
				last_value := new_token (text)
			}
unique		{
				last_token := E_UNIQUE
				last_value := new_token (unique_keyword)
			}
[uU][nN][iI][qQ][uU][eE]	{
				last_token := E_UNIQUE
				last_value := new_token (text)
			}
until		{
				last_token := E_UNTIL
				last_value := new_token (until_keyword)
			}
[uU][nN][tT][iI][lL]	{
				last_token := E_UNTIL
				last_value := new_token (text)
			}
variant		{
				last_token := E_VARIANT
				last_value := new_token (variant_keyword)
			}
[vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_VARIANT
				last_value := new_token (text)
			}
when		{
				last_token := E_WHEN
				last_value := new_token (when_keyword)
			}
[wW][hH][eE][nN]	{
				last_token := E_WHEN
				last_value := new_token (text)
			}
xor			{
				last_token := E_XOR
				last_value := new_infix_xor_operator (xor_keyword)
			}
[xX][oO][rR]	{
				last_token := E_XOR
				last_value := new_infix_xor_operator (text)
			}


----------/** Eiffel identifiers **/--------------------------------------------

[bB][iI][tT]	{
				last_token := E_BITTYPE
				last_value := new_identifier (text)
			}
[a-zA-Z][a-zA-Z0-9_]*	{
				last_token := E_IDENTIFIER
				last_value := new_identifier (text)
			}


----------/** Eiffel free operators **/-----------------------------------------

[@#|&][^%" \t\r\n]*	{
				last_token := E_FREEOP
				last_value := new_free_operator (text)
			}

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n']\'	{
				last_token := E_CHARACTER
				last_value := new_character_constant (text_item (2))
			}
\'\'\'		{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)
				column := column - 1

				last_token := E_CHARACTER
				last_value := new_character_constant ('%'')
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
				last_token := E_STRPLUS
				last_value := new_manifest_string ("+")
			}
\"-\"		{
				last_token := E_STRMINUS
				last_value := new_manifest_string ("-")
			}
\"\*\"		{
				last_token := E_STRSTAR
				last_value := new_manifest_string ("*")
			}
\"\/\"		{
				last_token := E_STRSLASH
				last_value := new_manifest_string ("/")
			}
\"\/\/\"	{
				last_token := E_STRDIV
				last_value := new_manifest_string ("//")
			}
\"\\\\\"	{
				last_token := E_STRMOD
				last_value := new_manifest_string ("\\")
			}
\"^\"		{
				last_token := E_STRPOWER
				last_value := new_manifest_string ("^")
			}
\"<\"		{
				last_token := E_STRLT
				last_value := new_manifest_string ("<")
			}
\"<=\"		{
				last_token := E_STRLE
				last_value := new_manifest_string ("<=")
			}
\">\"		{
				last_token := E_STRGT
				last_value := new_manifest_string (">")
			}
\">=\"		{
				last_token := E_STRGE
				last_value := new_manifest_string (">=")
			}
\"[nN][oO][tT]\"	{
				last_token := E_STRNOT
				last_value := new_manifest_string (text_substring (2, 4))
			}
\"[aA][nN][dD]\"	{
				last_token := E_STRAND
				last_value := new_manifest_string (text_substring (2, 4))
			}
\"[oO][rR]\"	{
				last_token := E_STROR
				last_value := new_manifest_string (text_substring (2, 3))
			}
\"[xX][oO][rR]\"	{
				last_token := E_STRXOR
				last_value := new_manifest_string (text_substring (2, 4))
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"	{
				last_token := E_STRANDTHEN
				last_value := new_manifest_string (text_substring (2, 9))
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"	{
				last_token := E_STRORELSE
				last_value := new_manifest_string (text_substring (2, 8))
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"	{
				last_token := E_STRIMPLIES
				last_value := new_manifest_string (text_substring (2, 8))
			}
\"[@#|&][^%" \t\r\n]*\"	{
				last_token := E_STRFREEOP
				last_value := new_manifest_string (text_substring (2, text_count - 1))
			}

\"[^%\n"]*\"	{
					-- Regular manifest string.
				last_token := E_STRING
				last_value := new_manifest_string (text_substring (2, text_count - 1))
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
				verbatim_open_white_characters := text
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
					last_token := E_STRING
					last_value := new_verbatim_string (text_substring (1, vs_count),
						verbatim_marker, verbatim_open_white_characters,
						text_substring (vs_count + 1, text_count - verbatim_marker.count - 2))
					verbatim_marker := Void
					verbatim_open_white_characters := Void
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
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
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
				error_handler.report_SSNS_error (current_position)
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
				error_handler.report_SSAS_error (current_position)
				column := ms_column
				line := ms_line

				more
			}
	%\/		{
					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSAC_error (current_position)
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
				error_handler.report_SSCU_error (current_position)
				column := ms_column
				line := ms_line

				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))+	{
				more
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"	{
				last_token := E_STRING
				last_value := new_special_manifest_string (text_substring (2, text_count - 1))
				set_start_condition (INITIAL)
			}
	%.		{
					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSSC_error (current_position)
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
				error_handler.report_SSEL_error (current_position)
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
				last_token := E_BIT
				last_value := new_bit_constant (text)
			}


----------/** Eiffel integers **/-----------------------------------------------

[0-9]+		{
				last_token := E_INTEGER
				last_value := new_integer_constant (text)
			}
[0-9]{1,3}(_[0-9]{3})+	{
				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			}
_(_*[0-9_]+_*)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			}
(_*[0-9]+_*)+	{
					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTEGER
				last_value := new_underscored_integer_constant (text)
			}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./[^.0-9]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
				last_token := E_REAL
				last_value := new_real_constant (text)
			}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
				last_token := E_REAL
				last_value := new_underscored_real_constant (text)
			}

		-- The first and fourth expressions use a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.

--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
				last_value := current_position
			}

--------------------------------------------------------------------------------
%%

end
