indexing

	description:

		"Finite State Machines"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_FSM

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	UT_IMPORTED_FORMATTERS

creation

	make

feature {NONE} -- Initialization

	make (a_grammar: PR_GRAMMAR) is
			-- Create a new finite state machine.
		require
			a_grammar_not_void: a_grammar /= Void
			valid_grammar: a_grammar.start_symbol /= Void
		do
			grammar := a_grammar
			!! states.make (Initial_max_nb_states)
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
				message := STRING_.make (128)
				message.append_string ("Parser contains ")
				if sr_total = 1 then
					message.append_string ("1 shift/reduce conflict")
				elseif sr_total > 1 then
					INTEGER_FORMATTER_.append_decimal_integer (message, sr_total)
					message.append_string (" shift/reduce conflicts")
				end
				if sr_total > 0 and rr_total > 0 then
					message.append_string (" and ")
				end
				if rr_total = 1 then
					message.append_string ("1 reduce/reduce conflict")
				elseif rr_total > 1 then
					INTEGER_FORMATTER_.append_decimal_integer (message, rr_total)
					message.append_string (" reduce/reduce conflicts")
				end
				message.append_string (".%N")
				!! warning.make (message)
				error_handler.report_warning (warning)
			end
		end

	resolve_conflicts_verbose (error_handler: UT_ERROR_HANDLER; a_file: like OUTPUT_STREAM_TYPE) is
			-- Try to resolve any shift/reduce conflicts using
			-- precedence levels. Report conflicts to
			-- `error_handler' and `a_file'.
		require
			error_handler_not_void: error_handler /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
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
						a_file.put_string (".%N")
					end
				end
				i := i + 1
			end
			if (sr_total > 0 and sr_total /= grammar.expected_conflicts) or rr_total > 0 then
				message := STRING_.make (128)
				message.append_string ("Parser contains ")
				if sr_total = 1 then
					message.append_string ("1 shift/reduce conflict")
				elseif sr_total > 1 then
					INTEGER_FORMATTER_.append_decimal_integer (message, sr_total)
					message.append_string (" shift/reduce conflicts")
				end
				if sr_total > 0 and rr_total > 0 then
					message.append_string (" and ")
				end
				if rr_total = 1 then
					message.append_string ("1 reduce/reduce conflict")
				elseif rr_total > 1 then
					INTEGER_FORMATTER_.append_decimal_integer (message, rr_total)
					message.append_string (" reduce/reduce conflicts")
				end
				message.append_string (".%N")
				!! warning.make (message)
				error_handler.report_warning (warning)
			end
		end

feature -- Output

	print_machine (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print textual representation of current
			-- finite state machine to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
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
			!! a_state.make (0, a_variable)
			put_closure_positions (a_state, a_variable)
			a_state.sort_positions
			states.put_first (a_state)
		end

	put_final_state is
			-- Make sure that there is a shift transition
			-- in start state (first state in `states')
			-- that leads to a next-to_final state whose
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
				!! next_to_final_state.make (states.count, start_symbol)
				states.put_last (next_to_final_state)
				start_state.shifts.force_last (next_to_final_state)
			end
			!! eof_token.make (0, "$", No_type)
			!! final_state.make (states.count, eof_token)
			states.put_last (final_state)
			next_to_final_state.shifts.force_last (final_state)
			!! termination_state.make (states.count, eof_token)
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
			derive_list: DS_LINKED_LIST [PR_RULE]
			a_cursor: DS_LINKED_LIST_CURSOR [PR_RULE]
			a_rule: PR_RULE
			a_position: PR_POSITION
		do
			a_cursor := a_variable.derives.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_rule := a_cursor.item
				!! a_position.make (a_rule, 1)
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
			!! transitions.make (- nb_tokens, nb_variables)
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
						!! target.make (0, a_symbol)
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
					!! a_reduction.make (a_position.rule)
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
			!! flattener.make
			flattener.flatten (variables)
		end

	new_state (a_state: PR_STATE): PR_STATE is
			-- Occurrence of `a_state' in FSM if present;
 			-- otherwise insert `a_state' into FSM
		require
			a_state_not_void: a_state /= Void
			not_full: not states.is_full
		local
			i, nb: INTEGER
		do
				-- The rule positions in `a_state' are sorted so
				-- that we can compare states quickly.
			a_state.sort_positions
			from
				i := 2
				nb := states.count
			until
				Result /= Void or i > nb
			loop
				Result := states.item (i)
				if not Result.same_state (a_state) then
					Result := Void
					i := i + 1
				end
			end
			if Result = Void then
				Result := a_state
					-- States are indexed from 0.
				Result.set_id (states.count)
				states.put_last (a_state)
			end
		ensure
			new_state_not_void: Result /= Void
			same_state: Result.same_state (a_state)
			has_new_state: states.has (Result)
		end

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
			!! reductions.make
			!! transitions.make
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
						!! a_transition.make (state1, state2)
						a_variable.put_transition (a_transition)
						transitions.force_last (a_transition)
					end
					j := j - 1
				end
				i := i - 1
			end
			!! visited_states.make (grammar.max_rhs + 1)
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
			!! follows_flattener.make
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

	No_type: PR_NO_TYPE is
			-- Type used when no type has been specified
		once
			!! Result.make (0, "ANY")
		ensure
			no_type_not_void: Result /= Void
		end

invariant

	states_not_void: states /= Void
	has_states: not states.is_empty
	no_void_state: not states.has (Void)
	grammar_not_void: grammar /= Void
	valid_grammar: grammar.start_symbol /= Void
--	positions_sorted: forall state in states, state.positions_sorted

end -- class PR_FSM
