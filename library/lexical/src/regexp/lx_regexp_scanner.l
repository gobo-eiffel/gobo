%{
note

	description:

		"Scanners for regular expressions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class LX_REGEXP_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_REGEXP_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description
%}

%x NUM QUOTE FIRSTCCL CCL REGEXP

%option ecs meta-ecs case-insensitive nodefault outfile="lx_regexp_scanner.e"

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
	.			{
					less (0)
					set_start_condition (REGEXP)
				}
}

<REGEXP>{
	"(u:"		{
					if description.utf8_mode then
						last_token := UNICODE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				}
	"(b:"		{
					if description.utf8_mode then
						last_token := BYTE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
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
					last_string_32_value := unicode_text
					if attached character_class_with_name (last_string_32_value) as l_character_class then
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
					process_single_character
				}
}

<NUM>{
	{WS}			-- Separator.
	[0-9]+		{
					if attached text as l_text and then l_text.is_integer then
						last_token := NUMBER
						last_integer_value := l_text.to_integer
					else
						report_integer_too_large_error (text)
					end
				}
	","				last_token := Comma_code
	"}"			{
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
	.			{
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
					process_single_character
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
					process_single_character
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
					process_single_character
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
	.|\n		{
					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (character_text)
					end
				}
}

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32
			
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
