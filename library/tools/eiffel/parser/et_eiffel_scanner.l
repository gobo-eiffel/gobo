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

%x BIT_BREAK BITTYPE_BREAK IDENTIFIER_BREAK
%x FREEOP_BREAK CHARACTER_BREAK STRING_BREAK
%x INTEGER_BREAK UINTEGER_BREAK HINTEGER_BREAK
%x REAL_BREAK UREAL_BREAK
%x MS MSN MSN1 VS1 VS2 VS3
%option nodefault line outfile="et_eiffel_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r\n]+	{
				if keep_all_breaks then
					last_token := E_BREAK
					last_value := new_break (text)
				end
			}


----------/** Eiffel comments **/-----------------------------------------------

([ \t\r\n]|"--".*)+	{
				if keep_all_breaks then
					last_token := E_BREAK
					last_value := new_comment (text)
				end
			}


----------/** Eiffel symbols **/------------------------------------------------

"-"			{
				last_token := Minus_code
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_minus_symbol (Current)
			}
"-"[ \t\r\n]+	{
				last_token := Minus_code
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_minus_symbol (Current)
			}
"-"([ \t\r\n]|"--".*)+	{
				last_token := Minus_code
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_minus_symbol (Current)
			}
"+"			{
				last_token := Plus_code
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_plus_symbol (Current)
			}
"+"[ \t\r\n]+	{
				last_token := Plus_code
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_plus_symbol (Current)
			}
"+"([ \t\r\n]|"--".*)+	{
				last_token := Plus_code
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_plus_symbol (Current)
			}
"*"			{
				last_token := Star_code
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_times_symbol (Current)
			}
"*"[ \t\r\n]+	{
				last_token := Star_code
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_times_symbol (Current)
			}
"*"([ \t\r\n]|"--".*)+	{
				last_token := Star_code
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_times_symbol (Current)
			}
"/"			{
				last_token := Slash_code
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_divide_symbol (Current)
			}
"/"[ \t\r\n]+	{
				last_token := Slash_code
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_divide_symbol (Current)
			}
"/"([ \t\r\n]|"--".*)+	{
				last_token := Slash_code
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_divide_symbol (Current)
			}
"^"			{
				last_token := Caret_code
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_power_symbol (Current)
			}
"^"[ \t\r\n]+	{
				last_token := Caret_code
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_power_symbol (Current)
			}
"^"([ \t\r\n]|"--".*)+	{
				last_token := Caret_code
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_power_symbol (Current)
			}
"="			{
				last_token := Equal_code
				last_literal_impl := equal_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_equal_symbol (Current)
			}
"="[ \t\r\n]+	{
				last_token := Equal_code
				last_literal_impl := equal_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_equal_symbol (Current)
			}
"="([ \t\r\n]|"--".*)+	{
				last_token := Equal_code
				last_literal_impl := equal_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_equal_symbol (Current)
			}
">"			{
				last_token := Greater_than_code
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_gt_symbol (Current)
			}
">"[ \t\r\n]+	{
				last_token := Greater_than_code
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_gt_symbol (Current)
			}
">"([ \t\r\n]|"--".*)+	{
				last_token := Greater_than_code
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_gt_symbol (Current)
			}
"<"			{
				last_token := Less_than_code
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_lt_symbol (Current)
			}
"<"[ \t\r\n]+	{
				last_token := Less_than_code
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_lt_symbol (Current)
			}
"<"([ \t\r\n]|"--".*)+	{
				last_token := Less_than_code
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_lt_symbol (Current)
			}
"."			{
				last_token := Dot_code
				last_literal_impl := dot_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_dot_symbol (Current)
			}
"."[ \t\r\n]+	{
				last_token := Dot_code
				last_literal_impl := dot_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_dot_symbol (Current)
			}
"."([ \t\r\n]|"--".*)+	{
				last_token := Dot_code
				last_literal_impl := dot_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_dot_symbol (Current)
			}
";"			{
				last_token := Semicolon_code
				last_literal_impl := semicolon_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_semicolon_symbol (Current)
			}
";"[ \t\r\n]+	{
				last_token := Semicolon_code
				last_literal_impl := semicolon_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_semicolon_symbol (Current)
			}
";"([ \t\r\n]|"--".*)+	{
				last_token := Semicolon_code
				last_literal_impl := semicolon_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_semicolon_symbol (Current)
			}
","			{
				last_token := Comma_code
				last_literal_impl := comma_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_comma_symbol (Current)
			}
","[ \t\r\n]+	{
				last_token := Comma_code
				last_literal_impl := comma_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_comma_symbol (Current)
			}
","([ \t\r\n]|"--".*)+	{
				last_token := Comma_code
				last_literal_impl := comma_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_comma_symbol (Current)
			}
":"			{
				last_token := Colon_code
				last_literal_impl := colon_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_colon_symbol (Current)
			}
":"[ \t\r\n]+	{
				last_token := Colon_code
				last_literal_impl := colon_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_colon_symbol (Current)
			}
":"([ \t\r\n]|"--".*)+	{
				last_token := Colon_code
				last_literal_impl := colon_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_colon_symbol (Current)
			}
"!"			{
				last_token := Exclamation_code
				last_literal_impl := bang_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_bang_symbol (Current)
			}
"!"[ \t\r\n]+	{
				last_token := Exclamation_code
				last_literal_impl := bang_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_bang_symbol (Current)
			}
"!"([ \t\r\n]|"--".*)+	{
				last_token := Exclamation_code
				last_literal_impl := bang_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_bang_symbol (Current)
			}
"?"			{
				last_token := Question_mark_code
				last_literal_impl := question_mark_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_question_mark_symbol (Current)
			}
"?"[ \t\r\n]+	{
				last_token := Question_mark_code
				last_literal_impl := question_mark_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_question_mark_symbol (Current)
			}
"?"([ \t\r\n]|"--".*)+	{
				last_token := Question_mark_code
				last_literal_impl := question_mark_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_question_mark_symbol (Current)
			}
"("			{
				last_token := Left_parenthesis_code
				last_literal_impl := left_parenthesis_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_left_parenthesis_symbol (Current)
			}
"("[ \t\r\n]+	{
				last_token := Left_parenthesis_code
				last_literal_impl := left_parenthesis_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_left_parenthesis_symbol (Current)
			}
"("([ \t\r\n]|"--".*)+	{
				last_token := Left_parenthesis_code
				last_literal_impl := left_parenthesis_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_left_parenthesis_symbol (Current)
			}
")"			{
				last_token := Right_parenthesis_code
				last_literal_impl := right_parenthesis_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_right_parenthesis_symbol (Current)
			}
")"[ \t\r\n]+	{
				last_token := Right_parenthesis_code
				last_literal_impl := right_parenthesis_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_right_parenthesis_symbol (Current)
			}
")"([ \t\r\n]|"--".*)+	{
				last_token := Right_parenthesis_code
				last_literal_impl := right_parenthesis_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_right_parenthesis_symbol (Current)
			}
"{"			{
				last_token := Left_brace_code
				last_literal_impl := left_brace_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_left_brace_symbol (Current)
			}
"{"[ \t\r\n]+	{
				last_token := Left_brace_code
				last_literal_impl := left_brace_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_left_brace_symbol (Current)
			}
"{"([ \t\r\n]|"--".*)+	{
				last_token := Left_brace_code
				last_literal_impl := left_brace_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_left_brace_symbol (Current)
			}
"}"			{
				last_token := Right_brace_code
				last_literal_impl := right_brace_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_right_brace_symbol (Current)
			}
"}"[ \t\r\n]+	{
				last_token := Right_brace_code
				last_literal_impl := right_brace_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_right_brace_symbol (Current)
			}
"}"([ \t\r\n]|"--".*)+	{
				last_token := Right_brace_code
				last_literal_impl := right_brace_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_right_brace_symbol (Current)
			}
"["			{
				last_token := Left_bracket_code
				last_literal_impl := left_bracket_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_left_bracket_symbol (Current)
			}
"["[ \t\r\n]+	{
				last_token := Left_bracket_code
				last_literal_impl := left_bracket_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_left_bracket_symbol (Current)
			}
"["([ \t\r\n]|"--".*)+	{
				last_token := Left_bracket_code
				last_literal_impl := left_bracket_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_left_bracket_symbol (Current)
			}
"]"			{
				last_token := Right_bracket_code
				last_literal_impl := right_bracket_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_right_bracket_symbol (Current)
			}
"]"[ \t\r\n]+	{
				last_token := Right_bracket_code
				last_literal_impl := right_bracket_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_right_bracket_symbol (Current)
			}
"]"([ \t\r\n]|"--".*)+	{
				last_token := Right_bracket_code
				last_literal_impl := right_bracket_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_right_bracket_symbol (Current)
			}
"$"			{
				last_token := Dollar_code
				last_literal_impl := dollar_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_dollar_symbol (Current)
			}
"$"[ \t\r\n]+	{
				last_token := Dollar_code
				last_literal_impl := dollar_symbol
				last_literal_start := 0
				last_break_start := 2
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_dollar_symbol (Current)
			}
"$"([ \t\r\n]|"--".*)+	{
				last_token := Dollar_code
				last_literal_impl := dollar_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 2
				last_comment_end := text_count
				last_value := ast_factory.new_dollar_symbol (Current)
			}
"//"		{
				last_token := E_DIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_div_symbol (Current)
			}
"//"[ \t\r\n]+	{
				last_token := E_DIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_div_symbol (Current)
			}
"//"([ \t\r\n]|"--".*)+	{
				last_token := E_DIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_div_symbol (Current)
			}
"\\\\"		{
				last_token := E_MOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_mod_symbol (Current)
			}
"\\\\"[ \t\r\n]+	{
				last_token := E_MOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_mod_symbol (Current)
			}
"\\\\"([ \t\r\n]|"--".*)+	{
				last_token := E_MOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_mod_symbol (Current)
			}
"/="		{
				last_token := E_NE
				last_literal_impl := not_equal_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_not_equal_symbol (Current)
			}
"/="[ \t\r\n]+	{
				last_token := E_NE
				last_literal_impl := not_equal_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_not_equal_symbol (Current)
			}
"/="([ \t\r\n]|"--".*)+	{
				last_token := E_NE
				last_literal_impl := not_equal_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_not_equal_symbol (Current)
			}
">="		{
				last_token := E_GE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_ge_symbol (Current)
			}
">="[ \t\r\n]+	{
				last_token := E_GE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_ge_symbol (Current)
			}
">="([ \t\r\n]|"--".*)+	{
				last_token := E_GE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_ge_symbol (Current)
			}
"<="		{
				last_token := E_LE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_le_symbol (Current)
			}
"<="[ \t\r\n]+	{
				last_token := E_LE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_le_symbol (Current)
			}
