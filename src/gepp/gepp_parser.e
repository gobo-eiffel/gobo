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
			reset as reset_parser_skeleton
		end

	GEPP_SCANNER
		rename
			make as make_gepp_scanner,
			reset as reset_gepp_scanner
		end

creation

	make

feature
-- Created by ibyacc V1.6 from "gepp_parser.y"

	Token_P_IFDEF: INTEGER is 257
		-- id of token P_IFDEF

	Token_P_IFNDEF: INTEGER is 258
		-- id of token P_IFNDEF

	Token_P_INCLUDE: INTEGER is 259
		-- id of token P_INCLUDE

	Token_P_DEFINE: INTEGER is 260
		-- id of token P_DEFINE

	Token_P_UNDEF: INTEGER is 261
		-- id of token P_UNDEF

	Token_P_NAME: INTEGER is 262
		-- id of token P_NAME

	Token_P_DEF_VALUE: INTEGER is 263
		-- id of token P_DEF_VALUE

	Token_P_ELSE: INTEGER is 264
		-- id of token P_ELSE

	Token_P_ENDIF: INTEGER is 265
		-- id of token P_ENDIF

	Token_P_EOL: INTEGER is 266
		-- id of token P_EOL

	Token_P_OR: INTEGER is 267
		-- id of token P_OR

	Token_P_AND: INTEGER is 268
		-- id of token P_AND

feature {NONE}

	yyreds: ARRAY[STRING] is
		once
			Result := <<
				"File : Instructions",
				"Instructions :",
				"Instructions : Instruction",
				"Instructions : Instructions Instruction",
				"Instruction : If_condition Instructions Endif",
				"Instruction : If_condition Instructions Else Instructions Endif",
				"Instruction : P_DEFINE P_NAME P_EOL",
				"Instruction : P_UNDEF P_NAME P_EOL",
				"Instruction : P_INCLUDE P_EOL",
				"If_condition : P_IFDEF Condition P_EOL",
				"If_condition : P_IFNDEF Condition P_EOL",
				"Condition : P_NAME",
				"Condition : ( Condition )",
				"Condition : Condition P_AND Condition",
				"Condition : Condition P_OR Condition",
				"Condition : ! Condition",
				"Endif : P_ENDIF P_EOL",
				"Else : P_ELSE P_EOL" >>
		end -- yyreds

	yytoks: ARRAY[STRING] is
		once
			Result := <<
				"$end",
				"error",
				"P_IFDEF",
				"P_IFNDEF",
				"P_INCLUDE",
				"P_DEFINE",
				"P_UNDEF",
				"P_NAME",
				"P_DEF_VALUE",
				"P_ELSE",
				"P_ENDIF",
				"P_EOL",
				"P_OR",
				"P_AND",
				"!",
				"(",
				")",
				"-unknown-" >>
		end -- yytoks

	yytokv: ARRAY[INTEGER] is
		once
			Result := <<
				0,256,257,258,259,260,261,262,263,264,
				265,266,267,268,33,40,41,-1 >>
		end -- yytokv

	yyexca_m: ARRAY[INTEGER] is
		once
			Result := <<
				-1, 1,
					0, -1,
					-2, 0,
				0 >>
		end -- yyexca_m

	yylast: INTEGER is 262

	yyact_m: ARRAY[INTEGER] is
		once
			Result := << 
				   8,   9,   7,   5,   6,  37,  27,  23,  22,   8,
				   9,   7,   5,   6,  31,  28,  27,  22,  20,  26,
				  28,  27,  34,  33,  25,  24,  14,   8,   9,   7,
				   5,   6,  18,  13,  12,   3,  15,   2,  10,  17,
				  21,   4,  11,   1,   0,   0,  19,  10,   0,   0,
				   0,  38,   0,   0,  29,  30,   0,   0,   0,  32,
				   0,   0,   0,   0,  35,  36,   0,   0,  10,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,  28,  27,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,  16 >>
		end -- yyact_m

	yypact_m: ARRAY[INTEGER] is
		once
			Result := << 
				-230,-1000,-230,-1000,-230,-228,-229,-240,  -1,  -1,
				-1000,-257,-241,-242,-1000,-247,-1000,  -1,  -1,-252,
				-1000,-230,-243,-244,-1000,-1000,-1000,  -1,  -1, -36,
				-1000,-1000,-248,-1000,-1000,-1000,-262,-1000,-1000 >>
		end -- yypact_m

	yypgo_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,  43,  37,  35,  41,  18,  40,  36 >>
		end -- yypgo_m

	yyr1_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   1,   2,   2,   2,   3,   3,   3,   3,   3,
				   4,   4,   7,   7,   7,   7,   7,   5,   6 >>
		end -- yyr1_m

	yyr2_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   2,   0,   2,   4,   6,  10,   7,   7,   5,
				   7,   7,   3,   7,   7,   7,   5,   5,   5 >>
		end -- yyr2_m

	yychk_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000,  -1,  -2,  -3,  -4, 260, 261, 259, 257, 258,
				  -3,  -2, 262, 262, 266,  -7, 262,  40,  33,  -7,
				  -5,  -6, 265, 264, 266, 266, 266, 268, 267,  -7,
				  -7, 266,  -2, 266, 266,  -7,  -7,  41,  -5 >>
		end -- yychk_m

	yydef_m: ARRAY[INTEGER] is
		once
			Result := << 
				   2,  -2,   1,   3,   2,   0,   0,   0,   0,   0,
				   4,   0,   0,   0,   9,   0,  12,   0,   0,   0,
				   5,   2,   0,   0,   7,   8,  10,   0,   0,   0,
				  16,  11,   0,  17,  18,  14,  15,  13,   6 >>
		end -- yydef_m

	yy_do_action (yy_a, yy_n: INTEGER) is
			-- execute user action 'yy_a'
		do
			inspect
				yy_a

			when 7 then
				yy_do_default_action(yy_n)

