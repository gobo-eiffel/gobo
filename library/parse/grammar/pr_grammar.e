indexing

	description:

		"Grammars for LALR(1) context-free languages."

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_GRAMMAR

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new grammar.
		do
			!! tokens.make (Initial_max_nb_tokens)
			!! variables.make (Initial_max_nb_variables)
			!! rules.make (Initial_max_nb_rules)
			!! eiffel_header.make (1)
		end

feature -- Access

	tokens: DS_ARRAYED_LIST [PR_TOKEN]
			-- Terminal symbols of current grammar

	variables: DS_ARRAYED_LIST [PR_VARIABLE]
			-- Non-terminal symbols of current grammar

	rules: DS_ARRAYED_LIST [PR_RULE]
			-- Rules of current grammar

	start_symbol: PR_VARIABLE
			-- Start symbol

	expected_conflicts: INTEGER
			-- Number of expected shift/reduce conflicts

	max_rhs: INTEGER is
			-- Maximum number of right-hand-side
			-- symbols in `rules'
		local
			i: INTEGER
		do
			i := rules.count
			from until i < 1 loop
				if rules.item (i).rhs.count > Result then
					Result := rules.item (i).rhs.count
				end
				i := i - 1
			end
		ensure
			max_rhs_positive: Result >= 0
--			definition: forall rule in rules, Result >= rule.rhs.count
--				and there_exists rule in rules, rule.rhs.count = Result
		end

feature -- User-defined Eiffel code

	eiffel_code: STRING
			-- User-defined Eiffel code
			-- (Appears in section 3)

	eiffel_header: DS_ARRAYED_LIST [STRING]
			-- User-defined Eiffel header
			-- (Appears in section 1 between %{})

feature -- Setting

	set_start_symbol (a_symbol: like start_symbol) is
			-- Set `start_symbol' to `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		do
			start_symbol := a_symbol
		ensure
			start_symbol_set: start_symbol = a_symbol
		end

	set_eiffel_code (code: like eiffel_code) is
			-- Set `eiffel_code' to `code'.
		do
			eiffel_code := code
		ensure
			eiffel_code_set: eiffel_code = code
		end

	set_expected_conflicts (nb: INTEGER) is
			-- Set `expected_conflicts' to `nb'.
		do
			expected_conflicts := nb
		ensure
			expected_conflicts: expected_conflicts = nb
		end

feature -- Element change

	put_token (a_token: PR_TOKEN) is
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

	put_variable (a_variable: PR_VARIABLE) is
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

	put_rule (a_rule: PR_RULE) is
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

feature -- Processing

	reduce (error_handler: UT_ERROR_HANDLER) is
			-- Remove useless nonterminal symbols and rules.
			-- Report results to `error_handler'.
		require
			error_handler_not_void: error_handler /= Void
		do
			-- TO DO
		end

	set_nullable is
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
			!! todo.make (nb)
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				lhs := a_rule.lhs
				rhs := a_rule.rhs
				if rhs.is_empty then
					lhs.set_nullable
				elseif not lhs.is_nullable then
					from
						j := rhs.count
						!! a_list.make (j + 1)
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
				!! old_todo.make (todo.count)
			until
				old_todo.count = todo.count
			loop
				tmp := old_todo
				old_todo := todo
				todo := tmp
				todo.wipe_out
				nb := old_todo.count
				from i := 1 until i > nb loop
					a_list := old_todo.item (i)
					check list_not_empty: not a_list.is_empty end
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

feature {NONE} -- Constants

	Initial_max_nb_tokens: INTEGER is 100
	Max_nb_tokens_increment: INTEGER is 100
	Initial_max_nb_variables: INTEGER is 300
	Max_nb_variables_increment: INTEGER is 300
			-- Maximum number of terminal
			-- and nonterminal symbols

	Initial_max_nb_rules: INTEGER is 500
	Max_nb_rules_increment: INTEGER is 500
			-- Maximum number of rules

invariant

	tokens_not_void: tokens /= Void
	no_void_token: not tokens.has (Void)
	variables_not_void: variables /= Void
	no_void_variable: not variables.has (Void)
	rules_not_void: rules /= Void
	no_void_rule: not rules.has (Void)
	eiffel_header_not_void: eiffel_header /= Void
	no_void_eiffel_header: not eiffel_header.has (Void)

end -- class PR_GRAMMAR
