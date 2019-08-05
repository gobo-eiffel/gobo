%{
note

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

	LX_LEX_TOKENS
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

%x SECT2 SECT3 EIFFEL_BLOCK OPTION RECOVER1 SCNAME XSCNAME NUM QUOTE
%x SCOND ACTION_TEXT DEFINITION FIRSTCCL CCL OUTFILE
%x REGEXP EIFFEL_BLOCK2

%option utf8 ecs meta-ecs case-insensitive nodefault
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

%%

--------------------------------------------------------------------------------
-- Section 1
--------------------------------------------------------------------------------

<INITIAL>{
	{WS}|{C}		 -- Separator or comment.
	{NL}			line_nb := line_nb + 1
	^"%{"{WS}?{C}?{NL}	{
					line_nb := line_nb + 1
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
	(b:.)		{
					report_directive_expected_error
					set_start_condition (RECOVER1)
				}
}

<EIFFEL_BLOCK>{
	[^"'%-]*												more
	\"([^"%\n]|%([^/\n]|("/"[0-9]+"/")|(\n[ \t]%)))*\"		more
	\'([^'%\n]|%([^/\n]|("/"[0-9]+"/")))\'					more
	"--".*													more
	\"|\'|%|-												more
	^"%}"		{
					check attached text_substring (1, text_count - 2) as l_last_string then
						line_nb := line_nb + l_last_string.occurrences ('%N')
						description.eiffel_header.force_last (l_last_string)
						set_start_condition (INITIAL)
					end
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

-- Not implemented yet:
--	fast			fast_table := True
--	nofast			fast_table := False
--	perf-report					;
--	noperf-report				;
--	verbose						;
--	noverbose					;

	{NL}		{
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				}
	[-a-z0-9]+|(b:.)	{
					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			}
}

<OUTFILE>{
	\"[^"\n]*\"		{
					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				}
	(b:.)		{
					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				}
}

<DEFINITION>{
	{WS}|{C}		-- Separates name and definition.
	[^ \t\n\r][^\n\r]*	{
					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
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
	(b:.)*			{
						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				}
	(b:.)*{NL}		{
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
	"{"{NAME}"}"|"<<"|(b:.)		{
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
					process_utf8_character
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
	(b:.)		{
					report_bad_start_condition_error (text)
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
	"{"				set_start_condition (EIFFEL_BLOCK2)
	[^{\n].*	{
					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				}
}

<EIFFEL_BLOCK2>{
	[^"'{}-]*												more
	\"([^"%\n]|%([^/\n]|("/"[0-9]+"/")|(\n[ \t]%)))*\"		more
	\'([^'%\n]|%([^/\n]|("/"[0-9]+"/")))\'					more
	"--".*													more
	\"|\'|-													more
	"{"			{
					nb_open_brackets := nb_open_brackets + 1
					more
				}
	"}"			{
					if nb_open_brackets = 0 then
						check attached text_substring (1, text_count - 1) as l_last_string then
							last_token := EIF_CODE
							line_nb := line_nb + l_last_string.occurrences ('%N')
							last_string_value := l_last_string
							set_start_condition (SECT2)
						end
					else
						nb_open_brackets := nb_open_brackets - 1
						more
					end
				}
}

--------------------------------------------------------------------------------
-- Section 3
--------------------------------------------------------------------------------

<SECT3>(.|\n)+	{
					last_token := EIF_CODE
					last_string_value := text
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
