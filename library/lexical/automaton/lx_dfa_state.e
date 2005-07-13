indexing

	description:

		"Deterministic finite automaton states"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class LX_DFA_STATE

inherit

	LX_STATE
		redefine
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (nfa_states: DS_ARRAYED_LIST [LX_NFA_STATE]; min, max: INTEGER) is
			-- Create a DFA state made up of the epsilon closure of
			-- `nfa_states'. The epsilon closure is the set of all NFA
			-- states reachable by an arbitrary number of epsilon
			-- transitions, which themselves have a non-epsilon
			-- transition going out or are accepting states.
			-- (Note: `nfa_states' may be altered.)
		require
			nfa_states_not_void: nfa_states /= Void
			no_void_state: not nfa_states.has (Void)
			valid_bounds: min <= max + 1
		local
			i, nb: INTEGER
			state, nfa_state: LX_NFA_STATE
			epsilon_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do		
			nb := nfa_states.count
			create states.make (nb)
			create transitions.make (min, max)
			create accepted_rules.make (nb)
			create accepted_head_rules.make (nb)
			from i := 1 until i > nb loop
				state := nfa_states.item (i)
				if state.transition /= Void then
					epsilon_transition ?= state.transition
					if epsilon_transition = Void then
						states.force_last (state)
						code := code + state.id
					else
						nfa_state := epsilon_transition.target
						if not nfa_states.has (nfa_state) then
							nfa_states.force_last (nfa_state)
							nb := nb + 1
						end
					end
				end
				if state.epsilon_transition /= Void then
					nfa_state := state.epsilon_transition.target
					if not nfa_states.has (nfa_state) then
						nfa_states.force_last (nfa_state)
						nb := nb + 1
					end
				end	
				if state.is_accepting then
					if state.is_accepting_head then
						accepted_head_rules.force_last (state.accepted_rule)
					else
						accepted_rules.force_last (state.accepted_rule)
					end
					if states.is_empty or else states.last /= state then
						states.force_last (state)
						code := code + state.id
					end
				end
				i := i + 1
			end
				-- The NFA states are sorted so that we can compare current
				-- states to other DFA states quickly. Bubble sort is used
				-- because there probably aren't very many states.
			states.sort (bubble_sorter)
				-- The accepted rule sets are sorted in increasing order
				-- so that the disambiguating rule (i.e. the first listed
				-- is considered match in the event of ties) will work.
				-- Bubble sort is used since the list is probably
				-- quite small.
			if not accepted_rules.is_empty then
				accepted_rules.sort (rule_sorter)
				accepted_rules.first.set_useful (True)
			end
			accepted_head_rules.sort (rule_sorter)
		ensure
			sorted: states.sorted (bubble_sorter)
			minimum_symbol_set: minimum_symbol = min
			maximum_symbol_set: maximum_symbol = max
		end

feature -- Access

	id: INTEGER
			-- State id

	states: DS_ARRAYED_LIST [LX_NFA_STATE]
			-- NFA states making up current state

	accepted_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Accepted rule set

	accepted_head_rules: DS_ARRAYED_LIST [LX_RULE]
			-- Rules with trailing context whose head
			-- part is accepted by current state

	transitions: LX_TRANSITION_TABLE [LX_DFA_STATE]
			-- Transition table to next DFA states in automaton,
			-- indexed by transitions' label

	minimum_symbol: INTEGER is
			-- Minimum value allowed for transition labels
		do
			Result := transitions.lower
		ensure
			definition: Result = transitions.lower
		end

	maximum_symbol: INTEGER is
			-- Maximum value allowed for transition labels
		do
			Result := transitions.upper
		ensure
			definition: Result = transitions.upper
		end

	next_state (symbol: INTEGER): LX_DFA_STATE is
			-- Next DFA state reachable through transition labeled `symbol';
			-- Void if no such transition exists
		require
			valid_symbol: valid_symbol (symbol)
		do
			Result := transitions.target (symbol)
		end

feature -- Setting

	set_id (i: like id) is
			-- Set `id' to `i'.
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Status report

	is_accepting: BOOLEAN is
			-- Is current state an accepting state?
		do
			Result := not accepted_rules.is_empty
		ensure then
			definition: Result = not accepted_rules.is_empty
		end

	is_accepting_head: BOOLEAN is
			-- Does current state contain an accepting NFA
			-- state for the head part of a trailing
			-- context rule?
		do
			Result := not accepted_head_rules.is_empty
		ensure
			definition: Result = not accepted_head_rules.is_empty
		end

	valid_symbol (symbol: INTEGER): BOOLEAN is
			-- Is `symbol' a valid value for transition label?
		do
			Result := transitions.valid_label (symbol)
		ensure
			definition: Result = transitions.valid_label (symbol)
			symbol_large_enough: Result implies symbol >= minimum_symbol
			symbol_small_enough: Result implies symbol <= maximum_symbol
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are current state and `other' equal?
		do
			if ANY_.same_types (Current, other) and code = other.code then
				Result := states.is_equal (other.states)
			end
		end

feature {LX_DFA} -- DFA construction

	new_state (symbol: INTEGER): LX_DFA_STATE is
			-- Newly created DFA state reachable from current
			-- state through transition labeled `symbol'
		local
			i, nb: INTEGER
			transition: LX_TRANSITION [LX_NFA_STATE]
			nfa_states: DS_ARRAYED_LIST [LX_NFA_STATE]
		do
			nb := states.count
			create nfa_states.make (nb)
			from i := 1 until i > nb loop
				transition := states.item (i).transition
				if transition /= Void and then transition.labeled (symbol) then
					nfa_states.put_last (transition.target)
				end
				i := i + 1
			end
			create Result.make (nfa_states, minimum_symbol, maximum_symbol)
		ensure
			new_state_not_void: Result /= Void
			minimum_symbol_set: Result.minimum_symbol = minimum_symbol
			maximum_symbol_set: Result.maximum_symbol = maximum_symbol
		end

	partition (equiv_classes: LX_EQUIVALENCE_CLASSES) is
			-- Partition symbols with same out-transitions.
		require
			equiv_classes_not_void: equiv_classes /= Void
			not_built: not equiv_classes.built
			-- forall NFA `transition', transition.recordable (equiv_classes)
		local
			i, nb: INTEGER
			transition: LX_TRANSITION [LX_NFA_STATE]
		do
			nb := states.count
			from i := 1 until i > nb loop
				transition := states.item (i).transition
				if transition /= Void then
					transition.record (equiv_classes)
				end
				i := i + 1
			end
		end

feature {NONE} -- Sort

	bubble_sorter: DS_BUBBLE_SORTER [LX_NFA_STATE] is
			-- NFA state bubble sorter
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [LX_NFA_STATE]
		once
			create a_comparator.make
			create Result.make (a_comparator)
		ensure
			sorter_not_void: Result /= Void
		end

	rule_sorter: DS_BUBBLE_SORTER [LX_RULE] is
			-- Rule bubble sorter
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [LX_RULE]
		once
			create a_comparator.make
			create Result.make (a_comparator)
		ensure
			sorter_not_void: Result /= Void
		end

feature {LX_DFA_STATE} -- Implementation

	code: INTEGER
			-- Hash code value
			-- (Used to speed up equality test.)

invariant

	states_not_void: states /= Void
	no_void_states: not states.has (Void)
	transitions_not_void: transitions /= Void
	accepted_rules_not_void: accepted_rules /= Void
	no_void_accepted_rule: not accepted_rules.has (Void)
	accepted_head_rules_not_void: accepted_head_rules /= Void
	no_void_accepted_head_rule: not accepted_head_rules.has (Void)

end
