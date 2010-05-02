note

	description:

		"Grammars for LALR(1) context-free languages."

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_GRAMMAR

inherit

	ANY
			-- Export features from ANY.

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new grammar.
		do
			create tokens.make (Initial_max_nb_tokens)
			create variables.make (Initial_max_nb_variables)
			create types.make (Initial_max_nb_types)
			create rules.make (Initial_max_nb_rules)
			create eiffel_header.make (1)
		end

feature -- Access

	tokens: DS_ARRAYED_LIST [PR_TOKEN]
			-- Terminal symbols of current grammar

	variables: DS_ARRAYED_LIST [PR_VARIABLE]
			-- Non-terminal symbols of current grammar

	types: DS_ARRAYED_LIST [PR_TYPE]
			-- Symbol types of current grammar

	rules: DS_ARRAYED_LIST [PR_RULE]
			-- Rules of current grammar

	start_symbol: PR_VARIABLE
			-- Start symbol

	expected_conflicts: INTEGER
			-- Number of expected shift/reduce conflicts

	max_rhs: INTEGER
			-- Maximum number of right-hand-side
			-- symbols in `rules'
		local
			i: INTEGER
		do
			i := rules.count
			from
			until
				i < 1
			loop
				if rules.item (i).rhs.count > Result then
					Result := rules.item (i).rhs.count
				end
				i := i - 1
			end
		ensure
			max_rhs_positive: Result >= 0
--			definition: forall rule in rules, Result >= rule.rhs.count and there_exists rule in rules, rule.rhs.count = Result
		end

feature -- User-defined Eiffel code

	eiffel_code: STRING
			-- User-defined Eiffel code
			-- (Appears in section 3)

	eiffel_header: DS_ARRAYED_LIST [STRING]
			-- User-defined Eiffel header
			-- (Appears in section 1 between %{})

feature -- Setting

	set_start_symbol (a_symbol: like start_symbol)
			-- Set `start_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			start_symbol := a_symbol
		ensure
			start_symbol_set: start_symbol = a_symbol
		end

	set_eiffel_code (code: like eiffel_code)
			-- Set `eiffel_code' to `code'.
		do
			eiffel_code := code
		ensure
			eiffel_code_set: eiffel_code = code
		end

	set_expected_conflicts (nb: INTEGER)
			-- Set `expected_conflicts' to `nb'.
		do
			expected_conflicts := nb
		ensure
			expected_conflicts: expected_conflicts = nb
		end

feature -- Element change

	put_token (a_token: PR_TOKEN)
			-- Add `a_token' at the end of the
			-- list of terminal symbols.
		require
			a_token_not_void: a_token /= Void
		do
			if tokens.is_full then
				tokens.resize (tokens.count + Max_nb_tokens_increment)
			end
			tokens.put_last (a_token)
		ensure
			one_more: tokens.count = old (tokens.count) + 1
			inserted: tokens.last = a_token
		end

	put_variable (a_variable: PR_VARIABLE)
			-- Add `a_variable' at the end of the
			-- list of non-terminal symbols.
		require
			a_variable_not_void: a_variable /= Void
		do
			if variables.is_full then
				variables.resize (variables.count + Max_nb_variables_increment)
			end
			variables.put_last (a_variable)
		ensure
			one_more: variables.count = old (variables.count) + 1
			inserted: variables.last = a_variable
		end

	put_type (a_type: PR_TYPE)
			-- Add `a_type' at the end of the
			-- list of symbol types.
		require
			a_type_not_void: a_type /= Void
		do
			if types.is_full then
				types.resize (types.count + Max_nb_types_increment)
			end
			types.put_last (a_type)
		ensure
			one_more: types.count = old (types.count) + 1
			inserted: types.last = a_type
		end

	put_rule (a_rule: PR_RULE)
			-- Add `a_rule' at the end of the
			-- list of grammar rules.
		require
			a_rule_not_void: a_rule /= Void
		do
			if rules.is_full then
				rules.resize (rules.count + Max_nb_rules_increment)
			end
			rules.put_last (a_rule)
		ensure
			one_more: rules.count = old (rules.count) + 1
			inserted: rules.last = a_rule
		end

