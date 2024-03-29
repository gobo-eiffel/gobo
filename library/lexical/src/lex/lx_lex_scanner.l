﻿%{
note

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_LEX_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description
%}

%x SECT2 SECT3 EIFFEL_BLOCK OPTION RECOVER1 SCNAME XSCNAME NUM QUOTE
%x SCOND ACTION_TEXT DEFINITION FIRSTCCL CCL OUTFILE
%x REGEXP EIFFEL_BLOCK2
%x EIFFEL_MSN EIFFEL_VS1 EIFFEL_VS2 EIFFEL_VS3

%option ecs meta-ecs case-insensitive nodefault
%option outfile="lx_lex_scanner.e"

C					"--".*
WS					[ \t\r]+
NL					\n
NAME				[a-z][a-z0-9_]*
OCHAR				\\[0-7]{1,3}
HCHAR				\\x[0-9a-f]{1,2}|\\x\{[0-9a-f]{1,6}\}
UCHAR				\\u[0-9a-f]{1,4}|\\u\{[0-9a-f]{1,6}\}
ESC					\\.
FIRST_CCL_CHAR		[^\\\n]|{OCHAR}|{HCHAR}|{UCHAR}|{ESC}
CCL_CHAR			[^\\\n\]]|{OCHAR}|{HCHAR}|{UCHAR}|{ESC}
EIFFEL_CHAR_CODE	[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*
EIFFEL_HORIZONTAL_BREAK	[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]

%%

--------------------------------------------------------------------------------
-- Section 1
--------------------------------------------------------------------------------

<INITIAL>{
	{WS}|{C}		 -- Separator or comment.
	{NL}			line_nb := line_nb + 1
	^"%{"{WS}?{C}?{NL}	{
					line_nb := line_nb + 1
					eiffel_text_count := 0
					set_start_condition (EIFFEL_BLOCK)
				}
	^"%s"			set_start_condition (SCNAME)
	^"%x"			set_start_condition (XSCNAME)
	^"%option"		set_start_condition (OPTION)
	^{NAME}		{
						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				}
	^"%%"		{
					last_token := ENDSECT
					set_start_condition (SECT2)
				}
	^"%"[a-z]*	{
					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				}
	.			{
					report_directive_expected_error
					set_start_condition (RECOVER1)
				}
}

<EIFFEL_BLOCK>{
	[^"'\-%\n]*		eiffel_more
	\n			{
					line_nb := line_nb + 1
					eiffel_more
				}
	%				eiffel_more
	^"%}"		{
					description.eiffel_header.force_last (utf8_text_substring (1, text_count - 2))
					set_start_condition (INITIAL)
				}
}

<SCNAME,XSCNAME>{
	{WS}|{C}		-- Separator or comment.
	{NAME}			add_new_start_condition (text, start_condition = XSCNAME)
	{NL}		{
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				}
	.			{
					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				}
}

<OPTION>{
	{WS}|{C}		-- Separator or comment.
	backup			description.set_backing_up_report (True)
	nobackup		description.set_backing_up_report (False)
	case-sensitive|nocase-insensitive	{
					description.set_case_insensitive (False)
				}
	case-insensitive|nocase-sensitive	{
					description.set_case_insensitive (True)
				}
	debug			description.set_debug_mode (True)
	nodebug			description.set_debug_mode (False)
	default			description.set_no_default_rule (False)
	nodefault		description.set_no_default_rule (True)
	ecs				description.set_equiv_classes_used (True)
	noecs			description.set_equiv_classes_used (False)
	full			description.set_full_table (True)
	nofull			description.set_full_table (False)
	meta-ecs		description.set_meta_equiv_classes_used (True)
	nometa-ecs		description.set_meta_equiv_classes_used (False)
	reject			description.set_reject_used (True)
	noreject		description.set_reject_used (False)
	line			description.set_line_used (True)
	noline			description.set_line_used (False)
	position		description.set_position_used (True)
	noposition		description.set_position_used (False)
	pre-action		description.set_pre_action_used (True)
	nopre-action	description.set_pre_action_used (False)
	post-action		description.set_post_action_used (True)
	nopost-action	description.set_post_action_used (False)
	pre-eof-action		description.set_pre_eof_action_used (True)
	nopre-eof-action	description.set_pre_eof_action_used (False)
	post-eof-action		description.set_post_eof_action_used (True)
	nopost-eof-action	description.set_post_eof_action_used (False)
	utf8		{
					description.set_utf8_mode (True)
				}
	warn		{
					description.set_no_warning (False)
				}
	nowarn		{
					description.set_no_warning (True)
				}
	outfile=		set_start_condition (OUTFILE)

	{NL}		{
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				}
	[-a-z0-9]+	{
					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			}
	.	{
					report_unrecognized_option_error (character_text)
					set_start_condition (RECOVER1)
			}
}

<OUTFILE>{
	\"([\x00-\xFF]{-}["\n])*\"		{
					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				}
	.			{
					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				}
}

