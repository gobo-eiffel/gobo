note

	description:

		"Deterministic finite automota"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class LX_DFA

inherit

	LX_AUTOMATON

create

	make

feature {NONE} -- Initialization

	make (start_conditions: LX_START_CONDITIONS; min, max: INTEGER)
			-- Create a new DFA using `start_conditions' to build
			-- the start states. Symbols handled by the DFA should
			-- be in range `min' .. `max'.
		require
			start_conditions_not_void: start_conditions /= Void
			start_conditions_not_empty: not start_conditions.is_empty
			min_large_enough: min >= 0
			max_large_enough: max >= min
		do
			initialize (start_conditions, min, max)
			build
		ensure
			minimum_symbol_set: minimum_symbol = min
			maximum_symbol_set: maximum_symbol = max
			state_states_count_set: start_states_count = 2 * start_conditions.count
		end

	initialize (start_conditions: LX_START_CONDITIONS; min, max: INTEGER)
			-- Initialize current DFA using `start_conditions' to build
			-- the start states. Symbols handled by the DFA should
			-- be in range `min' .. `max'.
		require
			start_conditions_not_void: start_conditions /= Void
			start_conditions_not_empty: not start_conditions.is_empty
			min_large_enough: min >= 0
			max_large_enough: max >= min
		local
			i, nb: INTEGER
		do
			minimum_symbol := min
			maximum_symbol := max
			nb := start_conditions.count
				-- Make room for start states and
				-- an eventual end-of-buffer state.
			create states.make ((2 * nb + 1).max (Initial_max_dfas))
			set_nfa_state_ids (start_conditions)
			from
				i := 1
			until
				i > nb
			loop
				put_start_condition (start_conditions.item (i))
				i := i + 1
			end
			start_states_count := 2 * nb
		ensure
			minimum_symbol_set: minimum_symbol = min
			maximum_symbol_set: maximum_symbol = max
			state_states_count_set: start_states_count = 2 * start_conditions.count
			capacity_large_enough: states.capacity > start_states_count
		end

feature -- Access

	start_state: LX_DFA_STATE
			-- DFA "INITIAL" start state
		do
			Result := states.first
		end

	start_states: DS_ARRAYED_LIST [LX_DFA_STATE]
			-- Start states in DFA
		local
			i: INTEGER
		do
			create Result.make (start_states_count)
			from
				i := 1
			until
				i > start_states_count
			loop
				Result.put_last (states.item (i))
				i := i + 1
			end
		ensure
			start_states_not_void: Result /= Void
			no_void_state: not Result.has_void
			start_states_count: Result.count = start_states_count
		end

	start_states_count: INTEGER
			-- Number of start states in DFA

	minimum_symbol, maximum_symbol: INTEGER
			-- Symbol range allowed by the DFA

	backing_up_count: INTEGER
			-- Number of DFA states requiring backing-up

	states: DS_ARRAYED_LIST [LX_DFA_STATE]
			-- States in DFA

feature -- Element change

	build
			-- Build DFA.
		local
			i: INTEGER
			state: LX_DFA_STATE
		do
			create partitions.make (minimum_symbol, maximum_symbol)
			backing_up_count := 0
			from
				i := 1
			until
				i > start_states_count
			loop
				build_transitions (states.item (i))
				i := i + 1
			end
			from
			until
				i > states.count
			loop
				state := states.item (i)
				build_transitions (state)
				if not state.is_accepting then
					backing_up_count := backing_up_count + 1
				end
				i := i + 1
			end
			partitions := Void
		end

