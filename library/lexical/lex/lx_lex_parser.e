indexing

	description:

		"Parsers for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		end

	KL_SHARED_INPUT_STREAM_ROUTINES

creation

	make, make_from_description


feature {NONE} -- Tables

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate := yytranslate_
			yyr1 := yyr1_
			yyr2 := yyr2_
			yydefact := yydefact_
			yydefgoto := yydefgoto_
			yypact := yypact_
			yypgoto := yypgoto_
			yytable := yytable_
			yycheck := yycheck_
		end

	yyFinal: INTEGER is 79

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 31

	yyMax_token: INTEGER is 266
	yyNsyms: INTEGER is 49

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    25,     2,    19,     2,     2,     2,    26,
    27,    14,    22,    17,    30,    24,    21,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    16,
     2,    15,    23,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    28,     2,    29,    18,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    12,    20,    13,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
    31,    32,    33,    33,    33,    34,    34,    34,    34,    35,
    36,    36,    36,    37,    38,    38,    38,    39,    39,    39,
    39,    40,    40,    40,    40,    41,    41,    42,    43,    43,
    44,    44,    44,    44,    44,    44,    44,    44,    44,    44,
    44,    44,    45,    45,    46,    46,    46,    46,    47,    47,
    48,    48,    48>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     4,     1,     0,     5,     5,     0,     1,     1,     1,     0,
     0,     3,     3,     1,     1,     3,     1,     2,     1,     1,
     1,     2,     3,     2,     1,     1,     3,     2,     1,     2,
     1,     2,     2,     2,     6,     5,     4,     1,     1,     1,
     3,     3,     3,     4,     1,     2,     3,     4,     0,     2,
     0,     1,     2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<     0,
     2,     3,    11,    14,    51,    10,     0,    52,     1,     3,
     0,    17,    15,     0,     0,    53,    11,    21,    31,    20,
    39,     0,    38,    49,     0,     0,     6,    19,    25,     0,
    26,    29,    40,    12,    13,     0,     5,    18,     0,     0,
    45,     0,     0,     7,     8,     9,     4,    24,     0,    28,
    22,    30,     0,    32,    33,    34,    16,    50,    41,    42,
     0,     0,    46,    43,    27,    23,     0,    47,    44,     0,
    37,     0,    48,     0,    36,    35,     0,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    77,
     2,     3,    47,     5,     6,     7,    15,    27,    28,    29,
    30,    31,    32,    33,    43,    39,     9>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    42,
-32768,-32768,     6,-32768,    49,     3,    15,    50,-32768,-32768,
     0,-32768,-32768,    43,    38,-32768,    -4,-32768,-32768,-32768,
-32768,    11,-32768,-32768,    11,    -1,    34,-32768,    31,    11,
    11,    26,-32768,-32768,-32768,    54,-32768,-32768,     7,    -7,
    32,    58,     1,-32768,-32768,-32768,-32768,-32768,    11,-32768,
    37,    26,    59,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
    61,     2,    35,-32768,    11,-32768,    10,-32768,-32768,    63,
-32768,    29,-32768,    55,-32768,-32768,    67,    69,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<-32768,
-32768,    60,-32768,    65,-32768,-32768,-32768,-32768,    51,    16,
-32768,    23,   -31,-32768,    33,-32768,-32768>>, 0)
		end

	yyLast: INTEGER is 75

	yytable_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    52,
    18,    41,    19,    63,    63,   -10,    20,    21,    37,    58,
   -10,     4,    49,    19,    10,    12,    42,    22,    21,    60,
    13,     4,    71,    23,    24,    25,    72,    26,    14,    64,
    69,    59,    74,    52,    23,    24,    25,    53,    26,    54,
    40,    75,    44,    45,    46,    51,     1,    55,    56,    48,
    49,    50,    35,     8,    36,    66,    49,    34,    16,    57,
    41,    61,    67,    68,    70,    73,    78,    76,    79,    17,
    11,    65,    38,     0,    62>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    31,
     1,     3,     3,     3,     3,     0,     7,     8,    13,     3,
     5,    16,    20,     3,    12,     1,    18,    18,     8,    27,
     6,    16,    13,    24,    25,    26,    17,    28,    14,    29,
    29,    25,     4,    65,    24,    25,    26,    12,    28,    14,
    25,    13,     9,    10,    11,    30,     5,    22,    23,    19,
    20,    21,    15,     5,    17,    19,    20,    15,     9,     6,
     3,    30,     4,     3,    30,     3,     0,    13,     0,    10,
     6,    49,    22,    -1,    42>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 1 then
