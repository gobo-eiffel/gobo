%{
note

	description:

		"Scanners for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

create

	make
%}

%option ecs meta-ecs case-insensitive nodefault
%option outfile="pr_yacc_scanner.e"

%x SECTION2 SECTION3 EIFFEL_CODE EIFFEL_ACTION
%x ERROR_SECTION ERROR_ACTION
%x EIFFEL_MSN EIFFEL_VS1 EIFFEL_VS2 EIFFEL_VS3

C					"--".*
WS					[ \t\r]+
NL					\n
ESC					\\(.|[0-7]{1,3}|[xu][0-9a-f]{1,6}|[xu]\{[0-9a-f]{1,6}\})
EIFFEL_CHAR_CODE	[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*
EIFFEL_HORIZONTAL_BREAK	[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]

%%

<INITIAL>{
	"%token"			last_token := T_TOKEN
	"%left"				last_token := T_LEFT
	"%right"			last_token := T_RIGHT
	"%nonassoc"			last_token := T_NONASSOC
	"%type"				last_token := T_TYPE
	"%start"			last_token := T_START
	"%expect"			last_token := T_EXPECT
	","					last_token := Comma_code
	"<"					last_token := Less_than_code
	">"					last_token := Greater_than_code
	"["					last_token := Left_bracket_code
	"]"					last_token := Right_bracket_code
	"%{"{WS}?{NL}	{
						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (EIFFEL_CODE)
					}
	"%{"{WS}?		{
						eiffel_text_count := 0
						set_start_condition (EIFFEL_CODE)
					}
	"%%"			{
						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					}
	"%"					last_token := T_UNKNOWN
}

<INITIAL,SECTION2>{
	{WS}|{C}			 -- Separator or comment.
	{NL}				line_nb := line_nb + 1

	[iI][nN][tT][eE][gG][eE][rR]	{
						last_token := T_INTEGER
						last_string_value := text
					}
	[iI][nN][tT][eE][gG][eE][rR]_8	{
						last_token := T_INTEGER_8
						last_string_value := text
					}
	[iI][nN][tT][eE][gG][eE][rR]_16	{
						last_token := T_INTEGER_16
						last_string_value := text
					}
	[iI][nN][tT][eE][gG][eE][rR]_32	{
						last_token := T_INTEGER_32
						last_string_value := text
					}
	[iI][nN][tT][eE][gG][eE][rR]_64	{
						last_token := T_INTEGER_64
						last_string_value := text
					}
	[nN][aA][tT][uU][rR][aA][lL]	{
						last_token := T_NATURAL
						last_string_value := text
					}
	[nN][aA][tT][uU][rR][aA][lL]_8	{
						last_token := T_NATURAL_8
						last_string_value := text
					}
	[nN][aA][tT][uU][rR][aA][lL]_16	{
						last_token := T_NATURAL_16
						last_string_value := text
					}
	[nN][aA][tT][uU][rR][aA][lL]_32	{
						last_token := T_NATURAL_32
						last_string_value := text
					}
	[nN][aA][tT][uU][rR][aA][lL]_64	{
						last_token := T_NATURAL_64
						last_string_value := text
					}
	[bB][oO][oO][lL][eE][aA][nN]	{
						last_token := T_BOOLEAN
						last_string_value := text
					}
	[rR][eE][aA][lL]	{
						last_token := T_REAL
						last_string_value := text
					}
	[rR][eE][aA][lL]_32	{
						last_token := T_REAL_32
						last_string_value := text
					}
	[rR][eE][aA][lL]_64	{
						last_token := T_REAL_64
						last_string_value := text
					}
	[dD][oO][uU][bB][lL][eE]	{
						last_token := T_DOUBLE
						last_string_value := text
					}
	[cC][hH][aA][rR][aA][cC][tT][eE][rR]	{
						last_token := T_CHARACTER
						last_string_value := text
					}
	[cC][hH][aA][rR][aA][cC][tT][eE][rR]_8	{
						last_token := T_CHARACTER_8
						last_string_value := text
					}
	[cC][hH][aA][rR][aA][cC][tT][eE][rR]_32	{
						last_token := T_CHARACTER_32
						last_string_value := text
					}
	[pP][oO][iI][nN][tT][eE][rR]	{
						last_token := T_POINTER
						last_string_value := text
					}
	[tT][uU][pP][lL][eE]	{
						last_token := T_TUPLE
						last_string_value := text
					}
	[lL][iI][kK][eE]	{
						last_token := T_LIKE
						last_string_value := text
					}
	[cC][uU][rR][rR][eE][nN][tT]	{
						last_token := T_CURRENT
						last_string_value := text
					}
	[eE][xX][pP][aA][nN][dD][eE][dD]	{
						last_token := T_EXPANDED
						last_string_value := text
					}
	[rR][eE][fF][eE][rR][eE][nN][cC][eE]	{
						last_token := T_REFERENCE
						last_string_value := text
					}
	[sS][eE][pP][aA][rR][aA][tT][eE]	{
						last_token := T_SEPARATE
						last_string_value := text
					}
	[aA][tT][tT][aA][cC][hH][eE][dD]	{
						last_token := T_ATTACHED
						last_string_value := text
					}
	[dD][eE][tT][aA][cC][hH][aA][bB][lL][eE]	{
						last_token := T_DETACHABLE
						last_string_value := text
					}
	[aA][sS]	{
						last_token := T_AS
						last_string_value := text
					}
	[a-z][a-z0-9_]*	{
						last_token := T_IDENTIFIER
						last_string_value := text
					}
	[0-9]+			{
						last_token := T_NUMBER
						last_integer_value := text.to_integer
						if last_integer_value = 0 then
							report_null_integer_error
						end
					}
	\'([^'\\\n]|{ESC})\'	{
						last_token := T_CHAR
						last_string_32_value := unicode_text
					}
	\"[^"\n]*\"		{
						last_token := T_STR
						last_string_value := utf8_text
						if text_count < 4 then
							report_invalid_string_token_error (utf8_text)
						end
					}
}

