indexing

	description:

		"Parsers for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_LEX_PARSER

inherit

	YY_PARSER [ANY]
		rename
			reset as reset_parser_skeleton
		redefine
			last_value, last_token
		end

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_value, last_token
		end

creation

	make, make_from_description

feature
--
--	Created	by ibyacc V1.0 from "lx_lex_parser.y"
--

	Token_CHAR: INTEGER is 257
	Token_NUMBER: INTEGER is 258
	Token_ENDSECT: INTEGER is 259
	Token_NAME: INTEGER is 260
	Token_EOF_OP: INTEGER is 261
	Token_CCL_OP: INTEGER is 262
	Token_EIF_CODE: INTEGER is 263
	Token_PIPED: INTEGER is 264
	Token_EMPTY: INTEGER is 265

-- line 342


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
			!UT_PRINTABLE_COMMAND_FACTORY! action_factory.make
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
			!UT_PRINTABLE_COMMAND_FACTORY! action_factory.make
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
			reset_lex_scanner
			reset_parser_skeleton
			pending_rules.wipe_out
			start_condition_stack.wipe_out
			default_rule := Void
			equiv_classes := Void
			transitions := Void
		end

feature -- Parsing

#ifndef ISE || HACT
	parse_file (a_file: FILE) is
#else
	parse_file (a_file: IO_MEDIUM) is
#endif
			-- Parse scanner description from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
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

	last_token: INTEGER
			-- Code of last token read

	last_value: ANY
			-- Last value read by `read_token'

	default_rule: like rule
			-- Default rule

	pending_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules which share the same semantic action

	start_condition_stack: LX_START_CONDITIONS
			-- Start condition containing
			-- the rule currently being parsed

	transitions: DS_ARRAYED_LIST [LX_SYMBOL_TRANSITION [LX_NFA_STATE]]
			-- Symbol transitions kept for later renumbering
			-- using equivalence classes

	action_factory: UT_COMMAND_FACTORY
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

	in_trail_context: BOOLEAN
			-- Is a trailing context being parsed?

feature -- Factory

	new_symbol_nfa (symbol: INTEGER): LX_NFA is
			-- New NFA made of two states and a
			-- symbol transition labeled `symbol'
		require
			rule_not_void: rule /= Void
		local
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
		do
			!! Result.make_symbol (symbol, rule, in_trail_context)
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
		require
			rule_not_void: rule /= Void
		do
			!! Result.make_epsilon (rule, in_trail_context)
		ensure
			nfa_not_void: Result /= Void
		end

	new_symbol_class_nfa (symbols: LX_SYMBOL_CLASS): LX_NFA is
			-- New NFA made of two states and a symbol
			-- class transition labeled `symbols'
		require
			symbols_not_void: symbols /= Void
			rule_not_void: rule /= Void
		do
			!! Result.make_symbol_class (symbols, rule, in_trail_context)
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
		require
			rule_not_void: rule /= Void
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

	init_new_rule is
			-- Initalize a new rule.
		local
			id: INTEGER
		do
			id := rules.count + 1
			if id > yyTrailing_mark then
					-- `yyTrailing_mark' and `yyTrailing_head_mark' are
					-- used to mark accepting ids as being special (i.e.
					-- part of a trailing context rule). As such, they
					-- implicitly limit the number of accepting ids (and
					-- hence the number of rules) because if there are
					-- too many rules the rule ids will go below these
					-- marks. Fortunately, this limit is large (10000)
					-- so unlikely to actually cause any problems.
				error_handler.too_many_rules (yyTrailing_mark)
			end
			!! rule.make (id)
			rule.set_line_nb (line_nb)
			rules.force_last (rule)
		ensure
			rule_not_void: rule /= Void
		end

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
			rule_not_void: rule /= Void
		local
			a_state: LX_NFA_STATE
		do
			a_nfa.set_accepting_id (rule.id)
			rule.set_trail_context
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

	process_bol_rule (a_nfa: LX_NFA) is
			-- Process a beginning-of-line rule.
		require
			a_nfa_not_void: a_nfa /= Void
			rule_not_void: rule /= Void
		local
			a_state: LX_NFA_STATE
		do
			a_nfa.set_accepting_id (rule.id)
			rule.set_trail_context
				(variable_trail_rule, head_count, trail_count)
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
			if not bol_needed then
				bol_needed := True
			end
		end

	process_eof_rule is
			-- Process a "<<EOF>>" rule.
		require
			rule_not_void: rule /= Void
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
			rule_not_void: rule /= Void
		local
			i, nb: INTEGER
			a_start_condition: LX_START_CONDITION
			sc: STRING
		do
			from
				a_start_condition := stack.first
				if a_start_condition.has_eof then
					sc := a_start_condition.name
					error_handler.multiple_EOF_rules (sc, filename, line_nb)
				else
					a_start_condition.set_has_eof (True)
						-- This is not a normal rule after all - don't
						-- count it as such, so we don't have any holes
						-- in the rule numbering.
					rules.remove_last
					rule.set_id (a_start_condition.id)
						-- Save `rule' as an end-of-file rule.
					eof_rules.force_last (rule)
				end
				i := 2
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
					rule := clone (rule)
					rule.set_id (a_start_condition.id)
						-- Save `rule' as an end-of-file rule.
					eof_rules.force_last (rule)
				end
				i := i + 1
			end
		end

	process_default_rule is
			-- Process default rule.
		require
			rule_not_void: rule /= Void
		local
			a_character_class: LX_SYMBOL_CLASS
			a_nfa: LX_NFA
			a_state: LX_NFA_STATE
		do
			!! a_character_class.make (0)
			a_character_class.set_negated (True)
			a_nfa := new_symbol_class_nfa (a_character_class)
				-- Remember the default rule so we don't generate
				-- "can't match" warnings for it.
			default_rule := rule
			a_nfa.set_accepting_id (rule.id)
			rule.set_trail_context (False, 0, 0)
			a_state := a_nfa.start_state
			start_conditions.add_state_to_all (a_state)
			if no_default_rule then
				set_action ("fatal_error (%"scanner jammed%")")
			else
				set_action ("echo")
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
			rule_not_void: rule /= Void
		do
			a_trail.set_beginning_as_normal
			in_trail_context := False
			if variable_length and head_count = 0 then
					-- Variable trailing context rule.
					-- Mark the first part of the rule as the accepting
					-- "head" part of a trailing context rule.
				a_regexp.set_accepting_id (rule.id + yyTrailing_head_mark)
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
			rule_not_void: rule /= Void
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
					a_regexp.set_accepting_id (rule.id + yyTrailing_head_mark)
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

	set_action (a_string: STRING) is
			-- Set pending rules' action using `a_string'.
		local
			i, nb: INTEGER
			action: UT_COMMAND
		do
			if action_factory.valid_argument (a_string) then
				action := action_factory.new_command (a_string)
				nb := pending_rules.count
				from i := 1 until i > nb loop
					pending_rules.item (i).set_action (action)
					i := i + 1
				end
				pending_rules.wipe_out
				rule.set_action (action)
			else
