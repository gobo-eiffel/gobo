%{
indexing

	description:

		"Parsers for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	GEPP_SCANNER
		rename
			make as make_gepp_scanner,
			reset as reset_gepp_scanner
		end

	KL_SHARED_EXCEPTIONS

creation

	make

feature
%}

%token P_IFDEF P_IFNDEF P_INCLUDE P_DEFINE P_UNDEF
%token P_NAME P_DEF_VALUE P_ELSE P_ENDIF P_EOL
%token P_STRING
%left P_OR
%left P_AND
%right '!'

%start File

%%

File: Instructions
	;

Instructions: -- /* empty */
	| Instruction
	| Instructions Instruction
	;


Instruction: If_condition Instructions Endif
	| If_condition Instructions Else Instructions Endif
	| P_DEFINE P_NAME P_EOL
		{
			if not ignored then
				define_value ("", dollar_to_string ($2))
			end
		}
	| P_UNDEF P_NAME P_EOL
		{
			if not ignored then
				undefine_value (dollar_to_string ($2))
			end
		}
	| P_INCLUDE P_STRING P_EOL
		{
			if not ignored then
				process_include (dollar_to_string ($2))
			end
		}
	;

If_condition: P_IFDEF Condition P_EOL
		{
			if_level := if_level + 1
			if not ignored and not dollar_to_boolean ($2) then
				ignored_level := if_level
			end
		}
	| P_IFNDEF Condition P_EOL
		{
			if_level := if_level + 1
			if not ignored and dollar_to_boolean ($2) then
				ignored_level := if_level
			end
		}
	;

Condition: P_NAME
		{
			$$ := is_defined (dollar_to_string ($1))
		}
	| '(' Condition ')'
		{
			$$ := $2
		}
	| Condition P_AND Condition
		{
			$$ := dollar_to_boolean ($1) and dollar_to_boolean ($3)
		}
	| Condition P_OR Condition
		{
			$$ := dollar_to_boolean ($1) or dollar_to_boolean ($3)
		}
	| '!' Condition
		{
			$$ := not dollar_to_boolean ($2)
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

	make is
			-- Create a new parser.
		do
			make_gepp_scanner
			make_parser_skeleton
			!! defined_values.make (10)
			!! include_stack.make
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
			a_file_open_read: input_stream_.is_open_read (a_file)
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
		do
			if include_stack.count < Max_include_depth then
				a_file := input_stream_.make_file_open_read (a_filename)
				if input_stream_.is_open_read (a_file) then
					include_stack.put (input_buffer)
					set_input_buffer (new_file_buffer (a_file))
				else
					std.error.put_string ("gepp: cannot open %'")
					std.error.put_string (a_filename)
					std.error.put_string ("%'%N")
					exceptions_.die (1)
				end
			end
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

feature {NONE} -- Conversion

	dollar_to_string (a: ANY): STRING is
		do
			Result ?= a
		end

	dollar_to_boolean (a: ANY): BOOLEAN is
		local
			bool_ref: BOOLEAN_REF
		do
			bool_ref ?= a
			Result := bool_ref.item
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

	include_stack: DS_LINKED_STACK [YY_BUFFER]
			-- Input buffers not completely parsed yet

	Max_include_depth: INTEGER is 10
			-- Maximum number of nested include files

invariant

	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)

end -- class GEPP_PARSER
