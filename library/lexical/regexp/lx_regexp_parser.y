%{
indexing

	description:

		"Parsers for regular expressions";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_REGEXP_PARSER

inherit

	YY_PARSER [ANY]
		rename
			reset as reset_parser_skeleton
		redefine
			last_value, last_token
		end

	LX_REGEXP_SCANNER
		rename
			make as make_regexp_scanner,
			make_from_description as make_regexp_scanner_from_description,
			reset as reset_regexp_scanner
		redefine
			last_value, last_token
		end

	KL_FILE_ROUTINES
		export
			{NONE} all
		end

creation

	make, make_from_description

feature
%}

%token CHAR NUMBER EOF_OP CCL_OP

%start Regexp

%%

Regexp: Init_pattern Pattern
		{
			check_options
		}
	;

Init_pattern: -- /* empty */
		{
				-- Initialize for a parse of one pattern.
			has_trail_context := False
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			init_new_rule
		}
	;

Pattern: '^' Rule
		{
			process_bol_rule (dollar_nfa ($2))
		}
	| Rule
		{
			process_rule (dollar_nfa ($1))
		}
	| EOF_OP
		{
			process_eof_rule
		}
	| error
		{
			error_handler.unrecognized_rule (filename, line_nb)
		}
	;

Rule: Regular_expression2 Regular_expression
		{
			$$ := append_trail_context_to_regexp
				(dollar_nfa ($2), dollar_nfa ($1))
		}
	| Regular_expression2 Regular_expression '$'
		{
			error_handler.trailing_context_used_twice (filename, line_nb)
		}
	| Regular_expression '$'
		{
			$$ := append_eol_to_regexp (dollar_nfa ($1))
		}
	| Regular_expression
		{
			if has_trail_context then
				if variable_length and head_count = 0 then
						-- Both head and trail are variable-length.
					variable_trail_rule := True
				else
					trail_count := rule_length
				end
			end
		}
	;

Regular_expression: Series
	| Regular_expression '|' Series
		{
			variable_length := True
			$$ := dollar_nfa ($1) | dollar_nfa ($3)
		}
	;

Regular_expression2: Regular_expression '/'
		{
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
		}
	;

Series: Singleton
	| Series Singleton
		{
			$$ := dollar_nfa ($1) & dollar_nfa ($2)
		}
	;

Singleton: CHAR
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character (dollar_integer ($1))
		}
	| Singleton '*'
		{
			variable_length := True
			$$ := |*| dollar_nfa ($1)
		}
	| Singleton '+'
		{
			variable_length := True
			$$ := |+| dollar_nfa ($1)
		}
	| Singleton '?'
		{
			variable_length := True
			$$ := |?| dollar_nfa ($1)
		}
	| Singleton '{' NUMBER ',' NUMBER '}'
		{
			variable_length := True
			$$ := new_bounded_iteration_nfa
				(dollar_nfa ($1), dollar_integer ($3), dollar_integer ($5))
		}
	| Singleton '{' NUMBER ',' '}'
		{
			variable_length := True
			$$ := new_unbounded_iteration_nfa
				(dollar_nfa ($1), dollar_integer ($3))
		}
	| Singleton '{' NUMBER '}'
		{
				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			$$ := new_iteration_nfa (dollar_nfa ($1), dollar_integer ($3))
		}
	| '.'
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa (dot_character_class)
		}
	| CCL_OP
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa (dollar_symbol_class ($1))
		}
	| Full_CCl
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character_class (dollar_symbol_class ($1))
		}
	| '"' String '"'
		{
			$$ := $2
		}
	| '(' Regular_expression ')'
		{
			$$ := $2
		}
	;

Full_CCl: '[' CCl ']'
		{
			character_classes.force
				(dollar_symbol_class ($2), dollar_string ($1))
			$$ := $2
		}
	| '[' '^' CCl  ']'
		{
			dollar_symbol_class ($3).set_negated (True)
			character_classes.force
				(dollar_symbol_class ($3), dollar_string ($1))
			$$ := $3
		}
	;

CCl: CHAR
		{
			$$ := append_character_to_character_class
				(dollar_integer ($1), new_character_class)
		}
	| CCl CHAR
		{
			$$ := append_character_to_character_class
				(dollar_integer ($2), dollar_symbol_class ($1))
		}
	| CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class
				(dollar_integer ($1), dollar_integer ($3),
				new_character_class)
		}
	| CCl CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class
				(dollar_integer ($2), dollar_integer ($4),
				dollar_symbol_class ($1))
		}
	;
	
String: -- /* empty */
		{
			$$ := new_epsilon_nfa
		}
	| String CHAR
		{
			rule_length := rule_length + 1
			$$ := append_character_to_string
				(dollar_integer ($2), dollar_nfa ($1))
		}
	;

%%

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

	parse_file (a_file: like FILE_type) is
			-- Parse regular expression from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
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

	last_token: INTEGER
			-- Code of last token read

	last_value: ANY
			-- Last value read by `read_token'

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
				-- Add `a_state' to all non-exclusive start condition,
				-- including the default (INITIAL) start condition.
			start_conditions.add_state_to_non_exclusive (a_state)
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
				-- Add `a_state' to all non-exclusive start condition,
				-- including the default (INITIAL) start condition.
			start_conditions.add_bol_state_to_non_exclusive (a_state)
			if not bol_needed then
				bol_needed := True
			end
		end

	process_eof_rule is
			-- Process a "<<EOF>>" rule.
		require
			rule_not_void: rule /= Void
		do
--			if start_condition_stack.is_empty then
--					-- This EOF applies to all start conditions
--					-- which don't already have EOF actions.
--				start_condition_stack.append_non_eof_start_conditions
--					(start_conditions)
--				if start_condition_stack.is_empty then
--					error_handler.all_start_conditions_have_EOF
--						(filename, line_nb)
--				else
--					build_eof_action (start_condition_stack)
--				end
--			else
--				build_eof_action (start_condition_stack)
--			end
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

-- invariant
--
--	transitions_not_void: equiv_classes /= Void implies transitions /= Void
--
-- end -- class LX_REGEXP_PARSER