<SECTION2>{
	"%prec"				last_token := T_PREC
	"%error"		{
						last_token := T_ERROR
						last_integer_value := line_nb
						set_start_condition (ERROR_SECTION)
					}
	":"				{
						last_token := Colon_code
						last_integer_value := line_nb
					}
	"|"				{
						last_token := Bar_code
						last_integer_value := line_nb
					}
	";"					last_token := Semicolon_code
	"{"{WS}?{NL}	{
						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (EIFFEL_ACTION)
					}
	"{"{WS}?		{
						eiffel_text_count := 0
						set_start_condition (EIFFEL_ACTION)
					}
	"%%"			{
						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					}
}

<SECTION3>{
	(.|\n)+			{
						last_token := T_USER_CODE
						last_string_value := utf8_text
					}
}

<ERROR_SECTION>{
	{WS}|{C}			 -- Separator or comment.
	{NL}				line_nb := line_nb + 1

	"("					last_token := Left_parenthesis_code
	")"					last_token := Right_parenthesis_code
	[0-9]+			{
						last_token := T_NUMBER
						last_error := text.to_integer
						last_integer_value := last_error
					}
	"{"{WS}?{NL}	{
						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (ERROR_ACTION)
					}
	"{"{WS}?		{
						eiffel_text_count := 0
						set_start_condition (ERROR_ACTION)
					}
}

<EIFFEL_CODE>{
	[^"'\-%\n]*		eiffel_more
	\n			{
					line_nb := line_nb + 1
					eiffel_more
				}
	%				eiffel_more
	"%}"		{
					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				}
	<<EOF>>		{
					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count)
					set_start_condition (INITIAL)
				}
}

