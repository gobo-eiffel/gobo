indexing

	description:

		"Parsers for regular expressions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_REGEXP_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			reset as reset_parser_skeleton
		end

	LX_REGEXP_SCANNER
		rename
			make as make_regexp_scanner,
			make_from_description as make_regexp_scanner_from_description,
			reset as reset_regexp_scanner
		end

	KL_SHARED_INPUT_STREAM_ROUTINES

creation

	make, make_from_description

feature
-- Created by ibyacc V1.6 from "lx_regexp_parser.y"

	Token_CHAR: INTEGER is 257
		-- id of token CHAR

	Token_NUMBER: INTEGER is 258
		-- id of token NUMBER

	Token_CCL_OP: INTEGER is 259
		-- id of token CCL_OP

feature {NONE}

	yyreds: ARRAY[STRING] is
		once
			Result := <<
				"Regexp : Init_pattern Pattern",
				"Init_pattern :",
				"Pattern : ^ Rule",
				"Pattern : Rule",
				"Pattern : error",
				"Rule : Regular_expression2 Regular_expression",
				"Rule : Regular_expression2 Regular_expression $",
				"Rule : Regular_expression $",
				"Rule : Regular_expression",
				"Regular_expression : Series",
				"Regular_expression : Regular_expression | Series",
				"Regular_expression2 : Regular_expression /",
				"Series : Singleton",
				"Series : Series Singleton",
				"Singleton : CHAR",
				"Singleton : Singleton *",
				"Singleton : Singleton +",
				"Singleton : Singleton ?",
				"Singleton : Singleton { NUMBER , NUMBER }",
				"Singleton : Singleton { NUMBER , }",
				"Singleton : Singleton { NUMBER }",
				"Singleton : .",
				"Singleton : CCL_OP",
				"Singleton : Full_CCl",
				"Singleton : %" String %"",
				"Singleton : ( Regular_expression )",
				"Full_CCl : [ CCl ]",
				"Full_CCl : [ ^ CCl ]",
				"CCl : CHAR",
				"CCl : CCl CHAR",
				"CCl : CHAR - CHAR",
				"CCl : CCl CHAR - CHAR",
				"String :",
				"String : String CHAR" >>
		end -- yyreds

	yytoks: ARRAY[STRING] is
		once
			Result := <<
				"$end",
				"error",
				"CHAR",
				"NUMBER",
				"CCL_OP",
				"^",
				"$",
				"|",
				"/",
				"*",
				"+",
				"?",
				"{",
				",",
				"}",
				".",
				"%"",
				"(",
				")",
				"[",
				"]",
				"-",
				"-unknown-" >>
		end -- yytoks

	yytokv: ARRAY[INTEGER] is
		once
			Result := <<
				0,256,257,258,259,94,36,124,47,42,
				43,63,123,44,125,46,34,40,41,91,
				93,45,-1 >>
		end -- yytokv

	yyexca_m: ARRAY[INTEGER] is
		once
			Result := <<
				-1, 1,
					0, -1,
					-2, 0,
				0 >>
		end -- yyexca_m

	yylast: INTEGER is 229

	yyact_m: ARRAY[INTEGER] is
		once
			Result := << 
				  15,  15,  49,  46,  39,  36,  16,  16,  35,  31,
				  50,  47,  12,  12,  32,  20,  43,  24,  25,  51,
				  33,  38,  45,  42,  10,   9,  22,   8,   5,  30,
				  28,  14,   7,  18,  23,  19,   3,   2,  26,   1,
				   0,   0,   0,   0,  29,   0,   0,  34,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,  17,  17,  23,
				   4,  41,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,  44,  27,   0,
				   0,   0,   0,  21,  21,   0,   0,   0,  21,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,  48,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,  40,  40,   0,
				   0,   0,  32,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   6,  11,  11,  13,  13,   0,  37 >>
		end -- yyact_m

	yypact_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000,-1000, -34,-1000, -33,-1000,-1000, -33, -21, -33,
				 -25,-1000,-1000,-1000,-1000,-1000, -33, -85,-1000, -16,
				-1000, -33,-1000, -25,-1000,-1000,-1000,-250, -29, -20,
				 -89,-243, -22,-1000, -33, -28,-1000,-1000,-1000,-1000,
				 -23, -90,-246,-123,-1000,-247,-1000,-1000,-106,-1000,
				-1000,-1000 >>
		end -- yypact_m

	yypgo_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,  39,  37,  36,  28,  32,  27,  25,  24,  31,
				  30,  29 >>
		end -- yypgo_m

	yyr1_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   1,   2,   3,   3,   3,   4,   4,   4,   4,
				   6,   6,   5,   7,   7,   8,   8,   8,   8,   8,
				   8,   8,   8,   8,   8,   8,   8,   9,   9,  11,
				  11,  11,  11,  10,  10 >>
		end -- yyr1_m

	yyr2_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   5,   1,   5,   3,   3,   5,   7,   5,   3,
				   2,   7,   5,   2,   5,   3,   5,   5,   5,  13,
				  11,   9,   3,   3,   3,   7,   7,   7,   9,   3,
				   5,   7,   9,   1,   5 >>
		end -- yyr2_m

	yychk_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000,  -1,  -2,  -3,  94,  -4, 256,  -5,  -6,  -7,
				  -8, 257,  46, 259,  -9,  34,  40,  91,  -4,  -6,
				  36, 124,  47,  -8,  42,  43,  63, 123, -10,  -6,
				 -11,  94, 257,  36,  -7, 258,  34, 257,  41,  93,
				 257, -11,  45,  44, 125,  45,  93, 257, 258, 125,
				 257, 125 >>
		end -- yychk_m

	yydef_m: ARRAY[INTEGER] is
		once
			Result := << 
				   2,  -2,   0,   1,   0,   4,   5,   0,   9,  10,
				  13,  15,  22,  23,  24,  33,   0,   0,   3,   6,
				   8,   0,  12,  14,  16,  17,  18,   0,   0,   0,
				   0,   0,  29,   7,  11,   0,  25,  34,  26,  27,
				  30,   0,   0,   0,  21,   0,  28,  31,   0,  20,
				  32,  19 >>
		end -- yydef_m

	yy_do_action (yy_a, yy_n: INTEGER) is
			-- execute user action 'yy_a'
		do
			inspect
				yy_a

			when 1 then
				yy_do_default_action(yy_n)

