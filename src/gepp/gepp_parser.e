indexing

	description:

		"Parsers for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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

feature {NONE} -- Implementation

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate ?= yytranslate_template
			yyr1 ?= yyr1_template
			yyr2 ?= yyr2_template
			yydefact ?= yydefact_template
			yydefgoto ?= yydefgoto_template
			yypact ?= yypact_template
			yypgoto ?= yypgoto_template
			yytable ?= yytable_template
			yycheck ?= yycheck_template
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		local
			yyval1: STRING
			yyval2: BOOLEAN
		do
			inspect yy_act
when 7 then
--|#line 64
			yyval := yyval_default;
			if not ignored then
				define_value ("", yytype1 (yyvs.item (yyvsp - 1)))
			end
		

when 8 then
--|#line 70
			yyval := yyval_default;
			if not ignored then
				undefine_value (yytype1 (yyvs.item (yyvsp - 1)))
			end
		

when 9 then
--|#line 76
			yyval := yyval_default;
			if not ignored then
				process_include (yytype1 (yyvs.item (yyvsp - 1)))
			end
		

when 10 then
--|#line 84
			yyval := yyval_default;
			if_level := if_level + 1
			if not ignored and not yytype2 (yyvs.item (yyvsp - 1)) then
				ignored_level := if_level
			end
		

when 11 then
--|#line 91
			yyval := yyval_default;
			if_level := if_level + 1
			if not ignored and yytype2 (yyvs.item (yyvsp - 1)) then
				ignored_level := if_level
			end
		

when 12 then
--|#line 100

			yyval2 := is_defined (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval2
when 13 then
--|#line 104

			yyval2 := yytype2 (yyvs.item (yyvsp - 1))
		
			yyval := yyval2
when 14 then
--|#line 108

			yyval2 := yytype2 (yyvs.item (yyvsp - 2)) and yytype2 (yyvs.item (yyvsp))
		
			yyval := yyval2
when 15 then
--|#line 112

			yyval2 := yytype2 (yyvs.item (yyvsp - 2)) or yytype2 (yyvs.item (yyvsp))
		
			yyval := yyval2
when 16 then
--|#line 116

			yyval2 := not yytype2 (yyvs.item (yyvsp))
		
			yyval := yyval2
when 17 then
--|#line 122
			yyval := yyval_default;
			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		

when 18 then
--|#line 131
			yyval := yyval_default;
			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		

			else
					-- No action
				yyval := yyval_default
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   16,    2,    2,    2,    2,    2,    2,
			   17,   18,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   20,   21,   21,   21,   22,   22,   22,   22,   22,
			   23,   23,   19,   19,   19,   19,   19,   24,   25>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    1,    0,    1,    2,    3,    5,    3,    3,    3,
			    3,    3,    1,    3,    3,    3,    2,    2,    2>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    0,    0,    0,    0,    0,    1,    3,    2,    0,
			    0,    0,    0,    0,   12,    0,    0,    4,    0,    8,
			    7,    9,    0,   16,    0,    0,   11,   10,    0,    0,
			    5,    2,   13,   14,   15,   17,   18,    0,    6,    0,
			    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   15,   39,    6,    7,    8,   30,   31>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   29,   40,   39,   37,   11,   11,   29, -32768,   29,   36,
			   35,   34,   11,   11, -32768,   28,   15, -32768,   10, -32768,
			 -32768, -32768,   23, -32768,   11,   11, -32768, -32768,   33,   14,
			 -32768,   29, -32768, -32768,   25, -32768, -32768,    1, -32768,   18,
			    3, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   -3, -32768,   -7,   -6, -32768,   12, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   17,   18,   16,   41,    5,    4,    3,    2,    1,   22,
			   23,   28,   17,    5,    4,    3,    2,    1,   40,   29,
			   28,   33,   34,   14,   37,   36,   27,   13,   12,   25,
			   24,   17,    5,    4,    3,    2,    1,   25,   24,   26,
			   24,   32,   25,   24,   35,   21,   20,   19,    0,   38,
			   11,   10,    9>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    6,    8,    5,    0,    3,    4,    5,    6,    7,   12,
			   13,   10,   18,    3,    4,    5,    6,    7,    0,    9,
			   10,   24,   25,   12,   31,   11,   11,   16,   17,   14,
			   15,   37,    3,    4,    5,    6,    7,   14,   15,   11,
			   15,   18,   14,   15,   11,   11,   11,   11,   -1,   37,
			   13,   12,   12>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): STRING is
		require
			valid_type: yyis_type1 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: STRING
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): BOOLEAN is
		require
			valid_type: yyis_type2 (v)
		local
			ref: BOOLEAN_REF
		do
			ref ?= v
			Result := ref.item
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: BOOLEAN_REF
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 41
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 19
			-- Number of tokens

	yyLast: INTEGER is 52
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 270
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 26
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



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
			a_filename_not_empty: a_filename.count > 0
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