<EIFFEL_ACTION,ERROR_ACTION>{
	[^"'\-{}$\n]*	eiffel_more
	\n			{
					line_nb := line_nb + 1
					eiffel_more
				}
	"$"				eiffel_more

	"$$"		{
					append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
					eiffel_text_count := 0
					if start_condition = ERROR_ACTION then
						report_invalid_dollar_dollar_error
						action_buffer.append_string ("$$")
					elseif attached rule as l_rule then
						process_dollar_dollar (l_rule)
					else
						action_buffer.append_string ("$$")
					end
				}
	\$[0-9]+	{
					if attached text_substring (eiffel_text_count + 2, text_count) as l_text_substring then
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						if l_text_substring.is_integer then
							if attached rule as l_rule then
								if start_condition = ERROR_ACTION then
									process_dollar_n (l_text_substring.to_integer, last_error - 1, l_rule)
								else
									process_dollar_n (l_text_substring.to_integer, l_rule.rhs.count, l_rule)
								end
							else
								eiffel_more
							end
						else
							report_integer_too_large_error (l_text_substring)
							eiffel_more
						end
					else
						eiffel_more
					end
				}
	\$\-[0-9]+	{
					if attached text_substring (eiffel_text_count + 3, text_count) as l_text_substring then
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						if l_text_substring.is_integer then
							if attached rule as l_rule then
								if start_condition = ERROR_ACTION then
									process_dollar_n (- l_text_substring.to_integer, last_error - 1, l_rule)
								else
									process_dollar_n (- l_text_substring.to_integer, l_rule.rhs.count, l_rule)
								end
							else
								eiffel_more
							end
						else
							report_integer_too_large_error (l_text_substring)
							eiffel_more
						end
					else
						eiffel_more
					end
				}
	"{"			{
					nb_open_brackets := nb_open_brackets + 1
					eiffel_more
				}
	"}"			{
					if nb_open_brackets = 0 then
						last_token := T_ACTION
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						last_string_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						nb_open_brackets := nb_open_brackets - 1
						eiffel_more
					end
				}
	<<EOF>>		{
					report_missing_characters_error ("}")
					last_token := T_ACTION
					append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
					eiffel_text_count := 0
					last_string_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				}
}

<EIFFEL_CODE,EIFFEL_ACTION,ERROR_ACTION>{
	["'\-]															eiffel_more
	"--".*															eiffel_more
	\'([^%\n]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{EIFFEL_CHAR_CODE}\/)\'	eiffel_more
	\"([^%\n"]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{EIFFEL_CHAR_CODE}\/)*\"	eiffel_more
	\"([^%\n"]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{EIFFEL_CHAR_CODE}\/)*%{EIFFEL_HORIZONTAL_BREAK}*\n	{
						-- Multi-line manifest string.
					line_nb := line_nb + 1
					push_start_condition (EIFFEL_MSN)
					eiffel_more
				}
	\"[^\n"]*[{\[]/{EIFFEL_HORIZONTAL_BREAK}*\n {
						-- Verbatim string.
					eiffel_verbatim_marker := unicode_text_substring (eiffel_text_count + 2, text_count - 1)
					eiffel_verbatim_opening_character := unicode_text_item (text_count)
					push_start_condition (EIFFEL_VS1)
					eiffel_more
			}
}

<EIFFEL_MSN>{
	{EIFFEL_HORIZONTAL_BREAK}*%([^%\n"]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{EIFFEL_CHAR_CODE}\/)*\"	{
					pop_start_condition
					eiffel_more
				}
	{EIFFEL_HORIZONTAL_BREAK}*%([^%\n"]|%[ABCDFHLNQRSTUV%'"()<>]|%\/{EIFFEL_CHAR_CODE}\/)*%{EIFFEL_HORIZONTAL_BREAK}*\n	{
					line_nb := line_nb + 1
					eiffel_more
				}
	{EIFFEL_HORIZONTAL_BREAK}*\n	{
						-- Syntax error: empty line in middle of
						-- multi-line manifest string.
					line_nb := line_nb + 1
					eiffel_more
				}
	.			{
						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
					eiffel_more
				}
	<<EOF>>		{
						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
				}
}

<EIFFEL_VS1>{
		-- Discard space characters at the
		-- end of Verbatim_string_opener.
	{EIFFEL_HORIZONTAL_BREAK}*\n {
					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				}
	.			{
						-- Syntax error.
					pop_start_condition
					eiffel_more
				}
	<<EOF>>		{
						-- Syntax error.
					pop_start_condition
				}
}

<EIFFEL_VS2>{
	{EIFFEL_HORIZONTAL_BREAK}*[}\]][^\n"]*\" {
					if is_eiffel_verbatim_string_closer (eiffel_text_count + 1, text_count - 1) then
						eiffel_verbatim_marker := eiffel_no_verbatim_marker
						pop_start_condition
					else
						set_start_condition (EIFFEL_VS3)
					end
					eiffel_more
				}
	[^"\n]*\n	{
					line_nb := line_nb + 1
					eiffel_more
				}
	.			{
					set_start_condition (EIFFEL_VS3)
					eiffel_more
				}
	<<EOF>>		{
						-- Syntax error.
					pop_start_condition
				}
}

<EIFFEL_VS3>{
	.*\n		{
					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				}
	.			{
						-- Syntax error.
					pop_start_condition
					eiffel_more
				}
	<<EOF>>		{
						-- Syntax error.
					pop_start_condition
				}
}

<*>.|\n			{
					last_token := unicode_text_item (1).code.to_integer_32
				}

%%

end
