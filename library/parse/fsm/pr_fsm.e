indexing

	description:

		"Finite State Machines"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_FSM

inherit

	ANY -- Export features of ANY.

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_ANY_ROUTINES

create

	make, make_verbose, make_default

feature {NONE} -- Initialization

	make (a_grammar: PR_GRAMMAR; error_handler: UT_ERROR_HANDLER) is
			-- Create a new finite state machine.
			-- Reduce the grammar and resolve conflicts.
			-- Report results to `error_handler'.
		require
			a_grammar_not_void: a_grammar /= Void
			valid_grammar: a_grammar.start_symbol /= Void
			error_handler_not_void: error_handler /= Void
		do
			a_grammar.reduce (error_handler)
			a_grammar.set_nullable
			make_default (a_grammar)
			resolve_conflicts (error_handler)
			set_error_actions (error_handler)
		end

	make_verbose (a_grammar: PR_GRAMMAR; error_handler: UT_ERROR_HANDLER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Create a new finite state machine.
			-- Reduce the grammar and resolve conflicts.
			-- Report results to `error_handler' and `a_file'.
		require
			a_grammar_not_void: a_grammar /= Void
			valid_grammar: a_grammar.start_symbol /= Void
			error_handler_not_void: error_handler /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_grammar.reduce_verbose (error_handler, a_file)
			a_grammar.set_nullable
			make_default (a_grammar)
			resolve_conflicts_verbose (error_handler, a_file)
			set_error_actions_verbose (error_handler, a_file)
			print_machine (a_file)
		end

	make_default (a_grammar: PR_GRAMMAR) is
			-- Create a new finite state machine.
		require
			a_grammar_not_void: a_grammar /= Void
			valid_grammar: a_grammar.start_symbol /= Void
		do
			grammar := a_grammar
			create states.make (Initial_max_nb_states)
			create cached_states.make (Initial_max_nb_states)
			build_nondeterministic
			build_deterministic
		end

feature -- Access

	states: DS_ARRAYED_LIST [PR_STATE]
			-- States making up current machine

	grammar: PR_GRAMMAR
			-- Associated grammar

