%{
indexing

	description:

		"Scanners for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

creation

	make
%}

%option ecs meta-ecs case-insensitive nodefault
%option outfile="pr_yacc_scanner.e"

%x SECTION2 SECTION3 EIFFEL_CODE EIFFEL_ACTION

C					"--".*
WS					[ \t\r]+
NL					\n
ESC					\\(.|[0-7]{1,3}|x[0-9a-f]{1,2})

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
						set_start_condition (EIFFEL_CODE)
					}
	"%{"{WS}?		{
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
						last_value := text
					}
	[bB][oO][oO][lL][eE][aA][nN]	{
						last_token := T_BOOLEAN
						last_value := text
					}
	[rR][eE][aA][lL]	{
						last_token := T_REAL
						last_value := text
					}
	[dD][oO][uU][bB][lL][eE]	{
						last_token := T_DOUBLE
						last_value := text
					}
	[cC][hH][aA][rR][aA][cC][tT][eE][rR]	{
						last_token := T_CHARACTER
						last_value := text
					}
	[pP][oO][iI][nN][tT][eE][rR]	{
						last_token := T_POINTER
						last_value := text
					}
	[lL][iI][kK][eE]	{
						last_token := T_LIKE
						last_value := text
					}
	[a-z][a-z0-9_]*	{
						last_token := T_IDENTIFIER
						last_value := text
					}
	[0-9]+			{
						last_token := T_NUMBER
						last_value := text.to_integer
						if last_value.is_equal (0) then
							report_null_integer_error
						end
					}
	\'([^'\\\n]|{ESC})\'	{
						last_token := T_CHAR
						last_value := text
					}
	\"[^"\n]*\"		{
						last_token := T_STR
						last_value := text
						if text_count < 4 then
							report_invalid_string_token_error (text)
						end
					}
}

<SECTION2>{
	"%prec"				last_token := T_PREC
	":"				{
						last_token := Colon_code
						last_value := line_nb
					}
	"|"				{
						last_token := Bar_code
						last_value := line_nb
					}
	";"					last_token := Semicolon_code
	"{"{WS}?{NL}	{
						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					}
	"{"{WS}?		{
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
						last_value := text
					}
}

<EIFFEL_CODE>{
	[^"'%\n-]*										more
	["%]([^"%\n]|%([^/\n\r]|("/"[0-9]+"/")))*["%]	more
	\'([^'%\n]|%([^/\n]|("/"[0-9]+"/")))\'			more
	"--".*											more
	\"|\'|%|-										more
	\n			{
					line_nb := line_nb + 1
					more
				}
	"%}"		{
					last_token := T_EIFFEL
					last_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				}
	<<EOF>>		{
					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_value := text_substring (1, text_count)
					set_start_condition (INITIAL)
				}
}

<EIFFEL_ACTION>{
	[^$"'%{}\n-]*									|
	["%]([^"%\n]|%([^/\n\r]|("/"[0-9]+"/")))*["%]	|
	\'([^'%\n]|%([^/\n]|("/"[0-9]+"/")))\'			|
	"--".*											|
	\"|\'|%|-|\$	{
					action_buffer.append_string (text)
				}
	\n+			{
					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				}
	"$$"		{
					process_dollar_dollar (rule)
				}
	\$[0-9]+	{
					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer, rule)
				}
	\$\-[0-9]+	{
					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer, rule)
				}
	"{"			{
					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				}
	"}"			{
					if nb_open_brackets = 0 then
						last_token := T_ACTION
						last_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						action_buffer.append_character ('}')
						nb_open_brackets := nb_open_brackets - 1
					end
				}
	<<EOF>>		{
					report_missing_characters_error ("}")
					last_token := T_ACTION
					last_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				}
}

<*>.|\n			{
					last_token := text_item (1).code
				}

%%

end -- class PR_YACC_SCANNER
