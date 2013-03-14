note

	description:

		"Parser skeletons for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class PR_YACC_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	PR_YACC_SCANNER_SKELETON
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
		end

	KL_IMPORTED_INTEGER_ROUTINES

feature {NONE} -- Initialization

	make (handler: like error_handler)
			-- Create a new grammar description parser.
		require
			handler_not_void: handler /= Void
		do
			make_yacc_scanner (handler)
			make_parser_skeleton
			create action_factory.make
			create last_grammar.make
			create terminal_symbols.make (Initial_max_nb_tokens)
			create nonterminal_symbols.make (Initial_max_nb_variables)
			create types.make (Initial_max_nb_types)
			create last_value_names.make (Initial_max_nb_types)
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			reset_yacc_scanner
			create last_grammar.make
			terminal_symbols.wipe_out
			nonterminal_symbols.wipe_out
			types.wipe_out
			last_value_names.wipe_out
			rule := Void
			precedence_token := Void
			start_symbol := Void
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse grammar description from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING)
			-- Parse grammar description from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Access

	last_grammar: PR_GRAMMAR
			-- Last grammar description parsed

	action_factory: PR_ACTION_FACTORY
			-- Semantic action factory

feature -- Setting

	set_action_factory (a_factory: like action_factory)
			-- Set `action_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			action_factory := a_factory
		ensure
			action_factory_set: action_factory = a_factory
		end

feature {NONE} -- Factory

	new_rule (lhs: PR_VARIABLE): PR_RULE
			-- New rule with `lhs' as left-hand-side
		require
			lhs_not_void: lhs /= Void
		local
			id: INTEGER
		do
			id := last_grammar.rules.count + 1
			create Result.make (id, lhs, No_action)
				-- Mark `lhs' has being derivable
				-- by this new rule.
			lhs.put_rule (Result)
		ensure
			rule_not_void: Result /= Void
			lhs_set: Result.lhs = lhs
			no_action: Result.action = No_action
		end

	new_terminal (a_name: STRING; a_type: PR_TYPE): PR_TOKEN
			-- Terminal symbol declared as:
			--   %token <a_type> a_name
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_not_void: a_type /= Void
		do
			if is_nonterminal (a_name) then
				report_token_declared_as_variable_error (a_name)
				Result := new_char_token ("'a'")
			else
				Result := new_token (a_name)
			end
			if Result.is_declared then
				report_token_declared_twice_error (a_name)
			else
				Result.set_declared
			end
			Result.set_type (a_type)
		ensure
			terminal_not_void: Result /= Void
			type_set: Result.type = a_type
		end

	new_char_terminal (a_char: STRING; a_type: PR_TYPE): PR_TOKEN
			-- Terminal symbol declared as:
			--   %token <a_type> a_char
		require
			a_char_not_void: a_char /= Void
--			valid_char: (\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\').recognizes (a_char)
			a_type_not_void: a_type /= Void
		do
			Result := new_char_token (a_char)
			if Result.is_declared then
				report_token_declared_twice_error (a_char)
			else
				Result.set_declared
			end
			Result.set_type (a_type)
		ensure
			terminal_not_void: Result /= Void
			type_set: Result.type = a_type
		end

	new_left_terminal (a_name: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %left a_name
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		do
			if is_nonterminal (a_name) then
				report_token_declared_as_variable_error (a_name)
				Result := new_char_token ("'a'")
			else
				Result := new_token (a_name)
			end
			Result.set_left_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_left_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_left_char_terminal (a_char: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %left a_char
		require
			a_char_not_void: a_char /= Void
--			valid_char: (\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\').recognizes (a_char)
		do
			Result := new_char_token (a_char)
			Result.set_left_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_left_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_right_terminal (a_name: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %right a_name
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		do
			if is_nonterminal (a_name) then
				report_token_declared_as_variable_error (a_name)
				Result := new_char_token ("'a'")
			else
				Result := new_token (a_name)
			end
			Result.set_right_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_right_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_right_char_terminal (a_char: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %right a_char
		require
			a_char_not_void: a_char /= Void
--			valid_char: (\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\').recognizes (a_char)
		do
			Result := new_char_token (a_char)
			Result.set_right_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_right_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_nonassoc_terminal (a_name: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %nonassoc a_name
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		do
			if is_nonterminal (a_name) then
				report_token_declared_as_variable_error (a_name)
				Result := new_char_token ("'a'")
			else
				Result := new_token (a_name)
			end
			Result.set_non_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_non_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_nonassoc_char_terminal (a_char: STRING; a_precedence: INTEGER): PR_TOKEN
			-- Terminal symbol declared as:
			--   %nonassoc a_char
		require
			a_char_not_void: a_char /= Void
--			valid_char: (\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\').recognizes (a_char)
		do
			Result := new_char_token (a_char)
			Result.set_non_associative
			set_precedence (Result, a_precedence)
		ensure
			terminal_not_void: Result /= Void
			associtivity_set: Result.is_non_associative
			precedence_set: Result.precedence = a_precedence
		end

	new_nonterminal (a_name: STRING; a_type: PR_TYPE): PR_VARIABLE
			-- Nonterminal symbol declared as:
			-- %type <a_type> a_name
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_not_void: a_type /= Void
		do
			if is_terminal (a_name) then
				report_variable_declared_as_token_error (a_name)
				Result := new_dummy_variable
			elseif is_nonterminal (a_name) then
				report_variable_declared_twice_error (a_name)
				Result := new_dummy_variable
			else
				Result := new_variable (a_name)
			end
			Result.set_type (a_type)
		ensure
			nonterminal_not_void: Result /= Void
			type_set: Result.type = a_type
		end

	new_token (a_name: STRING): PR_TOKEN
			-- Terminal symbol named `a_name';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of tokens of
			-- `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			is_terminal: not is_nonterminal (a_name)
		local
			lower_name: STRING
			an_id: INTEGER
		do
			lower_name := a_name.as_lower
			terminal_symbols.search (lower_name)
			if terminal_symbols.found then
				Result := terminal_symbols.found_item
			else
					-- Tokens are indexed from 0, but token
					-- of id 0 is reserved for EOF.
				an_id := last_grammar.tokens.count + 1
				create Result.make (an_id, a_name, Unknown_type)
				terminal_symbols.force_new (Result, lower_name)
				last_grammar.put_token (Result)
			end
		ensure
			token_not_void: Result /= Void
		end

	new_char_token (a_char: STRING): PR_TOKEN
			-- Terminal symbol associated with `a_char';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of tokens of
			-- `last_grammar'.
		require
			a_char_not_void: a_char /= Void
--			valid_char: (\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\').recognizes (a_char)
		local
			a_code: INTEGER
			a_key: STRING
			c: CHARACTER
			i, nb: INTEGER
			an_id: INTEGER
		do
			if a_char.count = 3 then
				a_code := a_char.item (2).code
			else
				c := a_char.item (3)
				inspect c
				when 'b' then
					a_code := Back_space_code
				when 'f' then
					a_code := Form_feed_code
				when 'n' then
					a_code := New_line_code
				when 'r' then
					a_code := Carriage_return_code
				when 't' then
					a_code := Tabulation_code
				when 'a' then
					a_code := 7
				when 'v' then
					a_code := 13
				when '0' .. '7' then
						-- Octal.
					nb := a_char.count - 1
					a_code := 0
					from
						i := 3
					until
						i > nb
					loop
						a_code := a_code * 8 + a_char.item (i).code - Zero_code
						i := i + 1
					end
				when 'x', 'X' then
					nb := a_char.count - 1
					if nb = 3 then
						a_code := c.code
					else
							-- Hexadecimal.
						a_code := 0
						from
							i := 4
						until
							i > nb
						loop
							a_code := a_code * 16
							c := a_char.item (i)
							inspect c
							when '0' .. '9' then
								a_code := a_code + c.code - Zero_code
							when 'a' .. 'z' then
								a_code := a_code + c.code - Lower_a_code + 10
							when 'A' .. 'Z' then
								a_code := a_code + c.code - Upper_a_code + 10
							end
							i := i + 1
						end
					end
				else
					a_code := c.code
				end
			end
			a_key := a_code.out
			terminal_symbols.search (a_key)
			if terminal_symbols.found then
				Result := terminal_symbols.found_item
			else
					-- Tokens are indexed from 0, but token
					-- of id 0 is reserved for EOF.
				an_id := last_grammar.tokens.count + 1
				create Result.make (an_id, a_char, Unknown_type)
				Result.set_token_id (a_code)
				terminal_symbols.force_new (Result, a_key)
				last_grammar.put_token (Result)
			end
		ensure
			token_not_void: Result /= Void
		end

	new_string_token (a_string: STRING): PR_TOKEN
			-- Terminal symbol associated with `a_string';
			-- Report an error if there is no token associated
			-- with this string.
		require
			a_string_not_void: a_string /= Void