"<="([ \t\r\n]|"--".*)+	{
				last_token := E_LE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_le_symbol (Current)
			}
"!!"		{
				last_token := E_BANGBANG
				last_literal_impl := bangbang_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_bangbang_symbol (Current)
			}
"!!"[ \t\r\n]+	{
				last_token := E_BANGBANG
				last_literal_impl := bangbang_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_bangbang_symbol (Current)
			}
"!!"([ \t\r\n]|"--".*)+	{
				last_token := E_BANGBANG
				last_literal_impl := bangbang_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_bangbang_symbol (Current)
			}
"->"		{
				last_token := E_ARROW
				last_literal_impl := arrow_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_arrow_symbol (Current)
			}
"->"[ \t\r\n]+	{
				last_token := E_ARROW
				last_literal_impl := arrow_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_arrow_symbol (Current)
			}
"->"([ \t\r\n]|"--".*)+	{
				last_token := E_ARROW
				last_literal_impl := arrow_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_arrow_symbol (Current)
			}
".."		{
				last_token := E_DOTDOT
				last_literal_impl := dotdot_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_dotdot_symbol (Current)
			}
".."[ \t\r\n]+	{
				last_token := E_DOTDOT
				last_literal_impl := dotdot_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_dotdot_symbol (Current)
			}
".."([ \t\r\n]|"--".*)+	{
				last_token := E_DOTDOT
				last_literal_impl := dotdot_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_dotdot_symbol (Current)
			}
"<<"		{
				last_token := E_LARRAY
				last_literal_impl := left_array_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_left_array_symbol (Current)
			}
"<<"[ \t\r\n]+	{
				last_token := E_LARRAY
				last_literal_impl := left_array_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_left_array_symbol (Current)
			}
"<<"([ \t\r\n]|"--".*)+	{
				last_token := E_LARRAY
				last_literal_impl := left_array_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_left_array_symbol (Current)
			}
">>"		{
				last_token := E_RARRAY
				last_literal_impl := right_array_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_right_array_symbol (Current)
			}
">>"[ \t\r\n]+	{
				last_token := E_RARRAY
				last_literal_impl := right_array_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_right_array_symbol (Current)
			}
">>"([ \t\r\n]|"--".*)+	{
				last_token := E_RARRAY
				last_literal_impl := right_array_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_right_array_symbol (Current)
			}
":="		{
				last_token := E_ASSIGN
				last_literal_impl := assign_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_assign_symbol (Current)
			}
":="[ \t\r\n]+	{
				last_token := E_ASSIGN
				last_literal_impl := assign_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_assign_symbol (Current)
			}
":="([ \t\r\n]|"--".*)+	{
				last_token := E_ASSIGN
				last_literal_impl := assign_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_assign_symbol (Current)
			}
"?="		{
				last_token := E_REVERSE
				last_literal_impl := assign_attempt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_assign_attempt_symbol (Current)
			}
"?="[ \t\r\n]+	{
				last_token := E_REVERSE
				last_literal_impl := assign_attempt_symbol
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_assign_attempt_symbol (Current)
			}
"?="([ \t\r\n]|"--".*)+	{
				last_token := E_REVERSE
				last_literal_impl := assign_attempt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_assign_attempt_symbol (Current)
			}


----------/** Reserved words **/------------------------------------------------

agent		{
				last_token := E_AGENT
				last_literal_impl := agent_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_agent_keyword (Current)
			}
agent[ \t\r\n]+	{
				last_token := E_AGENT
				last_literal_impl := agent_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_agent_keyword (Current)
			}
agent([ \t\r\n]|"--".*)+	{
				last_token := E_AGENT
				last_literal_impl := agent_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_agent_keyword (Current)
			}
[aA][gG][eE][nN][tT]	{
				last_token := E_AGENT
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_agent_keyword (Current)
			}
[aA][gG][eE][nN][tT][ \t\r\n]+	{
				last_token := E_AGENT
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_agent_keyword (Current)
			}
[aA][gG][eE][nN][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_AGENT
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_agent_keyword (Current)
			}
alias		{
				last_token := E_ALIAS
				last_literal_impl := alias_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_alias_keyword (Current)
			}
alias[ \t\r\n]+	{
				last_token := E_ALIAS
				last_literal_impl := alias_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_alias_keyword (Current)
			}
alias([ \t\r\n]|"--".*)+	{
				last_token := E_ALIAS
				last_literal_impl := alias_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_alias_keyword (Current)
			}
[aA][lL][iI][aA][sS]	{
				last_token := E_ALIAS
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_alias_keyword (Current)
			}
[aA][lL][iI][aA][sS][ \t\r\n]+	{
				last_token := E_ALIAS
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_alias_keyword (Current)
			}
[aA][lL][iI][aA][sS]([ \t\r\n]|"--".*)+	{
				last_token := E_ALIAS
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_alias_keyword (Current)
			}
all			{
				last_token := E_ALL
				last_literal_impl := all_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_all_keyword (Current)
			}
all[ \t\r\n]+	{
				last_token := E_ALL
				last_literal_impl := all_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_all_keyword (Current)
			}
all([ \t\r\n]|"--".*)+	{
				last_token := E_ALL
				last_literal_impl := all_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_all_keyword (Current)
			}
[aA][lL][lL]	{
				last_token := E_ALL
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_all_keyword (Current)
			}
[aA][lL][lL][ \t\r\n]+	{
				last_token := E_ALL
				last_literal_start := 1
				last_literal_end := 3
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_all_keyword (Current)
			}
[aA][lL][lL]([ \t\r\n]|"--".*)+	{
				last_token := E_ALL
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_all_keyword (Current)
			}
and			{
				last_token := E_AND
				last_literal_impl := and_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_and_keyword (Current)
			}
and[ \t\r\n]+	{
				last_token := E_AND
				last_literal_impl := and_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_and_keyword (Current)
			}
and([ \t\r\n]|"--".*)+	{
				last_token := E_AND
				last_literal_impl := and_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_and_keyword (Current)
			}
[aA][nN][dD]	{
				last_token := E_AND
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_and_keyword (Current)
			}
[aA][nN][dD][ \t\r\n]+	{
				last_token := E_AND
				last_literal_start := 1
				last_literal_end := 3
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_and_keyword (Current)
			}
[aA][nN][dD]([ \t\r\n]|"--".*)+	{
				last_token := E_AND
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_and_keyword (Current)
			}
as			{
				last_token := E_AS
				last_literal_impl := as_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_as_keyword (Current)
			}
as[ \t\r\n]+	{
				last_token := E_AS
				last_literal_impl := as_keyword
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_as_keyword (Current)
			}
as([ \t\r\n]|"--".*)+	{
				last_token := E_AS
				last_literal_impl := as_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_as_keyword (Current)
			}
[aA][sS]	{
				last_token := E_AS
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_as_keyword (Current)
			}
[aA][sS][ \t\r\n]+	{
				last_token := E_AS
				last_literal_start := 1
				last_literal_end := 2
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_as_keyword (Current)
			}
[aA][sS]([ \t\r\n]|"--".*)+	{
				last_token := E_AS
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_as_keyword (Current)
			}
check		{
				last_token := E_CHECK
				last_literal_impl := check_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_check_keyword (Current)
			}
check[ \t\r\n]+	{
				last_token := E_CHECK
				last_literal_impl := check_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_check_keyword (Current)
			}
check([ \t\r\n]|"--".*)+	{
				last_token := E_CHECK
				last_literal_impl := check_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_check_keyword (Current)
			}
[cC][hH][eE][cC][kK]	{
				last_token := E_CHECK
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_check_keyword (Current)
			}
[cC][hH][eE][cC][kK][ \t\r\n]+	{
				last_token := E_CHECK
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_check_keyword (Current)
			}
[cC][hH][eE][cC][kK]([ \t\r\n]|"--".*)+	{
				last_token := E_CHECK
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_check_keyword (Current)
			}
class		{
				last_token := E_CLASS
				last_literal_impl := class_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_class_keyword (Current)
			}
class[ \t\r\n]+	{
				last_token := E_CLASS
				last_literal_impl := class_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_class_keyword (Current)
			}
class([ \t\r\n]|"--".*)+	{
				last_token := E_CLASS
				last_literal_impl := class_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_class_keyword (Current)
			}
[cC][lL][aA][sS][sS]	{
				last_token := E_CLASS
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_class_keyword (Current)
			}
[cC][lL][aA][sS][sS][ \t\r\n]+	{
				last_token := E_CLASS
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_class_keyword (Current)
			}
[cC][lL][aA][sS][sS]([ \t\r\n]|"--".*)+	{
				last_token := E_CLASS
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_class_keyword (Current)
			}
