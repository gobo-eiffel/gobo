﻿note

	description:

		"Non-deterministic finite automota"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"

class LX_NFA

inherit

	LX_AUTOMATON
		redefine
			copy,
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			copy,
			is_equal
		end

create

	make,
	make_symbol,
	make_epsilon,
	make_symbol_class

feature {NONE} -- Initialization

	make (some_states: like states)
			-- Create a new NFA with `some_states' as states.
		require
			some_states_not_void: some_states /= Void
			no_void_states: not some_states.has_void
			start_and_final: some_states.count >= 2
		do
			states := some_states
			in_trail_context := final_state.in_trail_context
		ensure
			start_state_set: start_state = some_states.first
			final_state_set: final_state = some_states.last
		end

	make_symbol (symbol: INTEGER; in_context: BOOLEAN)
			-- Create a new NFA made of two states and
			-- a symbol transition labeled `symbol'.
		local
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			create states.make (Initial_max_state_nb)
			create state1.make (in_context)
			create state2.make (in_context)
			create transition.make (symbol, state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

	make_epsilon (in_context: BOOLEAN)
			-- Create a new NFA made of two states and
			-- an epsilon transition.
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			create states.make (Initial_max_state_nb)
			create state1.make (in_context)
			create state2.make (in_context)
			create transition.make (state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

	make_symbol_class (symbols: LX_SYMBOL_CLASS; in_context: BOOLEAN)
			-- Create a new NFA made of two states and
			-- a symbol class transition labeled `symbols'.
		require
			symbols_not_void: symbols /= Void
		local
			transition: LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			create states.make (Initial_max_state_nb)
			create state1.make (in_context)
			create state2.make (in_context)
			create transition.make (symbols, state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

feature -- Access

	start_state: LX_NFA_STATE
			-- Automaton's start state
		do
			Result := states.first
		ensure then
			definition: Result = states.first
		end

	final_state: LX_NFA_STATE
			-- Automaton's final state
		do
			Result := states.last
		ensure
			final_state_not_void: Result /= Void
			definition: Result = states.last
		end

	states: DS_ARRAYED_LIST [LX_NFA_STATE]
			-- Automaton's states

feature -- Status report

	has (a_state: like start_state): BOOLEAN
			-- Is `a_state' part of current automaton?
		require
			a_state_not_void: a_state /= Void
		do
			Result := states.has (a_state)
		ensure
			definition: Result = states.has (a_state)
		end

	in_trail_context: BOOLEAN
			-- Is automaton part of a trailing context rule?

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current automaton.
		local
			old_states: like states
			new_state, old_state: like start_state
			i, nb: INTEGER
			transition: detachable LX_TRANSITION [LX_NFA_STATE]
			epsilon_transition: detachable LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			standard_copy (other)
			old_states := states
			create states.make (old_states.capacity)
			nb := old_states.count
			from
				i := 1
			until
				i > nb
			loop
				old_state := old_states.item (i)
				old_state.set_id (i)
				states.put_last (old_state.cloned_object)
				i := i + 1
			end
			from
				i := 1
			until
				i > nb
			loop
				new_state := states.item (i)
				transition := new_state.transition
				if transition /= Void then
					transition := transition.cloned_object
					old_state := transition.target
					transition.set_target (states.item (old_state.id))
					new_state.set_transition (transition)
				end
				epsilon_transition := new_state.epsilon_transition
				if epsilon_transition /= Void then
					epsilon_transition := epsilon_transition.cloned_object
					old_state := epsilon_transition.target
					epsilon_transition.set_target (states.item (old_state.id))
					new_state.set_epsilon_transition (epsilon_transition)
				end
				i := i + 1
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current automaton equal to `other'?
		do
			if ANY_.same_types (Current, other) then
					-- This routine has been redefined to follow
					-- the redefinition of `copy'. The new implementation
					-- is not really impressive but a better implementation
					-- would take too much effort to write for little
					-- benefits!
				Result := states.count = other.states.count
			end
		end

feature -- Setting

	set_accepted_rule (a_rule: LX_RULE)
			-- Make `final_state' be an accepting state
			-- for `a_rule'.
		do
			final_state.set_accepted_rule (a_rule)
		ensure
			accepted_rule_set: final_state.accepted_rule = a_rule
		end

	set_beginning_as_normal
			-- Set each state of the epsilon closure of
			-- `start_state' as normal (i.e. not in trailing
			-- context).
		do
			start_state.set_beginning_as_normal
		end

feature -- Operations

	build_concatenation (other: like Current)
			-- Produce automaton which will pattern-match first the
			-- current automaton and then `other', and will fail if
			-- either of the sub-patterns fails
			-- (`other' might be altered!)
			-- Regexp: Current other
		require
			other_not_void: other /= Void
			not_current: other /= Current
		local
			a_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			create a_transition.make (other.start_state)
			final_state.set_transition (a_transition)
			states.append_last (other.states)
		end

	build_union (other: like Current)
			-- Produce automaton which matches either current NFA or `other'
			-- (`other' might be altered!)
			-- Regexp: Current | other
		require
			other_not_void: other /= Void
			not_current: other /= Current
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2, state3: like start_state
		do
			state1 := start_state
			state2 := other.start_state
			if state1.epsilon_transition = Void then
				create transition.make (state2)
				state1.set_epsilon_transition (transition)
			elseif state2.epsilon_transition = Void then
				create transition.make (state1)
				state2.set_epsilon_transition (transition)
				states.replace (state2, 1)
				other.states.replace (state1, 1)
			else
				create state3.make (in_trail_context)
				create transition.make (state1)
				state3.set_transition (transition)
				create transition.make (state2)
				state3.set_epsilon_transition (transition)
				states.replace (state3, 1)
				state3 := final_state
				states.replace (state1, states.count)
				states.force_last (state3)
			end
			state1 := final_state
			state2 := other.final_state
			if not state2.is_accepting then
				create transition.make (state2)
				state1.set_transition (transition)
				states.append_last (other.states)
			elseif not state1.is_accepting then
				create transition.make (state1)
				state2.set_transition (transition)
				states.replace (state2, states.count)
				other.states.replace (state1, other.states.count)
				states.append_last (other.states)
			else
				create state3.make (in_trail_context)
				create transition.make (state3)
				state1.set_transition (transition)
				create transition.make (state3)
				state2.set_transition (transition)
				states.append_last (other.states)
				states.force_last (state3)
			end
		end

	build_optional
			-- Produce automaton which optionally matches wathever
			-- current NFA matched
			-- Regexp: Current ?
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2, state3: like start_state
		do
			if start_state.epsilon_transition = Void then
				create transition.make (final_state)
				start_state.set_epsilon_transition (transition)
			else
				state1 := start_state
				state2 := final_state
				create state3.make (in_trail_context)
				create transition.make (state1)
				state3.set_transition (transition)
				create transition.make (state2)
				state3.set_epsilon_transition (transition)
				states.replace (state3, 1)
				states.replace (state1, states.count)
				states.force_last (state2)
			end
		end

	build_closure
			-- Produce closure of current automaton
			-- Regexp: Current *
		do
			build_positive_closure
			build_optional
		end

	build_positive_closure
			-- Produce positive closure of current automaton
			-- Regexp: Current +
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2, state3: like start_state
		do
			state1 := start_state
			state2 := final_state
			create transition.make (state1)
			state2.set_transition (transition)
			create state3.make (in_trail_context)
			create transition.make (state1)
			state3.set_transition (transition)
			states.replace (state3, 1)
			create state3.make (in_trail_context)
			create transition.make (state3)
			state2.set_epsilon_transition (transition)
			states.force_last (state1)
			states.force_last (state3)
		end

	build_iteration (nb: INTEGER)
			-- Produce automaton that matches whatever current
			-- NFA matched `nb' number of times
			-- Regexp: Current {nb}
		require
			nb_positive: nb > 0
		local
			i: INTEGER
			a_nfa: like Current
		do
			if nb /= 1 then
				a_nfa := cloned_object
				from
					i := 2
				until
					i >= nb
				loop
					a_nfa.build_concatenation (cloned_object)
					i := i + 1
				end
				build_concatenation (a_nfa)
			end
		end

	build_unbounded_iteration (nb: INTEGER)
			-- Produce automaton which matches `nb' or more
			-- occurrences of current automaton
			-- Regexp: Current {nb,}
		require
			nb_positive: nb > 0
		local
			a_nfa: like Current
		do
			a_nfa := cloned_object
			a_nfa.build_closure
			build_iteration (nb)
			build_concatenation (a_nfa)
		end

	build_bounded_iteration (lb, ub: INTEGER)
			-- Produce automaton that matches whatever matched current automaton
			-- from `lb' number of times to `ub' number of times
			-- Regexp: Current {lb,ub}
		require
			lb_positive: lb > 0
			valid_ub: ub >= lb
		local
			i: INTEGER
			a_nfa1, a_nfa2: like Current
		do
			if lb = ub then
				build_iteration (lb)
			else
				a_nfa1 := cloned_object
				a_nfa1.build_optional
				from
					i := lb + 1
				until
					i >= ub
				loop
					a_nfa2 := cloned_object
					a_nfa2.build_concatenation (a_nfa1)
					a_nfa2.build_optional
					a_nfa1 := a_nfa2
					i := i + 1
				end
				build_iteration (lb)
				build_concatenation (a_nfa1)
			end
		end

feature -- Functions

	concatenation (other: like Current): like Current
			-- Concatenation of the current automaton with `other' to
			-- produce an automaton which will pattern-match first the
			-- current automaton and then `other', and will fail if
			-- either of the sub-patterns fails
			-- (`other' might be altered!)
			-- Regexp: Current other
		require
			other_not_void: other /= Void
			not_current: other /= Current
		do
			build_concatenation (other)
			Result := Current
		ensure
			automaton: Result = Current
		end

	union (other: like Current): like Current
			-- Automaton which matches either current NFA or `other'
			-- (`other' might be altered!)
			-- Regexp: Current | other
		require
			other_not_void: other /= Void
			not_current: other /= Current
		do
			build_union (other)
			Result := Current
		ensure
			automaton: Result = Current
		end

	optional: like Current
			-- Automaton which optionally matches wathever
			-- current NFA matched
			-- Regexp: Current ?
		do
			build_optional
			Result := Current
		ensure
			automaton: Result = Current
		end

	closure: like Current
			-- Closure of current automaton
			-- Regexp: Current *
		do
			build_closure
			Result := Current
		ensure
			automaton: Result = Current
		end

	positive_closure: like Current
			-- Positive closure of current automaton
			-- Regexp: Current +
		do
			build_positive_closure
			Result := Current
		ensure
			automaton: Result = Current
		end

	iteration (nb: INTEGER): like Current
			-- Automaton that matches whatever current
			-- NFA matched `nb' number of times
			-- Regexp: Current {nb}
		require
			nb_positive: nb > 0
		do
			build_iteration (nb)
			Result := Current
		ensure
			automaton: Result = Current
		end

	unbounded_iteration (nb: INTEGER): like Current
			-- Automaton which matches `nb' or more
			-- occurrences of current automaton
			-- Regexp: Current {nb,}
		require
			nb_positive: nb > 0
		do
			build_unbounded_iteration (nb)
			Result := Current
		ensure
			automaton: Result = Current
		end

	bounded_iteration (lb, ub: INTEGER): like Current
			-- Automaton that matches whatever matched current automaton
			-- from `lb' number of times to `ub' number of times
			-- Regexp: Current {lb,ub}
		require
			lb_positive: lb > 0
			valid_ub: ub >= lb
		do
			build_bounded_iteration (lb, ub)
			Result := Current
		ensure
			automaton: Result = Current
		end

feature {NONE} -- Constants

	Initial_max_state_nb: INTEGER = 100
			-- Initial maximum number of states

invariant

	states_not_void: states /= Void
	no_void_state: not states.has_void
	start_and_final: states.count >= 2
	final_state: not final_state.has_transition
--	valid_transitions: forall state in states,
--		state.transition /= Void implies
--			states.has (state.transition.target)
--	valid_epsilon_transitions: forall state in states,
--		state.epsilon_transition /= Void implies
--			states.has (state.epsilon_transition.target)

end
