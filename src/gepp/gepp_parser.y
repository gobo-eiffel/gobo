%{
indexing

	description:

		"Parsers for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	GEPP_SCANNER
		rename
			make as make_gepp_scanner,
			reset as reset_gepp_scanner
		end

creation

	make

feature
%}

%token P_IFDEF P_IFNDEF P_INCLUDE P_DEFINE P_UNDEF
%token P_DEF_VALUE P_ELSE P_ENDIF P_EOL

%token <STRING>		P_NAME P_STRING
%type <BOOLEAN>		Condition

%left P_OR
%left P_AND
%right '!'

%expect 15
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
			make_gepp_scanner
			make_parser_skeleton
			error_handler := a_handler
			!! defined_values.make (10)
			!! include_stack.make (Max_include_depth)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_gepp_scanner
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
			include_stack.wipe_out
		end

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse scanner description from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
			-- Parse scanner description from `a_string'.
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
			a_filename_not_empty: not a_filename.empty
		local
			a_file: like INPUT_STREAM_TYPE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			too_many_includes: GEPP_TOO_MANY_INCLUDES_ERROR
		do
			if not include_stack.is_full then
				a_file := INPUT_STREAM_.make_file_open_read (a_filename)
				if INPUT_STREAM_.is_open_read (a_file) then
					include_stack.put (input_buffer)
					set_input_buffer (new_file_buffer (a_file))
				else
					!! cannot_read.make (a_filename)
					error_handler.report_error (cannot_read)
					abort
				end
			else
				!! too_many_includes.make (include_stack.count + 1)
				error_handler.report_error (too_many_includes)
				abort
			end
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_error (a_message: STRING) is
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
			file_buffer: YY_FILE_BUFFER
			filename: STRING
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				filename := INPUT_STREAM_.name (file_buffer.file)
			else
				filename := "string"
			end
			!! an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
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

	Max_include_depth: INTEGER is 10
			-- Maximum number of nested include files

invariant

	error_handler_not_void: error_handler /= Void
	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)

end -- class GEPP_PARSER