feature -- Conflicts

	resolve_conflicts (error_handler: UT_ERROR_HANDLER) is
			-- Try to resolve any shift/reduce conflicts using
			-- precedence levels. Report conflicts to `error_handler'.
		require
			error_handler_not_void: error_handler /= Void
		local
			i, nb: INTEGER
			a_state: PR_STATE
			sr, sr_total: INTEGER
			rr, rr_total: INTEGER
			conflicts: DS_LIST [PR_CONFLICT]
			message: STRING
			warning: UT_MESSAGE
		do
			nb := states.count
			from i := 1 until i > nb loop
				a_state := states.item (i)
				if a_state.lookahead_needed then
					conflicts := a_state.resolve_conflicts
					if a_state.has_conflict then
						sr := a_state.shift_reduce_count
						rr := a_state.reduce_reduce_count
						sr_total := sr_total + sr
						rr_total := rr_total + rr
					end
				end
				i := i + 1
			end
			if (sr_total > 0 and sr_total /= grammar.expected_conflicts) or rr_total > 0 then
				create message.make (128)
				message.append_string ("Parser contains ")
				if sr_total = 1 then
					message.append_string ("1 shift/reduce conflict")
				elseif sr_total > 1 then
					INTEGER_.append_decimal_integer (sr_total, message)
					message.append_string (" shift/reduce conflicts")
				end
				if sr_total > 0 and rr_total > 0 then
					message.append_string (" and ")
				end
				if rr_total = 1 then
					message.append_string ("1 reduce/reduce conflict")
				elseif rr_total > 1 then
					INTEGER_.append_decimal_integer (rr_total, message)
					message.append_string (" reduce/reduce conflicts")
				end
				message.append_string (".%N")
				create warning.make (message)
				error_handler.report_warning (warning)
			end
		end

	resolve_conflicts_verbose (error_handler: UT_ERROR_HANDLER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Try to resolve any shift/reduce conflicts using
			-- precedence levels. Report conflicts to
			-- `error_handler' and `a_file'.
		require
			error_handler_not_void: error_handler /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			a_state: PR_STATE
			sr, sr_total: INTEGER
			rr, rr_total: INTEGER
			conflicts: DS_LIST [PR_CONFLICT]
			a_cursor: DS_LINEAR_CURSOR [PR_CONFLICT]
			message: STRING
			warning: UT_MESSAGE
		do
			nb := states.count
			from i := 1 until i > nb loop
				a_state := states.item (i)
				if a_state.lookahead_needed then
					conflicts := a_state.resolve_conflicts
					a_cursor := conflicts.new_cursor
					from a_cursor.start until a_cursor.after loop
						a_cursor.item.print_conflict (a_file)
						a_cursor.forth
					end
					if a_state.has_conflict then
						sr := a_state.shift_reduce_count
						rr := a_state.reduce_reduce_count
						sr_total := sr_total + sr
						rr_total := rr_total + rr
						a_file.put_string ("State ")
						a_file.put_integer (a_state.id)
						a_file.put_string (" contains ")
						if sr = 1 then
							a_file.put_string ("1 shift/reduce conflict")
						elseif sr > 1 then
							a_file.put_integer (sr)
							a_file.put_string (" shift/reduce conflicts")
						end
						if sr > 0 and rr > 0 then
							a_file.put_string (" and ")
						end
						if rr = 1 then
							a_file.put_string ("1 reduce/reduce conflict")
						elseif rr > 1 then
							a_file.put_integer (rr)
							a_file.put_string (" reduce/reduce conflicts")
						end
						a_file.put_character ('.')
						a_file.put_new_line
					end
				end
				i := i + 1
			end
			if sr_total > 0 or rr_total > 0 then
				a_file.put_new_line
			end
			if (sr_total > 0 and sr_total /= grammar.expected_conflicts) or rr_total > 0 then
				create message.make (128)
				message.append_string ("Parser contains ")
				if sr_total = 1 then
					message.append_string ("1 shift/reduce conflict")
				elseif sr_total > 1 then
					INTEGER_.append_decimal_integer (sr_total, message)
					message.append_string (" shift/reduce conflicts")
				end
				if sr_total > 0 and rr_total > 0 then
					message.append_string (" and ")
				end
				if rr_total = 1 then
					message.append_string ("1 reduce/reduce conflict")
				elseif rr_total > 1 then
					INTEGER_.append_decimal_integer (rr_total, message)
					message.append_string (" reduce/reduce conflicts")
				end
				message.append_string (".%N")
				create warning.make (message)
				error_handler.report_warning (warning)
			end
		end