--#line 46 "lx_lex_parser.y"

			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--#line 56 "lx_lex_parser.y"

			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
			end
		

when 4 then
--#line 66 "lx_lex_parser.y"

			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		

when 5 then
--#line 70 "lx_lex_parser.y"

			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		

when 7 then
--#line 77 "lx_lex_parser.y"

			set_action (dollar_string (yyvs.item (yyvsp)))
		

when 9 then
--#line 82 "lx_lex_parser.y"

			set_action ("")
		

when 10 then
--#line 88 "lx_lex_parser.y"

				-- Initialize for a parse of one rule.
			has_trail_context := False
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			rule_id := rules.count + 1
		

when 11 then
--#line 102 "lx_lex_parser.y"

			yyval := start_condition_stack.count
		

when 12 then
--#line 106 "lx_lex_parser.y"

			start_condition_stack.append_start_conditions (start_conditions)
		

when 14 then
--#line 113 "lx_lex_parser.y"

			yyval := start_condition_stack.count
		

when 15 then
--#line 119 "lx_lex_parser.y"

			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		

when 16 then
--#line 123 "lx_lex_parser.y"

			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		

when 17 then
--#line 127 "lx_lex_parser.y"

			error_handler.bad_start_condition_list (filename, line_nb)
		

when 18 then
--#line 133 "lx_lex_parser.y"

			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 19 then
--#line 137 "lx_lex_parser.y"

			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 20 then
--#line 141 "lx_lex_parser.y"

			process_eof_rule
		

when 21 then
--#line 145 "lx_lex_parser.y"

			error_handler.unrecognized_rule (filename, line_nb)
		

when 22 then
--#line 151 "lx_lex_parser.y"

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 23 then
--#line 156 "lx_lex_parser.y"

			error_handler.trailing_context_used_twice (filename, line_nb)
		

when 24 then
--#line 160 "lx_lex_parser.y"

			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 25 then
--#line 164 "lx_lex_parser.y"

			if has_trail_context then
				if variable_length and head_count = 0 then
						-- Both head and trail are variable-length.
					variable_trail_rule := True
				else
					trail_count := rule_length
				end
			end
		

when 27 then
--#line 178 "lx_lex_parser.y"

			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		

when 28 then
--#line 185 "lx_lex_parser.y"

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
		

when 30 then
--#line 206 "lx_lex_parser.y"

			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		

when 31 then
--#line 212 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		

when 32 then
--#line 217 "lx_lex_parser.y"

			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 33 then
--#line 222 "lx_lex_parser.y"

			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 34 then
--#line 227 "lx_lex_parser.y"

			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 35 then
--#line 232 "lx_lex_parser.y"

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 36 then
--#line 238 "lx_lex_parser.y"

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		

when 37 then
--#line 244 "lx_lex_parser.y"

				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 38 then
--#line 252 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		

when 39 then
--#line 257 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 40 then
--#line 262 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 41 then
--#line 267 "lx_lex_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 42 then
--#line 271 "lx_lex_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 43 then
--#line 277 "lx_lex_parser.y"

			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		

when 44 then
--#line 283 "lx_lex_parser.y"

			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		

when 45 then
--#line 292 "lx_lex_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		

when 46 then
--#line 297 "lx_lex_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		

when 47 then
--#line 302 "lx_lex_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		

when 48 then
--#line 308 "lx_lex_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		

when 49 then
--#line 316 "lx_lex_parser.y"

			yyval := new_epsilon_nfa
		

when 50 then
--#line 320 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 53 then
--#line 330 "lx_lex_parser.y"

			eiffel_code := dollar_string (yyvs.item (yyvsp))
		

			else
				-- No action
			end
		end



