%{
note

	description:

		"Scanners for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_WILDCARD_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

create

	make, make_from_description
%}

%x QUOTE FIRSTCCL CCL

%option unicode ecs meta-ecs case-insensitive nodefault outfile="lx_wildcard_scanner.e"

WS					[ \t\r]+
NL					\n
BCHAR				\\([0-7]{1,3}|x[0-9a-f]{1,2})
UCHAR				\\u[0-9a-f]{1,6}|\\u\{[0-9a-f]{1,6}\}
ESC					\\.
FIRST_CCL_CHAR		[^\\\n]|{BCHAR}|{UCHAR}|{ESC}
CCL_CHAR			[^\\\n\]]|{BCHAR}|{UCHAR}|{ESC}

%%

<INITIAL>{
	\"			{
					last_token := Double_quote_code
					set_start_condition (QUOTE)
				}
	"["{FIRST_CCL_CHAR}{CCL_CHAR}*"]"	{
					check attached text as l_last_string then
						if unicode_mode.item then
							if unicode_character_classes.has (l_last_string) then
								last_token := UCCL_OP
								last_lx_unicode_character_class_value := unicode_character_classes.item (l_last_string)
							else
								last_token := UCCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						else
							if character_classes.has (l_last_string) then
								last_token := CCL_OP
								last_lx_symbol_class_value := character_classes.item (l_last_string)
							else
								last_token := CCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						end
					end
				}
	"*("			last_token := STAR_PAREN
	"**/"			last_token := STAR_STAR_SLASH
	[@|*+?()]	last_token := text_item (1).code
	.			{
					last_token := CHAR
					process_utf8_character
				}
}

<QUOTE>{
	[^"\n]		{
					last_token := CHAR
					process_utf8_character
				}
	\"			{
					last_token := Double_quote_code
					set_start_condition (INITIAL)
				}
	{NL}		{
					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (INITIAL)
				}
}

<QUOTE,INITIAL,CCL>{
	{ESC}		{
					last_token := CHAR
					process_escaped_character
				}
	{BCHAR}		{
					last_token := BCHAR
					process_byte_character
				}
	{UCHAR}		{
					last_token := UCHAR
					process_unicode_character
				}
}

<FIRSTCCL>{
	{ESC}		{
					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				}
	{BCHAR}		{
					last_token := BCHAR
					process_byte_character
					set_start_condition (CCL)
				}
	{UCHAR}		{
					last_token := UCHAR
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
					set_start_condition (INITIAL)
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
					set_start_condition (INITIAL)
				}
	{NL}		{
					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
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

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
