%{
indexing

	description:

		"Scanners for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_LEX_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	LX_DESCRIPTION
		rename
			make as make_description,
			make_from_description as make_descrition_from_description,
			reset as reset_description
		end
		
	LX_LEX_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

creation

	make, make_from_description
%}

%x SECT2 SECT3 EIFFEL_BLOCK OPTION RECOVER SCNAME XSCNAME NUM QUOTE
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
	^"%option"		set_start_condition (OPTION);
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
					error_handler.unrecognized_directive (filename, line_nb)
					set_start_condition (RECOVER)
				}
	.			{
					error_handler.directive_expected (filename, line_nb)
					set_start_condition (RECOVER)
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
					error_handler.start_condition_expected (filename, line_nb)
					set_start_condition (RECOVER)
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
					error_handler.set_no_warning (False)
				}
	nowarn		{
					no_warning := True
					error_handler.set_no_warning (True)
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
					error_handler.unrecognized_option (text, filename, line_nb)
					set_start_condition (RECOVER)
			}
}

<OUTFILE>{
	\"[^"\n]*\"		{
					output_filename := text_substring (2, text_count - 1)
					set_start_condition (OPTION)
				}
	.			{
					output_filename := Void
					error_handler.missing_quote (filename, line_nb)
					set_start_condition (RECOVER)
				}
}

<DEFINITION>{
	{WS}|{C}		-- Separates name and definition.
	[^ \t\n\r].*	{
					check last_string_not_void: last_string /= Void end
					process_name_definition (last_string, text)
					set_start_condition (INITIAL)
				}
	{NL}		{
					line_nb := line_nb + 1
					error_handler.incomplete_name_definition (filename, line_nb)
					set_start_condition (INITIAL)
				}
}

<RECOVER>{
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
					last_string := text
					if not name_definitions.has (last_string) then
						error_handler.undefined_definition
							(last_string, filename, line_nb)
					else
						put_back_string (name_definitions.item (last_string))
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
						-- The line number has already been set when creating
						-- `rule', but it often gets the wrong number because
						-- it is done before parsing the current rule.
					rule.set_line_nb (line_nb)
					set_start_condition (ACTION_TEXT)
				}
	{NL}		{
						-- The line number has already been set when creating
						-- `rule', but it often gets the wrong number because
						-- it is done before parsing the current rule.
					rule.set_line_nb (line_nb)
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
	.				error_handler.bad_start_condition (text, filename, line_nb)
}

<NUM>{
	{WS}			-- Separator.
	[0-9]+		{
					last_token := NUMBER
					check is_integer: text.is_integer end
					last_value := text.to_integer
				}
	","				last_token := Comma_code
	"}"			{
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
	.			{
					error_handler.bad_character_in_brackets (filename, line_nb)
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				}
	{NL}		{
					error_handler.missing_bracket (filename, line_nb)
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
					error_handler.missing_quote (filename, line_nb)
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
					error_handler.bad_character_class (filename, line_nb)
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
					error_handler.bad_character_class (filename, line_nb)
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
	[^"'}-]*												more
	\"([^"%\n]|%([^/\n]|("/"[0-9]+"/")|(\n[ \t]%)))*\"		more
	\'([^'%\n]|%([^/\n]|("/"[0-9]+"/")))\'					more
	--.*													more
	\"|\'|-													more
	"}"			{
					last_token := EIF_CODE
					last_string := text_substring (1, text_count - 1)
					line_nb := line_nb + last_string.occurrences ('%N')
					last_value := last_string
					set_start_condition (SECT2)
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
						error_handler.bad_character ("%%N", filename, line_nb)
						line_nb := line_nb + 1
					else
						error_handler.bad_character (text, filename, line_nb)
					end
				}

%%

feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new scanner description scanner.
		require
			handler_not_void: handler /= Void
		do
			make_description
			make_compressed_scanner_skeleton
			error_handler := handler
			!! name_definitions.make (Initial_max_nb_names)
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description
		(a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new scanner description scanner and
			-- initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			from_description (a_description)
			make_compressed_scanner_skeleton
			error_handler := handler
			!! name_definitions.make (Initial_max_nb_names)
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			reset_description
			name_definitions.wipe_out
			character_classes.wipe_out
			line_nb := 1
			last_string := Void
		end

feature -- Access

	error_handler: LX_LEX_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	filename: STRING is
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				Result := file_buffer.file.name
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

	last_value: ANY
			-- Semantic value to be passed to the parser

	rule: LX_RULE
			-- Rule being analyzed

	character_classes: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING]
			-- Character classes declared so far

	name_definitions: DS_HASH_TABLE [STRING, STRING]
			-- Name definition table

	last_string: STRING
			-- Last string which has been read

