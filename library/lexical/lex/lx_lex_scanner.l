%{
indexing

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		
	LX_LEX_TOKENS
		export
			{NONE} all
		end

creation

	make, make_from_description
%}

%x SECT2 SECT3 EIFFEL_BLOCK OPTION RECOVER1 SCNAME XSCNAME NUM QUOTE
%x SCOND ACTION_TEXT DEFINITION FIRSTCCL CCL OUTFILE
%x REGEXP EIFFEL_BLOCK2

%option ecs meta-ecs case-insensitive nodefault
%option outfile="lx_lex_scanner.e"

C					"--".*
WS					[ \t\r]+
NL					\n
NAME				[a-z][a-z0-9_]*
ESC					\\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
FIRST_CCL_CHAR		[^\\\n]|{ESC}
CCL_CHAR			[^\\\n\]]|{ESC}

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
	.			{
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
					last_string := text_substring (1, text_count - 2)
					line_nb := line_nb + last_string.occurrences ('%N')
					eiffel_header.force_last (last_string)
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
	backup			backing_up_report := True
	nobackup		backing_up_report := False
	case-sensitive|nocase-insensitive	{
					case_insensitive := False
				}
	case-insensitive|nocase-sensitive	{
					case_insensitive := True
				}
	debug			debug_mode := True
	nodebug			debug_mode := False
	default			no_default_rule := False
	nodefault		no_default_rule := True
	ecs				equiv_classes_used := True
	noecs			equiv_classes_used := False
	full			full_table := True
	nofull			full_table := False
	meta-ecs		meta_equiv_classes_used := True
	nometa-ecs		meta_equiv_classes_used := False
	reject			reject_used := True
	noreject		reject_used := False
	user-action		user_action_used := True
	nouser-action	user_action_used := False
	warn		{
					no_warning := False
				}
	nowarn		{
					no_warning := True
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
	[-a-z0-9]+|.	{
					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			}
}

<OUTFILE>{
	\"[^"\n]*\"		{
					output_filename := text_substring (2, text_count - 1)
					set_start_condition (OPTION)
				}
	.			{
					output_filename := Void
					report_missing_quote_error
					set_start_condition (RECOVER1)
				}
}

<DEFINITION>{
	{WS}|{C}		-- Separates name and definition.
	[^ \t\n\r][^\n\r]*	{
					check last_string_not_void: last_string /= Void end
					process_name_definition (last_string, text)
					set_start_condition (INITIAL)
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
	\"			{
					last_token := Double_quote_code
					set_start_condition (QUOTE)
				}
	"$"/[ \t\r\n]	last_token := Dollar_code
	"{"{NAME}"}"	{
					last_string := STRING_.to_lower (text)
					if name_definitions.has (last_string) then
						put_back_string (name_definitions.item (last_string))
					else
						report_undefined_definition_error (text)
					end
				}
	"{"			{
					last_token := Left_brace_code
					set_start_condition (NUM)
				}
	"["{FIRST_CCL_CHAR}{CCL_CHAR}*"]"	{
					last_string := text
					if character_classes.has (last_string) then
						last_token := CCL_OP
						last_value := character_classes.item (last_string)
					else
						last_token := Left_bracket_code
						last_value := last_string
						less (1)
						set_start_condition (FIRSTCCL)
					end
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
					process_character (text_item (1).code)
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
					last_value := text
				}
	.			{
					report_bad_start_condition_error (text)
				}
}

<NUM>{
	{WS}			-- Separator.
	[0-9]+		{
					last_token := NUMBER
					check is_integer: STRING_.is_integer (text) end
					last_value := text.to_integer
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
					process_character (text_item (1).code)
					last_token := CHAR
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

<QUOTE,REGEXP,CCL,FIRSTCCL>{ESC}	{
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
					set_start_condition (REGEXP)
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
					last_value := text
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
						last_token := EIF_CODE
						last_string := text_substring (1, text_count - 1)
						line_nb := line_nb + last_string.occurrences ('%N')
						last_value := last_string
						set_start_condition (SECT2)
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
					last_value := text
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

end -- class LX_LEX_SCANNER