-- line 57

			if not ignored then
				define_value ("", dollar_to_string (yyvstack.item(-1)))
			end
		
			when 8 then
				yy_do_default_action(yy_n)

-- line 63

			if not ignored then
				undefine_value (dollar_to_string (yyvstack.item(-1)))
			end
		
			when 9 then
				yy_do_default_action(yy_n)

-- line 69

			if not ignored then
			end
		
			when 10 then
				yy_do_default_action(yy_n)

-- line 76

			if_level := if_level + 1
			if not ignored and not dollar_to_boolean (yyvstack.item(-1)) then
				ignored_level := if_level
			end
		
			when 11 then
				yy_do_default_action(yy_n)

-- line 83

			if_level := if_level + 1
			if not ignored and dollar_to_boolean (yyvstack.item(-1)) then
				ignored_level := if_level
			end
		
			when 12 then
				yy_do_default_action(yy_n)

-- line 92

			yyval := is_defined (dollar_to_string (yyvstack.item(-0)))
		
			when 13 then
				yy_do_default_action(yy_n)

-- line 96

			yyval := yyvstack.item(-1)
		
			when 14 then
				yy_do_default_action(yy_n)

-- line 100

			yyval := dollar_to_boolean (yyvstack.item(-2)) and dollar_to_boolean (yyvstack.item(-0))
		
			when 15 then
				yy_do_default_action(yy_n)

-- line 104

			yyval := dollar_to_boolean (yyvstack.item(-2)) or dollar_to_boolean (yyvstack.item(-0))
		
			when 16 then
				yy_do_default_action(yy_n)

-- line 108

			yyval := not dollar_to_boolean (yyvstack.item(-0))
		
			when 17 then
				yy_do_default_action(yy_n)

-- line 114

			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		
			when 18 then
				yy_do_default_action(yy_n)

-- line 123

			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		
			else
			-- empty action
			end -- inspect action
		end -- yy_do_action

-- line 132


feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			make_gepp_scanner
			make_parser_skeleton
			!! defined_values.make (10)
		end

	make_parser_skeleton is
			-- Create a new parser skeleton.
		do
			reset_parser_skeleton
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_gepp_scanner
			reset_parser_skeleton
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
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

feature {NONE} -- Implementation

	clear_input is
			-- Set current input to undefined value.
		do
			last_token := Token_undefined
			last_value := void_value
		end

invariant

	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)

end -- class GEPP_PARSER