feature {NONE} -- Initialization

	make (a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new scanner description parser.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			make_lex_scanner (handler)
			make_parser_skeleton
			!! pending_rules.make (Initial_max_pending_rules)
			!! start_condition_stack.make (Initial_max_start_conditions)
			!! action_factory.make
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description
		(a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new scanner description parser
			-- and initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			make_lex_scanner_from_description (a_description, handler)
			make_parser_skeleton
			!! pending_rules.make (Initial_max_pending_rules)
			!! start_condition_stack.make (Initial_max_start_conditions)
			!! action_factory.make
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_lex_scanner
			pending_rules.wipe_out
			start_condition_stack.wipe_out
			equiv_classes := Void
			transitions := Void
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

feature -- Access

	pending_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules which share the same semantic action

	start_condition_stack: LX_START_CONDITIONS
			-- Start condition containing
			-- the rule currently being parsed

	transitions: DS_ARRAYED_LIST [LX_SYMBOL_TRANSITION [LX_NFA_STATE]]
			-- Symbol transitions kept for later renumbering
			-- using equivalence classes

	action_factory: LX_ACTION_FACTORY
			-- Semantic action factory

feature -- Setting

	set_action_factory (a_factory: like action_factory) is
			-- Set `action_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			action_factory := a_factory
		ensure
			action_factory_set: action_factory = a_factory
		end

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

feature {NONE} -- Factory

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

	push_start_condition (a_name: STRING; stack: LX_START_CONDITIONS) is
			-- Push start condition named `a_name' on top of `stack'.
			-- Do nothing if that start condition is already in `stack'.
		require
			a_name_not_void: a_name /= Void
			stack_not_void: stack /= Void
		do
			if start_conditions.has_start_condition (a_name) then
				if stack.has_start_condition (a_name) then
					error_handler.start_condition_specified_twice
						(a_name, filename, line_nb)
				else
					stack.put_last (start_conditions.start_condition (a_name))
				end
			else
				error_handler.undeclared_start_condition
					(a_name, filename, line_nb)
			end
		end

	process_rule (a_nfa: LX_NFA) is
			-- Process a rule.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			a_rule: LX_RULE
			a_state: LX_NFA_STATE
		do
			if rule_id > yyTrailing_mark then
					-- `yyTrailing_mark' and `yyTrailing_head_mark' are
					-- used to mark accepting ids as being special (i.e.
					-- part of a trailing context rule). As such, they
					-- implicitly limit the number of accepting ids (and
					-- hence the number of rules) because if there are
					-- too many rules the rule ids will go below these
					-- marks. Fortunately, this limit is large (10000)
					-- so unlikely to actually cause any problems.
				error_handler.too_many_rules (yyTrailing_mark)
			else
				a_nfa.set_accepting_id (rule_id)
				!! a_rule.make (rule_id, a_nfa, Dummy_action)
				rules.force_last (a_rule)
				pending_rules.force_last (a_rule)
				a_rule.set_line_nb (rule_line_nb)
				a_rule.set_trail_context
					(variable_trail_rule, head_count, trail_count)
				if variable_trail_rule then
					variable_trail_context := True
				end
				a_state := a_nfa.start_state
				if start_condition_stack.is_empty then
						-- Add `a_state' to all non-exclusive start condition,
						-- including the default (INITIAL) start condition.
					start_conditions.add_state_to_non_exclusive (a_state)
				else
					start_condition_stack.add_state_to_all (a_state)
				end
			end
		end

	process_bol_rule (a_nfa: LX_NFA) is
			-- Process a beginning-of-line rule.
		require
			a_nfa_not_void: a_nfa /= Void
		local
			a_rule: LX_RULE
			a_state: LX_NFA_STATE
		do
			if rule_id > yyTrailing_mark then
					-- `yyTrailing_mark' and `yyTrailing_head_mark' are
					-- used to mark accepting ids as being special (i.e.
					-- part of a trailing context rule). As such, they
					-- implicitly limit the number of accepting ids (and
					-- hence the number of rules) because if there are
					-- too many rules the rule ids will go below these
					-- marks. Fortunately, this limit is large (10000)
					-- so unlikely to actually cause any problems.
				error_handler.too_many_rules (yyTrailing_mark)
			else
				a_nfa.set_accepting_id (rule_id)
				!! a_rule.make (rule_id, a_nfa, Dummy_action)
				rules.force_last (a_rule)
				pending_rules.force_last (a_rule)
				a_rule.set_line_nb (rule_line_nb)
				a_rule.set_trail_context
					(variable_trail_rule, head_count, trail_count)
				bol_needed := True
				if variable_trail_rule then
					variable_trail_context := True
				end
				a_state := a_nfa.start_state
				if start_condition_stack.is_empty then
						-- Add `a_state' to all non-exclusive start condition,
						-- including the default (INITIAL) start condition.
					start_conditions.add_bol_state_to_non_exclusive (a_state)
				else
					start_condition_stack.add_bol_state_to_all (a_state)
				end
			end
		end

	process_eof_rule is
			-- Process a "<<EOF>>" rule.
		do
			if start_condition_stack.is_empty then
					-- This EOF applies to all start conditions
					-- which don't already have EOF actions.
				start_condition_stack.append_non_eof_start_conditions
					(start_conditions)
				if start_condition_stack.is_empty then
					error_handler.all_start_conditions_have_EOF
						(filename, line_nb)
				else
					build_eof_action (start_condition_stack)
				end
			else
				build_eof_action (start_condition_stack)
			end
		end

	build_eof_action (stack: LX_START_CONDITIONS) is
			-- Build the "<<EOF>>" action for start conditions in `stack'.
		require
			stack_not_void: stack /= Void
			stack_not_empty: not stack.is_empty
		local
			a_rule: LX_RULE
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
			sc: STRING
		do
			from
				i := 1
				nb := stack.count
			until
				i > nb
			loop
				a_start_condition := stack.item (i)
				if a_start_condition.has_eof then
					sc := a_start_condition.name
					error_handler.multiple_EOF_rules (sc, filename, line_nb)
				else
					a_start_condition.set_has_eof (True)
					!! a_rule.make (a_start_condition.id, Eof_nfa, Dummy_action)
						-- Save `rule' as an end-of-file rule.
					eof_rules.force_last (a_rule)
					pending_rules.force_last (a_rule)
				end
				i := i + 1
			end
		end

	process_default_rule is
			-- Process default rule.
		local
			a_rule: LX_RULE
			a_character_class: LX_SYMBOL_CLASS
			a_nfa: LX_NFA
			a_state: LX_NFA_STATE
		do
			if rule_id > yyTrailing_mark then
					-- `yyTrailing_mark' and `yyTrailing_head_mark' are
					-- used to mark accepting ids as being special (i.e.
					-- part of a trailing context rule). As such, they
					-- implicitly limit the number of accepting ids (and
					-- hence the number of rules) because if there are
					-- too many rules the rule ids will go below these
					-- marks. Fortunately, this limit is large (10000)
					-- so unlikely to actually cause any problems.
				error_handler.too_many_rules (yyTrailing_mark)
			else
				!! a_character_class.make (0)
				a_character_class.set_negated (True)
				a_nfa := new_symbol_class_nfa (a_character_class)
				a_nfa.set_accepting_id (rule_id)
				!! a_rule.make (rule_id, a_nfa, Dummy_action)
				rules.force_last (a_rule)
				pending_rules.force_last (a_rule)
				a_rule.set_line_nb (0)
				a_rule.set_trail_context (False, 0, 0)
				a_state := a_nfa.start_state
				start_conditions.add_state_to_all (a_state)
				if no_default_rule then
					set_action ("fatal_error (%"scanner jammed%")")
				else
					set_action ("echo")
				end
			end
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

	set_action (a_text: STRING) is
			-- Set pending rules' action using `a_text'.
		require
			a_text_not_void: a_text /= Void
		local
			i, nb: INTEGER
			action: UT_COMMAND
		do
			action := action_factory.new_action (a_text)
			nb := pending_rules.count
			from i := 1 until i > nb loop
				pending_rules.item (i).set_action (action)
				i := i + 1
			end
			pending_rules.wipe_out
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

	Initial_max_pending_rules: INTEGER is 10
			-- Maximum number of pending rules

	Initial_max_transitions: INTEGER is 1000
			-- Maximum number of symbol transitions

	Dummy_action: LX_ACTION is
			-- Dummy action
		once
			!! Result.make ("fatal_error (%"Unknown action%")")
		ensure
			dummy_action_not_void: Result /= Void
		end

	Eof_nfa: LX_NFA is
			-- End-of-file NFA
		once
			!! Result.make_epsilon (False)
		ensure
			nfa_not_void: Result /= Void
		end

invariant

	pending_rules_not_void: pending_rules /= Void
	no_void_pending_rule: not pending_rules.has (Void)
	start_condition_stack_not_void: start_condition_stack /= Void
	transitions_not_void: equiv_classes /= Void implies transitions /= Void
	action_factory_not_void: action_factory /= Void

end -- class LX_LEX_PARSER
