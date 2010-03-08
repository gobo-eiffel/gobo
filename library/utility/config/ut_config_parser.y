%{
indexing

	description:

		"Parsers for config files made up of name/value pairs and preprocessor instructions"

	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CONFIG_PARSER

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	UT_CONFIG_SCANNER
		rename
			make as make_scanner,
			reset as reset_scanner
		redefine
			fatal_error
		end

	KL_SHARED_STRING_EQUALITY_TESTER

	KL_SHARED_EXECUTION_ENVIRONMENT

create

	make

%}

%token P_IFDEF P_IFNDEF P_INCLUDE P_DEFINE P_UNDEF
%token P_ELSE P_ENDIF P_EOL P_COLON

%token <STRING> P_NAME P_STRING P_VALUE
%type <BOOLEAN> Condition

%left P_OR
%left P_AND
%right '!'

%expect 21
%start File

%%

File: Instructions
	;

Instructions: -- Empty
	| Instruction
	| Instructions Instruction
	;


Instruction: If_condition Instructions Endif
	| If_condition Instructions Else Instructions Endif
	| P_DEFINE P_NAME P_EOL
		{
			if not ignored then
				define_value ("", $2)
			end
		}
	| P_UNDEF P_NAME P_EOL
		{
			if not ignored then
				undefine_value ($2)
			end
		}
	| P_INCLUDE P_STRING P_EOL
		{
			if not ignored then
				process_include ($2)
			end
		}
	| P_NAME P_COLON P_VALUE P_EOL
		{
			if not ignored then
				config_values.force ($3, $1)
			end
		}
	| P_NAME P_COLON P_EOL
		{
			if not ignored then
				config_values.force ("", $1)
			end
		}
	| P_EOL
		{
			-- Empty lines are skipped.
		}
	;

If_condition: P_IFDEF Condition P_EOL
		{
			if_level := if_level + 1
			if not ignored and not $2 then
				ignored_level := if_level
			end
		}
	| P_IFNDEF Condition P_EOL
		{
			if_level := if_level + 1
			if not ignored and $2 then
				ignored_level := if_level
			end
		}
	;

Condition: P_NAME
		{
			$$ := is_defined ($1)
		}
	| '(' Condition ')'
		{
			$$ := $2
		}
	| Condition P_AND Condition
		{
			$$ := $1 and $3
		}
	| Condition P_OR Condition
		{
			$$ := $1 or $3
		}
	| '!' Condition
		{
			$$ := not $2
		}
	;

Endif: P_ENDIF P_EOL
		{
			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		}
	;

Else: P_ELSE P_EOL
		{
			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		}
	;

%%

feature {NONE} -- Initialization

	make (a_handler: like error_handler) is
			-- Create a new parser.
		require
			a_handler_not_void: a_handler /= Void
		do
			make_scanner
			make_parser_skeleton
			error_handler := a_handler
			create defined_values.make_map (10)
			defined_values.set_key_equality_tester (string_equality_tester)
			create config_values.make_map (10)
			config_values.set_key_equality_tester (string_equality_tester)
			create include_stack.make (Max_include_depth)
			create line_nb_stack.make (Max_include_depth)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_scanner
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
			line_nb_stack.wipe_out
			include_stack.wipe_out
			config_values.wipe_out
			has_error := False
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse config from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
			-- Parse config from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Processing

	process_include (a_filename: STRING) is
			-- Parse include file `a_filename'.
			-- Do not allow more than 10 nested include files.
		require
			a_filname_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		local
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			too_many_includes: UT_TOO_MANY_INCLUDES_ERROR
		do
			if not include_stack.is_full then
				create a_file.make (Execution_environment.interpreted_string (a_filename))
				a_file.open_read
				if a_file.is_open_read then
					line_nb_stack.put (line_nb)
					include_stack.put (input_buffer)
					set_input_buffer (new_file_buffer (a_file))
					line_nb := 1
				else
					create cannot_read.make (a_filename)
					error_handler.report_error (cannot_read)
					has_error := True
					abort
				end
			else
				create too_many_includes.make (include_stack.count + 1)
				error_handler.report_error (too_many_includes)
				has_error := True
				abort
			end
		end

feature -- Error handling

	has_error: BOOLEAN
			-- Has an error occurred?

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_error (a_message: STRING) is
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
			file_buffer: detachable YY_FILE_BUFFER
			filename: STRING
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				filename := file_buffer.file.name
			else
				filename := "string"
			end
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			has_error := True
		end

	fatal_error (a_message: STRING) is
			-- A fatal error occurred.
			-- Print `a_message'.
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_message)
			error_handler.report_error (l_error)
			has_error := True
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		do
			Result := ignored_level /= 0
		end

	is_defined (a_name: STRING): BOOLEAN is
			-- Is `a_name' defined?
		require
			a_name_not_void: a_name/= Void
		do
			Result := defined_values.has (a_name)
		end

feature -- Access

	config_values: DS_HASH_TABLE [STRING, STRING]
			-- Name/value pairs read from the config file so far

feature -- Element change

	define_value (a_value: STRING; a_name: STRING) is
			-- Define `a_name' with `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			defined_values.force (a_value, a_name)
		ensure
			a_name_defined: is_defined (a_name)
		end

	undefine_value (a_name: STRING) is
			-- Undefine `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			defined_values.remove (a_name)
		ensure
			a_name_undefined: not is_defined (a_name)
		end

feature {NONE} -- Implementation

	defined_values: DS_HASH_TABLE [STRING, STRING]
			-- Defined values

	if_level: INTEGER
			-- Number of nested #ifdef and #ifndef

	ignored_level: INTEGER
			-- Level of #ifdef or #ifndef which specified
			-- that subsequent lines should be ignored;
			-- 0 if lines should not be ignored

	include_stack: DS_ARRAYED_STACK [YY_BUFFER]
			-- Input buffers not completely parsed yet

	line_nb_stack: DS_ARRAYED_STACK [INTEGER]
			-- Line numbers in the corresponding input buffers in `include_stack'

	Max_include_depth: INTEGER is 10
			-- Maximum number of nested include files

invariant

	error_handler_not_void: error_handler /= Void
	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_void_item
	config_values_not_void: config_values /= Void
	no_void_config_value: not config_values.has_void_item

end
