indexing

	description:

		"Deterministic finite automaton states";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_DFA_STATE

inherit

	LX_STATE
		undefine
#ifdef ISE || HACT
			consistent, setup,
#endif
			copy
		redefine
			is_equal
		select
			is_equal
		end

	HASHABLE
		undefine
#ifdef ISE || HACT
			consistent, setup,
#endif
			copy
		redefine
			is_equal
#ifdef VE
--| Bug in VE (970520a)
		select
			is_equal
#endif
		end

	DS_ARRAYED_LIST [LX_NFA_STATE]
		rename
			make as make_arrayed_list,
			is_equal as arrayed_list_is_equal
		export
			{NONE} all
			{ANY} item, count
		end

creation

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
			make_arrayed_list (nb)
			!! transitions.make (min, max)
			!! accepting_ids.make (nb)
			from i := 1 until i > nb loop
				state := nfa_states.item (i)
				if state.transition /= Void then
					epsilon_transition ?= state.transition
					if epsilon_transition = Void then
						force_last (state)
						hash_code := hash_code + state.id
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
					accepting_ids.force_last (state.accepting_id)
					if is_empty or else last /= state then
						force_last (state)
						hash_code := hash_code + state.id
					end
				end
				i := i + 1
			end
				-- The NFA states are sorted so that we can compare current
				-- states to other DFA states quickly. Bubble sort is used
				-- because there probably aren't very many states.
			sort (bubble_sorter)
				-- The accepting id set is sorted in increasing order
				-- so that the disambiguating rule (i.e. the first listed
				-- is considered match in the event of ties) will work.
				-- Bubble sort is used since the list is probably
				-- quite small.
			accepting_ids.sort (id_sorter)
		ensure
			sorted: sorted (bubble_sorter)
			minimum_symbol_set: minimum_symbol = min
			maximum_symbol_set: maximum_symbol = max
		end

feature -- Access

	id: INTEGER
			-- State id

	hash_code: INTEGER
			-- Hash code value

	accepting_ids: DS_ARRAYED_LIST [INTEGER]
			-- Accepting id set

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

	set_accepting_ids (ids: like accepting_ids) is
			-- Set `accepting_ids' to `ids'.
		require
			ids_not_void: ids /= Void
		do
			accepting_ids := ids
		ensure
			accepting_id_set: accepting_ids = ids
		end

feature -- Status report

	is_accepting: BOOLEAN is
			-- Is current state an accepting state?
		do
			Result := not accepting_ids.is_empty
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
			if hash_code = other.hash_code then
				Result := arrayed_list_is_equal (other)
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
			nb := count
			!! nfa_states.make (nb)
			from i := 1 until i > nb loop
				transition := item (i).transition
				if transition /= Void and then transition.labeled (symbol) then
					nfa_states.put_last (transition.target)
				end
				i := i + 1
			end
			!! Result.make (nfa_states, minimum_symbol, maximum_symbol)
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
			nb := count
			from i := 1 until i > nb loop
				transition := item (i).transition
				if transition /= Void then
					transition.record (equiv_classes)
				end
				i := i + 1
			end
		end

feature {NONE} -- Sort

	bubble_sorter: DS_BUBBLE_SORTER [LX_NFA_STATE] is
			-- NFA state bubble sorter
		once
			!! Result
		ensure
			sorter_not_void: Result /= Void
		end

	id_sorter: DS_BUBBLE_SORTER [INTEGER] is
			-- Id bubble sorter
		once
			!! Result
		ensure
			sorter_not_void: Result /= Void
		end

invariant

	transitions_not_void: transitions /= Void
	accepting_ids_not_void: accepting_ids /= Void

end -- class LX_DFA_STATE
