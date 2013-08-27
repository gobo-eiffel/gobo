%{
note

	description:

		"Scanners for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value
		end

	LX_WILDCARD_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value
		end

create

	make, make_from_description
%}

%x QUOTE FIRSTCCL CCL

%option ecs meta-ecs case-insensitive nodefault outfile="lx_wildcard_scanner.e"

WS					[ \t\r]+
NL					\n
ESC					\\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
FIRST_CCL_CHAR		[^\\\n]|{ESC}
CCL_CHAR			[^\\\n\]]|{ESC}

%%

<INITIAL>{
	\"			{
					last_token := Double_quote_code
					set_start_condition (QUOTE)
				}
	"["{FIRST_CCL_CHAR}{CCL_CHAR}*"]"	{
					check attached text as l_last_string then
						if character_classes.has (l_last_string) then
							last_token := CCL_OP
							last_lx_symbol_class_value := character_classes.item (l_last_string)
						else
							last_token := Left_bracket_code
							last_string_value := l_last_string
							less (1)
							set_start_condition (FIRSTCCL)
						end
					end
				}
	"*("			last_token := STAR_PAREN
	"**/"			last_token := STAR_STAR_SLASH
	[@|*+?()]	last_token := text_item (1).code
	.			{
					last_token := CHAR
					process_character (text_item (1).code)
				}
}

<QUOTE>{
	[^"\n]		{
					process_character (text_item (1).code)
					last_token := CHAR
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

<QUOTE,INITIAL,CCL,FIRSTCCL>{ESC}	{
					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				}

<FIRSTCCL>{
	"^"/[^-\]]	{
					set_start_condition (CCL)
					last_token := Caret_code
				}
	"^"/[-\]]		last_token := Caret_code
	.			{
					last_token := CHAR
					process_character (text_item (1).code)
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
					process_character (text_item (1).code)
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

<*>.|\n			{
					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (text)
					end
				}

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

end