<DEFINITION>{
	{WS}|{C}		-- Separates name and definition.
	[^ \t\n\r][^\n\r]*	{
					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, unicode_text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				}
	{NL}		{
					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				}
}

<RECOVER1>{
	.*			{
						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				}
	.*{NL}		{
						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				}
}


--------------------------------------------------------------------------------
-- Section 2
--------------------------------------------------------------------------------

<SECT2>{
	{WS}|{C}		-- Separator or comment.
	{NL}			line_nb := line_nb + 1
	^"%%"{WS}?{C}?	{
					last_token := ENDSECT
					set_start_condition (SECT3)
				}
	"^"			{
					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				}
	"{"				last_token := Left_brace_code
	"}"				last_token := Right_brace_code
	"<"			{
					last_token := Less_than_code
					set_start_condition (SCOND)
				}
	"{"{NAME}"}"|"<<"|.		{
					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
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
	"{"{NAME}"}"	{
					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				}
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
	"["			{
					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				}
	"<<EOF>>"		last_token := EOF_OP
	[/|*+?.()]		last_token := text_item (1).code
	{WS}		{
					set_start_condition (ACTION_TEXT)
				}
	{NL}		{
					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				}
	.			{
					last_token := CHAR
					process_single_character
				}
}

<SCOND>{
	{WS}|{C}		-- Separator or comment.
	{NL}			line_nb := line_nb + 1
	","				last_token := Comma_code
	"*"				last_token := Star_code
	">"			{
					last_token := Greater_than_code
					set_start_condition (SECT2)
				}
	{NAME}		{
					last_token := NAME
					last_string_value := text
				}
	.		{
					report_bad_start_condition_error (character_text)
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

<ACTION_TEXT>{
	"|".*		{
					last_token := PIPED
					set_start_condition (SECT2)
				}
	{NL}		{
					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				}
	"{"			{
					eiffel_text_count := 0
					set_start_condition (EIFFEL_BLOCK2)
				}
	[^{\n].*	{
					last_token := EIF_CODE
					last_string_value := utf8_text
					set_start_condition (SECT2)
				}
}

<EIFFEL_BLOCK2>{
	[^"'\-{}\n]*	eiffel_more
	\n			{
					line_nb := line_nb + 1
					eiffel_more
				}
	"{"			{
					nb_open_brackets := nb_open_brackets + 1
					eiffel_more
				}
	"}"			{
					if nb_open_brackets = 0 then
						last_token := EIF_CODE
						last_string_value := utf8_text_substring (1, text_count - 1)
						set_start_condition (SECT2)
					else
						nb_open_brackets := nb_open_brackets - 1
						eiffel_more
					end
				}
}

<EIFFEL_BLOCK,EIFFEL_BLOCK2>{
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

--------------------------------------------------------------------------------
-- Section 3
--------------------------------------------------------------------------------

<SECT3>(.|\n)+	{
					last_token := EIF_CODE
					last_string_value := utf8_text
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

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32
			
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
