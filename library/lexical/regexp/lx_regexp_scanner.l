%{
indexing

	description:

		"Scanners for regular expressions";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_REGEXP_SCANNER

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
		
	LX_REGEXP_TOKENS
		export
			{NONE} all
		end

	DP_CHARACTER_CODES
		export
			{NONE} all
		end

creation

	make, make_from_description
%}

%x NUM QUOTE FIRSTCCL CCL REGEXP

%option ecs meta-ecs case-insensitive nodefault outfile="lx_regexp_scanner.e"

WS					[ \t\r]+
NL					\n
ESC					\\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
FIRST_CCL_CHAR		[^\\\n]|{ESC}
CCL_CHAR			[^\\\n\]]|{ESC}

%%

<INITIAL>{
	"^"			{
					last_token := Caret_code
					set_start_condition (REGEXP)
				}
	.		{
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
					last_string := Void
				}
	[/|*+?.()]		last_token := text_item (1).code
	.			{
					last_token := CHAR
					process_character (text_item (1).code)
				}
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
			character_classes.wipe_out
			line_nb := 1
		end

feature -- Access

	error_handler: LEX_ERROR_HANDLER
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

	last_string: STRING
			-- Last string which has been read

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

feature {NONE} -- Constants

	Initial_max_character_classes: INTEGER is 101
			-- Maximum number of character classes

invariant

	error_handler_not_void: error_handler /= Void
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_item (Void)

end -- class LX_REGEXP_SCANNER