create		{
				last_literal_impl := create_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
create[ \t\r\n]+	{
				last_literal_impl := create_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
create([ \t\r\n]|"--".*)+	{
				last_literal_impl := create_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[cC][rR][eE][aA][tT][eE]	{
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[cC][rR][eE][aA][tT][eE][ \t\r\n]+	{
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[cC][rR][eE][aA][tT][eE]([ \t\r\n]|"--".*)+	{
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				if use_create_keyword then
					last_token := E_CREATE
					last_value := ast_factory.new_create_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
creation	{
				last_token := E_CREATION
				last_literal_impl := creation_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_creation_keyword (Current)
			}
creation[ \t\r\n]+	{
				last_token := E_CREATION
				last_literal_impl := creation_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_creation_keyword (Current)
			}
creation([ \t\r\n]|"--".*)+	{
				last_token := E_CREATION
				last_literal_impl := creation_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_creation_keyword (Current)
			}
[cC][rR][eE][aA][tT][iI][oO][nN]	{
				last_token := E_CREATION
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_creation_keyword (Current)
			}
[cC][rR][eE][aA][tT][iI][oO][nN][ \t\r\n]+	{
				last_token := E_CREATION
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_creation_keyword (Current)
			}
[cC][rR][eE][aA][tT][iI][oO][nN]([ \t\r\n]|"--".*)+	{
				last_token := E_CREATION
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_creation_keyword (Current)
			}
current		{
				last_token := E_CURRENT
				last_literal_impl := current_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
current[ \t\r\n]+	{
				last_token := E_CURRENT
				last_literal_impl := current_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
current([ \t\r\n]|"--".*)+	{
				last_token := E_CURRENT
				last_literal_impl := current_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_current_keyword (Current)
			}
Current		{
				last_token := E_CURRENT
				last_literal_impl := capitalized_current_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
Current[ \t\r\n]+	{
				last_token := E_CURRENT
				last_literal_impl := capitalized_current_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
Current([ \t\r\n]|"--".*)+	{
				last_token := E_CURRENT
				last_literal_impl := capitalized_current_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_current_keyword (Current)
			}
[cC][uU][rR][rR][eE][nN][tT]	{
				last_token := E_CURRENT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
[cC][uU][rR][rR][eE][nN][tT][ \t\r\n]+	{
				last_token := E_CURRENT
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_current_keyword (Current)
			}
[cC][uU][rR][rR][eE][nN][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_CURRENT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_current_keyword (Current)
			}
debug		{
				last_token := E_DEBUG
				last_literal_impl := debug_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_debug_keyword (Current)
			}
debug[ \t\r\n]+	{
				last_token := E_DEBUG
				last_literal_impl := debug_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_debug_keyword (Current)
			}
debug([ \t\r\n]|"--".*)+	{
				last_token := E_DEBUG
				last_literal_impl := debug_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 6
				last_comment_end := text_count
				last_value := ast_factory.new_debug_keyword (Current)
			}
[dD][eE][bB][uU][gG]	{
				last_token := E_DEBUG
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_debug_keyword (Current)
			}
[dD][eE][bB][uU][gG][ \t\r\n]+	{
				last_token := E_DEBUG
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_debug_keyword (Current)
			}
[dD][eE][bB][uU][gG]([ \t\r\n]|"--".*)+	{
				last_token := E_DEBUG
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_debug_keyword (Current)
			}
deferred	{
				last_token := E_DEFERRED
				last_literal_impl := deferred_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_deferred_keyword (Current)
			}
deferred[ \t\r\n]+	{
				last_token := E_DEFERRED
				last_literal_impl := deferred_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_deferred_keyword (Current)
			}
deferred([ \t\r\n]|"--".*)+	{
				last_token := E_DEFERRED
				last_literal_impl := deferred_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_deferred_keyword (Current)
			}
[dD][eE][fF][eE][rR][rR][eE][dD]	{
				last_token := E_DEFERRED
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_deferred_keyword (Current)
			}
[dD][eE][fF][eE][rR][rR][eE][dD][ \t\r\n]+	{
				last_token := E_DEFERRED
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_deferred_keyword (Current)
			}
[dD][eE][fF][eE][rR][rR][eE][dD]([ \t\r\n]|"--".*)+	{
				last_token := E_DEFERRED
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_deferred_keyword (Current)
			}
do			{
				last_token := E_DO
				last_literal_impl := do_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_do_keyword (Current)
			}
do[ \t\r\n]+	{
				last_token := E_DO
				last_literal_impl := do_keyword
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_do_keyword (Current)
			}
do([ \t\r\n]|"--".*)+	{
				last_token := E_DO
				last_literal_impl := do_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_do_keyword (Current)
			}
[dD][oO]	{
				last_token := E_DO
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_do_keyword (Current)
			}
[dD][oO][ \t\r\n]+	{
				last_token := E_DO
				last_literal_start := 1
				last_literal_end := 2
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_do_keyword (Current)
			}
[dD][oO]([ \t\r\n]|"--".*)+	{
				last_token := E_DO
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_do_keyword (Current)
			}
else		{
				last_token := E_ELSE
				last_literal_impl := else_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_else_keyword (Current)
			}
else[ \t\r\n]+	{
				last_token := E_ELSE
				last_literal_impl := else_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_else_keyword (Current)
			}
else([ \t\r\n]|"--".*)+	{
				last_token := E_ELSE
				last_literal_impl := else_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_else_keyword (Current)
			}
[eE][lL][sS][eE]	{
				last_token := E_ELSE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_else_keyword (Current)
			}
[eE][lL][sS][eE][ \t\r\n]+	{
				last_token := E_ELSE
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_else_keyword (Current)
			}
[eE][lL][sS][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_ELSE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 5
				last_comment_end := text_count
				last_value := ast_factory.new_else_keyword (Current)
			}
elseif		{
				last_token := E_ELSEIF
				last_literal_impl := elseif_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_elseif_keyword (Current)
			}
elseif[ \t\r\n]+	{
				last_token := E_ELSEIF
				last_literal_impl := elseif_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_elseif_keyword (Current)
			}
elseif([ \t\r\n]|"--".*)+	{
				last_token := E_ELSEIF
				last_literal_impl := elseif_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_elseif_keyword (Current)
			}
[eE][lL][sS][eE][iI][fF]	{
				last_token := E_ELSEIF
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_elseif_keyword (Current)
			}
[eE][lL][sS][eE][iI][fF][ \t\r\n]+	{
				last_token := E_ELSEIF
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_elseif_keyword (Current)
			}
[eE][lL][sS][eE][iI][fF]([ \t\r\n]|"--".*)+	{
				last_token := E_ELSEIF
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_elseif_keyword (Current)
			}
end			{
				last_token := E_END
				last_literal_impl := end_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_end_keyword (Current)
			}
end[ \t\r\n]+	{
				last_token := E_END
				last_literal_impl := end_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_end_keyword (Current)
			}
end([ \t\r\n]|"--".*)+	{
				last_token := E_END
				last_literal_impl := end_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_end_keyword (Current)
			}
[eE][nN][dD]	{
				last_token := E_END
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_end_keyword (Current)
			}
[eE][nN][dD][ \t\r\n]+	{
				last_token := E_END
				last_literal_start := 1
				last_literal_end := 3
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_end_keyword (Current)
			}
[eE][nN][dD]([ \t\r\n]|"--".*)+	{
				last_token := E_END
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_end_keyword (Current)
			}
ensure		{
				last_token := E_ENSURE
				last_literal_impl := ensure_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_ensure_keyword (Current)
			}
ensure[ \t\r\n]+	{
				last_token := E_ENSURE
				last_literal_impl := ensure_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_ensure_keyword (Current)
			}
ensure([ \t\r\n]|"--".*)+	{
				last_token := E_ENSURE
				last_literal_impl := ensure_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_ensure_keyword (Current)
			}
[eE][nN][sS][uU][rR][eE]	{
				last_token := E_ENSURE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_ensure_keyword (Current)
			}
[eE][nN][sS][uU][rR][eE][ \t\r\n]+	{
				last_token := E_ENSURE
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_ensure_keyword (Current)
			}
[eE][nN][sS][uU][rR][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_ENSURE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_ensure_keyword (Current)
			}
expanded	{
				last_token := E_EXPANDED
				last_literal_impl := expanded_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_expanded_keyword (Current)
			}
expanded[ \t\r\n]+	{
				last_token := E_EXPANDED
				last_literal_impl := expanded_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_expanded_keyword (Current)
			}
expanded([ \t\r\n]|"--".*)+	{
				last_token := E_EXPANDED
				last_literal_impl := expanded_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_expanded_keyword (Current)
			}
[eE][xX][pP][aA][nN][dD][eE][dD]	{
				last_token := E_EXPANDED
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_expanded_keyword (Current)
			}
[eE][xX][pP][aA][nN][dD][eE][dD][ \t\r\n]+	{
				last_token := E_EXPANDED
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_expanded_keyword (Current)
			}
[eE][xX][pP][aA][nN][dD][eE][dD]([ \t\r\n]|"--".*)+	{
				last_token := E_EXPANDED
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_expanded_keyword (Current)
			}
export		{
				last_token := E_EXPORT
				last_literal_impl := export_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_export_keyword (Current)
			}
export[ \t\r\n]+	{
				last_token := E_EXPORT
				last_literal_impl := export_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_export_keyword (Current)
			}
export([ \t\r\n]|"--".*)+	{
				last_token := E_EXPORT
				last_literal_impl := export_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_export_keyword (Current)
			}
[eE][xX][pP][oO][rR][tT]	{
				last_token := E_EXPORT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_export_keyword (Current)
			}
[eE][xX][pP][oO][rR][tT][ \t\r\n]+	{
				last_token := E_EXPORT
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_export_keyword (Current)
			}
[eE][xX][pP][oO][rR][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_EXPORT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_export_keyword (Current)
			}
external	{
				last_token := E_EXTERNAL
				last_literal_impl := external_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_external_keyword (Current)
			}
external[ \t\r\n]+	{
				last_token := E_EXTERNAL
				last_literal_impl := external_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_external_keyword (Current)
			}
external([ \t\r\n]|"--".*)+	{
				last_token := E_EXTERNAL
				last_literal_impl := external_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 9
				last_comment_end := text_count
				last_value := ast_factory.new_external_keyword (Current)
			}
[eE][xX][tT][eE][rR][nN][aA][lL]	{
				last_token := E_EXTERNAL
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_external_keyword (Current)
			}
[eE][xX][tT][eE][rR][nN][aA][lL][ \t\r\n]+	{
				last_token := E_EXTERNAL
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_external_keyword (Current)
			}
[eE][xX][tT][eE][rR][nN][aA][lL]([ \t\r\n]|"--".*)+	{
				last_token := E_EXTERNAL
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 9
				last_comment_end := text_count
				last_value := ast_factory.new_external_keyword (Current)
			}
false		{
				last_token := E_FALSE
				last_literal_impl := false_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
false[ \t\r\n]+	{
				last_token := E_FALSE
				last_literal_impl := false_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
false([ \t\r\n]|"--".*)+	{
				last_token := E_FALSE
				last_literal_impl := false_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_false_keyword (Current)
			}
False		{
				last_token := E_FALSE
				last_literal_impl := capitalized_false_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
False[ \t\r\n]+	{
				last_token := E_FALSE
				last_literal_impl := capitalized_false_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
False([ \t\r\n]|"--".*)+	{
				last_token := E_FALSE
				last_literal_impl := capitalized_false_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_false_keyword (Current)
			}
[fF][aA][lL][sS][eE]	{
				last_token := E_FALSE
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
[fF][aA][lL][sS][eE][ \t\r\n]+	{
				last_token := E_FALSE
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_false_keyword (Current)
			}
[fF][aA][lL][sS][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_FALSE
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_false_keyword (Current)
			}
feature		{
				last_token := E_FEATURE
				last_literal_impl := feature_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_feature_keyword (Current)
			}
feature[ \t\r\n]+	{
				last_token := E_FEATURE
				last_literal_impl := feature_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_feature_keyword (Current)
			}
feature([ \t\r\n]|"--".*)+	{
				last_token := E_FEATURE
				last_literal_impl := feature_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_feature_keyword (Current)
			}
[fF][eE][aA][tT][uU][rR][eE]	{
				last_token := E_FEATURE
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_feature_keyword (Current)
			}
[fF][eE][aA][tT][uU][rR][eE][ \t\r\n]+	{
				last_token := E_FEATURE
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_feature_keyword (Current)
			}
[fF][eE][aA][tT][uU][rR][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_FEATURE
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_feature_keyword (Current)
			}
from		{
				last_token := E_FROM
				last_literal_impl := from_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_from_keyword (Current)
			}
from[ \t\r\n]+	{
				last_token := E_FROM
				last_literal_impl := from_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_from_keyword (Current)
			}
from([ \t\r\n]|"--".*)+	{
				last_token := E_FROM
				last_literal_impl := from_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_from_keyword (Current)
			}
[fF][rR][oO][mM]	{
				last_token := E_FROM
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_from_keyword (Current)
			}
[fF][rR][oO][mM][ \t\r\n]+	{
				last_token := E_FROM
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_from_keyword (Current)
			}
[fF][rR][oO][mM]([ \t\r\n]|"--".*)+	{
				last_token := E_FROM
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_from_keyword (Current)
			}
frozen		{
				last_token := E_FROZEN
				last_literal_impl := frozen_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_frozen_keyword (Current)
			}
frozen[ \t\r\n]+	{
				last_token := E_FROZEN
				last_literal_impl := frozen_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_frozen_keyword (Current)
			}
frozen([ \t\r\n]|"--".*)+	{
				last_token := E_FROZEN
				last_literal_impl := frozen_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_frozen_keyword (Current)
			}
[fF][rR][oO][zZ][eE][nN]	{
				last_token := E_FROZEN
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_frozen_keyword (Current)
			}
[fF][rR][oO][zZ][eE][nN][ \t\r\n]+	{
				last_token := E_FROZEN
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_frozen_keyword (Current)
			}
[fF][rR][oO][zZ][eE][nN]([ \t\r\n]|"--".*)+	{
				last_token := E_FROZEN
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_frozen_keyword (Current)
			}
if			{
				last_token := E_IF
				last_literal_impl := if_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_if_keyword (Current)
			}
if[ \t\r\n]+	{
				last_token := E_IF
				last_literal_impl := if_keyword
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_if_keyword (Current)
			}
if([ \t\r\n]|"--".*)+	{
				last_token := E_IF
				last_literal_impl := if_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_if_keyword (Current)
			}
[iI][fF]	{
				last_token := E_IF
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_if_keyword (Current)
			}
[iI][fF][ \t\r\n]+	{
				last_token := E_IF
				last_literal_start := 1
				last_literal_end := 2
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_if_keyword (Current)
			}
[iI][fF]([ \t\r\n]|"--".*)+	{
				last_token := E_IF
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_if_keyword (Current)
			}
implies		{
				last_token := E_IMPLIES
				last_literal_impl := implies_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_implies_keyword (Current)
			}
implies[ \t\r\n]+	{
				last_token := E_IMPLIES
				last_literal_impl := implies_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_implies_keyword (Current)
			}
implies([ \t\r\n]|"--".*)+	{
				last_token := E_IMPLIES
				last_literal_impl := implies_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_implies_keyword (Current)
			}
[iI][mM][pP][lL][iI][eE][sS]	{
				last_token := E_IMPLIES
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_implies_keyword (Current)
			}
[iI][mM][pP][lL][iI][eE][sS][ \t\r\n]+	{
				last_token := E_IMPLIES
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_implies_keyword (Current)
			}
[iI][mM][pP][lL][iI][eE][sS]([ \t\r\n]|"--".*)+	{
				last_token := E_IMPLIES
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_implies_keyword (Current)
			}
indexing	{
				last_token := E_INDEXING
				last_literal_impl := indexing_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_indexing_keyword (Current)
			}
indexing[ \t\r\n]+	{
				last_token := E_INDEXING
				last_literal_impl := indexing_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_indexing_keyword (Current)
			}
indexing([ \t\r\n]|"--".*)+	{
				last_token := E_INDEXING
				last_literal_impl := indexing_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_indexing_keyword (Current)
			}
[iI][nN][dD][eE][xX][iI][nN][gG]	{
				last_token := E_INDEXING
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_indexing_keyword (Current)
			}
[iI][nN][dD][eE][xX][iI][nN][gG][ \t\r\n]+	{
				last_token := E_INDEXING
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_indexing_keyword (Current)
			}
[iI][nN][dD][eE][xX][iI][nN][gG]([ \t\r\n]|"--".*)+	{
				last_token := E_INDEXING
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_indexing_keyword (Current)
			}
infix		{
				last_token := E_INFIX
				last_literal_impl := infix_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_infix_keyword (Current)
			}
infix[ \t\r\n]+	{
				last_token := E_INFIX
				last_literal_impl := infix_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_infix_keyword (Current)
			}
infix([ \t\r\n]|"--".*)+	{
				last_token := E_INFIX
				last_literal_impl := infix_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_infix_keyword (Current)
			}
[iI][nN][fF][iI][xX]	{
				last_token := E_INFIX
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_infix_keyword (Current)
			}
[iI][nN][fF][iI][xX][ \t\r\n]+	{
				last_token := E_INFIX
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_infix_keyword (Current)
			}
[iI][nN][fF][iI][xX]([ \t\r\n]|"--".*)+	{
				last_token := E_INFIX
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_infix_keyword (Current)
			}
inherit		{
				last_token := E_INHERIT
				last_literal_impl := inherit_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_inherit_keyword (Current)
			}
inherit[ \t\r\n]+	{
				last_token := E_INHERIT
				last_literal_impl := inherit_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_inherit_keyword (Current)
			}
inherit([ \t\r\n]|"--".*)+	{
				last_token := E_INHERIT
				last_literal_impl := inherit_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_inherit_keyword (Current)
			}
[iI][nN][hH][eE][rR][iI][tT]	{
				last_token := E_INHERIT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_inherit_keyword (Current)
			}
[iI][nN][hH][eE][rR][iI][tT][ \t\r\n]+	{
				last_token := E_INHERIT
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_inherit_keyword (Current)
			}
[iI][nN][hH][eE][rR][iI][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_INHERIT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_inherit_keyword (Current)
			}
inspect		{
				last_token := E_INSPECT
				last_literal_impl := inspect_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_inspect_keyword (Current)
			}
inspect[ \t\r\n]+	{
				last_token := E_INSPECT
				last_literal_impl := inspect_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_inspect_keyword (Current)
			}
inspect([ \t\r\n]|"--".*)+	{
				last_token := E_INSPECT
				last_literal_impl := inspect_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_inspect_keyword (Current)
			}
[iI][nN][sS][pP][eE][cC][tT]	{
				last_token := E_INSPECT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_inspect_keyword (Current)
			}
[iI][nN][sS][pP][eE][cC][tT][ \t\r\n]+	{
				last_token := E_INSPECT
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_inspect_keyword (Current)
			}
[iI][nN][sS][pP][eE][cC][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_INSPECT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_inspect_keyword (Current)
			}
invariant	{
				last_token := E_INVARIANT
				last_literal_impl := invariant_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_invariant_keyword (Current)
			}
invariant[ \t\r\n]+	{
				last_token := E_INVARIANT
				last_literal_impl := invariant_keyword
				last_literal_start := 0
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_invariant_keyword (Current)
			}
invariant([ \t\r\n]|"--".*)+	{
				last_token := E_INVARIANT
				last_literal_impl := invariant_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_invariant_keyword (Current)
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_INVARIANT
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_invariant_keyword (Current)
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT][ \t\r\n]+	{
				last_token := E_INVARIANT
				last_literal_start := 1
				last_literal_end := 9
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_invariant_keyword (Current)
			}
[iI][nN][vV][aA][rR][iI][aA][nN][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_INVARIANT
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_invariant_keyword (Current)
			}
is			{
				last_token := E_IS
				last_literal_impl := is_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_is_keyword (Current)
			}
is[ \t\r\n]+	{
				last_token := E_IS
				last_literal_impl := is_keyword
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_is_keyword (Current)
			}
is([ \t\r\n]|"--".*)+	{
				last_token := E_IS
				last_literal_impl := is_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_is_keyword (Current)
			}
[iI][sS]	{
				last_token := E_IS
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_is_keyword (Current)
			}
[iI][sS][ \t\r\n]+	{
				last_token := E_IS
				last_literal_start := 1
				last_literal_end := 2
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_is_keyword (Current)
			}
[iI][sS]([ \t\r\n]|"--".*)+	{
				last_token := E_IS
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_is_keyword (Current)
			}
like		{
				last_token := E_LIKE
				last_literal_impl := like_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_like_keyword (Current)
			}
like[ \t\r\n]+	{
				last_token := E_LIKE
				last_literal_impl := like_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_like_keyword (Current)
			}
like([ \t\r\n]|"--".*)+	{
				last_token := E_LIKE
				last_literal_impl := like_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_like_keyword (Current)
			}
[lL][iI][kK][eE]	{
				last_token := E_LIKE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_like_keyword (Current)
			}
[lL][iI][kK][eE][ \t\r\n]+	{
				last_token := E_LIKE
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_like_keyword (Current)
			}
[lL][iI][kK][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_LIKE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_like_keyword (Current)
			}
local		{
				last_token := E_LOCAL
				last_literal_impl := local_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_local_keyword (Current)
			}
local[ \t\r\n]+	{
				last_token := E_LOCAL
				last_literal_impl := local_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_local_keyword (Current)
			}
local([ \t\r\n]|"--".*)+	{
				last_token := E_LOCAL
				last_literal_impl := local_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_local_keyword (Current)
			}
[lL][oO][cC][aA][lL]	{
				last_token := E_LOCAL
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_local_keyword (Current)
			}
[lL][oO][cC][aA][lL][ \t\r\n]+	{
				last_token := E_LOCAL
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_local_keyword (Current)
			}
[lL][oO][cC][aA][lL]([ \t\r\n]|"--".*)+	{
				last_token := E_LOCAL
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_local_keyword (Current)
			}
loop		{
				last_token := E_LOOP
				last_literal_impl := loop_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_loop_keyword (Current)
			}
loop[ \t\r\n]+	{
				last_token := E_LOOP
				last_literal_impl := loop_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_loop_keyword (Current)
			}
loop([ \t\r\n]|"--".*)+	{
				last_token := E_LOOP
				last_literal_impl := loop_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_loop_keyword (Current)
			}
[lL][oO][oO][pP]	{
				last_token := E_LOOP
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_loop_keyword (Current)
			}
[lL][oO][oO][pP][ \t\r\n]+	{
				last_token := E_LOOP
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_loop_keyword (Current)
			}
[lL][oO][oO][pP]([ \t\r\n]|"--".*)+	{
				last_token := E_LOOP
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_loop_keyword (Current)
			}
not			{
				last_token := E_NOT
				last_literal_impl := not_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_not_keyword (Current)
			}
not[ \t\r\n]+	{
				last_token := E_NOT
				last_literal_impl := not_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_not_keyword (Current)
			}
not([ \t\r\n]|"--".*)+	{
				last_token := E_NOT
				last_literal_impl := not_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_not_keyword (Current)
			}
[nN][oO][tT]	{
				last_token := E_NOT
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_not_keyword (Current)
			}
[nN][oO][tT][ \t\r\n]+	{
				last_token := E_NOT
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_not_keyword (Current)
			}
[nN][oO][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_NOT
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 4
				last_comment_end := text_count
				last_value := ast_factory.new_not_keyword (Current)
			}
obsolete	{
				last_token := E_OBSOLETE
				last_literal_impl := obsolete_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
obsolete[ \t\r\n]+	{
				last_token := E_OBSOLETE
				last_literal_impl := obsolete_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
obsolete([ \t\r\n]|"--".*)+	{
				last_token := E_OBSOLETE
				last_literal_impl := obsolete_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
[oO][bB][sS][oO][lL][eE][tT][eE]	{
				last_token := E_OBSOLETE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
[oO][bB][sS][oO][lL][eE][tT][eE][ \t\r\n]+	{
				last_token := E_OBSOLETE
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
[oO][bB][sS][oO][lL][eE][tT][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_OBSOLETE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_obsolete_keyword (Current)
			}
old			{
				last_token := E_OLD
				last_literal_impl := old_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_old_keyword (Current)
			}
old[ \t\r\n]+	{
				last_token := E_OLD
				last_literal_impl := old_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_old_keyword (Current)
			}
old([ \t\r\n]|"--".*)+	{
				last_token := E_OLD
				last_literal_impl := old_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_old_keyword (Current)
			}
[oO][lL][dD]	{
				last_token := E_OLD
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_old_keyword (Current)
			}
[oO][lL][dD][ \t\r\n]+	{
				last_token := E_OLD
				last_literal_start := 1
				last_literal_end := 3
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_old_keyword (Current)
			}
[oO][lL][dD]([ \t\r\n]|"--".*)+	{
				last_token := E_OLD
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_old_keyword (Current)
			}
once		{
				last_token := E_ONCE
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
once[ \t\r\n]+	{
				last_token := E_ONCE
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
once([ \t\r\n]|"--".*)+	{
				last_token := E_ONCE
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]	{
				last_token := E_ONCE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE][ \t\r\n]+	{
				last_token := E_ONCE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_ONCE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_once_keyword (Current)
			}
-- We need to make the distinction between once keywords followed
-- by a manifest string and once keywords introducing a once-routine
-- because otherwise we would need to have two look-ahead tokens
-- to figure out that the first once keyword in the following example
-- in part of a once manifest string expression and the second is
-- part of the compound of the once routine:
--   f is
--      require
--         once "foo" /= Void
--      once
--         do_nothing
--      end
once/\"	{
				last_token := E_ONCE_STRING
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
once[ \t\r\n]+/\"	{
				last_token := E_ONCE_STRING
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
once([ \t\r\n]|"--".*\n)+/\"	{
				last_token := E_ONCE_STRING
				last_literal_impl := once_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE][ \t\r\n]+/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_once_keyword (Current)
			}
[oO][nN][cC][eE]([ \t\r\n]|"--".*\n)+/\"	{
				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_once_keyword (Current)
			}
or			{
				last_token := E_OR
				last_literal_impl := or_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_or_keyword (Current)
			}
or[ \t\r\n]+	{
				last_token := E_OR
				last_literal_impl := or_keyword
				last_literal_start := 0
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_or_keyword (Current)
			}
or([ \t\r\n]|"--".*)+	{
				last_token := E_OR
				last_literal_impl := or_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_or_keyword (Current)
			}
[oO][rR]	{
				last_token := E_OR
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_or_keyword (Current)
			}
[oO][rR][ \t\r\n]+	{
				last_token := E_OR
				last_literal_start := 1
				last_literal_end := 2
				last_break_start := 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_or_keyword (Current)
			}
[oO][rR]([ \t\r\n]|"--".*)+	{
				last_token := E_OR
				last_literal_start := 1
				last_literal_end := 2
				last_break_end := 0
				last_comment_start := 3
				last_comment_end := text_count
				last_value := ast_factory.new_or_keyword (Current)
			}
precursor	{
				last_token := E_PRECURSOR
				last_literal_impl := precursor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
precursor[ \t\r\n]+	{
				last_token := E_PRECURSOR
				last_literal_impl := precursor_keyword
				last_literal_start := 0
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
precursor([ \t\r\n]|"--".*)+	{
				last_token := E_PRECURSOR
				last_literal_impl := precursor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_precursor_keyword (Current)
			}
Precursor	{
				last_token := E_PRECURSOR
				last_literal_impl := capitalized_precursor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
Precursor[ \t\r\n]+	{
				last_token := E_PRECURSOR
				last_literal_impl := capitalized_precursor_keyword
				last_literal_start := 0
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
Precursor([ \t\r\n]|"--".*)+	{
				last_token := E_PRECURSOR
				last_literal_impl := capitalized_precursor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_precursor_keyword (Current)
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR]	{
				last_token := E_PRECURSOR
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR][ \t\r\n]+	{
				last_token := E_PRECURSOR
				last_literal_start := 1
				last_literal_end := 9
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_precursor_keyword (Current)
			}
[pP][rR][eE][cC][uU][rR][sS][oO][rR]([ \t\r\n]|"--".*)+	{
				last_token := E_PRECURSOR
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_precursor_keyword (Current)
			}
prefix		{
				last_token := E_PREFIX
				last_literal_impl := prefix_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_prefix_keyword (Current)
			}
prefix[ \t\r\n]+	{
				last_token := E_PREFIX
				last_literal_impl := prefix_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_prefix_keyword (Current)
			}
prefix([ \t\r\n]|"--".*)+	{
				last_token := E_PREFIX
				last_literal_impl := prefix_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_prefix_keyword (Current)
			}
[pP][rR][eE][fF][iI][xX]	{
				last_token := E_PREFIX
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_prefix_keyword (Current)
			}
[pP][rR][eE][fF][iI][xX][ \t\r\n]+	{
				last_token := E_PREFIX
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_prefix_keyword (Current)
			}
[pP][rR][eE][fF][iI][xX]([ \t\r\n]|"--".*)+	{
				last_token := E_PREFIX
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_prefix_keyword (Current)
			}
redefine	{
				last_token := E_REDEFINE
				last_literal_impl := redefine_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_redefine_keyword (Current)
			}
redefine[ \t\r\n]+	{
				last_token := E_REDEFINE
				last_literal_impl := redefine_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_redefine_keyword (Current)
			}
redefine([ \t\r\n]|"--".*)+	{
				last_token := E_REDEFINE
				last_literal_impl := redefine_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_redefine_keyword (Current)
			}
[rR][eE][dD][eE][fF][iI][nN][eE]	{
				last_token := E_REDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_redefine_keyword (Current)
			}
[rR][eE][dD][eE][fF][iI][nN][eE][ \t\r\n]+	{
				last_token := E_REDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_redefine_keyword (Current)
			}
[rR][eE][dD][eE][fF][iI][nN][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_REDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_redefine_keyword (Current)
			}
reference	{
				last_literal_impl := reference_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
reference[ \t\r\n]+	{
				last_literal_impl := reference_keyword
				last_literal_start := 0
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
reference([ \t\r\n]|"--".*)+	{
				last_literal_impl := reference_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE]	{
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_end := 0
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE][ \t\r\n]+	{
				last_literal_start := 1
				last_literal_end := 9
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
[rR][eE][fF][eE][rR][eE][nN][cC][eE]([ \t\r\n]|"--".*)+	{
				last_literal_start := 1
				last_literal_end := 9
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				if use_reference_keyword then
					last_token := E_REFERENCE
					last_value := ast_factory.new_reference_keyword (Current)
				else
					last_token := E_IDENTIFIER
					last_value := ast_factory.new_identifier (Current)
				end
			}
rename		{
				last_token := E_RENAME
				last_literal_impl := rename_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_rename_keyword (Current)
			}
rename[ \t\r\n]+	{
				last_token := E_RENAME
				last_literal_impl := rename_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_rename_keyword (Current)
			}
rename([ \t\r\n]|"--".*)+	{
				last_token := E_RENAME
				last_literal_impl := rename_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_rename_keyword (Current)
			}
[rR][eE][nN][aA][mM][eE]	{
				last_token := E_RENAME
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_rename_keyword (Current)
			}
[rR][eE][nN][aA][mM][eE][ \t\r\n]+	{
				last_token := E_RENAME
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_rename_keyword (Current)
			}
[rR][eE][nN][aA][mM][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_RENAME
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_rename_keyword (Current)
			}
require		{
				last_token := E_REQUIRE
				last_literal_impl := require_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_require_keyword (Current)
			}
require[ \t\r\n]+	{
				last_token := E_REQUIRE
				last_literal_impl := require_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_require_keyword (Current)
			}
require([ \t\r\n]|"--".*)+	{
				last_token := E_REQUIRE
				last_literal_impl := require_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_require_keyword (Current)
			}
[rR][eE][qQ][uU][iI][rR][eE]	{
				last_token := E_REQUIRE
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_require_keyword (Current)
			}
[rR][eE][qQ][uU][iI][rR][eE][ \t\r\n]+	{
				last_token := E_REQUIRE
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_require_keyword (Current)
			}
[rR][eE][qQ][uU][iI][rR][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_REQUIRE
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_require_keyword (Current)
			}
rescue		{
				last_token := E_RESCUE
				last_literal_impl := rescue_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_rescue_keyword (Current)
			}
rescue[ \t\r\n]+	{
				last_token := E_RESCUE
				last_literal_impl := rescue_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_rescue_keyword (Current)
			}
rescue([ \t\r\n]|"--".*)+	{
				last_token := E_RESCUE
				last_literal_impl := rescue_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_rescue_keyword (Current)
			}
[rR][eE][sS][cC][uU][eE]	{
				last_token := E_RESCUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_rescue_keyword (Current)
			}
[rR][eE][sS][cC][uU][eE][ \t\r\n]+	{
				last_token := E_RESCUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_rescue_keyword (Current)
			}
[rR][eE][sS][cC][uU][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_RESCUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_rescue_keyword (Current)
			}
result		{
				last_token := E_RESULT
				last_literal_impl := result_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
result[ \t\r\n]+	{
				last_token := E_RESULT
				last_literal_impl := result_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
result([ \t\r\n]|"--".*)+	{
				last_token := E_RESULT
				last_literal_impl := result_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_result_keyword (Current)
			}
Result		{
				last_token := E_RESULT
				last_literal_impl := capitalized_result_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
Result[ \t\r\n]+	{
				last_token := E_RESULT
				last_literal_impl := capitalized_result_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
Result([ \t\r\n]|"--".*)+	{
				last_token := E_RESULT
				last_literal_impl := capitalized_result_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_result_keyword (Current)
			}
[rR][eE][sS][uU][lL][tT]	{
				last_token := E_RESULT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
[rR][eE][sS][uU][lL][tT][ \t\r\n]+	{
				last_token := E_RESULT
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_result_keyword (Current)
			}
[rR][eE][sS][uU][lL][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_RESULT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_result_keyword (Current)
			}
retry		{
				last_token := E_RETRY
				last_literal_impl := retry_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_retry_keyword (Current)
			}
retry[ \t\r\n]+	{
				last_token := E_RETRY
				last_literal_impl := retry_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_retry_keyword (Current)
			}
retry([ \t\r\n]|"--".*)+	{
				last_token := E_RETRY
				last_literal_impl := retry_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_retry_keyword (Current)
			}
[rR][eE][tT][rR][yY]	{
				last_token := E_RETRY
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_retry_keyword (Current)
			}
[rR][eE][tT][rR][yY][ \t\r\n]+	{
				last_token := E_RETRY
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_retry_keyword (Current)
			}
[rR][eE][tT][rR][yY]([ \t\r\n]|"--".*)+	{
				last_token := E_RETRY
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_retry_keyword (Current)
			}
select		{
				last_token := E_SELECT
				last_literal_impl := select_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_select_keyword (Current)
			}
select[ \t\r\n]+	{
				last_token := E_SELECT
				last_literal_impl := select_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_select_keyword (Current)
			}
select([ \t\r\n]|"--".*)+	{
				last_token := E_SELECT
				last_literal_impl := select_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_select_keyword (Current)
			}
[sS][eE][lL][eE][cC][tT]	{
				last_token := E_SELECT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_select_keyword (Current)
			}
[sS][eE][lL][eE][cC][tT][ \t\r\n]+	{
				last_token := E_SELECT
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_select_keyword (Current)
			}
[sS][eE][lL][eE][cC][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_SELECT
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_select_keyword (Current)
			}
separate	{
				last_token := E_SEPARATE
				last_literal_impl := separate_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_separate_keyword (Current)
			}
separate[ \t\r\n]+	{
				last_token := E_SEPARATE
				last_literal_impl := separate_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_separate_keyword (Current)
			}
separate([ \t\r\n]|"--".*)+	{
				last_token := E_SEPARATE
				last_literal_impl := separate_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_separate_keyword (Current)
			}
[sS][eE][pP][aA][rR][aA][tT][eE]	{
				last_token := E_SEPARATE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_separate_keyword (Current)
			}
[sS][eE][pP][aA][rR][aA][tT][eE][ \t\r\n]+	{
				last_token := E_SEPARATE
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_separate_keyword (Current)
			}
[sS][eE][pP][aA][rR][aA][tT][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_SEPARATE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_separate_keyword (Current)
			}
strip		{
				last_token := E_STRIP
				last_literal_impl := strip_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_strip_keyword (Current)
			}
strip[ \t\r\n]+	{
				last_token := E_STRIP
				last_literal_impl := strip_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_strip_keyword (Current)
			}
strip([ \t\r\n]|"--".*)+	{
				last_token := E_STRIP
				last_literal_impl := strip_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_strip_keyword (Current)
			}
[sS][tT][rR][iI][pP]	{
				last_token := E_STRIP
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_strip_keyword (Current)
			}
[sS][tT][rR][iI][pP][ \t\r\n]+	{
				last_token := E_STRIP
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_strip_keyword (Current)
			}
[sS][tT][rR][iI][pP]([ \t\r\n]|"--".*)+	{
				last_token := E_STRIP
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_strip_keyword (Current)
			}
then		{
				last_token := E_THEN
				last_literal_impl := then_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_then_keyword (Current)
			}
then[ \t\r\n]+	{
				last_token := E_THEN
				last_literal_impl := then_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_then_keyword (Current)
			}
then([ \t\r\n]|"--".*)+	{
				last_token := E_THEN
				last_literal_impl := then_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_then_keyword (Current)
			}
[tT][hH][eE][nN]	{
				last_token := E_THEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_then_keyword (Current)
			}
[tT][hH][eE][nN][ \t\r\n]+	{
				last_token := E_THEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_then_keyword (Current)
			}
[tT][hH][eE][nN]([ \t\r\n]|"--".*)+	{
				last_token := E_THEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_then_keyword (Current)
			}
true		{
				last_token := E_TRUE
				last_literal_impl := true_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
true[ \t\r\n]+	{
				last_token := E_TRUE
				last_literal_impl := true_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
true([ \t\r\n]|"--".*)+	{
				last_token := E_TRUE
				last_literal_impl := true_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_true_keyword (Current)
			}
True		{
				last_token := E_TRUE
				last_literal_impl := capitalized_true_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
True[ \t\r\n]+	{
				last_token := E_TRUE
				last_literal_impl := capitalized_true_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
True([ \t\r\n]|"--".*)+	{
				last_token := E_TRUE
				last_literal_impl := capitalized_true_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_true_keyword (Current)
			}
[tT][rR][uU][eE]	{
				last_token := E_TRUE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
[tT][rR][uU][eE][ \t\r\n]+	{
				last_token := E_TRUE
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_true_keyword (Current)
			}
[tT][rR][uU][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_TRUE
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_true_keyword (Current)
			}
undefine	{
				last_token := E_UNDEFINE
				last_literal_impl := undefine_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_undefine_keyword (Current)
			}
undefine[ \t\r\n]+	{
				last_token := E_UNDEFINE
				last_literal_impl := undefine_keyword
				last_literal_start := 0
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_undefine_keyword (Current)
			}
undefine([ \t\r\n]|"--".*)+	{
				last_token := E_UNDEFINE
				last_literal_impl := undefine_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_undefine_keyword (Current)
			}
[uU][nN][dD][eE][fF][iI][nN][eE]	{
				last_token := E_UNDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_undefine_keyword (Current)
			}
[uU][nN][dD][eE][fF][iI][nN][eE][ \t\r\n]+	{
				last_token := E_UNDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_start := 9
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_undefine_keyword (Current)
			}
[uU][nN][dD][eE][fF][iI][nN][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_UNDEFINE
				last_literal_start := 1
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 9
				last_comment_end := text_count
				last_value := ast_factory.new_undefine_keyword (Current)
			}
unique		{
				last_token := E_UNIQUE
				last_literal_impl := unique_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
unique[ \t\r\n]+	{
				last_token := E_UNIQUE
				last_literal_impl := unique_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
unique([ \t\r\n]|"--".*)+	{
				last_token := E_UNIQUE
				last_literal_impl := unique_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_unique_keyword (Current)
			}
Unique		{
				last_token := E_UNIQUE
				last_literal_impl := capitalized_unique_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
Unique[ \t\r\n]+	{
				last_token := E_UNIQUE
				last_literal_impl := capitalized_unique_keyword
				last_literal_start := 0
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
Unique([ \t\r\n]|"--".*)+	{
				last_token := E_UNIQUE
				last_literal_impl := capitalized_unique_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_unique_keyword (Current)
			}
[uU][nN][iI][qQ][uU][eE]	{
				last_token := E_UNIQUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
[uU][nN][iI][qQ][uU][eE][ \t\r\n]+	{
				last_token := E_UNIQUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_start := 7
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_unique_keyword (Current)
			}
[uU][nN][iI][qQ][uU][eE]([ \t\r\n]|"--".*)+	{
				last_token := E_UNIQUE
				last_literal_start := 1
				last_literal_end := 6
				last_break_end := 0
				last_comment_start := 7
				last_comment_end := text_count
				last_value := ast_factory.new_unique_keyword (Current)
			}
until		{
				last_token := E_UNTIL
				last_literal_impl := until_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_until_keyword (Current)
			}
until[ \t\r\n]+	{
				last_token := E_UNTIL
				last_literal_impl := until_keyword
				last_literal_start := 0
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_until_keyword (Current)
			}
until([ \t\r\n]|"--".*)+	{
				last_token := E_UNTIL
				last_literal_impl := until_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_until_keyword (Current)
			}
[uU][nN][tT][iI][lL]	{
				last_token := E_UNTIL
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_until_keyword (Current)
			}
[uU][nN][tT][iI][lL][ \t\r\n]+	{
				last_token := E_UNTIL
				last_literal_start := 1
				last_literal_end := 5
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_until_keyword (Current)
			}
[uU][nN][tT][iI][lL]([ \t\r\n]|"--".*)+	{
				last_token := E_UNTIL
				last_literal_start := 1
				last_literal_end := 5
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_until_keyword (Current)
			}
variant		{
				last_token := E_VARIANT
				last_literal_impl := variant_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_variant_keyword (Current)
			}
variant[ \t\r\n]+	{
				last_token := E_VARIANT
				last_literal_impl := variant_keyword
				last_literal_start := 0
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_variant_keyword (Current)
			}
variant([ \t\r\n]|"--".*)+	{
				last_token := E_VARIANT
				last_literal_impl := variant_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_variant_keyword (Current)
			}
[vV][aA][rR][iI][aA][nN][tT]	{
				last_token := E_VARIANT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_variant_keyword (Current)
			}
[vV][aA][rR][iI][aA][nN][tT][ \t\r\n]+	{
				last_token := E_VARIANT
				last_literal_start := 1
				last_literal_end := 7
				last_break_start := 8
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_variant_keyword (Current)
			}
[vV][aA][rR][iI][aA][nN][tT]([ \t\r\n]|"--".*)+	{
				last_token := E_VARIANT
				last_literal_start := 1
				last_literal_end := 7
				last_break_end := 0
				last_comment_start := 8
				last_comment_end := text_count
				last_value := ast_factory.new_variant_keyword (Current)
			}
when		{
				last_token := E_WHEN
				last_literal_impl := when_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_when_keyword (Current)
			}
when[ \t\r\n]+	{
				last_token := E_WHEN
				last_literal_impl := when_keyword
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_when_keyword (Current)
			}
when([ \t\r\n]|"--".*)+	{
				last_token := E_WHEN
				last_literal_impl := when_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_when_keyword (Current)
			}
[wW][hH][eE][nN]	{
				last_token := E_WHEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_when_keyword (Current)
			}
[wW][hH][eE][nN][ \t\r\n]+	{
				last_token := E_WHEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_when_keyword (Current)
			}
[wW][hH][eE][nN]([ \t\r\n]|"--".*)+	{
				last_token := E_WHEN
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_when_keyword (Current)
			}
xor			{
				last_token := E_XOR
				last_literal_impl := xor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_xor_keyword (Current)
			}
xor[ \t\r\n]+	{
				last_token := E_XOR
				last_literal_impl := xor_keyword
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_xor_keyword (Current)
			}
xor([ \t\r\n]|"--".*)+	{
				last_token := E_XOR
				last_literal_impl := xor_keyword
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_xor_keyword (Current)
			}
[xX][oO][rR]	{
				last_token := E_XOR
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_xor_keyword (Current)
			}
[xX][oO][rR][ \t\r\n]+	{
				last_token := E_XOR
				last_literal_start := 1
				last_literal_end := 3
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_xor_keyword (Current)
			}
[xX][oO][rR]([ \t\r\n]|"--".*)+	{
				last_token := E_XOR
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_xor_keyword (Current)
			}


----------/** Eiffel identifiers **/--------------------------------------------

[bB][iI][tT]	{
				last_token := E_BITTYPE
				last_literal_start := 1
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
			}
[bB][iI][tT]/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (BITTYPE_BREAK)
			}
<BITTYPE_BREAK>{
	[ \t\r\n]+	{
				last_token := E_BITTYPE
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_BITTYPE
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_BITTYPE
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_BITTYPE
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
}

[a-zA-Z][a-zA-Z0-9_]*	{
				last_token := E_IDENTIFIER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
			}
[a-zA-Z][a-zA-Z0-9_]*/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (IDENTIFIER_BREAK)
			}
<IDENTIFIER_BREAK>{
	[ \t\r\n]+	{
				last_token := E_IDENTIFIER
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_IDENTIFIER
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_IDENTIFIER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_IDENTIFIER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_identifier (Current)
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel free operators **/-----------------------------------------

		-- Note: Accepts non-printable characters as well,
		-- provided that they are not break characters.

[@#|&][^%" \t\r\n]*	{
				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_free_operator (Current)
			}
[@#|&][^%" \t\r\n]*/[ \t\r\n]	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (FREEOP_BREAK)
			}
<FREEOP_BREAK>{
	[ \t\r\n]+	{
				last_token := E_FREEOP
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_free_operator (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_FREEOP
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_free_operator (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_FREEOP
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_free_operator (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_FREEOP
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_free_operator (Current)
				set_start_condition (INITIAL)
			}
}


----------/** Eiffel characters **/---------------------------------------------

\'[^%\n']\'	{
				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c1_character_constant (text_item (2), Current)
			}
\'[^%\n']\'[ \t\r\n]+	{
				last_token := E_CHARACTER
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_c1_character_constant (text_item (2), Current)
			}
\'[^%\n']\'([ \t\r\n]|"--".*)+	{
				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_c1_character_constant (text_item (2), Current)
			}
\'\'\'		{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)
				column := column - 1

				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c1_character_constant ('%'', Current)
			}
\'\'\'[ \t\r\n]+	{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)
				column := column - 1

				last_token := E_CHARACTER
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_c1_character_constant ('%'', Current)
			}
\'\'\'([ \t\r\n]|"--".*)+	{
					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
				column := column + 1
				error_handler.report_SCTQ_error (current_position)
				column := column - 1

				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_c1_character_constant ('%'', Current)
			}

\'%A\'						process_c2_character_constant ('%A')
\'%A\'[ \t\r\n]+			process_c2_character_constant_break ('%A')
\'%A\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%A')
\'%B\'						process_c2_character_constant ('%B')
\'%B\'[ \t\r\n]+			process_c2_character_constant_break ('%B')
\'%B\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%B')
\'%C\'						process_c2_character_constant ('%C')
\'%C\'[ \t\r\n]+			process_c2_character_constant_break ('%C')
\'%C\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%C')
\'%D\'						process_c2_character_constant ('%D')
\'%D\'[ \t\r\n]+			process_c2_character_constant_break ('%D')
\'%D\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%D')
\'%F\'						process_c2_character_constant ('%F')
\'%F\'[ \t\r\n]+			process_c2_character_constant_break ('%F')
\'%F\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%F')
\'%H\'						process_c2_character_constant ('%H')
\'%H\'[ \t\r\n]+			process_c2_character_constant_break ('%H')
\'%H\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%H')
\'%L\'						process_c2_character_constant ('%L')
\'%L\'[ \t\r\n]+			process_c2_character_constant_break ('%L')
\'%L\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%L')
\'%N\'						process_c2_character_constant ('%N')
\'%N\'[ \t\r\n]+			process_c2_character_constant_break ('%N')
\'%N\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%N')
\'%Q\'						process_c2_character_constant ('%Q')
\'%Q\'[ \t\r\n]+			process_c2_character_constant_break ('%Q')
\'%Q\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%Q')
\'%R\'						process_c2_character_constant ('%R')
\'%R\'[ \t\r\n]+			process_c2_character_constant_break ('%R')
\'%R\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%R')
\'%S\'						process_c2_character_constant ('%S')
\'%S\'[ \t\r\n]+			process_c2_character_constant_break ('%S')
\'%S\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%S')
\'%T\'						process_c2_character_constant ('%T')
\'%T\'[ \t\r\n]+			process_c2_character_constant_break ('%T')
\'%T\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%T')
\'%U\'						process_c2_character_constant ('%U')
\'%U\'[ \t\r\n]+			process_c2_character_constant_break ('%U')
\'%U\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%U')
\'%V\'						process_c2_character_constant ('%V')
\'%V\'[ \t\r\n]+			process_c2_character_constant_break ('%V')
\'%V\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%V')
\'%%\'						process_c2_character_constant ('%%')
\'%%\'[ \t\r\n]+			process_c2_character_constant_break ('%%')
\'%%\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%%')
\'%\'\'						process_c2_character_constant ('%'')
\'%\'\'[ \t\r\n]+			process_c2_character_constant_break ('%'')
\'%\'\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%'')
\'%\"\'						process_c2_character_constant ('%"')
\'%\"\'[ \t\r\n]+			process_c2_character_constant_break ('%"')
\'%\"\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%"')
\'%\(\'						process_c2_character_constant ('%(')
\'%\(\'[ \t\r\n]+			process_c2_character_constant_break ('%(')
\'%\(\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%(')
\'%\)\'						process_c2_character_constant ('%)')
\'%\)\'[ \t\r\n]+			process_c2_character_constant_break ('%)')
\'%\)\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%)')
\'%<\'						process_c2_character_constant ('%<')
\'%<\'[ \t\r\n]+			process_c2_character_constant_break ('%<')
\'%<\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%<')
\'%>\'						process_c2_character_constant ('%>')
\'%>\'[ \t\r\n]+			process_c2_character_constant_break ('%>')
\'%>\'([ \t\r\n]|"--".*)+	process_c2_character_constant_comment ('%>')

\'%\/[0-9]+\/\'	{
				last_token := E_CHARACTER
				last_literal_start := 4
				last_literal_end := text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c3_character_constant (Current)
			}
\'%\/[0-9]+\/\'/[ \t\r\n]	{
				last_literal_start := 4
				last_literal_end := text_count - 2
				more
				set_start_condition (CHARACTER_BREAK)
			}
<CHARACTER_BREAK>{
	[ \t\r\n]+	{
				last_token := E_CHARACTER
				last_break_start := last_literal_end + 3
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_c3_character_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_start := last_literal_end + 3
				last_comment_end := text_count
				last_value := ast_factory.new_c3_character_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c3_character_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c3_character_constant (Current)
				set_start_condition (INITIAL)
			}
}

\'%a\'						process_lower_case_c2_character_constant ('%A')
\'%a\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%A')
\'%a\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%A')
\'%b\'						process_lower_case_c2_character_constant ('%B')
\'%b\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%B')
\'%b\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%B')
\'%c\'						process_lower_case_c2_character_constant ('%C')
\'%c\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%C')
\'%c\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%C')
\'%d\'						process_lower_case_c2_character_constant ('%D')
\'%d\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%D')
\'%d\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%D')
\'%f\'						process_lower_case_c2_character_constant ('%F')
\'%f\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%F')
\'%f\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%F')
\'%h\'						process_lower_case_c2_character_constant ('%H')
\'%h\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%H')
\'%h\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%H')
\'%l\'						process_lower_case_c2_character_constant ('%L')
\'%l\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%L')
\'%l\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%L')
\'%n\'						process_lower_case_c2_character_constant ('%N')
\'%n\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%N')
\'%n\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%N')
\'%q\'						process_lower_case_c2_character_constant ('%Q')
\'%q\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%Q')
\'%q\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%Q')
\'%r\'						process_lower_case_c2_character_constant ('%R')
\'%r\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%R')
\'%r\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%R')
\'%s\'						process_lower_case_c2_character_constant ('%S')
\'%s\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%S')
\'%s\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%S')
\'%t\'						process_lower_case_c2_character_constant ('%T')
\'%t\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%T')
\'%t\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%T')
\'%u\'						process_lower_case_c2_character_constant ('%U')
\'%u\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%U')
\'%u\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%U')
\'%v\'						process_lower_case_c2_character_constant ('%V')
\'%v\'[ \t\r\n]+			process_lower_case_c2_character_constant_break ('%V')
\'%v\'([ \t\r\n]|"--".*)+	process_lower_case_c2_character_constant_comment ('%V')

