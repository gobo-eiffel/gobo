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
			make as make_parser_skeleton
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

	yyFinal: INTEGER is 53

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 23

	yyMax_token: INTEGER is 260
	yyNsyms: INTEGER is 34

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    17,     2,     7,     2,     2,     2,    18,
    19,    10,    11,    14,    22,    16,     9,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    12,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    20,     2,    21,     6,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    13,     8,    15,     2,     2,     2,     2,     2,
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
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
    23,    24,    25,    25,    25,    26,    26,    26,    26,    27,
    27,    28,    29,    29,    30,    30,    30,    30,    30,    30,
    30,    30,    30,    30,    30,    30,    31,    31,    32,    32,
    32,    32,    33,    33>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     2,     0,     2,     1,     1,     2,     3,     2,     1,     1,
     3,     2,     1,     2,     1,     2,     2,     2,     6,     5,
     4,     1,     1,     1,     3,     3,     3,     4,     1,     2,
     3,     4,     0,     2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<     2,
     0,     5,    15,    23,     0,    22,    33,     0,     0,     1,
     4,     9,     0,    10,    13,    24,     3,     0,     0,    29,
     0,     0,     8,     0,    12,     6,    14,    16,    17,    18,
     0,    34,    25,    26,     0,     0,    30,    27,    11,     7,
     0,    31,    28,     0,     0,    21,    32,     0,    20,    19,
     0,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    51,
     1,    10,    11,    12,    13,    14,    15,    16,    22,    18>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<-32768,
     0,-32768,-32768,-32768,    16,-32768,-32768,    16,     8,-32768,
-32768,    30,    16,    16,    17,-32768,-32768,     6,    -6,   -12,
    12,     1,-32768,    16,-32768,    33,    17,-32768,-32768,-32768,
    27,-32768,-32768,-32768,    41,     5,    23,-32768,    16,-32768,
    28,-32768,-32768,    43,    20,-32768,-32768,    32,-32768,-32768,
    48,    49,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<-32768,
-32768,-32768,    45,    -1,-32768,    29,   -14,-32768,    31,-32768>>, 0)
		end

	yyLast: INTEGER is 53

	yytable_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    27,
     2,    24,     3,    37,     4,     5,    19,    37,    32,    35,
    20,    26,    34,    21,    20,     6,     7,     8,     3,     9,
     4,    38,    33,    48,    27,    43,    28,    29,    30,    31,
    41,     6,     7,     8,    49,     9,    23,    24,    25,    40,
    24,    45,    46,    42,    44,    47,    50,    52,    53,    17,
     0,    36,    39>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    14,
     1,     8,     3,     3,     5,     6,     8,     3,     3,    22,
     3,    13,    19,     6,     3,    16,    17,    18,     3,    20,
     5,    21,    17,     4,    39,    21,    10,    11,    12,    13,
     4,    16,    17,    18,    15,    20,     7,     8,     9,     7,
     8,    14,    15,     3,    22,     3,    15,     0,     0,     5,
    -1,    21,    24>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 1 then
--#line 46 "lx_regexp_parser.y"

			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--#line 55 "lx_regexp_parser.y"

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
--#line 73 "lx_regexp_parser.y"

			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 4 then
--#line 77 "lx_regexp_parser.y"

			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 5 then
--#line 81 "lx_regexp_parser.y"

			error_handler.unrecognized_rule (filename, line_nb)
		

when 6 then
--#line 87 "lx_regexp_parser.y"

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 7 then
--#line 92 "lx_regexp_parser.y"

			error_handler.trailing_context_used_twice (filename, line_nb)
		

when 8 then
--#line 96 "lx_regexp_parser.y"

			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 9 then
--#line 100 "lx_regexp_parser.y"

			if has_trail_context then
				if variable_length and head_count = 0 then
						-- Both head and trail are variable-length.
					variable_trail_rule := True
				else
					trail_count := rule_length
				end
			end
		

when 11 then
--#line 114 "lx_regexp_parser.y"

			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		

when 12 then
--#line 121 "lx_regexp_parser.y"

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
--#line 142 "lx_regexp_parser.y"

			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		

when 15 then
--#line 148 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		

when 16 then
--#line 153 "lx_regexp_parser.y"

			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 17 then
--#line 158 "lx_regexp_parser.y"

			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 18 then
--#line 163 "lx_regexp_parser.y"

			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 19 then
--#line 168 "lx_regexp_parser.y"

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 20 then
--#line 174 "lx_regexp_parser.y"

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		

when 21 then
--#line 180 "lx_regexp_parser.y"

				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 22 then
--#line 188 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		

when 23 then
--#line 193 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 24 then
--#line 198 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 25 then
--#line 203 "lx_regexp_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 26 then
--#line 207 "lx_regexp_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 27 then
--#line 213 "lx_regexp_parser.y"

			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		

when 28 then
--#line 219 "lx_regexp_parser.y"

			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		

when 29 then
--#line 228 "lx_regexp_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		

when 30 then
--#line 233 "lx_regexp_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		

when 31 then
--#line 238 "lx_regexp_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		

when 32 then
--#line 244 "lx_regexp_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		

when 33 then
--#line 252 "lx_regexp_parser.y"

			yyval := new_epsilon_nfa
		

when 34 then
--#line 256 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

			else
				-- No action
			end
		end



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

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_regexp_scanner
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

invariant

	transitions_not_void: equiv_classes /= Void implies transitions /= Void

end -- class LX_REGEXP_PARSER