-- line 46

			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
			when 2 then
				yy_do_default_action(yy_n)

-- line 55

			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
			end
				-- Initialize for a parse of one pattern.

			has_trail_context := False
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			rule_id := 1
		
			when 3 then
				yy_do_default_action(yy_n)

-- line 73

			process_bol_rule (dollar_nfa (yyvstack.item(-0)))
		
			when 4 then
				yy_do_default_action(yy_n)

-- line 77

			process_rule (dollar_nfa (yyvstack.item(-0)))
		
			when 5 then
				yy_do_default_action(yy_n)

-- line 81

			error_handler.unrecognized_rule (filename, line_nb)
		
			when 6 then
				yy_do_default_action(yy_n)

-- line 87

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvstack.item(-0)), dollar_nfa (yyvstack.item(-1)))
		
			when 7 then
				yy_do_default_action(yy_n)

-- line 92

			error_handler.trailing_context_used_twice (filename, line_nb)
		
			when 8 then
				yy_do_default_action(yy_n)

-- line 96

			yyval := append_eol_to_regexp (dollar_nfa (yyvstack.item(-1)))
		
			when 9 then
				yy_do_default_action(yy_n)

-- line 100

			if has_trail_context then
				if variable_length and head_count = 0 then
						-- Both head and trail are variable-length.

					variable_trail_rule := True
				else
					trail_count := rule_length
				end
			end
		
			when 11 then
				yy_do_default_action(yy_n)