\'%.\'		{
					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)
				column := column - 2

				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_c2_character_constant (text_item (3), Current)
			}
\'%.\'[ \t\r\n]+	{
					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)
				column := column - 2

				last_token := E_CHARACTER
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_c2_character_constant (text_item (3), Current)
			}
\'%.\'([ \t\r\n]|"--".*)+	{
					-- Syntax error: invalid special character
					-- %l in character constant.
				column := column + 2
				error_handler.report_SCSC_error (current_position)
				column := column - 2

				last_token := E_CHARACTER
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_c2_character_constant (text_item (3), Current)
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
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\+\"[ \t\r\n]+	{
				last_token := E_STRPLUS
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\+\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRPLUS
				last_literal_impl := plus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"-\"		{
				last_token := E_STRMINUS
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"-\"[ \t\r\n]+	{
				last_token := E_STRMINUS
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"-\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRMINUS
				last_literal_impl := minus_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\*\"		{
				last_token := E_STRSTAR
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\*\"[ \t\r\n]+	{
				last_token := E_STRSTAR
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\*\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRSTAR
				last_literal_impl := times_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\"		{
				last_token := E_STRSLASH
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\"[ \t\r\n]+	{
				last_token := E_STRSLASH
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRSLASH
				last_literal_impl := divide_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\/\"	{
				last_token := E_STRDIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\/\"[ \t\r\n]+	{
				last_token := E_STRDIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\/\/\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRDIV
				last_literal_impl := div_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\\\\\"	{
				last_token := E_STRMOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\\\\\"[ \t\r\n]+	{
				last_token := E_STRMOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"\\\\\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRMOD
				last_literal_impl := mod_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"^\"		{
				last_token := E_STRPOWER
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"^\"[ \t\r\n]+	{
				last_token := E_STRPOWER
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"^\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRPOWER
				last_literal_impl := power_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<\"		{
				last_token := E_STRLT
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<\"[ \t\r\n]+	{
				last_token := E_STRLT
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRLT
				last_literal_impl := lt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<=\"		{
				last_token := E_STRLE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<=\"[ \t\r\n]+	{
				last_token := E_STRLE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"<=\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRLE
				last_literal_impl := le_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">\"		{
				last_token := E_STRGT
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">\"[ \t\r\n]+	{
				last_token := E_STRGT
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_start := 4
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRGT
				last_literal_impl := gt_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 4
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">=\"		{
				last_token := E_STRGE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">=\"[ \t\r\n]+	{
				last_token := E_STRGE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\">=\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRGE
				last_literal_impl := ge_symbol
				last_literal_start := 0
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[nN][oO][tT]\"	{
				last_token := E_STRNOT
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[nN][oO][tT]\"[ \t\r\n]+	{
				last_token := E_STRNOT
				last_literal_start := 2
				last_literal_end := 4
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[nN][oO][tT]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRNOT
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\"	{
				last_token := E_STRAND
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\"[ \t\r\n]+	{
				last_token := E_STRAND
				last_literal_start := 2
				last_literal_end := 4
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRAND
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\"	{
				last_token := E_STROR
				last_literal_start := 2
				last_literal_end := 3
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\"[ \t\r\n]+	{
				last_token := E_STROR
				last_literal_start := 2
				last_literal_end := 3
				last_break_start := 5
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STROR
				last_literal_start := 2
				last_literal_end := 3
				last_break_end := 0
				last_comment_start := 5
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[xX][oO][rR]\"	{
				last_token := E_STRXOR
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[xX][oO][rR]\"[ \t\r\n]+	{
				last_token := E_STRXOR
				last_literal_start := 2
				last_literal_end := 4
				last_break_start := 6
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[xX][oO][rR]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRXOR
				last_literal_start := 2
				last_literal_end := 4
				last_break_end := 0
				last_comment_start := 6
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"	{
				last_token := E_STRANDTHEN
				last_literal_start := 2
				last_literal_end := 9
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"[ \t\r\n]+	{
				last_token := E_STRANDTHEN
				last_literal_start := 2
				last_literal_end := 9
				last_break_start := 11
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRANDTHEN
				last_literal_start := 2
				last_literal_end := 9
				last_break_end := 0
				last_comment_start := 11
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"	{
				last_token := E_STRORELSE
				last_literal_start := 2
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"[ \t\r\n]+	{
				last_token := E_STRORELSE
				last_literal_start := 2
				last_literal_end := 8
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[oO][rR]\ [eE][lL][sS][eE]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRORELSE
				last_literal_start := 2
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"	{
				last_token := E_STRIMPLIES
				last_literal_start := 2
				last_literal_end := 8
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"[ \t\r\n]+	{
				last_token := E_STRIMPLIES
				last_literal_start := 2
				last_literal_end := 8
				last_break_start := 10
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[iI][mM][pP][lL][iI][eE][sS]\"([ \t\r\n]|"--".*)+	{
				last_token := E_STRIMPLIES
				last_literal_start := 2
				last_literal_end := 8
				last_break_end := 0
				last_comment_start := 10
				last_comment_end := text_count
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[@#|&][^%" \t\r\n]*\"	{
				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[@#|&][^%" \t\r\n]*\"/([ \t\r\n]|"--")	{
				last_string_kind := str_freeop
				last_literal_start := 2
				last_literal_end := text_count - 1
				more
				set_start_condition (STRING_BREAK)
			}

\"[^%\n"]*\"	{
					-- Regular manifest string.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_manifest_string (Current)
			}