--			valid_string: (\"[^"\n]*\").recognizes (a_string)
		local
			an_id: INTEGER
		do
			terminal_symbols.search (a_string)
			if terminal_symbols.found then
				Result := terminal_symbols.found_item
			else
				report_undefined_string_token_error (a_string)
					-- Tokens are indexed from 0, but token
					-- of id 0 is reserved for EOF.
				an_id := last_grammar.tokens.count + 1
				create Result.make (an_id, a_string, Unknown_type)
				Result.set_literal_string (a_string)
				terminal_symbols.force_new (Result, a_string)
				last_grammar.put_token (Result)
			end
		ensure
			token_not_void: Result /= Void
		end

	new_variable (a_name: STRING): PR_VARIABLE
			-- Nonterminal symbol named `a_name';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of variables
			-- of `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			is_nonterminal: not is_terminal (a_name)
		local
			lower_name: STRING
			an_id: INTEGER
		do
			lower_name := a_name.as_lower
			nonterminal_symbols.search (lower_name)
			if nonterminal_symbols.found then
				Result := nonterminal_symbols.found_item
			else
					-- Variables are indexed from 0.
				an_id := last_grammar.variables.count
				create Result.make (an_id, a_name, Unknown_type)
				nonterminal_symbols.force_new (Result, lower_name)
				last_grammar.put_variable (Result)
			end
		ensure
			variable_not_void: Result /= Void
		end

	new_dummy_variable: PR_VARIABLE
			-- New dummy nonterminal symbol used for mid-rule
			-- semantic actions (Use unique symbol names.)
		local
			a_name: STRING
			an_id: INTEGER
		do
			create a_name.make (10)
			a_name.append_character ('@')
			INTEGER_.append_decimal_integer (nonterminal_symbols.count, a_name)
				-- Variables are indexed from 0.
			an_id := last_grammar.variables.count
			create Result.make (an_id, a_name, Unknown_type)
			nonterminal_symbols.force (Result, a_name)
			last_grammar.put_variable (Result)
		ensure
			dummy_variable_not_void: Result /= Void
		end

	new_symbol (a_name: STRING): PR_SYMBOL
			-- Symbol named `a_name'; Create a new nonterminal
			-- symbol if it does not exist yet, and add it to
			-- the list of variables of `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
		local
			lower_name: STRING
			a_variable: PR_VARIABLE
			an_id: INTEGER
		do
			lower_name := a_name.as_lower
			nonterminal_symbols.search (lower_name)
			if nonterminal_symbols.found then
				Result := nonterminal_symbols.found_item
			elseif terminal_symbols.has (lower_name) then
				Result := terminal_symbols.item (lower_name)
			else
					-- Variables are indexed from 0.
				an_id := last_grammar.variables.count
				create a_variable.make (an_id, a_name, Unknown_type)
				nonterminal_symbols.force_new (a_variable, lower_name)
				last_grammar.put_variable (a_variable)
				Result := a_variable
			end
		ensure
			symbol_not_void: Result /= Void
		end

	new_type (a_type_mark: STRING; a_name: STRING): PR_TYPE
			-- Type named `a_name'; Create a new type if
			-- it does not exist yet.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			upper_name: STRING
			an_id: INTEGER
		do
			if a_type_mark /= Void then
				create upper_name.make (a_type_mark.count + a_name.count + 1)
				upper_name.append_string (a_type_mark.as_upper)
				upper_name.append_character (' ')
				upper_name.append_string (a_name.as_upper)
			else
				upper_name := a_name.as_upper
			end
			types.search (upper_name)
			if types.found then
				Result := types.found_item
			else
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create Result.make (an_id, a_type_mark, a_name)
				types.force_new (Result, upper_name)
				last_grammar.put_type (Result)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_basic_type (a_type_mark: STRING; a_name: STRING): PR_TYPE
			-- Basic type named `a_name'; Create a new type if
			-- it does not exist yet.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			upper_name: STRING
			an_id: INTEGER
		do
			if a_type_mark /= Void then
				create upper_name.make (a_type_mark.count + a_name.count + 1)
				upper_name.append_string (a_type_mark.as_upper)
				upper_name.append_character (' ')
				upper_name.append_string (a_name.as_upper)
			else
				upper_name := a_name.as_upper
			end
			types.search (upper_name)
			if types.found then
				Result := types.found_item
			else
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create {PR_BASIC_TYPE} Result.make (an_id, a_type_mark, a_name)
				types.force_new (Result, upper_name)
				last_grammar.put_type (Result)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_generic_type (a_type_mark: STRING; a_name: STRING; generics: DS_ARRAYED_LIST [PR_TYPE]): PR_TYPE
			-- Type named `a_name' with generic parameters `generics';
			-- Create a new type if it does not exist yet.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			valid_generics: generics /= Void implies not generics.has_void
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			upper_name: STRING
			an_id: INTEGER
		do
			if generics /= Void then
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create Result.make_generic (an_id, a_type_mark, a_name, generics)
				upper_name := Result.name.as_upper
				types.search (upper_name)
				if types.found then
					Result := types.found_item
				else
					types.force_new (Result, upper_name)
					last_grammar.put_type (Result)
				end
			else
				Result := new_type (a_type_mark, a_name)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_labeled_tuple_type (a_type_mark: STRING; a_name: STRING; generics: DS_ARRAYED_LIST [PR_LABELED_TYPE]): PR_TYPE
			-- Labeled Tuple type named `a_name' with generic parameters `generics';
			-- Create a new type if it does not exist yet.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			valid_generics: generics /= Void implies not generics.has_void
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			upper_name: STRING
			an_id: INTEGER
		do
			if generics /= Void then
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create Result.make_labeled_tuple (an_id, a_type_mark, a_name, generics)
				upper_name := Result.name.as_upper
				types.search (upper_name)
				if types.found then
					Result := types.found_item
				else
					types.force_new (Result, upper_name)
					last_grammar.put_type (Result)
				end
			else
				Result := new_type (a_type_mark, a_name)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_anchored_type (a_type_mark: STRING; a_name: STRING): PR_TYPE
			-- Anchored type of the form "like `a_name'";
			-- Create a new type if it does not exist yet.
		require
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			lower_name: STRING
			an_id: INTEGER
		do
			if a_type_mark /= Void then
				create lower_name.make (a_type_mark.count + a_name.count + 1)
				lower_name.append_string (a_type_mark.as_lower)
				lower_name.append_character (' ')
				lower_name.append_string (a_name.as_lower)
			else
				lower_name := a_name.as_lower
			end
			types.search (lower_name)
			if types.found then
				Result := types.found_item
			else
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create Result.make_anchored (an_id, a_type_mark, a_name)
				types.force_new (Result, lower_name)
				last_grammar.put_type (Result)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_like_current_type (a_type_mark: STRING): PR_TYPE
			-- Anchored type of the form "like Current";
			-- Create a new type if it does not exist yet.
		require
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			lower_name: STRING
			an_id: INTEGER
		do
			if a_type_mark /= Void then
				create lower_name.make (a_type_mark.count + 13)
				lower_name.append_string (a_type_mark.as_lower)
				lower_name.append_character (' ')
				lower_name.append_string (like_current_lower_name)
			else
				lower_name := like_current_lower_name
			end
			types.search (lower_name)
			if types.found then
				Result := types.found_item
			else
					-- Types are indexed from 1.
					-- (0 used to be reserved for no-type)
				an_id := last_grammar.types.count + 1
				create Result.make_like_current (an_id, a_type_mark)
				types.force_new (Result, lower_name)
				last_grammar.put_type (Result)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_qualified_anchored_type (a_type_mark: STRING; a_type: PR_TYPE; a_name: STRING): PR_TYPE
			-- Qualified anchored type of the form "like {`a_type'}`a_name'";
			-- Create a new type if it does not exist yet.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
			a_name_long_enough: a_name.count > 0
			a_type_mark_not_empty: a_type_mark /= Void implies not a_type_mark.is_empty
		local
			lower_name: STRING
			an_id: INTEGER
		do
				-- Types are indexed from 1.
				-- (0 used to be reserved for no-type)
			an_id := last_grammar.types.count + 1
			create Result.make_qualified_anchored (an_id, a_type_mark, a_type, a_name)
			lower_name := Result.name.as_lower
			types.search (lower_name)
			if types.found then
				Result := types.found_item
			else
				types.force_new (Result, lower_name)
				last_grammar.put_type (Result)
			end
		ensure
			type_not_void: Result /= Void
		end

	new_labeled_type (a_label: STRING; a_type: PR_TYPE): PR_LABELED_TYPE
			-- New labeled type
		require
			a_label_not_void: a_label /= Void
			a_type_not_void: a_type /= Void
		local
			l_labels: DS_ARRAYED_LIST [STRING]
		do
			create l_labels.make (5)
			l_labels.put_first (a_label)
			create Result.make (l_labels, a_type)
		ensure
			type_not_void: Result /= Void
			labels_set: Result.labels.first = a_label
			type_set: Result.type = a_type
		end

	new_action (a_text: STRING): DP_COMMAND
			-- Action associated with `a_text'
		require
			a_text_not_void: a_text /= Void
		do
			Result := action_factory.new_action (a_text)
		ensure
			action_not_void: Result /= Void
		end

	new_error_action (a_text: STRING; a_line: INTEGER): PR_ERROR_ACTION
			-- Error action associated with `a_text'
		require
			a_text_not_void: a_text /= Void
		do
			create Result.make (action_factory.new_action (a_text), a_line)
		ensure
			action_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	initialize_grammar
			-- Initialize input grammar.
		local
			a_token: PR_TOKEN
			a_type: PR_TYPE
		do
				-- Make sure ANY is the first type in grammar.
			a_type := new_type (Void, "ANY")
				-- Error token. The token id value 256
				-- is specified by POSIX.
			a_token := new_token ("error")
			a_token.set_token_id (256)
			a_token.set_useful (True)
				-- Token that represents all undefined
				-- literal tokens. It is always the
				-- second token on the grammar.
			a_token := new_token ("$undefined.")
			a_token.set_useful (True)
		end

	put_rule (a_rule: PR_RULE)
			-- Add `a_rule' to `last_grammar'.
		require
			a_rule_not_void: a_rule /= Void
		do
			last_grammar.put_rule (a_rule)
		end

	put_symbol (rhs: PR_SYMBOL; a_rule: PR_RULE)
			-- Add `rhs' to the right-hand-side part of `a_rule'.
		require
			rhs_not_void: rhs /= Void
			a_rule_not_void: a_rule /= Void
		local
			dummy_rule: PR_RULE
			dummy_variable: PR_VARIABLE
		do
			if a_rule.action /= No_action then
					-- A mid-rule action has been detected.
				dummy_variable := new_dummy_variable
				dummy_variable.set_type (a_rule.lhs.type)
				dummy_rule := new_rule (dummy_variable)
				dummy_rule.set_action (a_rule.action)
				dummy_rule.set_line_nb (a_rule.line_nb)
				put_rule (dummy_rule)
				a_rule.put_symbol (dummy_variable)
				a_rule.set_action (No_action)
			end
			a_rule.put_symbol (rhs)
		ensure
			inserted: a_rule.rhs.last = rhs
		end

	put_action (an_action: DP_COMMAND; a_rule: PR_RULE)
			-- Set semantic action of `a_rule' to `an_action'.
		require
			an_action_not_void: an_action /= Void
			a_rule_not_void: a_rule /= Void
		local
			dummy_rule: PR_RULE
			dummy_variable: PR_VARIABLE
		do
			if a_rule.action /= No_action then
					-- A mid-rule action has been detected.
				dummy_variable := new_dummy_variable
				dummy_variable.set_type (a_rule.lhs.type)
				dummy_rule := new_rule (dummy_variable)
				dummy_rule.set_action (a_rule.action)
				dummy_rule.set_line_nb (a_rule.line_nb)
				put_rule (dummy_rule)
				a_rule.put_symbol (dummy_variable)
			end
			a_rule.set_action (an_action)
		ensure
			inserted: a_rule.action = an_action
		end

	put_error_action (an_action: PR_ERROR_ACTION; i: INTEGER; a_rule: PR_RULE)
			-- Set syntax error action associated with `i'-th
			-- symbol in `a_rule' to `an_action'.
		require
			a_rule_not_void: a_rule /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= a_rule.error_actions.count
		do
			a_rule.set_error_action (an_action, i)
		ensure
			inserted: a_rule.error_actions.item (i) = an_action
		end

	set_start_symbol
			-- Set the start symbol of `last_grammar'.
		local
			a_symbol: PR_VARIABLE
			a_name: STRING
		do
			if start_symbol /= Void then
				a_name := start_symbol.first
				if is_terminal (a_name) then
					report_start_symbol_token_error
				elseif not is_nonterminal (a_name) then
					report_unknown_start_symbol_error
				else
					a_symbol := new_variable (a_name)
					last_grammar.set_start_symbol (a_symbol)
				end
				start_symbol := Void
			elseif not last_grammar.rules.is_empty then
				a_symbol := last_grammar.rules.first.lhs
				last_grammar.set_start_symbol (a_symbol)
			end
		end

	set_precedence (a_token: PR_TOKEN; a_precedence: INTEGER)
			-- Set precedence of `a_token' to `a_precedence'.
		require
			a_token_not_void: a_token /= Void
		do
			if a_token.has_precedence then
				report_precedence_defined_twice_error (a_token.name)
			end
			a_token.set_precedence (a_precedence)
		ensure
			precedence_set: a_token.precedence = a_precedence
		end

	set_alias_name (a_type: PR_TYPE; a_name: STRING)
			-- Set alias name of `a_type' to `a_name'.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		local
			l_old_alias_name: STRING
			l_last_value_name: STRING
			l_no_type: PR_TYPE
		do
			l_old_alias_name := a_type.alias_name
			if l_old_alias_name /= Void then
				if not STRING_.same_case_insensitive (l_old_alias_name, a_name) then
					if l_old_alias_name.is_empty then
						report_alias_name_not_defined_error (a_type, a_name)
					else
						report_alias_name_defined_twice_error (a_type, l_old_alias_name, a_name)
					end
				end
			else
				a_type.set_alias_name (a_name)
				l_no_type := No_type
				l_last_value_name := a_type.last_value_name
				last_value_names.search (l_last_value_name)
				if last_value_names.found then
					report_last_value_name_used_twice_error (l_last_value_name, last_value_names.found_item, a_type)
				elseif a_type /= l_no_type and then l_no_type.last_value_name.same_string (l_last_value_name) then
					report_last_value_name_used_twice_error (l_last_value_name, l_no_type, a_type)
				else
					last_value_names.force_last_new (a_type, l_last_value_name)
				end
			end
		end

	set_no_alias_name (a_type: PR_TYPE)
			-- Set no alias name to `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			l_old_alias_name: STRING
			l_last_value_name: STRING
			l_no_type: PR_TYPE
		do
			l_old_alias_name := a_type.alias_name
			if l_old_alias_name /= Void then
				if not l_old_alias_name.is_empty then
					report_alias_name_undefined_error (a_type, l_old_alias_name)
				end
			else
				a_type.set_alias_name ("")
				l_no_type := No_type
				l_last_value_name := a_type.last_value_name
				last_value_names.search (l_last_value_name)
				if last_value_names.found then
					report_last_value_name_used_twice_error (l_last_value_name, last_value_names.found_item, a_type)
				elseif a_type /= l_no_type and then l_no_type.last_value_name.same_string (l_last_value_name) then
					report_last_value_name_used_twice_error (l_last_value_name, l_no_type, a_type)
				else
					last_value_names.force_last_new (a_type, l_last_value_name)
				end
			end
		end

	set_token_id (a_token: PR_TOKEN; an_id: INTEGER)
			-- Set `token_id' of `a_token' to `an_id'.
		require
			a_token_not_void: a_token /= Void
			an_id_positive: an_id > 0
		do
			if a_token.has_token_id and then a_token.token_id /= an_id then
				report_two_token_ids_token_error (a_token.name, a_token.token_id, an_id)
			end
			a_token.set_token_id (an_id)
		ensure
			token_id_set: a_token.token_id = an_id
		end

	set_literal_string (a_token: PR_TOKEN; a_string: STRING)
			-- Set `literal_string' of `a_token' to `a_string'.
		require
			a_token_not_void: a_token /= Void
			a_string_not_void: a_string /= Void
--			valid_string: (\"[^"\n]*\").recognizes (a_string)
		do
			if a_token.literal_string /= Void and then not a_token.literal_string.is_equal (a_string) then
				report_two_strings_token_error (a_token.name, a_token.literal_string, a_string)
			elseif terminal_symbols.has (a_string) and then terminal_symbols.item (a_string) /= a_token then
				report_string_token_defined_twice_error (a_string, terminal_symbols.item (a_string).name, a_token.name)
			end
			a_token.set_literal_string (a_string)
			terminal_symbols.force (a_token, a_string)
		ensure
			literal_string_set: a_token.literal_string = a_string
		end

	process_rule (a_rule: PR_RULE)
			-- Set associativity and precedence of `a_rule'.
			-- Use `precedence_token' (%prec) or the last token
			-- specified in the right-hand-side of the rule.
		require
			a_rule_not_void: a_rule /= Void
		local
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			a_token: PR_TOKEN
			i: INTEGER
		do
			if precedence_token /= Void then
				a_token := precedence_token
				a_token.set_useful (True)
			else
				from
					rhs := a_rule.rhs
					i := rhs.count
				until
					i < 1 or a_token /= Void
				loop
					if attached {PR_TOKEN} rhs.item (i) as l_token then
						a_token := l_token
					end
					i := i - 1
				end
			end
			if a_token /= Void then
				if a_token.is_left_associative then
					a_rule.set_left_associative
				elseif a_token.is_right_associative then
					a_rule.set_right_associative
				elseif a_token.is_non_associative then
					a_rule.set_non_associative
				end
				a_rule.set_precedence (a_token.precedence)
			end
		end

	process_symbols
			-- Assign ids to symbols and report any
			-- undefined symbol error.
		local
			last_token_id: INTEGER
			i, nb: INTEGER
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
			variables: DS_ARRAYED_LIST [PR_VARIABLE]
			a_variable: PR_VARIABLE
			max_token_id: INTEGER
			translate: ARRAY [detachable PR_TOKEN]
		do
			tokens := last_grammar.tokens
			last_token_id := 256
			nb := tokens.count
			from
				i := 1
			until
				i > nb
			loop
				a_token := tokens.item (i)
				if not a_token.has_token_id then
					last_token_id := last_token_id + 1
					a_token.set_token_id (last_token_id)
				end
				if a_token.token_id > max_token_id then
					max_token_id := a_token.token_id
				end
				i := i + 1
			end
			create translate.make_filled (Void, 0, max_token_id)
			from
				i := 1
			until
				i > nb
			loop
				a_token := tokens.item (i)
				if translate.item (a_token.token_id) /= Void then
					report_token_id_used_twice_warning (translate.item (a_token.token_id), a_token)
				else
					translate.put (a_token, a_token.token_id)
				end
				i := i + 1
			end
			variables := last_grammar.variables
			nb := variables.count
			from
				i := 1
			until
				i > nb
			loop
				a_variable := variables.item (i)
				if a_variable.rules.is_empty then
					report_undefined_symbol_error (a_variable.name)
				end
				i := i + 1
			end
		end

feature {NONE} -- Access

	precedence: INTEGER
			-- Precedence level of operators

	precedence_token: PR_TOKEN
			-- %prec token used to set the precedence level
			-- and associativity of the rule being parsed

	type: PR_TYPE
			-- Temporary variable

	start_symbol: DS_PAIR [STRING, INTEGER]
			-- Name and line number of the start symbol
			-- declared by %start

	terminal_symbols: DS_HASH_TABLE [PR_TOKEN, STRING]
			-- Terminal symbols already created so far
			-- indexed by symbol names in lowercase

	nonterminal_symbols: DS_HASH_TABLE [PR_VARIABLE, STRING]
			-- Nonterminal symbols already created so far
			-- indexed by symbol names in lowercase

	types: DS_HASH_TABLE [PR_TYPE, STRING]
			-- Types already created so far indexed
			-- by type names in uppercase (or in lowercase in case of anchored types)

	last_value_names: DS_HASH_TABLE [PR_TYPE, STRING]
			-- Types indexed by their 'last_value_name'

feature {NONE} -- Status report

	is_terminal (a_name: STRING): BOOLEAN
			-- Is there a terminal symbol named `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			lower_name: STRING
		do
			lower_name := a_name.as_lower
			Result := terminal_symbols.has (lower_name)
		end

	is_nonterminal (a_name: STRING): BOOLEAN
			-- Is there a nonterminal symbol named `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			lower_name: STRING
		do
			lower_name := a_name.as_lower
			Result := nonterminal_symbols.has (lower_name)
		end

feature {NONE} -- Error handling

	report_error (a_message: STRING)
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure then
			not_successful: not successful
		end

	report_alias_name_defined_twice_error (a_type: PR_TYPE; a_old_alias_name, a_new_alias_name: STRING)
			-- Report that the alias name for token type `a_type' has been defined twice.
			-- The same alias name should be repeated in each %token declaration with a given type.
		require
			a_type_not_void: a_type /= Void
			a_old_alias_name_not_void: a_old_alias_name /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
		local
			an_error: PR_ALIAS_NAME_DEFINED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_type, a_old_alias_name, a_new_alias_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_alias_name_not_defined_error (a_type: PR_TYPE; a_new_alias_name: STRING)
			-- Report that the alias name for token type `a_type',
			-- which was not defined so far, is now being defined as `a_new_alias_name'.
			-- The alias name should be repeated in each %token declaration with a given type.
		require
			a_type_not_void: a_type /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
		local
			an_error: PR_ALIAS_NAME_NOT_DEFINED_ERROR
		do
			create an_error.make (filename, line_nb, a_type, a_new_alias_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_alias_name_undefined_error (a_type: PR_TYPE; a_old_alias_name: STRING)
			-- Report that the alias name for token type `a_type',
			-- which was defined as `a_old_alias_name', is being undefined.
			-- The alias name should be repeated in each %token declaration with a given type.
		require
			filename_not_void: filename /= Void
			a_type_not_void: a_type /= Void
			a_old_alias_name_not_void: a_old_alias_name /= Void
		local
			an_error: PR_ALIAS_NAME_UNDEFINED_ERROR
		do
			create an_error.make (filename, line_nb, a_type, a_old_alias_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_last_value_name_used_twice_error (a_last_value_name: STRING; a_type1, a_type2: PR_TYPE)
			-- Report that `a_last_value_name' is the name of the variable
			-- used to pass values for tokens both of type `a_type1' and `a_type2'.
		require
			a_last_value_name_not_void: a_last_value_name /= Void
			a_type1_not_void: a_type1 /= Void
			a_type2_not_void: a_type2 /= Void
		local
			an_error: PR_LAST_VALUE_NAME_USED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_last_value_name, a_type1, a_type2)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_start_symbol_token_error
			-- Report that `start_symbol' is a token
			-- instead of a nonterminal symbol.
		require
			start_symbol_not_void: start_symbol /= Void
		local
			an_error: PR_START_SYMBOL_TOKEN_ERROR
			a_name: STRING
			a_line: INTEGER
		do
			a_name := start_symbol.first
			a_line := start_symbol.second
			create an_error.make (filename, a_line, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_unknown_start_symbol_error
			-- Report that `start_symbol' has not been declared.
		require
			start_symbol_not_void: start_symbol /= Void
		local
			an_error: PR_UNKNOWN_START_SYMBOL_ERROR
			a_name: STRING
			a_line: INTEGER
		do
			a_name := start_symbol.first
			a_line := start_symbol.second
			create an_error.make (filename, a_line, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_lhs_symbol_token_error (a_name: STRING)
			-- Report that the left-hand-side symbol `a_name'
			-- is a token instead of a nonterminal symbol.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_LHS_SYMBOL_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_multiple_start_declarations_error
			-- Report multiple %start declarations.
		local
			an_error: PR_MULTIPLE_START_DECLARATIONS_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_precedence_defined_twice_error (a_name: STRING)
			-- Report multiple precedence definition
			-- for token `a_name'.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_PRECEDENCE_DEFINED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_prec_specified_twice_error
			-- Report that %prec has been specified twice
			-- in the same rule.
		local
			an_error: PR_PREC_SPECIFIED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_prec_not_token_error (a_name: STRING)
			-- Report that the symbol `a_name' specified
			-- in the %prec clause is not a token.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_PREC_NOT_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_invalid_error_n_error (n: INTEGER)
			-- Report that %error(`n') has been used in a rule but `n'
			-- is not a valid index for the rhs of the corresponding rule.
		local
			an_error: PR_INVALID_ERROR_N_ERROR
		do
			create an_error.make (filename, line_nb, n)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_token_declared_twice_error (a_name: STRING)
			-- Report that the token `a_name' has been
			-- declared twice.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_TOKEN_DECLARED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_variable_declared_twice_error (a_name: STRING)
			-- Report that the variable `a_name' has been
			-- declared twice.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_VARIABLE_DECLARED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_variable_declared_as_token_error (a_name: STRING)
			-- Report that the variable `a_name' has already
			-- been declared as a token.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_SYMBOL_DECLARED_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_token_declared_as_variable_error (a_name: STRING)
			-- Report that the token `a_name' has already
			-- been declared as a variable.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_SYMBOL_DECLARED_VARIABLE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_no_rules_error
			-- Report that no rules has been specified
			-- in the input grammar.
		local
			an_error: PR_NO_RULES_ERROR
		do
			create an_error.make (filename)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_undefined_symbol_error (a_name: STRING)
			-- Report that the symbol `a_name' has not
			-- been defined as a token or in a rule.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_UNDEFINED_SYMBOL_ERROR
		do
			create an_error.make (filename, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_undefined_string_token_error (a_string: STRING)
			-- Report that the literal `a_string' has not
			-- been defined as a token.
		require
			a_string_not_void: a_string /= Void
		local
			an_error: PR_UNDEFINED_STRING_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_string)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_string_token_defined_twice_error (a_string: STRING; token1, token2: STRING)
			-- Report that the literal `a_string' has
			-- been defined twice.
		require
			a_string_not_void: a_string /= Void
			token1_not_void: token1 /= Void
			token2_not_void: token2 /= Void
		local
			an_error: PR_STRING_TOKEN_DEFINED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_string, token1, token2)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_two_strings_token_error (a_token: STRING; string1, string2: STRING)
			-- Report that the token `a_token' has been
			-- associated with two different literal strings.
		require
			a_token_not_void: a_token /= Void
			string1_not_void: string1 /= Void
			string2_not_void: string2 /= Void
		local
			an_error: PR_TWO_STRINGS_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_token, string1, string2)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_two_token_ids_token_error (a_token: STRING; id1, id2: INTEGER)
			-- Report that the token `a_token' has been
			-- given two different token ids.
		require
			a_token_not_void: a_token /= Void
		local
			an_error: PR_TWO_TOKEN_IDS_TOKEN_ERROR
		do
			create an_error.make (filename, line_nb, a_token, id1, id2)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_rule_declared_twice_warning (a_name: STRING)
			-- Report that the rule `a_name' has been
			-- declared twice.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_RULE_DECLARED_TWICE_ERROR
		do
			create an_error.make (filename, line_nb, a_name)
			error_handler.report_warning (an_error)
		end

	report_token_id_used_twice_warning (token1, token2: PR_TOKEN)
			-- Report that `token1' and `token2' have been
			-- assigned the same token id.
		require
			token1_not_void: token1 /= Void
			token2_not_void: token2 /= Void
		local
			an_error: PR_TOKEN_ID_USED_TWICE_ERROR
		do
			create an_error.make (filename, token1.name, token2.name, token1.token_id)
			error_handler.report_warning (an_error)
		end

