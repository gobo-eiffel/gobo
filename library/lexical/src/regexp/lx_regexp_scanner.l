%{
note

	description:

		"Scanners for regular expressions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_REGEXP_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

	LX_REGEXP_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description
%}

%x NUM QUOTE FIRSTCCL CCL REGEXP

%option utf8 ecs meta-ecs case-insensitive nodefault outfile="lx_regexp_scanner.e"

WS					[ \t\r]+
NL					\n
OCHAR				\\[0-7]{1,3}
HCHAR				\\x[0-9a-f]{1,2}|\\x\{[0-9a-f]{1,6}\}
UCHAR				\\u[0-9a-f]{1,4}|\\u\{[0-9a-f]{1,6}\}
ESC					\\.
FIRST_CCL_CHAR		[^\\\n]|{OCHAR}|{HCHAR}|{UCHAR}|{ESC}
CCL_CHAR			[^\\\n\]]|{OCHAR}|{HCHAR}|{UCHAR}|{ESC}

%%

<INITIAL>{
	"^"			{
					last_token := Caret_code
					set_start_condition (REGEXP)
				}
	(b:.)		{
					less (0)
					set_start_condition (REGEXP)
				}
}

<REGEXP>{
	"(u:"		{
					last_token := UNICODE_MODE_START
				}
	"(b:"		{
					last_token := BYTE_MODE_START
				}
	\"			{
					last_token := Double_quote_code
					set_start_condition (QUOTE)
				}
	"$"/[ \t\r\n]	last_token := Dollar_code
	"{"			{
					last_token := Left_brace_code
					set_start_condition (NUM)
				}
	"{+}"		{
					last_token := CCL_PLUS
				}
	"{-}"		{
					last_token := CCL_MINUS
				}
	"["{FIRST_CCL_CHAR}{CCL_CHAR}*"]"	{
					last_string_value := text
					if attached character_class_with_name (last_string_value) as l_character_class then
						last_token := CCL_OP
						last_lx_symbol_class_value := l_character_class
					else
						last_token := CCL_BRACKET
						less (1)
						set_start_condition (FIRSTCCL)
					end
				}
	[/|*+?.()]		last_token := text_item (1).code
	.			{
					last_token := CHAR
					process_utf8_character
				}
}

<NUM>{
	{WS}			-- Separator.
	[0-9]+		{
					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				}
	","				last_token := Comma_code
	"}"			{
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
	(b:.)		{
					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
	{NL}		{
					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
}

<QUOTE>{
	[^"\n]		{
					last_token := CHAR
					process_utf8_character
				}
	\"			{
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				}
	{NL}		{
					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				}
}

<QUOTE,REGEXP,CCL>{
	{ESC}		{
					last_token := CHAR
					process_escaped_character
				}
	{OCHAR}		{
					last_token := CHAR
					process_octal_character
				}
	{HCHAR}		{
					last_token := CHAR
					process_hexadecimal_character
				}
	{UCHAR}		{
					last_token := CHAR
					process_unicode_character
				}
}

<FIRSTCCL>{
	{ESC}		{
					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				}
	{OCHAR}		{
					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				}
	{HCHAR}		{
					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				}
	{UCHAR}		{
					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				}
	"^"/[^-\]]	{
					set_start_condition (CCL)
					last_token := Caret_code
				}
	"^"/[-\]]		last_token := Caret_code
	.			{
					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				}
	{NL}		{
					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				}
}

<CCL>{
	-/[^\]]			last_token := Minus_code
	[^\]\n]		{
					last_token := CHAR
					process_utf8_character
				}
	"]"			{
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				}
	{NL}		{
					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				}
}

<*>{
	(b:.)		{
					report_bad_character_error (text)
				}
	\n			{
					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				}
}

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