\"[^%\n"]*\"/([ \t\r\n]|"--")	{
					-- Regular manifest string.
				last_string_kind := str_regular
				last_literal_start := 2
				last_literal_end := text_count - 1
				more
				set_start_condition (STRING_BREAK)
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
					last_literal_start := 1
					last_literal_end := vs_count
					last_break_end := 0
					last_comment_end := 0
					last_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (vs_count + 1, text_count - verbatim_marker.count - 2), Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			}
	[ \t\r]*\][^%\n"]*\"/([ \t\r\n]|"--") {
				if is_verbatim_string_closer (vs_count + 1, text_count - 1) then
					last_string_kind := str_verbatim
					last_literal_start := 1
					last_literal_end := vs_count
					verbatim_close_white_characters := text_substring (vs_count + 1, text_count - verbatim_marker.count - 2)
					vs_count := text_count
					more
					set_start_condition (STRING_BREAK)
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
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_special_manifest_string (Current)
			}
\"([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"/([ \t\r\n]|"--")	{
					-- Manifest string with special characters.
				last_string_kind := str_special
				last_literal_start := 2
				last_literal_end := text_count - 1
				more
				set_start_condition (STRING_BREAK)
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
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			}
	([^%\n"]|%([ABCDFHLNQRSTUV%'"()<>]|\/[0-9]+\/))*\"/([ \t\r\n]|"--")	{
				last_literal_start := 2
				last_literal_end := text_count - 1
				more
				set_start_condition (STRING_BREAK)
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