feature -- Output

	print_grammar (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print textual representation of
			-- current grammar to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
		do
			a_file.put_string ("Grammar%N%N")
			nb := rules.count
			from
				i := 1
			until
				i > nb
			loop
				rules.item (i).print_rule (a_file)
				a_file.put_character ('%N')
				i := i + 1
			end
			a_file.put_string ("%NTerminals, with rules where they appear%N%N")
				-- EOF token.
			a_file.put_string ("$ (token 0)%N")
			nb := tokens.count
			from
				i := 1
			until
				i > nb
			loop
				tokens.item (i).print_token (Current, a_file)
				a_file.put_character ('%N')
				i := i + 1
			end
			a_file.put_string ("%NNonterminals, with rules where they appear%N%N")
			nb := variables.count
			from
				i := 1
			until
				i > nb
			loop
				variables.item (i).print_variable (Current, a_file)
				a_file.put_character ('%N')
				i := i + 1
			end
		end

feature -- Processing

	reduce (error_handler: UT_ERROR_HANDLER)
			-- Remove useless nonterminal symbols and rules.
			-- Report results to `error_handler'.
		require
			error_handler_not_void: error_handler /= Void
		local
			i, j: INTEGER
			a_rule: PR_RULE
			a_variable: PR_VARIABLE
			r: DS_ARRAYED_LIST [PR_RULE]
			useless_variables: INTEGER
			useless_rules: INTEGER
			message: STRING
			warning: UT_MESSAGE
		do
			mark_useful_variables
			mark_useful_rules
			from
				i := 1
			until
				i > rules.count
			loop
				a_rule := rules.item (i)
				if a_rule.is_useful then
					a_rule.set_id (i)
					i := i + 1
				else
					rules.remove (i)
					useless_rules := useless_rules + 1
				end
			end
			from
				i := 1
			until
				i > variables.count
			loop
				a_variable := variables.item (i)
				if a_variable.is_useful then
						-- Variables are indexed from 0.
					a_variable.set_id (i - 1)
					r := a_variable.rules
					j := r.count
					from
					until
						j < 1
					loop
						if not r.item (j).is_useful then
							r.remove (j)
						end
						j := j - 1
					end
					i := i + 1
				else
					variables.remove (i)
					useless_variables := useless_variables + 1
				end
			end
			if useless_variables > 0 or useless_rules > 0 then
				create message.make (128)
				message.append_string ("Parser contains ")
				if useless_variables = 1 then
					message.append_string ("1 useless nonterminal")
				elseif useless_variables > 1 then
					INTEGER_.append_decimal_integer (useless_variables, message)
					message.append_string (" useless nonterminals")
				end
				if useless_variables > 0 and useless_rules > 0 then
					message.append_string (" and ")
				end
				if useless_rules = 1 then
					message.append_string ("1 useless rule")
				elseif useless_rules > 1 then
					INTEGER_.append_decimal_integer (useless_rules, message)
					message.append_string (" useless rules")
				end
				message.append_string (".%N")
				create warning.make (message)
				error_handler.report_warning (warning)
			end
		end

	reduce_verbose (error_handler: UT_ERROR_HANDLER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Remove useless nonterminal symbols and rules.
			-- Report verbosely results to `error_handler'
			-- and `a_file'.
		require
			error_handler_not_void: error_handler /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			old_variables: like variables
			old_rules: like rules
			useless_variables: INTEGER
			useless_tokens: INTEGER
			useless_rules: INTEGER
			a_variable: PR_VARIABLE
			a_token: PR_TOKEN
			a_rule: PR_RULE
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			i, j, nb, nb_rhs: INTEGER
		do
			old_variables := variables.cloned_object
			old_rules := rules.cloned_object
			reduce (error_handler)
			useless_variables := old_variables.count - variables.count
			useless_rules := old_rules.count - rules.count
			if useless_variables > 0 then
				a_file.put_string ("Useless nonterminals:%N%N")
				nb := old_variables.count
				from
					i := 1
				until
					i > nb
				loop
					a_variable := old_variables.item (i)
					if not a_variable.is_useful then
						a_file.put_character ('%T')
						a_file.put_string (a_variable.name)
						a_file.put_character ('%N')
					end
					i := i + 1
				end
				a_file.put_character ('%N')
			end
			nb := tokens.count
			from
				i := 1
			until
				i > nb
			loop
				a_token := tokens.item (i)
				if not a_token.is_useful then
					if useless_tokens = 0 then
						a_file.put_string ("Terminals which are not used:%N%N")
					end
					useless_tokens := useless_tokens + 1
					a_file.put_character ('%T')
					a_file.put_string (a_token.name)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
			if useless_tokens > 0 then
				a_file.put_character ('%N')
			end
			if useless_rules > 0 then
				a_file.put_string ("Useless rules:%N%N")
				nb := old_rules.count
				from
					i := 1
				until
					i > nb
				loop
					a_rule := old_rules.item (i)
					if not a_rule.is_useful then
						a_file.put_character ('#')
						a_file.put_integer (i)
						a_file.put_character ('%T')
						a_file.put_string (a_rule.lhs.name)
						a_file.put_string (": ")
						rhs := a_rule.rhs
						nb_rhs := rhs.count
						from
							j := 1
						until
							j > nb_rhs
						loop
							a_file.put_string (rhs.item (j).name)
							a_file.put_character (' ')
							j := j + 1
						end
						a_file.put_string (";%N")
					end
					i := i + 1
				end
				a_file.put_character ('%N')
			end
			if useless_variables > 0 or useless_tokens > 0 or useless_rules > 0 then
				a_file.put_character ('%N')
			end
		end

	set_nullable
			-- Set nonterminal symbols which can be expanded
			-- to an empty string.
		local
			i, j, nb: INTEGER
			a_rule: PR_RULE
			token_found, stop: BOOLEAN
			lhs, a_variable: PR_VARIABLE
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			a_list: DS_ARRAYED_LIST [PR_VARIABLE]
			old_todo, todo, tmp: DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]]
		do
			nb := rules.count
			create todo.make (nb)
			from
				i := 1
			until
				i > nb
			loop
				a_rule := rules.item (i)
				lhs := a_rule.lhs
				rhs := a_rule.rhs
				if rhs.is_empty then
					lhs.set_nullable
				elseif not lhs.is_nullable then
					from
						j := rhs.count
						create a_list.make (j + 1)
						a_list.put_first (lhs)
						token_found := False
					until
						token_found or j < 1
					loop
						a_variable ?= rhs.item (j)
						if a_variable = Void then
							token_found := True
						elseif not a_variable.is_nullable then
							a_list.put_last (a_variable)
						end
						j := j - 1
					end
					if not token_found then
						if a_list.count > 1 then
							todo.put_last (a_list)
						else
							lhs.set_nullable
						end
					end
				end
				i := i + 1
			end
			from
				create old_todo.make (todo.count)
			until
				old_todo.count = todo.count
			loop
				tmp := old_todo
				old_todo := todo
				todo := tmp
				todo.wipe_out
				nb := old_todo.count
				from
					i := 1
				until
					i > nb
				loop
					a_list := old_todo.item (i)
					check
						list_not_empty: not a_list.is_empty
					end
					if not a_list.first.is_nullable then
						from
							j := a_list.count
							stop := False
						invariant
							count: j = a_list.count
						until
							stop or j = 1
						loop
							if a_list.last.is_nullable then
								a_list.remove_last
								j := j - 1
							else
								stop := True
							end
						end
						if not stop then
							a_list.first.set_nullable
						else
							todo.put_last (a_list)
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Processing

	mark_useful_variables
			-- Mark all nonterminals which can expand to
			-- an empty string or strings consisting only
			-- of terminals. Mark the corresponding rules
			-- accordingly (i.e. rules whose right-hand-
			-- side is only made of terminals or useful
			-- nonterminals).
		local
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			a_variable: PR_VARIABLE
			a_symbol: PR_SYMBOL
			a_rule: PR_RULE
			i, j: INTEGER
			changed: BOOLEAN
			nb_rules: INTEGER
		do
			nb_rules := rules.count
			from
				changed := True
			until
				not changed
			loop
				changed := False
				from
					i := 1
				until
					i > nb_rules
				loop
					a_rule := rules.item (i)
					if not a_rule.is_useful then
						a_rule.set_useful (True)
						rhs := a_rule.rhs
						j := rhs.count
						from
						until
							j < 1
						loop
							a_symbol := rhs.item (j)
							if a_symbol.is_terminal or a_symbol.is_useful then
								j := j - 1
							else
									-- Not useful yet.
								a_rule.set_useful (False)
									-- Jump out of the loop.
								j := 0
							end
						end
						if a_rule.is_useful then
							a_variable := a_rule.lhs
							if not a_variable.is_useful then
								a_variable.set_useful (True)
								changed := True
							end
						end
						j := j - 1
					end
					i := i + 1
				end
			end
		end

	mark_useful_rules
			-- Mark all rules which are reachable from
			-- `start_symbol' and whose symbols are used.
		local
			useful: BOOLEAN
			i: INTEGER
			a_rule: PR_RULE
		do
			useful := start_symbol /= Void and then start_symbol.is_useful
			i := variables.count
			from
			until
				i < 1
			loop
				variables.item (i).set_useful (False)
				i := i - 1
			end
			if useful then
				start_symbol.set_useful (True)
				traverse_variable (start_symbol)
			end
			i := rules.count
			from
			until
				i < 1
			loop
				a_rule := rules.item (i)
				if not a_rule.lhs.is_useful then
					a_rule.set_useful (False)
				end
				i := i - 1
			end
		end

	traverse_variable (a_variable: PR_VARIABLE)
			-- Traverse the right-hand-side symbols of
			-- the useful rules whose left-hand-side is
			-- `a_variable' recursivelly and mark these
			-- symbols as useful.
		require
			a_variable_not_void: a_variable /= Void
		local
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			r: DS_ARRAYED_LIST [PR_RULE]
			variable2: PR_VARIABLE
			a_symbol: PR_SYMBOL
			a_rule: PR_RULE
			i, j: INTEGER
		do
			r := a_variable.rules
			i := r.count
			from
			until
				i < 1
			loop
				a_rule := r.item (i)
				if a_rule.is_useful then
					rhs := a_rule.rhs
					j := rhs.count
					from
					until
						j < 1
					loop
						a_symbol := rhs.item (j)
						variable2 ?= a_symbol
						if variable2 /= Void then
							if not variable2.is_useful then
								variable2.set_useful (True)
								traverse_variable (variable2)
							end
						else
							a_symbol.set_useful (True)
						end
						j := j - 1
					end
				end
				i := i - 1
			end
		end

feature {NONE} -- Constants

	Initial_max_nb_tokens: INTEGER = 100
			-- Initial capacity for `tokens'

	Max_nb_tokens_increment: INTEGER = 100
			-- Increment when resizing `tokens'

	Initial_max_nb_variables: INTEGER = 300
			-- Initial capacity for `variables'

	Max_nb_variables_increment: INTEGER = 300
			-- Increment when resizing `variables'

	Initial_max_nb_types: INTEGER = 300
			-- Initial capacity for `types'
	Max_nb_types_increment: INTEGER = 300
			-- Increment when resizing `types'

	Initial_max_nb_rules: INTEGER = 500
			-- Initial capacity for `rules'

	Max_nb_rules_increment: INTEGER = 500
			-- Increment when resizing `rules'

invariant

	tokens_not_void: tokens /= Void
	no_void_token: not tokens.has_void
	variables_not_void: variables /= Void
	no_void_variable: not variables.has_void
	types_not_void: types /= Void
	no_void_type: not types.has_void
	rules_not_void: rules /= Void
	no_void_rule: not rules.has_void
	eiffel_header_not_void: eiffel_header /= Void
	no_void_eiffel_header: not eiffel_header.has_void

end