feature -- Setting

	set_error_handler (handler: like error_handler) is
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature {NONE} -- Implementation

	put_back_string (str: STRING) is
			-- Put `str' back to buffer for the scanner
			-- to analyze it again.
		require
			str_not_void: str /= Void
		local
			i: INTEGER
		do
			from i := str.count until i < 1 loop
				unread_character (str.item (i))
				i := i - 1
			end
		end

	add_new_start_condition (a_name: STRING; exclusive: BOOLEAN) is
			-- Create a new start condition named `a_name' and
			-- insert it at the end of `start_conditions'.
		require
			a_name_not_void: a_name /= Void
		do
			if start_conditions.has_start_condition (a_name) then
				error_handler.start_condition_declared_twice
					(a_name, filename, line_nb)
			else
				start_conditions.force_new_start_condition (a_name, exclusive)
			end
		end

	process_character (a_code: INTEGER) is
			-- Check whether `a_code' is a valid code for character
			-- whose printable representation is held in `text'.
			-- Set `last_value' accordingly.
		do
			if a_code < characters_count then
				last_value := a_code
			else
				error_handler.character_out_of_range (text, filename, line_nb)
				last_value := 0
			end
		end

	process_escaped_character is
			-- Process escaped character whose printable representation
			-- is held in `text'. Check whether the corresponding 
			-- character is not out of range. Set `last_value' accordingly.
		require
			-- valid_text: `text' recognized by \\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			c := text_item (2)
			inspect c
			when 'b' then
				a_code := Back_space_code
			when 'f' then
				a_code := Form_feed_code
			when 'n' then
				a_code := New_line_code
			when 'r' then
				a_code := Carriage_return_code
			when 't' then
				a_code := Tabulation_code
			when 'a' then
				a_code := 7
			when 'v' then
				a_code := 13
			when '0'..'7' then
					-- Octal.
				nb := text_count
				a_code := 0
				from i := 2 until i > nb loop
					a_code := a_code * 8 + text_item (i).code - Zero_code
					i := i + 1
				end
			when 'x', 'X' then
				nb := text_count
				if nb = 2 then
					a_code := c.code
				else
						-- Hexadecimal.
					a_code := 0
					from i := 3 until i > nb loop
					a_code := a_code * 16
						c := text_item (i)
						inspect c
						when '0'..'9' then
							a_code := a_code + c.code - Zero_code
						when 'a'..'z' then
							a_code := a_code + c.code - Lower_a_code + 10
						when 'A'..'Z' then
							a_code := a_code + c.code - Upper_a_code + 10
						end
						i := i + 1
					end
				end
			else
				a_code := c.code
			end
			process_character (a_code)
		end

	process_name_definition (a_name, a_definition: STRING) is
			-- Keep track of name definition.
			-- Trailing spaces are removed from `a_definition'
			-- and parentheses are added around it.
		require
			a_name_not_void: a_name /= Void
			a_definition_not_void: a_definition /= Void
		local
			bracketed_name: STRING
			parenthesised_definition: STRING
		do
			!! bracketed_name.make (a_name.count + 2)
			bracketed_name.append_character ('{')
			bracketed_name.append_string (a_name)
			bracketed_name.append_character ('}')
			if name_definitions.has (bracketed_name) then
				error_handler.name_defined_twice (a_name, filename, line_nb)
			end
			!! parenthesised_definition.make (a_definition.count + 2)
			parenthesised_definition.append_character ('(')
			parenthesised_definition.append_string (a_definition)
				-- Skip trailing white spaces.
			parenthesised_definition.right_adjust
			parenthesised_definition.append_character (')')
			name_definitions.force (parenthesised_definition, bracketed_name)
		end

feature {NONE} -- Constants

	Initial_max_nb_names: INTEGER is 101
			-- Maximum number of name definitions

	Initial_max_character_classes: INTEGER is 101
			-- Maximum number of character classes

invariant

	error_handler_not_void: error_handler /= Void
	name_definitions_not_void: name_definitions /= Void
	no_void_name_definition: not name_definitions.has_item (Void)
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_item (Void)

end -- class LX_LEX_SCANNER