-- TO DO GOBO (Warning)
			end
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

-- invariant
--
--	pending_rules_not_void: pending_rules /= Void
--	no_void_pending_rule: not pending_rules.has (Void)
--	start_condition_stack_not_void: start_condition_stack /= Void
--	transitions_not_void: equiv_classes /= Void implies transitions /= Void
--	action_factory_not_void: action_factory /= Void
--
-- end -- class LX_LEX_PARSER

feature {NONE}

	yyreds: ARRAY[STRING] is
		once
			Result := <<
				"Scanner_description : Section1 Section2 Init_rule Section3",
				"Section1 : ENDSECT",
				"Section2 :",
				"Section2 : Section2 Start_condition Init_rule Pattern Action",
				"Section2 : Section2 Start_condition { Section2 }",
				"Action :",
				"Action : EIF_CODE",
				"Action : PIPED",
				"Action : EMPTY",
				"Init_rule :",
				"Start_condition :",
				"Start_condition : Less_than * >",
				"Start_condition : Less_than Name_list >",
				"Less_than : <",
				"Name_list : NAME",
				"Name_list : Name_list , NAME",
				"Name_list : error",
				"Pattern : ^ Rule",
				"Pattern : Rule",
				"Pattern : EOF_OP",
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
				"String : String CHAR",
				"Section3 :",
				"Section3 : ENDSECT",
				"Section3 : ENDSECT EIF_CODE" >>
		end -- yyreds

	yytoks: ARRAY[STRING] is
		once
			Result := <<
				"$end",
				"error",
				"CHAR",
				"NUMBER",
				"ENDSECT",
				"NAME",
				"EOF_OP",
				"CCL_OP",
				"EIF_CODE",
				"PIPED",
				"EMPTY",
				"{",
				"}",
				"*",
				">",
				"<",
				",",
				"^",
				"$",
				"|",
				"/",
				"+",
				"?",
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
				0,256,257,258,259,260,261,262,263,264,
				265,123,125,42,62,60,44,94,36,124,
				47,43,63,46,34,40,41,91,93,45,-1 >>
		end -- yytokv

	yyexca_m: ARRAY[INTEGER] is
		once
			Result := <<
				-1, 1,
					0, -1,
					-2, 0,
				-1, 4,
					0, 10,
					259, 10,
					-2, 11,
				0 >>
		end -- yyexca_m

	yylast: INTEGER is 241

	yyact_m: ARRAY[INTEGER] is
		once
			Result := << 
				  31,  31,  39,  40,  41,  17,  32,  32,  58,  75,
				  10,   3,  28,  28,  72,  65,  13,  62,  61,  55,
				  76,  73,  56,  69,  48,  49,  44,  77,   8,  64,
				  59,  12,  35,  37,  54,  26,   8,  46,  25,  24,
				  71,  68,  20,   4,  52,  50,   5,  30,  23,  14,
				   7,  36,  38,  11,  18,   6,  34,  33,  33,   9,
				  19,  47,  42,  43,   2,   1,   0,   0,   0,   0,
				   0,   0,  53,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,  60,   0,   0,   0,   0,   0,
				  67,   0,   0,  57,   0,   0,  47,   0,   0,   0,
				   0,   0,   0,   0,  70,  51,   0,   0,   0,   0,
				   0,   0,  45,   0,  45,   0,   0,   0,  45,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,  74,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,  66,  66,
				   0,   0,  56,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,  22,  27,  27,   0,   0,  21,  29,  29,
				  16,   0,   0,   0,  15,   0,   0,   0,   0,   0,
				  63 >>
		end -- yyact_m

	yypact_m: ARRAY[INTEGER] is
		once
			Result := << 
				-248,-1000,-1000,-1000, -24,-249, -92, -26,-1000,-1000,
				-258, -34,-1000, -30, -11,-1000,-1000,-1000,-261, -33,
				-1000,-1000,-1000, -33, -10, -33, -18,-1000,-1000,-1000,
				-1000,-1000, -33, -75, -32,-1000,-1000,-252,-1000,-1000,
				-1000,-1000,-1000,  -6,-1000, -33,-1000, -18,-1000,-1000,
				-1000,-240, -17, -12, -78,-235,  -4,-1000,-1000,-1000,
				 -33, -21,-1000,-1000,-1000,-1000,  -5, -79,-236,-116,
				-1000,-237,-1000,-1000, -98,-1000,-1000,-1000 >>
		end -- yypact_m

	yypgo_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,  65,  64,  43,  46,  59,  55,  54,  52,  50,
				  49,  42,  48,  39,  38,  35,  47,  44,  34 >>
		end -- yypgo_m

	yyr1_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   1,   2,   3,   3,   3,   8,   8,   8,   8,
				   4,   6,   6,   6,   9,  10,  10,  10,   7,   7,
				   7,   7,  11,  11,  11,  11,  13,  13,  12,  14,
				  14,  15,  15,  15,  15,  15,  15,  15,  15,  15,
				  15,  15,  15,  16,  16,  18,  18,  18,  18,  17,
				  17,   5,   5,   5 >>
		end -- yyr1_m

	yyr2_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   9,   3,   0,  11,  11,   0,   3,   3,   3,
				   1,   1,   7,   6,   3,   3,   7,   3,   5,   3,
				   3,   3,   5,   7,   5,   3,   2,   7,   5,   2,
				   5,   3,   5,   5,   5,  13,  11,   9,   3,   3,
				   3,   7,   7,   7,   9,   3,   5,   7,   9,   1,
				   5,   0,   2,   5 >>
		end -- yyr2_m

	yychk_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000,  -1,  -2, 259,  -3,  -4,  -6,  -9,  60,  -5,
				 259,  -4, 123,  42, -10, 260, 256, 263,  -7,  94,
				 -11, 261, 256, -12, -13, -14, -15, 257,  46, 262,
				 -16,  34,  40,  91,  -3,  62,  62,  44,  -8, 263,
				 264, 265, -11, -13,  36, 124,  47, -15,  42,  43,
				  63, 123, -17, -13, -18,  94, 257, 125, 260,  36,
				 -14, 258,  34, 257,  41,  93, 257, -18,  45,  44,
				 125,  45,  93, 257, 258, 125, 257, 125 >>
		end -- yychk_m

	yydef_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,  -2,   3,   2,  -2,  51,  10,   0,  14,   1,
				  52,   0,   3,   0,   0,  15,  17,  53,   6,   0,
				  19,  20,  21,   0,  25,  26,  29,  31,  38,  39,
				  40,  49,   0,   0,  11,  12,  13,   0,   4,   7,
				   8,   9,  18,  22,  24,   0,  28,  30,  32,  33,
				  34,   0,   0,   0,   0,   0,  45,   5,  16,  23,
				  27,   0,  41,  50,  42,  43,  46,   0,   0,   0,
				  37,   0,  44,  47,   0,  36,  48,  35 >>
		end -- yydef_m

	yy_do_action (yy_a, yy_n: INTEGER) is
			-- execute user action 'yy_a'
		do
			inspect
				yy_a

			when 1 then
				yy_do_default_action(yy_n)