<STRING_BREAK>{
	[ \t\r\n]+	{
				last_break_end := text_count
				last_comment_end := 0
				inspect last_string_kind
				when str_freeop then
					last_token := E_STRFREEOP
					last_break_start := last_literal_end + 2
					last_value := ast_factory.new_regular_manifest_string (Current)
				when str_special then
					last_token := E_STRING
					last_break_start := last_literal_end + 2
					last_value := ast_factory.new_special_manifest_string (Current)
				when str_verbatim then
					last_token := E_STRING
					last_break_start := vs_count + 1
					last_value := ast_factory.new_verbatim_string (verbatim_marker,
						verbatim_open_white_characters, verbatim_close_white_characters, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					verbatim_close_white_characters := Void
				else
					last_token := E_STRING
					last_break_start := last_literal_end + 2
					last_value := ast_factory.new_regular_manifest_string (Current)
				end
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_break_end := 0
				last_comment_end := text_count
				inspect last_string_kind
				when str_freeop then
					last_token := E_STRFREEOP
					last_comment_start := last_literal_end + 2
					last_value := ast_factory.new_regular_manifest_string (Current)
				when str_special then
					last_token := E_STRING
					last_comment_start := last_literal_end + 2
					last_value := ast_factory.new_special_manifest_string (Current)
				when str_verbatim then
					last_token := E_STRING
					last_comment_start := vs_count + 1
					last_value := ast_factory.new_verbatim_string (verbatim_marker,
						verbatim_open_white_characters, verbatim_close_white_characters, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					verbatim_close_white_characters := Void
				else
					last_token := E_STRING
					last_comment_start := last_literal_end + 2
					last_value := ast_factory.new_regular_manifest_string (Current)
				end
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				inspect last_string_kind
				when str_freeop then
					last_token := E_STRFREEOP
					last_value := ast_factory.new_regular_manifest_string (Current)
				when str_special then
					last_token := E_STRING
					last_value := ast_factory.new_special_manifest_string (Current)
				else
					last_token := E_STRING
					last_value := ast_factory.new_regular_manifest_string (Current)
				end
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				inspect last_string_kind
				when str_freeop then
					last_token := E_STRFREEOP
					last_value := ast_factory.new_regular_manifest_string (Current)
				when str_special then
					last_token := E_STRING
					last_value := ast_factory.new_special_manifest_string (Current)
				else
					last_token := E_STRING
					last_value := ast_factory.new_regular_manifest_string (Current)
				end
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
				last_value := ast_factory.new_bit_constant (Current)
			}
[0-1]+[bB]/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (BIT_BREAK)
			}
<BIT_BREAK>{
	[ \t\r\n]+	{
				last_token := E_BIT
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_bit_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_BIT
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_bit_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_BIT
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_bit_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_BIT
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_bit_constant (Current)
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
				last_value := ast_factory.new_regular_integer_constant (Current)
			}
[0-9]+/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (INTEGER_BREAK)
			}
<INTEGER_BREAK>{
	[ \t\r\n]+	{
				last_token := E_INTEGER
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_regular_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_integer_constant (Current)
				set_start_condition (INITIAL)
			}
}
[0-9]{1,3}(_[0-9]{3})+	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
			}
_(_*[0-9_]+_*)+	{
					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
			}
(_*[0-9]+_*)+	{
					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
			}
(_*[0-9]+_*)+/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (UINTEGER_BREAK)
			}