-- line 114

			variable_length := True
			yyval := dollar_nfa (yyvstack.item(-2)) | dollar_nfa (yyvstack.item(-0))
		
			when 12 then
				yy_do_default_action(yy_n)

-- line 121

				-- This rule is written separately so the reduction

				-- will occur before the trailing series is parsed.

			if has_trail_context then
				error_handler.trailing_context_used_twice (filename, line_nb)
			else
				has_trail_context := True
			end
			if variable_length then
					-- We hope the trailing context is fixed-length.

				variable_length := False
			else
				head_count := rule_length
			end
			rule_length := 0
			in_trail_context := True
		
			when 14 then
				yy_do_default_action(yy_n)

-- line 142

			yyval := dollar_nfa (yyvstack.item(-1)) & dollar_nfa (yyvstack.item(-0))
		
			when 15 then
				yy_do_default_action(yy_n)

-- line 148

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvstack.item(-0)))
		
			when 16 then
				yy_do_default_action(yy_n)

-- line 153

			variable_length := True
			yyval := |*| dollar_nfa (yyvstack.item(-1))
		
			when 17 then
				yy_do_default_action(yy_n)

-- line 158

			variable_length := True
			yyval := |+| dollar_nfa (yyvstack.item(-1))
		
			when 18 then
				yy_do_default_action(yy_n)

-- line 163

			variable_length := True
			yyval := |?| dollar_nfa (yyvstack.item(-1))
		
			when 19 then
				yy_do_default_action(yy_n)

-- line 168

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvstack.item(-5)), dollar_integer (yyvstack.item(-3)), dollar_integer (yyvstack.item(-1)))
		
			when 20 then
				yy_do_default_action(yy_n)

-- line 174

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvstack.item(-4)), dollar_integer (yyvstack.item(-2)))
		
			when 21 then
				yy_do_default_action(yy_n)

-- line 180

				-- The singleton could be something like "(foo)",

				-- in which case we have no idea what its length

				-- is, so we punt here.

			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvstack.item(-3)), dollar_integer (yyvstack.item(-1)))
		
			when 22 then
				yy_do_default_action(yy_n)

-- line 188

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		
			when 23 then
				yy_do_default_action(yy_n)

-- line 193

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvstack.item(-0)))
		
			when 24 then
				yy_do_default_action(yy_n)

-- line 198

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvstack.item(-0)))
		
			when 25 then
				yy_do_default_action(yy_n)

-- line 203

			yyval := yyvstack.item(-1)
		
			when 26 then
				yy_do_default_action(yy_n)

-- line 207

			yyval := yyvstack.item(-1)
		
			when 27 then
				yy_do_default_action(yy_n)

-- line 213

			character_classes.force
				(dollar_symbol_class (yyvstack.item(-1)), dollar_string (yyvstack.item(-2)))
			yyval := yyvstack.item(-1)
		
			when 28 then
				yy_do_default_action(yy_n)

-- line 219

			dollar_symbol_class (yyvstack.item(-1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvstack.item(-1)), dollar_string (yyvstack.item(-3)))
			yyval := yyvstack.item(-1)
		
			when 29 then
				yy_do_default_action(yy_n)

-- line 228

			yyval := append_character_to_character_class
				(dollar_integer (yyvstack.item(-0)), new_character_class)
		
			when 30 then
				yy_do_default_action(yy_n)

-- line 233

			yyval := append_character_to_character_class
				(dollar_integer (yyvstack.item(-0)), dollar_symbol_class (yyvstack.item(-1)))
		
			when 31 then
				yy_do_default_action(yy_n)

-- line 238

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvstack.item(-2)), dollar_integer (yyvstack.item(-0)),
				new_character_class)
		
			when 32 then
				yy_do_default_action(yy_n)