-- line 50

			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
			when 2 then
				yy_do_default_action(yy_n)

-- line 60

			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
			end
		
			when 4 then
				yy_do_default_action(yy_n)

-- line 70

			start_condition_stack.keep_first (dollar_integer (yyvstack.item(-3)))
		
			when 5 then
				yy_do_default_action(yy_n)

-- line 74

			start_condition_stack.keep_first (dollar_integer (yyvstack.item(-3)))
		
			when 7 then
				yy_do_default_action(yy_n)

-- line 81

			set_action (dollar_string (yyvstack.item(-0)))
		
			when 8 then
				yy_do_default_action(yy_n)

-- line 85

			pending_rules.force_last (rule)
		
			when 9 then
				yy_do_default_action(yy_n)

-- line 89

			set_action ("")
		
			when 10 then
				yy_do_default_action(yy_n)

-- line 95

				-- Initialize for a parse of one rule.

			has_trail_context := False
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			init_new_rule
		
			when 11 then
				yy_do_default_action(yy_n)

-- line 109

			yyval := start_condition_stack.count
		
			when 12 then
				yy_do_default_action(yy_n)

-- line 113

			start_condition_stack.append_start_conditions (start_conditions)
		
			when 14 then
				yy_do_default_action(yy_n)

-- line 120

			yyval := start_condition_stack.count
		
			when 15 then
				yy_do_default_action(yy_n)