feature -- Setting

	set_error_actions (error_handler: UT_ERROR_HANDLER) is
			-- Try to set states' error actions.
			-- Report conflicts to `error_handler'.
		require
			error_handler_not_void: error_handler /= Void
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			a_state: PR_STATE
			positions: DS_ARRAYED_LIST [PR_POSITION]
			a_position, action_position: PR_POSITION
			all_before, has_conflict: BOOLEAN
			an_action, other_action: PR_ERROR_ACTION
			start_rules: DS_ARRAYED_LIST [PR_RULE]
			start_positions: DS_ARRAYED_LIST [PR_POSITION]
			line1, line2: INTEGER
			nb_conflicts: INTEGER
			message: STRING
			warning: UT_MESSAGE
		do
			nb := states.count
			from i := 1 until i > nb loop
				a_state := states.item (i)
				all_before := True
				positions := a_state.positions
				nb2 := positions.count
				from j := 1 until j > nb2 loop
					a_position := positions.item (j)
					if not a_position.before then
						all_before := False
						if not a_position.after then
							if action_position /= Void then
								an_action := a_position.error_action
								other_action := action_position.error_action
								if not ANY_.equal_objects (an_action, other_action) then
									has_conflict := True
								end
								if an_action /= Void then
									line1 := an_action.line_nb
								else
									line1 := a_position.rule.line_nb
								end
								if other_action /= Void then
									line2 := other_action.line_nb
								else
									line2 := action_position.rule.line_nb
								end
								if line1 < line2 then
									action_position := a_position
								end
							else
								action_position := a_position
							end
						else
								-- There won't be any syntax error at this state
								-- because we can reduce at least one rule.
							action_position := Void
							j := nb2 + 1 -- Jump out of the loop.
						end
					end
					j := j + 1
				end
				if all_before then
						-- Try to find the start symbols/rules.
					start_rules := grammar.start_symbol.rules
					create start_positions.make (nb2)
					from j := 1 until j > nb2 loop
						a_position := positions.item (j)
						if start_rules.has (a_position.rule) then
							start_positions.put_last (a_position)
						end
						j := j + 1
					end
					nb2 := start_positions.count
					from j := 1 until j > nb2 loop
						a_position := start_positions.item (j)
						if action_position /= Void then
							an_action := a_position.error_action
							other_action := action_position.error_action
							if not ANY_.equal_objects (an_action, other_action) then
								has_conflict := True
							end
							if an_action /= Void then
								line1 := an_action.line_nb
							else
								line1 := a_position.rule.line_nb
							end
							if other_action /= Void then
								line2 := other_action.line_nb
							else
								line2 := action_position.rule.line_nb
							end
							if line1 < line2 then
								action_position := a_position
							end
						else
							action_position := a_position
						end
						j := j + 1
					end
				end
				if has_conflict then
					nb_conflicts := nb_conflicts + 1
					has_conflict := False
				end
				if action_position /= Void then
					a_state.set_error_action (action_position.error_action)
					action_position := Void
				end
				i := i + 1
			end
			if nb_conflicts >= 1 then
				create message.make (128)
				message.append_string ("Parser contains ")
				if nb_conflicts = 1 then
					message.append_string ("1 error action conflict.%N")
				else
					INTEGER_.append_decimal_integer (nb_conflicts, message)
					message.append_string (" error action conflicts.%N")
				end
				create warning.make (message)
				error_handler.report_warning (warning)
			end
		end

	set_error_actions_verbose (error_handler: UT_ERROR_HANDLER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Try to set states' error actions.
			-- Report conflicts to `error_handler' and `a_file'.
		require
			error_handler_not_void: error_handler /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			k, nb3: INTEGER
			a_state: PR_STATE
			positions: DS_ARRAYED_LIST [PR_POSITION]
			conflicts: DS_ARRAYED_LIST [PR_POSITION]
			a_position, action_position: PR_POSITION
			all_before: BOOLEAN
			an_action, other_action: PR_ERROR_ACTION
			start_rules: DS_ARRAYED_LIST [PR_RULE]
			start_positions: DS_ARRAYED_LIST [PR_POSITION]
			line1, line2: INTEGER
			nb_conflicts: INTEGER
			message: STRING
			warning: UT_MESSAGE
		do
			nb := states.count
			from i := 1 until i > nb loop
				a_state := states.item (i)
				all_before := True
				positions := a_state.positions
				nb2 := positions.count
				from j := 1 until j > nb2 loop
					a_position := positions.item (j)
					if not a_position.before then
						all_before := False
						if not a_position.after then
							if action_position /= Void then
								an_action := a_position.error_action
								other_action := action_position.error_action
								if not ANY_.equal_objects (an_action, other_action) then
									if conflicts = Void then
										create conflicts.make (nb2)
										conflicts.put_last (action_position)
									end
									conflicts.put_last (a_position)
								end
								if an_action /= Void then
									line1 := an_action.line_nb
								else
									line1 := a_position.rule.line_nb
								end
								if other_action /= Void then
									line2 := other_action.line_nb
								else
									line2 := action_position.rule.line_nb
								end
								if line1 < line2 then
									action_position := a_position
								end
							else
								action_position := a_position
							end
						else
								-- There won't be any syntax error at this state
								-- because we can reduce at least one rule.
							action_position := Void
							j := nb2 + 1 -- Jump out of the loop.
						end
					end
					j := j + 1
				end
				if all_before then
						-- Try to find the start symbols/rules.
					start_rules := grammar.start_symbol.rules
					create start_positions.make (nb2)
					from j := 1 until j > nb2 loop
						a_position := positions.item (j)
						if start_rules.has (a_position.rule) then
							start_positions.put_last (a_position)
						end
						j := j + 1
					end
					nb2 := start_positions.count
					from j := 1 until j > nb2 loop
						a_position := start_positions.item (j)
						if action_position /= Void then
							an_action := a_position.error_action
							other_action := action_position.error_action
							if not ANY_.equal_objects (an_action, other_action) then
								if conflicts = Void then
									create conflicts.make (nb2)
									conflicts.put_last (action_position)
								end
								conflicts.put_last (a_position)
							end
							if an_action /= Void then
								line1 := an_action.line_nb
							else
								line1 := a_position.rule.line_nb
							end
							if other_action /= Void then
								line2 := other_action.line_nb
							else
								line2 := action_position.rule.line_nb
							end
							if line1 < line2 then
								action_position := a_position
							end
						else
							action_position := a_position
						end
						j := j + 1
					end
				end
				if conflicts /= Void then
					a_file.put_string ("State ")
					a_file.put_integer (a_state.id)
					a_file.put_line (" contains 1 error action conflict:")
					nb3 := conflicts.count
					from k := 1 until k > nb3 loop
						a_file.put_character ('%T')
						conflicts.item (k).print_position (a_file)
						a_file.put_new_line
						k := k + 1
					end
					nb_conflicts := nb_conflicts + 1
					conflicts := Void
				end
				if action_position /= Void then
					a_state.set_error_action (action_position.error_action)
					action_position := Void
				end
				i := i + 1
			end
			if nb_conflicts >= 1 then
				a_file.put_new_line
				create message.make (128)
				message.append_string ("Parser contains ")
				if nb_conflicts = 1 then
					message.append_string ("1 error action conflict.%N")
				else
					INTEGER_.append_decimal_integer (nb_conflicts, message)
					message.append_string (" error action conflicts.%N")
				end
				create warning.make (message)
				error_handler.report_warning (warning)
			end
		end