-- line 244

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvstack.item(-2)), dollar_integer (yyvstack.item(-0)),
				dollar_symbol_class (yyvstack.item(-3)))
		
			when 33 then
				yy_do_default_action(yy_n)

-- line 252

			yyval := new_epsilon_nfa
		
			when 34 then
				yy_do_default_action(yy_n)

-- line 256

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvstack.item(-0)), dollar_nfa (yyvstack.item(-1)))
		
			else
			-- empty action
			end -- inspect action
		end -- yy_do_action

-- line 263


feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new regular expression parser.
		require
			handler_not_void: handler /= Void
		do
			make_regexp_scanner (handler)
			make_parser_skeleton
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description
		(a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new regular expression parser
			-- and initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			make_regexp_scanner_from_description (a_description, handler)
			make_parser_skeleton
		ensure
			error_handler_set: error_handler = handler
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
			reset_regexp_scanner
			reset_parser_skeleton
			equiv_classes := Void
			transitions := Void
		end

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse regular expression from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: input_stream_.is_open_read (a_file)
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
			-- Parse regular expression from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Access

	transitions: DS_ARRAYED_LIST [LX_SYMBOL_TRANSITION [LX_NFA_STATE]]
			-- Symbol transitions kept for later renumbering
			-- using equivalence classes

feature -- Status report

	has_trail_context: BOOLEAN
	variable_trail_rule: BOOLEAN
	variable_length: BOOLEAN
	rule_length: INTEGER
	head_count: INTEGER
	trail_count: INTEGER

	rule_id: INTEGER
			-- Id of rule being parsed

	in_trail_context: BOOLEAN
			-- Is a trailing context being parsed?

feature -- Factory

	new_symbol_nfa (symbol: INTEGER): LX_NFA is
			-- New NFA made of two states and a
			-- symbol transition labeled `symbol'
		local
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
		do
			!! Result.make_symbol (symbol, in_trail_context)
			if equiv_classes /= Void then
				equiv_classes.put (symbol)
					-- Keep track of symbol transition for later
					-- renumbering using equivalence classes
				transition ?= Result.start_state.transition
				transitions.force_last (transition)
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_epsilon_nfa: LX_NFA is
			-- New NFA made of two states and an epsilon transition
		do
			!! Result.make_epsilon (in_trail_context)
		ensure
			nfa_not_void: Result /= Void
		end

	new_symbol_class_nfa (symbols: LX_SYMBOL_CLASS): LX_NFA is
			-- New NFA made of two states and a symbol
			-- class transition labeled `symbols'
		require
			symbols_not_void: symbols /= Void
		do
			!! Result.make_symbol_class (symbols, in_trail_context)
		ensure
			nfa_not_void: Result /= Void
		end

	new_character_class: LX_SYMBOL_CLASS is
			-- New empty character class
		do
			!! Result.make (characters_count)
		ensure
			character_class_not_void: Result /= Void
		end

	new_nfa_from_character (a_char: INTEGER): LX_NFA is
			-- New NFA with a transition labeled `a_char'
			-- (Take case-sensitiveness into account.)
		local
			lower_char: INTEGER
			a_name: STRING
			a_character_class: LX_SYMBOL_CLASS
		do
			if case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					lower_char := a_char + Case_diff
					a_name := lower_char.out
					if character_classes.has (a_name) then
						Result := new_symbol_class_nfa
							(character_classes.item (a_name))
					else
						!! a_character_class.make (2)
						a_character_class.put (a_char)
						a_character_class.put (lower_char)
						if equiv_classes /= Void then
							equiv_classes.add (a_character_class)
						end
						character_classes.force (a_character_class, a_name)
						Result := new_symbol_class_nfa (a_character_class)
					end
				when Lower_a_code .. Lower_z_code then
					a_name := a_char.out
					if character_classes.has (a_name) then
						Result := new_symbol_class_nfa
							(character_classes.item (a_name))
					else
						!! a_character_class.make (2)
						a_character_class.put (a_char - Case_diff)
						a_character_class.put (a_char)
						if equiv_classes /= Void then
							equiv_classes.add (a_character_class)
						end
						character_classes.force (a_character_class, a_name)
						Result := new_symbol_class_nfa (a_character_class)
					end
				when 0 then
					Result := new_symbol_nfa (characters_count)
				else
					Result := new_symbol_nfa (a_char)
				end
			elseif a_char = 0 then
				Result := new_symbol_nfa (characters_count)
			else
				Result := new_symbol_nfa (a_char)
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_nfa_from_character_class (a_character_class: LX_SYMBOL_CLASS): LX_NFA is
			-- New NFA with a transition labeled with `a_character_class'
			-- (Sort symbols in `a_character_class' if necessary and
			-- eventually register to `equiv_classes'.)
		require
			a_character_class_not_void: a_character_class /= Void
		do
			if a_character_class.sort_needed then
				a_character_class.sort
			end
			if equiv_classes /= Void then
				equiv_classes.add (a_character_class)
			end
			Result := new_symbol_class_nfa (a_character_class)
		ensure
			nfa_not_void: Result /= Void
		end

	new_bounded_iteration_nfa (a_nfa: LX_NFA; i, j: INTEGER): LX_NFA is
			-- New NFA that matches whatever matched `a_nfa' from
			-- `i' number of times to `j' number of times
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i < 0 or i > j then
				error_handler.bad_iteration_values (filename, line_nb)
				Result := new_epsilon_nfa
			else
				if i = 0 then
					if j <= 0 then
						error_handler.bad_iteration_values (filename, line_nb)
						Result := new_epsilon_nfa
					else
						Result := |?| a_nfa.bounded_iteration (1, j)
					end
				else
					Result := a_nfa.bounded_iteration (i, j)
				end
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_unbounded_iteration_nfa (a_nfa: LX_NFA; i: INTEGER): LX_NFA is
			-- New NFA that matches `i' or more occurrences of `a_nfa'
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i <= 0 then
				error_handler.iteration_not_positive (filename, line_nb)
				Result := new_epsilon_nfa
			else
				Result := a_nfa |{n,}| i
			end
		ensure
			nfa_not_void: Result /= Void
		end

	new_iteration_nfa (a_nfa: LX_NFA; i: INTEGER): LX_NFA is
			-- New NFA that matches whatever `a_nfa'
			-- matched `i' number of times
		require
			a_nfa_not_void: a_nfa /= Void
		do
			if i <= 0 then
				error_handler.iteration_not_positive (filename, line_nb)
				Result := new_epsilon_nfa
			else
				Result := a_nfa |{n}| i
			end
		ensure
			nfa_not_void: Result /= Void
		end

feature {NONE} -- Conversion

	dollar_integer (val: ANY): INTEGER is
		local
			int: INTEGER_REF
		do
			int ?= val
			Result := int.item
		end

	dollar_nfa (val: ANY): LX_NFA is
		do
			Result ?= val
		end

	dollar_string (val: ANY): STRING is
		do
			Result ?= val
		end

	dollar_symbol_class (val: ANY): LX_SYMBOL_CLASS is
		do
			Result ?= val
		end

feature {NONE} -- Implementation

	process_rule (a_nfa: LX_NFA) is
			-- Process a rule.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			a_state: LX_NFA_STATE
		do
			a_nfa.set_accepting_id (rule_id)
			if variable_trail_rule then
				variable_trail_context := True
			end
			a_state := a_nfa.start_state
				-- Add `a_state' to all non-exclusive start condition,
				-- including the default (INITIAL) start condition.
			start_conditions.add_state_to_non_exclusive (a_state)
		end

	process_bol_rule (a_nfa: LX_NFA) is
			-- Process a beginning-of-line rule.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			a_state: LX_NFA_STATE
		do
			a_nfa.set_accepting_id (rule_id)
			bol_needed := True
			if variable_trail_rule then
				variable_trail_context := True
			end
			a_state := a_nfa.start_state
				-- Add `a_state' to all non-exclusive start condition,
				-- including the default (INITIAL) start condition.
			start_conditions.add_bol_state_to_non_exclusive (a_state)
		end

	append_character_to_string (a_char: INTEGER; a_string: LX_NFA): LX_NFA is
			-- Append character `a_char' at end of string `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			a_name: STRING
			lower_char: INTEGER
			a_character_class: LX_SYMBOL_CLASS
		do
			if case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					lower_char := a_char + Case_diff
					a_name := lower_char.out
					if character_classes.has (a_name) then
						Result := a_string & new_symbol_class_nfa
							(character_classes.item (a_name))
					else
						!! a_character_class.make (2)
						a_character_class.put (a_char)
						a_character_class.put (lower_char)
						if equiv_classes /= Void then
							equiv_classes.add (a_character_class)
						end
						character_classes.force (a_character_class, a_name)
						Result := a_string & new_symbol_class_nfa
							(a_character_class)
					end
				when Lower_a_code .. Lower_z_code then
					a_name := a_char.out
					if character_classes.has (a_name) then
						Result := a_string & new_symbol_class_nfa
							(character_classes.item (a_name))
					else
						!! a_character_class.make (2)
						a_character_class.put (a_char - Case_diff)
						a_character_class.put (a_char)
						if equiv_classes /= Void then
							equiv_classes.add (a_character_class)
						end
						character_classes.force (a_character_class, a_name)
						Result := a_string & new_symbol_class_nfa
							(a_character_class)
					end
				when 0 then
					Result := a_string & new_symbol_nfa (characters_count)
				else
					Result := a_string & new_symbol_nfa (a_char)
				end
			elseif a_char = 0 then
				Result := a_string & new_symbol_nfa (characters_count)
			else
				Result := a_string & new_symbol_nfa (a_char)
			end
		ensure
			string_set: Result = a_string
		end

	append_character_to_character_class (a_char: INTEGER;
		a_character_class: LX_SYMBOL_CLASS): LX_SYMBOL_CLASS is
			-- Append character `a_char' to `a_character_class'.
		require
			a_character_class_not_void: a_character_class /= Void
		do
			if case_insensitive then
				inspect a_char
				when Upper_a_code .. Upper_z_code then
					a_character_class.put (a_char)
					a_character_class.put (a_char + Case_diff)
				when Lower_a_code .. Lower_z_code then
					a_character_class.put (a_char - Case_diff)
					a_character_class.put (a_char)
				when 0 then
					a_character_class.put (characters_count)
				else
					a_character_class.put (a_char)
				end
			elseif a_char = 0 then
				a_character_class.put (characters_count)
			else
				a_character_class.put (a_char)
			end
			Result := a_character_class
		ensure
			character_class_set: Result = a_character_class
		end

	append_character_set_to_character_class (char1, char2: INTEGER;
		a_character_class: LX_SYMBOL_CLASS): LX_SYMBOL_CLASS is
			-- Append character set `char1'-`char2' to `a_character_class'.
		require
			a_character_class_not_void: a_character_class /= Void
		local
			a_char: INTEGER
		do
			if char1 > char2 then
				error_handler.negative_range_in_character_class
					(filename, line_nb)
			elseif case_insensitive then
				from a_char := char1 until a_char > char2 loop
					inspect a_char
					when Upper_a_code .. Upper_z_code then
						a_character_class.put (a_char)
						a_character_class.put (a_char + Case_diff)
					when Lower_a_code .. Lower_z_code then
						a_character_class.put (a_char - Case_diff)
						a_character_class.put (a_char)
					when 0 then
						a_character_class.put (characters_count)
					else
						a_character_class.put (a_char)
					end
					a_char := a_char + 1
				end
			else
				from a_char := char1 until a_char > char2 loop
					if a_char = 0 then
						a_character_class.put (characters_count)
					else
						a_character_class.put (a_char)
					end
					a_char := a_char + 1
				end
			end
			Result := a_character_class
		ensure
			character_class_set: Result = a_character_class
		end

	append_trail_context_to_regexp (a_trail, a_regexp: LX_NFA): LX_NFA is
			-- Append trailing context `a_trail'
			-- to regular expression `a_regexp'.
		require
			a_trail_not_void: a_trail /= Void
			a_regexp_not_void: a_regexp /= Void
		do
			a_trail.set_beginning_as_normal
			in_trail_context := False
			if variable_length and head_count = 0 then
					-- Variable trailing context rule.
					-- Mark the first part of the rule as the accepting
					-- "head" part of a trailing context rule.
				a_regexp.set_accepting_id (rule_id + yyTrailing_head_mark)
				variable_trail_rule := True
			else
				trail_count := rule_length
			end
			Result := a_regexp & a_trail
		ensure
			regexp_set: Result = a_regexp
		end

	append_eol_to_regexp (a_regexp: LX_NFA): LX_NFA is
			-- Append end-of-line trailing context (i.e. "$")
			-- to regular expression `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
		do
			head_count := 0
			trail_count := 1
			rule_length := 1
			variable_length := False
			in_trail_context := True
			if has_trail_context then
				error_handler.trailing_context_used_twice (filename, line_nb)
				Result := a_regexp
			else
				if variable_length then
						-- Variable trailing context rule.
						-- Mark the first part of the rule as the accepting
						-- "head" part of a trailing context rule.
					a_regexp.set_accepting_id (rule_id + yyTrailing_head_mark)
					variable_trail_rule := True
				end
				has_trail_context := True
				Result := a_regexp & new_epsilon_nfa &
						new_symbol_nfa (New_line_code)
			end
		ensure
			regexp_set: Result = a_regexp
		end

	dot_character_class: LX_SYMBOL_CLASS is
			-- "." character class (i.e. all characters except new_line)
		local
			dot_string: STRING
		do
			dot_string := "."
			if character_classes.has (dot_string) then
				Result := character_classes.item (dot_string)
			else
				!! Result.make (1)
				Result.put (New_line_code)
				Result.set_negated (True)
				if equiv_classes /= Void then
					equiv_classes.add (Result)
				end
				character_classes.force (Result, dot_string)
			end
		ensure
			dot_character_class_not_void: Result /= Void
		end

	build_equiv_classes is
			-- Build equivalence classes and renumber
			-- symbol and character class transitions.
		require
			equiv_classes_not_void: equiv_classes /= Void
		local
			i, nb: INTEGER
			label: INTEGER
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
			cursor: DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING]
		do
			equiv_classes.build
			cursor := character_classes.new_cursor
			from cursor.start until cursor.after loop
				cursor.item.convert (equiv_classes)
				cursor.forth
			end
			nb := transitions.count
			from i := 1 until i > nb loop
				transition := transitions.item (i)
				label := equiv_classes.equivalence_class (transition.label)
				transition.set_label (label)
				i := i + 1
			end
		ensure
			built: equiv_classes.built
		end

	check_options is
			-- Check user-specified options.
		do
			if full_table then
				if meta_equiv_classes_used then
					error_handler.full_and_meta_equiv_classes
				end
				if reject_used then
					error_handler.full_and_reject
				elseif variable_trail_context then
					error_handler.full_and_variable_trail_context
				end
			end
		end

feature {NONE} -- Constants

	Initial_max_transitions: INTEGER is 1000
			-- Maximum number of symbol transitions

feature {NONE} -- Implementation

	clear_input is
			-- Set current input to undefined value.
		do
			last_token := Token_undefined
			last_value := void_value
		end

invariant

	transitions_not_void: equiv_classes /= Void implies transitions /= Void

end -- class LX_REGEXP_PARSER