<UINTEGER_BREAK>{
	[ \t\r\n]+	{
				last_token := E_INTEGER
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_underscored_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_integer_constant (Current)
				set_start_condition (INITIAL)
			}
}
0x[0-9a-fA-F]+	{
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_hexadecimal_integer_constant (Current)
			}
0x[0-9a-fA-F]+/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (HINTEGER_BREAK)
			}
<HINTEGER_BREAK>{
	[ \t\r\n]+	{
				last_token := E_INTEGER
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_hexadecimal_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_hexadecimal_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_hexadecimal_integer_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_INTEGER
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_hexadecimal_integer_constant (Current)
				set_start_condition (INITIAL)
			}
}


---------/** Eiffel reals **/---------------------------------------------------

[0-9]+\./([ \t\r\n]|"--")	|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+/([ \t\r\n]|"--")	|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (REAL_BREAK)
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
				last_value := ast_factory.new_regular_real_constant (Current)
			}
<REAL_BREAK>{
	[ \t\r\n]+	{
				last_token := E_REAL
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_regular_real_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_REAL
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_regular_real_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_REAL
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_real_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_REAL
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_regular_real_constant (Current)
				set_start_condition (INITIAL)
			}
}
[0-9]{1,3}(_[0-9]{3})+\./([ \t\r\n]|"--")	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*/([ \t\r\n]|"--")	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?/([ \t\r\n]|"--")	{
				last_literal_start := 1
				last_literal_end := text_count
				more
				set_start_condition (UREAL_BREAK)
			}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]	|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_real_constant (Current)
			}
<UREAL_BREAK>{
	[ \t\r\n]+	{
				last_token := E_REAL
				last_break_start := last_literal_end + 1
				last_break_end := text_count
				last_comment_end := 0
				last_value := ast_factory.new_underscored_real_constant (Current)
				set_start_condition (INITIAL)
			}
	([ \t\r\n]|"--".*)+	{
				last_token := E_REAL
				last_break_end := 0
				last_comment_start := last_literal_end + 1
				last_comment_end := text_count
				last_value := ast_factory.new_underscored_real_constant (Current)
				set_start_condition (INITIAL)
			}
	.		{
					-- Should never happen.
				less (0)
				last_token := E_REAL
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_real_constant (Current)
				set_start_condition (INITIAL)
			}
	<<EOF>>	{
					-- Should never happen.
				last_token := E_REAL
				last_break_end := 0
				last_comment_end := 0
				last_value := ast_factory.new_underscored_real_constant (Current)
				set_start_condition (INITIAL)
			}
}


--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
				last_value := current_position
			}

--------------------------------------------------------------------------------
%%

end