feature -- Output

	print_machine (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print textual representation of current
			-- finite state machine to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
		do
			grammar.print_grammar (a_file)
			nb := states.count
			from i := 1 until i > nb loop
				states.item (i).print_state (a_file)
				i := i + 1
			end
		end

feature {NONE} -- Processing (nondeterministic)

	build_nondeterministic is
			-- Build states of nondeterminstic finite
			-- state machine corresponding to `grammar'.
		local
			i: INTEGER
		do
			build_derives
			put_start_state
			from i := 1 until i > states.count loop
				build_transitions (states.item (i))
				i := i + 1
			end
			put_final_state
		end

	put_start_state is
			-- Create and insert start state.
		local
			a_state: PR_STATE
			a_variable: PR_VARIABLE
		do
			a_variable := grammar.start_symbol
				-- States are indexed from 0.
			create a_state.make (0, a_variable)
			put_closure_positions (a_state, a_variable)
			a_state.sort_positions
			states.put_first (a_state)
		end

	put_final_state is
			-- Make sure that there is a shift transition
			-- in start state (first state in `states')
			-- that leads to a next-to-final state whose
			-- `accessing_symbol' is the grammar's start
			-- symbol. The next-to-final state has one shift
			-- to the final state whose `accessing_symbol'
			-- is zero (end of input). The final state has
			-- one shift which goes to the termination state
			-- (last state in `states'). The reason for this
			-- extra state at the end is to placate the
			-- parser's strategy of making all decisions
			-- one token ahead of its actions.
		require
			start_state_exists: not states.is_empty
		local
			start_state: PR_STATE
			next_to_final_state: PR_STATE
			final_state: PR_STATE
			termination_state: PR_STATE
			start_symbol: PR_VARIABLE
			eof_token: PR_TOKEN
		do
			if not states.extendible (3) then
				states.resize (states.count + 3)
			end
			start_state := states.first
			start_symbol := grammar.start_symbol
			if start_state.has_shift (start_symbol) then
				next_to_final_state := start_state.shift (start_symbol)
			else
				create next_to_final_state.make (states.count, start_symbol)
				states.put_last (next_to_final_state)
				start_state.shifts.force_last (next_to_final_state)
			end
			create eof_token.make (0, "$", No_type)
			create final_state.make (states.count, eof_token)
			states.put_last (final_state)
			next_to_final_state.shifts.force_last (final_state)
			create termination_state.make (states.count, eof_token)
			states.put_last (termination_state)
			final_state.shifts.force_last (termination_state)
		end

	put_closure_positions (a_state: PR_STATE; a_variable: PR_VARIABLE) is
			-- Insert in `a_state' the first positions of the
			-- rules that can help derive the beginning of the
			-- data for `a_variable'.
		require
			a_state_not_void: a_state /= Void
			a_variable_not_void: a_variable /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [PR_RULE]
			a_rule: PR_RULE
			a_position: PR_POSITION
		do
			a_cursor := a_variable.derives.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_rule := a_cursor.item
				create a_position.make (a_rule, 1)
				a_state.put_position (a_position)
				a_cursor.forth
			end
		end

	build_transitions (a_state: PR_STATE) is
			-- Build the shift and reduction transitions for `a_state'.
		require
			a_state_not_void: a_state /= Void
		local
			positions: DS_ARRAYED_LIST [PR_POSITION]
			i, nb_positions: INTEGER
			nb_tokens, nb_variables: INTEGER
			a_position: PR_POSITION
			target: PR_STATE
			a_symbol: PR_SYMBOL
			a_symbol_id: INTEGER
			a_variable: PR_VARIABLE
			transitions: ARRAY [PR_STATE]
			nb_transitions: INTEGER
			shifts: DS_ARRAYED_LIST [PR_STATE]
			reductions: DS_ARRAYED_LIST [PR_REDUCTION]
			a_reduction: PR_REDUCTION
		do
			nb_tokens := grammar.tokens.count
			nb_variables := grammar.variables.count
			create transitions.make (- nb_tokens, nb_variables)
			positions := a_state.positions
			nb_positions := positions.count
			reductions := a_state.reductions
			if not reductions.extendible (nb_positions) then
				reductions.resize (reductions.count + nb_positions)
			end
			from i := 1 until i > nb_positions loop
				a_position := positions.item (i)
				if not a_position.after then
					a_symbol := a_position.symbol
					a_symbol_id := a_symbol.id
					if a_symbol.is_terminal then
						a_symbol_id := - a_symbol_id
					end
					target := transitions.item (a_symbol_id)
					if target = Void then
						create target.make (0, a_symbol)
						transitions.put (target, a_symbol_id)
						nb_transitions := nb_transitions + 1
					end
					a_position := a_position.next
					target.put_position (a_position)
					if not a_position.after then
						a_variable ?= a_position.symbol
						if a_variable /= Void then
							put_closure_positions (target, a_variable)
						end
					end
				else
						-- Since the positions have been sorted
						-- in `a_state', the reduction rules will
						-- be sorted as well.
					create a_reduction.make (a_position.rule)
					reductions.put_last (a_reduction)
				end
				i := i + 1
			end
			shifts := a_state.shifts
			if not shifts.extendible (nb_transitions) then
				shifts.resize (shifts.count + nb_transitions)
			end
			if not states.extendible (nb_transitions) then
				states.resize (states.capacity + nb_transitions + Max_nb_states_increment)
				cached_states.resize (cached_states.capacity + nb_transitions + Max_nb_states_increment)
			end
			from i := - nb_tokens until i > nb_variables loop
				target := transitions.item (i)
				if target /= Void then
					target := new_state (target)
					shifts.put_last (target)
				end
				i := i + 1
			end
		end

	build_derives is
			-- Build `derives' rule list for each variable.
		local
			i: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			a_rule: PR_RULE
			variables: DS_ARRAYED_LIST [PR_VARIABLE]
			a_variable: PR_VARIABLE
			flattener: DS_NESTED_LIST_FLATTENER [PR_RULE]
		do
			rules := grammar.rules
			i := rules.count
			from until i < 1 loop
				a_rule := rules.item (i)
				if not a_rule.rhs.is_empty then
					a_variable ?= a_rule.rhs.first
					if a_variable /= Void then
						a_rule.lhs.firsts.force_last (a_variable)
					end
				end
				i := i - 1
			end
			variables := grammar.variables
			i := variables.count
			from until i < 1 loop
				a_variable := variables.item (i)
				a_variable.derives.append_last (a_variable.rules)
				i := i - 1
			end
			create flattener.make
			flattener.flatten (variables)
		end

	new_state (a_state: PR_STATE): PR_STATE is
			-- Occurrence of `a_state' in FSM if present;
			-- otherwise insert `a_state' into FSM
		require
			a_state_not_void: a_state /= Void
			states_not_full: not states.is_full
			cached_states_not_full: not cached_states.is_full
		local
			i, nb: INTEGER
			a_code: INTEGER
			state_list: DS_ARRAYED_LIST [PR_STATE]
		do
				-- The rule positions in `a_state' are sorted so
				-- that we can compare states quickly.
			a_state.sort_positions
			a_code := a_state.hash_code
			if cached_states.has (a_code) then
				state_list := cached_states.item (a_code)
				from
					i := 1
					nb := state_list.count
				until
					Result /= Void or i > nb
				loop
					Result := state_list.item (i)
					if not Result.same_state (a_state) then
						Result := Void
						i := i + 1
					end
				end
			else
				create state_list.make (2)
				cached_states.put (state_list, a_code)
			end
			if Result = Void then
				Result := a_state
					-- States are indexed from 0.
				Result.set_id (states.count)
				states.put_last (a_state)
				state_list.force_last (a_state)
			end
		ensure
			new_state_not_void: Result /= Void
			same_state: Result.same_state (a_state)
			has_new_state: states.has (Result)
		end

	cached_states: DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER]
			-- States indexed by hash-codes

feature {NONE} -- Processing (deterministic)

	build_deterministic is
			-- Make current finite state machine deterministic.
		local
			i, j, nb: INTEGER
			reductions: DS_LINKED_LIST [PR_REDUCTION]
			reductions_cursor: DS_LINEAR_CURSOR [PR_REDUCTION]
			transitions: DS_LINKED_LIST [PR_TRANSITION]
			transitions_cursor: DS_LINEAR_CURSOR [PR_TRANSITION]
			follows_flattener: DS_NESTED_LIST_FLATTENER [PR_TOKEN]
			shifts: DS_ARRAYED_LIST [PR_STATE]
			follows: DS_LINKED_LIST [PR_TOKEN]
			rules: DS_ARRAYED_LIST [PR_RULE]
			rhs: DS_ARRAYED_LIST [PR_SYMBOL]
			visited_states: DS_ARRAYED_STACK [PR_STATE]
			state1, state2: PR_STATE
			a_transition: PR_TRANSITION
			a_symbol: PR_SYMBOL
			a_variable: PR_VARIABLE
			a_token: PR_TOKEN
			a_rule: PR_RULE
		do
			create reductions.make
			create transitions.make
			i := states.count
			from until i < 1 loop
				state1 := states.item (i)
					-- Find out whether a lookahead token
					-- is needed in `state1'.
				state1.set_lookahead_needed
				if state1.lookahead_needed then
					reductions.append_last (state1.reductions)
				end
					-- Build transitions going out of `state1'.
				shifts := state1.shifts
				j := shifts.count
				from  until j < 1 loop
					state2 := shifts.item (j)
					a_variable ?= state2.accessing_symbol
					if a_variable /= Void then
						create a_transition.make (state1, state2)
						a_variable.put_transition (a_transition)
						transitions.force_last (a_transition)
					end
					j := j - 1
				end
				i := i - 1
			end
			create visited_states.make (grammar.max_rhs + 1)
			transitions_cursor := transitions.new_cursor
			from transitions_cursor.start until transitions_cursor.after loop
				a_transition := transitions_cursor.item
				follows := a_transition.following_tokens
				state1 := a_transition.target
				shifts := state1.shifts
				i := shifts.count
				from until i < 1 loop
					a_symbol := shifts.item (i).accessing_symbol
					a_token ?= a_symbol
					if a_token /= Void then
						if not follows.has (a_token) then
							follows.force_last (a_token)
						end
					else
						a_variable ?= a_symbol
						check a_variable_not_void: a_variable /= Void end
						if a_variable.is_nullable then
							a_transition.included_tokens.force_last (a_variable.transition (state1))
						end
					end
					i := i - 1
				end
				a_variable ?= a_transition.symbol
				rules := a_variable.rules
				i := rules.count
				from until i < 1 loop
					state1 := a_transition.source
					visited_states.wipe_out
					visited_states.put (state1)
					a_rule := rules.item (i)
					rhs := a_rule.rhs
					nb := rhs.count
					from j := 1 until j > nb loop
						state1 := state1.shift (rhs.item (j))
						check shift_not_void: state1 /= Void end
						visited_states.put (state1)
						j := j + 1
					end
					if state1.lookahead_needed then
						state1.put_transition (a_transition, a_rule)
					end
					j := rhs.count
					visited_states.remove
					from until j < 1 loop
						a_variable ?= rhs.item (j)
						if a_variable /= Void then
							state1 := visited_states.item
							visited_states.remove
							a_variable.transition (state1).included_tokens.force_last (a_transition)
							if not a_variable.is_nullable then
								j := 0 -- Jump out of the loop.
							else
								j := j - 1
							end
						else
							j := 0 -- Jump out of the loop.
						end
					end
					i := i - 1
				end
				transitions_cursor.forth
			end
			create follows_flattener.make
			follows_flattener.flatten (transitions)
			reductions_cursor := reductions.new_cursor
			from reductions_cursor.start until reductions_cursor.after loop
				reductions_cursor.item.build_lookaheads
				reductions_cursor.forth
			end
		end

feature {NONE} -- Constants

	Initial_max_nb_states: INTEGER is 100
	Max_nb_states_increment: INTEGER is 100
			-- Maxium number of states

	No_type: PR_TYPE is
			-- Type used when no type has been specified
		once
			if grammar.types.is_empty then
				create Result.make (0, "ANY")
			else
				Result := grammar.types.first
			end
		ensure
			no_type_not_void: Result /= Void
		end

invariant

	states_not_void: states /= Void
	has_states: not states.is_empty
	no_void_state: not states.has (Void)
	grammar_not_void: grammar /= Void
	valid_grammar: grammar.start_symbol /= Void
	-- positions_sorted: forall state in states, state.positions_sorted
	cached_states_not_void: cached_states /= Void
	no_void_state_list: not cached_states.has_item (Void)
	-- no_void_cached_state: forall state_list in cached_states, forall state in state_list, state /= Void

end