feature {NONE} -- Constants

	Initial_max_nb_tokens: INTEGER = 100
			-- Initial maximum number of terminal symbols

	Initial_max_nb_variables: INTEGER = 300
			-- Initial maximum number of nonterminal symbols

	Initial_max_nb_types: INTEGER = 300
			-- Initial maximum number of types

	like_current_lower_name: STRING = "like current"
			-- Type name for 'like Current', in lower-case

	No_action: DP_COMMAND
			-- Do nothing semantic action
		once
			Result := action_factory.new_action ("")
		ensure
			no_action_not_void: Result /= Void
		end

	No_type: PR_TYPE
			-- Type used when no type has been specified:
			--   %token token_name
		do
			Result := new_type (Void, "ANY")
		ensure
			no_type_not_void: Result /= Void
		end

	Unknown_type: PR_TYPE
			-- Type used when type is not known
		do
			Result := new_type (Void, "ANY")
		ensure
			no_type_not_void: Result /= Void
		end

invariant

	last_grammar_not_void: last_grammar /= Void
	terminal_symbols_not_void: terminal_symbols /= Void
	no_void_terminal_symbol: not terminal_symbols.has_void_item
	nonterminal_symbols_not_void: nonterminal_symbols /= Void
	no_void_nonterminal_symbol: not nonterminal_symbols.has_void_item
	types_not_void: types /= Void
	no_void_type: not types.has_void_item
	last_value_names_not_void: last_value_names /= Void
	no_void_last_value_name_type: not last_value_names.has_void_item
	start_symbol_name_not_void: start_symbol /= Void implies start_symbol.first /= Void
	action_factory_not_void: action_factory /= Void

end