feature {NONE} -- Implementation

	partitions: detachable LX_SYMBOL_PARTITIONS
			-- Partitions of symbols with same out-transitions

	set_nfa_state_ids (start_conditions: LX_START_CONDITIONS)
			-- Give unique ids to each NFA state of each pattern
			-- in each start condition of `start_conditions'.
			-- (This is for optimization purposes in features
			-- `make' and `is_equal' from LX_DFA_STATE.)
		require
			start_conditions_not_void: start_conditions /= Void
		local
			start_condition: LX_START_CONDITION
			patterns: DS_ARRAYED_LIST [LX_NFA]
			nfa: LX_NFA
			nfa_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			visited: DS_HASH_TABLE [LX_NFA, INTEGER]
			i, nb, j, nb2, k, nb3: INTEGER
			key, new_id: INTEGER
		do
			new_id := 1
			create visited.make (100)
			nb := start_conditions.count
			from
				i := 1
			until
				i > nb
			loop
				start_condition := start_conditions.item (i)
				patterns := start_condition.patterns
				nb2 := patterns.count
				from
					j := 1
				until
					j > nb2
				loop
					nfa := patterns.item (j)
					key := nfa.start_state.id
					if not visited.has (key) or else visited.item (key) /= nfa then
						visited.force (nfa, new_id)
						nfa_states := nfa.states
						nb3 := nfa_states.count
						from
							k := 1
						until
							k > nb3
						loop
							nfa_states.item (k).set_id (new_id)
							new_id := new_id + 1
							k := k + 1
						end
					end
					j := j + 1
				end
				patterns := start_condition.bol_patterns
				nb2 := patterns.count
				from
					j := 1
				until
					j > nb2
				loop
					nfa := patterns.item (j)
					key := nfa.start_state.id
					if not visited.has (key) or else visited.item (key) /= nfa then
						visited.force (nfa, new_id)
						nfa_states := nfa.states
						nb3 := nfa_states.count
						from
							k := 1
						until
							k > nb3
						loop
							nfa_states.item (k).set_id (new_id)
							new_id := new_id + 1
							k := k + 1
						end
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	put_start_condition (start_condition: LX_START_CONDITION)
			-- Add start states associated with `start_condition'.
		require
			not_full: states.count + 2 <= states.capacity
			start_condition_not_void: start_condition /= Void
		local
			patterns, bol_patterns: DS_ARRAYED_LIST [LX_NFA]
			nfa_states, nfa_bol_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			nfa_state: LX_NFA_STATE
			state: LX_DFA_STATE
			i, nb: INTEGER
		do
			patterns := start_condition.patterns
			bol_patterns := start_condition.bol_patterns
			nb := patterns.count
			create nfa_states.make (nb)
			create nfa_bol_states.make (nb + bol_patterns.count)
			from
				i := 1
			until
				i > nb
			loop
				nfa_state := patterns.item (i).start_state
				nfa_states.put_last (nfa_state)
				nfa_bol_states.put_last (nfa_state)
				i := i + 1
			end
			nb := bol_patterns.count
			from
				i := 1
			until
				i > nb
			loop
				nfa_bol_states.put_last (bol_patterns.item (i).start_state)
				i := i + 1
			end
			create state.make (nfa_states, minimum_symbol, maximum_symbol)
			states.put_last (state)
			state.set_id (states.count)
			create state.make (nfa_bol_states, minimum_symbol, maximum_symbol)
			states.put_last (state)
			state.set_id (states.count)
		end

	build_transitions (state: LX_DFA_STATE)
			-- Build `state''s out-transitions
			-- and add reachable states to DFA.
		require
			state_not_void: state /= Void
			paritions_not_void: partitions /= Void
		local
			i, nb: INTEGER
			previous: INTEGER
			dfa_state: LX_DFA_STATE
			transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]
			symbols: DS_HASH_SET [INTEGER]
		do
			check paritions_not_void: attached partitions as l_partitions then
				nb := l_partitions.capacity
				if states.capacity - states.count < nb then
					resize (states.capacity + nb + Max_dfas_increment)
				end
				l_partitions.initialize
				state.partition (l_partitions)
				symbols := l_partitions.symbols
				transitions := state.transitions
				from
					i := minimum_symbol
				until
					i > maximum_symbol
				loop
					if symbols.has (i) then
							-- There is a transition labeled `i'
							-- leaving `new_state'.
						if l_partitions.is_representative (i) then
							dfa_state := new_state (state.new_state (i))
						else
							previous := l_partitions.previous_symbol (i)
							check attached transitions.target (previous) as l_target then
								dfa_state := l_target
							end
						end
						transitions.set_target (dfa_state, i)
					end
					i := i + 1
				end
			end
		end

	new_state (state: LX_DFA_STATE): LX_DFA_STATE
			-- Occurrence of `state' in DFA if present;
			-- otherwise insert `state' into DFA
		require
			state_not_void: state /= Void
			not_full: not states.is_full
		local
			i, nb: INTEGER
			l_result: detachable LX_DFA_STATE
		do
			from
				i := start_states_count + 1
				nb := states.count
			until
				l_result /= Void or i > nb
			loop
				l_result := states.item (i)
				if not l_result.is_equal (state) then
					l_result := Void
					i := i + 1
				end
			end
			if l_result = Void then
				Result := state
				states.put_last (state)
				state.set_id (states.count)
			else
				Result := l_result
			end
		ensure
			new_state_not_void: Result /= Void
			same_state: Result.is_equal (state)
			has_new_state: states.has (Result)
		end

feature {NONE} -- Resizing

	resize (n: INTEGER)
			-- Resize DFA so that it can contain upto `n' states.
			-- Do not lose any states.
		require
			n_large_enough: n >= states.capacity
		do
			states.resize (n)
		end

feature {NONE} -- Constants

	Initial_max_dfas: INTEGER = 1000
			-- Initial capacity for `states'

	Max_dfas_increment: INTEGER = 1000
			-- Increment when resizing `states'

invariant

	states_not_void: states /= Void
	no_void_state: not states.has_void
	at_least_one_state: not states.is_empty
	positive_start_states_count: start_states_count > 0
	start_states_count_small_enough: start_states_count <= states.count
	positive_backing_up_count: backing_up_count >= 0
	minimum_symbol_large_enough: minimum_symbol >= 0
	maximum_symbol_large_enough: maximum_symbol >= minimum_symbol
--	min_symbol: forall state in states, state.minimum_symbol = minimum_symbol
--	max_symbol: forall state in states, state.maximum_symbol = maximum_symbol

end
