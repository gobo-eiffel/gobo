indexing

	description:

		"Parser skeletons for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_YACC_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON [ANY]
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

feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new grammar description parser.
		require
			handler_not_void: handler /= Void
		do
			make_yacc_scanner (handler)
			make_parser_skeleton
			!! action_factory.make
			!! last_grammar.make
			!! terminal_symbols.make (Initial_max_nb_tokens)
			!! nonterminal_symbols.make (Initial_max_nb_variables)
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_yacc_scanner
			!! last_grammar.make
			terminal_symbols.wipe_out
			nonterminal_symbols.wipe_out
			rule := Void
			precedence_token := Void
			start_symbol := Void
		end

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse grammar description from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
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

	set_action_factory (a_factory: like action_factory) is
			-- Set `action_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			action_factory := a_factory
		ensure
			action_factory_set: action_factory = a_factory
		end

feature {NONE} -- Factory

	new_rule (lhs: PR_VARIABLE): PR_RULE is
			-- New rule with `lhs' as left-hand-side
		require
			lhs_not_void: lhs /= Void
		local
			id: INTEGER
		do
			id := last_grammar.rules.count + 1
			!! Result.make (id, lhs, No_action)
				-- Mark `lhs' has being derivable
				-- by this new rule.
			lhs.put_rule (Result)
		ensure
			rule_not_void: Result /= Void
			lhs_set: Result.lhs = lhs
			no_action: Result.action = No_action
		end

	new_token (a_name: STRING): PR_TOKEN is
			-- Terminal symbol named `a_name';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of tokens of
			-- `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			is_terminal: not is_nonterminal (a_name)
		local
			lower_name: STRING
			an_id: INTEGER
		do
			lower_name := STRING_.to_lower (a_name)
			if terminal_symbols.has (lower_name) then
				Result := terminal_symbols.item (lower_name)
			else
					-- Tokens are indexed from 0, but token
					-- of id 0 is reserved for EOF.
				an_id := last_grammar.tokens.count + 1
				!! Result.make (an_id, a_name)
				terminal_symbols.force (Result, lower_name)
				last_grammar.put_token (Result)
			end
		ensure
			token_not_void: Result /= Void
		end

	new_token_with_id (a_name: STRING; id: INTEGER): PR_TOKEN is
			-- Terminal symbol named `a_name' with token id
			-- `id'; Create a new symbol if it does not exist
			-- yet, and add it to the list of tokens of
			-- `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			is_terminal: not is_nonterminal (a_name)
		local
			lower_name: STRING
		do
			Result := new_token (a_name)
			Result.set_token_id (id)
		ensure
			token_not_void: Result /= Void
			token_id_set: Result.token_id = id
		end

	new_char_token (a_char: STRING): PR_TOKEN is
			-- Terminal symbol associated with `a_char';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of tokens of
			-- `last_grammar'.
		require
			a_char_not_void: a_char /= Void
			-- valid_char: `a_char' recognized by
			--		\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\'
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
				when '0'..'7' then
						-- Octal.
					nb := a_char.count - 1
					a_code := 0
					from i := 3 until i > nb loop
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
						from i := 4 until i > nb loop
						a_code := a_code * 16
							c := a_char.item (i)
							inspect c
							when '0'..'9' then
								a_code := a_code + c.code - Zero_code
							when 'a'..'z' then
								a_code := a_code + c.code - Lower_a_code + 10
							when 'A'..'Z' then
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
			if terminal_symbols.has (a_key) then
				Result := terminal_symbols.item (a_key)
			else
					-- Tokens are indexed from 0, but token
					-- of id 0 is reserved for EOF.
				an_id := last_grammar.tokens.count + 1
				!! Result.make (an_id, a_char)
				Result.set_token_id (a_code)
				terminal_symbols.force (Result, a_key)
				last_grammar.put_token (Result)
			end
		ensure
			token_not_void: Result /= Void
		end

	new_char_token_with_id (a_char: STRING; id: INTEGER): PR_TOKEN is
			-- Terminal symbol associated with `a_char' and
			-- with token id `id'; Create a new symbol if it
			-- does not exist yet, and add it to the list of
			-- tokens of `last_grammar'.
		require
			a_char_not_void: a_char /= Void
			-- valid_char: `a_char' recognized by
			--		\'(.|\\(.|[0-7]{1,3}|x[0-9a-f]{1,2}))\'
		do
			Result := new_char_token (a_char)
			Result.set_token_id (id)
		ensure
			token_not_void: Result /= Void
			token_id_set: Result.token_id = id
		end

	new_variable (a_name: STRING): PR_VARIABLE is
			-- Nonterminal symbol named `a_name';
			-- Create a new symbol if it does not exist
			-- yet, and add it to the list of variables
			-- of `last_grammar'.
		require
			a_name_not_void: a_name /= Void
			is_nonterminal: not is_terminal (a_name)
		local
			lower_name: STRING
			an_id: INTEGER
		do
			lower_name := STRING_.to_lower (a_name)
			if nonterminal_symbols.has (lower_name) then
				Result := nonterminal_symbols.item (lower_name)
			else
					-- Variables are indexed from 0.
				an_id := last_grammar.variables.count
				!! Result.make (an_id, a_name)
				nonterminal_symbols.force (Result, lower_name)
				last_grammar.put_variable (Result)
			end
		ensure
			variable_not_void: Result /= Void
		end

	new_dummy_variable: PR_VARIABLE is
			-- New dummy nonterminal symbol used for mid-rule
			-- semantic actions (Use unique symbol names.)
		local
			a_name: STRING
			an_id: INTEGER
		do
			a_name := STRING_.make (10)
			a_name.append_character ('@')
			INTEGER_FORMATTER_.append_decimal_integer (a_name, nonterminal_symbols.count)
				-- Variables are indexed from 0.
			an_id := last_grammar.variables.count
			!! Result.make (an_id, a_name)
			nonterminal_symbols.force (Result, a_name)
			last_grammar.put_variable (Result)
		ensure
			dummy_variable_not_void: Result /= Void
		end

	new_symbol (a_name: STRING): PR_SYMBOL is
			-- Symbol named `a_name'; Create a new nonterminal
			-- symbol if it does not exist yet, and add it to
			-- the list of variables of `last_grammar'.
		require
			a_name_not_void: a_name /= Void
		local
			lower_name: STRING
			a_variable: PR_VARIABLE
			an_id: INTEGER
		do
			lower_name := STRING_.to_lower (a_name)
			if nonterminal_symbols.has (lower_name) then
				Result := nonterminal_symbols.item (lower_name)
			elseif terminal_symbols.has (lower_name) then
				Result := terminal_symbols.item (lower_name)
			else
					-- Variables are indexed from 0.
				an_id := last_grammar.variables.count
				!! a_variable.make (an_id, a_name)
				nonterminal_symbols.force (a_variable, lower_name)
				last_grammar.put_variable (a_variable)
				Result := a_variable
			end
		ensure
			symbol_not_void: Result /= Void
		end

	new_action (a_text: STRING): UT_COMMAND is
		require
			a_text_not_void: a_text /= Void
		do
			Result := action_factory.new_action (a_text)
		ensure
			action_not_void: Result /= Void
		end

feature {NONE} -- Conversion

	dollar_integer (val: ANY): INTEGER is
		local
			int: INTEGER_REF
		do
			int ?= val
			Result := int.item
		end

	dollar_string (val: ANY): STRING is
		do
			Result ?= val
		end

	dollar_token (val: ANY): PR_TOKEN is
		do
			Result ?= val
		end

feature {NONE} -- Implementation

	initialize_grammar is
			-- Initialize input grammar.
		local
			a_token: PR_TOKEN
		do
				-- Error token. The token id value 256
				-- is specified by POSIX.
			a_token := new_token_with_id ("error", 256)
			a_token.set_useful (True)
				-- Token that represents all undefined
				-- literal tokens. It is always the 
				-- second token on the grammar.
			a_token := new_token ("$undefined.")
			a_token.set_useful (True)
		end

	put_rule (a_rule: PR_RULE) is
			-- Add `a_rule' to `last_grammar'.
		require
			a_rule_not_void: a_rule /= Void
		do
			last_grammar.put_rule (a_rule)
		end

	put_symbol (rhs: PR_SYMBOL; a_rule: PR_RULE) is
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

	put_action (an_action: UT_COMMAND; a_rule: PR_RULE) is
			-- Set semantic action of `a_rule' to `an_action'.
		require
			an_action_not_void: an_action /= Void
			a_rule_not_void: a_rule /= Void
		do
			a_rule.set_action (an_action)
		ensure
			inserted: a_rule.action = an_action
		end

	set_start_symbol is
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

	set_left_associative (a_token: PR_TOKEN) is
			-- Set `a_token' to be left associative and set
			-- its precedence level to `precedence'.
		require
			a_token_not_void: a_token /= Void
		do
			if a_token.has_precedence then
				report_precedence_defined_twice_error (a_token.name)
			end
			a_token.set_left_associative
			a_token.set_precedence (precedence)
		ensure
			associtivity_set: a_token.is_left_associative
			precedence_set: a_token.precedence = precedence
		end

	set_right_associative (a_token: PR_TOKEN) is
			-- Set `a_token' to be right associative and set
			-- its precedence level to `precedence'.
		require
			a_token_not_void: a_token /= Void
		do
			if a_token.has_precedence then
				report_precedence_defined_twice_error (a_token.name)
			end
			a_token.set_right_associative
			a_token.set_precedence (precedence)
		ensure
			associtivity_set: a_token.is_right_associative
			precedence_set: a_token.precedence = precedence
		end

	set_non_associative (a_token: PR_TOKEN) is
			-- Set `a_token' to be non-associative and set
			-- its precedence level to `precedence'.
		require
			a_token_not_void: a_token /= Void
		do
			if a_token.has_precedence then
				report_precedence_defined_twice_error (a_token.name)
			end
			a_token.set_non_associative
			a_token.set_precedence (precedence)
		ensure
			associtivity_set: a_token.is_non_associative
			precedence_set: a_token.precedence = precedence
		end

	process_rule (a_rule: PR_RULE) is
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
					a_token ?= rhs.item (i)
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

	process_symbols is
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
			translate: ARRAY [PR_TOKEN]
		do
			tokens := last_grammar.tokens
			last_token_id := 256
			nb := tokens.count
			from i := 1 until i > nb loop
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
			!! translate.make (0, max_token_id)
			from i := 1 until i > nb loop
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
			from i := 1 until i > nb loop
				a_variable := variables.item (i)
				if a_variable.rules.is_empty then
					report_undefined_symbol_error (a_variable.name)
				end
				i := i + 1
			end
		end