-- line 126

			push_start_condition (dollar_string (yyvstack.item(-0)), start_condition_stack)
		
			when 16 then
				yy_do_default_action(yy_n)

-- line 130

			push_start_condition (dollar_string (yyvstack.item(-0)), start_condition_stack)
		
			when 17 then
				yy_do_default_action(yy_n)

-- line 134

			error_handler.bad_start_condition_list (filename, line_nb)
		
			when 18 then
				yy_do_default_action(yy_n)

-- line 140

			process_bol_rule (dollar_nfa (yyvstack.item(-0)))
		
			when 19 then
				yy_do_default_action(yy_n)

-- line 144

			process_rule (dollar_nfa (yyvstack.item(-0)))
		
			when 20 then
				yy_do_default_action(yy_n)

-- line 148

			process_eof_rule
		
			when 21 then
				yy_do_default_action(yy_n)

-- line 152

			error_handler.unrecognized_rule (filename, line_nb)
		
			when 22 then
				yy_do_default_action(yy_n)

-- line 158

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvstack.item(-0)), dollar_nfa (yyvstack.item(-1)))
		
			when 23 then
				yy_do_default_action(yy_n)

-- line 163

			error_handler.trailing_context_used_twice (filename, line_nb)
		
			when 24 then
				yy_do_default_action(yy_n)

-- line 167

			yyval := append_eol_to_regexp (dollar_nfa (yyvstack.item(-1)))
		
			when 25 then
				yy_do_default_action(yy_n)