feature {NONE} -- Access

	rule: PR_RULE
			-- Rule being parsed

	precedence: INTEGER
			-- Precedence level of operators

	precedence_token: PR_TOKEN
			-- %prec token used to set the precedence level
			-- and associativity of the rule being parsed

	start_symbol: DS_PAIR [STRING, INTEGER]
			-- Name and line number of the start symbol
			-- declared by %start

	terminal_symbols: DS_HASH_TABLE [PR_TOKEN, STRING]
			-- Terminal symbols already created so far
			-- indexed by symbol names in lowercase

	nonterminal_symbols: DS_HASH_TABLE [PR_VARIABLE, STRING]
			-- Nonterminal symbols already created so far
			-- indexed by symbol names in lowercase

feature {NONE} -- Status report

	is_terminal (a_name: STRING): BOOLEAN is
			-- Is there a terminal symbol named `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			lower_name: STRING
		do
			lower_name := STRING_.to_lower (a_name)
			Result := terminal_symbols.has (lower_name)
		end

	is_nonterminal (a_name: STRING): BOOLEAN is
			-- Is there a nonterminal symbol named `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			lower_name: STRING
		do
			lower_name := STRING_.to_lower (a_name)
			Result := nonterminal_symbols.has (lower_name)
		end

feature {NONE} -- Error handling

	report_error (a_message: STRING) is
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
		do
			!! an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure then
			not_successful: not successful
		end

	report_start_symbol_token_error is
			-- Report that `start_symbol' is a token
			-- instead of a nonterminal symbol.
		require
			start_symbol_not_void: start_symbol /= Void
		local
			an_error: PR_START_SYMBOL_TOKEN_ERROR
			a_name: STRING
			line: INTEGER
		do
			a_name := start_symbol.first
			line := start_symbol.second
			!! an_error.make (filename, line, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_unknown_start_symbol_error is
			-- Report that `start_symbol' has not been declared.
		require
			start_symbol_not_void: start_symbol /= Void
		local
			an_error: PR_UNKNOWN_START_SYMBOL_ERROR
			a_name: STRING
			line: INTEGER
		do
			a_name := start_symbol.first
			line := start_symbol.second
			!! an_error.make (filename, line, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_lhs_symbol_token_error (a_name: STRING) is
			-- Report that the left-hand-side symbol `a_name'
			-- is a token instead of a nonterminal symbol.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_LHS_SYMBOL_TOKEN_ERROR
		do
			!! an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_multiple_start_declarations_error is
			-- Report multiple %start declarations.
		local
			an_error: PR_MULTIPLE_START_DECLARATIONS_ERROR
		do
			!! an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_precedence_defined_twice_error (a_name: STRING) is
			-- Report multiple precedence definition
			-- for token `a_name'.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_PRECEDENCE_DEFINED_TWICE_ERROR
		do
			!! an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_prec_specified_twice_error is
			-- Report that %prec has been specified twice
			-- in the same rule.
		local
			an_error: PR_PREC_SPECIFIED_TWICE_ERROR
		do
			!! an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_prec_not_token_error (a_name: STRING) is
			-- Report that the symbol `a_name' specified
			-- in the %prec clause is not a token.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_PREC_NOT_TOKEN_ERROR
		do
			!! an_error.make (filename, line_nb, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_no_rules_error is
			-- Report that no rules has been specified 
			-- in the input grammar.
		local
			an_error: PR_NO_RULES_ERROR
		do
			!! an_error.make (filename)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_undefined_symbol_error (a_name: STRING) is
			-- Report that the symbol `a_name' has not
			-- been defined as a token or in a rule.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_UNDEFINED_SYMBOL_ERROR
		do
			!! an_error.make (filename, a_name)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_rule_declared_twice_warning (a_name: STRING) is
			-- Report that the rule `a_name' has been
			-- declared twice.
		require
			a_name_not_void: a_name /= Void
		local
			an_error: PR_RULE_DECLARED_TWICE_ERROR
		do
			!! an_error.make (filename, line_nb, a_name)
			error_handler.report_warning (an_error)
		end

	report_token_id_used_twice_warning (token1, token2: PR_TOKEN) is
			-- Create a new error reporting that `token1' and
			-- `token2' have been assigned the same token id.
		require
			token1_not_void: token1 /= Void
			token2_not_void: token2 /= Void
		local
			an_error: PR_TOKEN_ID_USED_TWICE_ERROR
		do
			!! an_error.make (filename, token1.name, token2.name, token1.token_id)
			error_handler.report_warning (an_error)
		end

feature {NONE} -- Constants

	Initial_max_nb_tokens: INTEGER is 100
	Initial_max_nb_variables: INTEGER is 300
			-- Initial maximum number of terminal
			-- and nonterminal symbols

	No_action: UT_COMMAND is
			-- Do nothing semantic action
		once
			Result := action_factory.new_action ("")
		ensure
			no_action_not_void: Result /= Void
		end

invariant

	last_grammar_not_void: last_grammar /= Void
	terminal_symbols_not_void: terminal_symbols /= Void
	no_void_terminal_symbol: not terminal_symbols.has_item (Void)
	nonterminal_symbols_not_void: nonterminal_symbols /= Void
	no_void_nonterminal_symbol: not nonterminal_symbols.has_item (Void)
	start_symbol_name_not_void:
		start_symbol /= Void implies start_symbol.first /= Void
	action_factory_not_void: action_factory /= Void

end -- class PR_YACC_PARSER_SKELETON