-- line 171

			if has_trail_context then
				if variable_length and head_count = 0 then
						-- Both head and trail are variable-length.

					variable_trail_rule := True
				else
					trail_count := rule_length
				end
			end
		
			when 27 then
				yy_do_default_action(yy_n)

-- line 185

			variable_length := True
			yyval := dollar_nfa (yyvstack.item(-2)) | dollar_nfa (yyvstack.item(-0))
		
			when 28 then
				yy_do_default_action(yy_n)

-- line 192

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
				yy_do_default_action(yy_n)

-- line 213

			yyval := dollar_nfa (yyvstack.item(-1)) & dollar_nfa (yyvstack.item(-0))
		
			when 31 then
				yy_do_default_action(yy_n)

-- line 219

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvstack.item(-0)))
		
			when 32 then
				yy_do_default_action(yy_n)

-- line 224

			variable_length := True
			yyval := |*| dollar_nfa (yyvstack.item(-1))
		
			when 33 then
				yy_do_default_action(yy_n)

-- line 229

			variable_length := True
			yyval := |+| dollar_nfa (yyvstack.item(-1))
		
			when 34 then
				yy_do_default_action(yy_n)

-- line 234

			variable_length := True
			yyval := |?| dollar_nfa (yyvstack.item(-1))
		
			when 35 then
				yy_do_default_action(yy_n)

-- line 239

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvstack.item(-5)), dollar_integer (yyvstack.item(-3)), dollar_integer (yyvstack.item(-1)))
		
			when 36 then
				yy_do_default_action(yy_n)

-- line 245

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvstack.item(-4)), dollar_integer (yyvstack.item(-2)))
		
			when 37 then
				yy_do_default_action(yy_n)

-- line 251

				-- The singleton could be something like "(foo)",

				-- in which case we have no idea what its length

				-- is, so we punt here.

			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvstack.item(-3)), dollar_integer (yyvstack.item(-1)))
		
			when 38 then
				yy_do_default_action(yy_n)

-- line 259

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		
			when 39 then
				yy_do_default_action(yy_n)

-- line 264

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvstack.item(-0)))
		
			when 40 then
				yy_do_default_action(yy_n)

-- line 269

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvstack.item(-0)))
		
			when 41 then
				yy_do_default_action(yy_n)

-- line 274

			yyval := yyvstack.item(-1)
		
			when 42 then
				yy_do_default_action(yy_n)

-- line 278

			yyval := yyvstack.item(-1)
		
			when 43 then
				yy_do_default_action(yy_n)

-- line 284

			character_classes.force
				(dollar_symbol_class (yyvstack.item(-1)), dollar_string (yyvstack.item(-2)))
			yyval := yyvstack.item(-1)
		
			when 44 then
				yy_do_default_action(yy_n)

-- line 290

			dollar_symbol_class (yyvstack.item(-1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvstack.item(-1)), dollar_string (yyvstack.item(-3)))
			yyval := yyvstack.item(-1)
		
			when 45 then
				yy_do_default_action(yy_n)

-- line 299

			yyval := append_character_to_character_class
				(dollar_integer (yyvstack.item(-0)), new_character_class)
		
			when 46 then
				yy_do_default_action(yy_n)

-- line 304

			yyval := append_character_to_character_class
				(dollar_integer (yyvstack.item(-0)), dollar_symbol_class (yyvstack.item(-1)))
		
			when 47 then
				yy_do_default_action(yy_n)

-- line 309

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvstack.item(-2)), dollar_integer (yyvstack.item(-0)),
				new_character_class)
		
			when 48 then
				yy_do_default_action(yy_n)

-- line 315

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvstack.item(-2)), dollar_integer (yyvstack.item(-0)),
				dollar_symbol_class (yyvstack.item(-3)))
		
			when 49 then
				yy_do_default_action(yy_n)

-- line 323

			yyval := new_epsilon_nfa
		
			when 50 then
				yy_do_default_action(yy_n)

-- line 327

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvstack.item(-0)), dollar_nfa (yyvstack.item(-1)))
		
			when 53 then
				yy_do_default_action(yy_n)

-- line 337

			eiffel_code := dollar_string (yyvstack.item(-0))
		
			else
			-- empty action
			end -- inspect action
		end -- yy_do_action
end -- class
