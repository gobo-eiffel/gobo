indexing

	description:

		"Non-deterministic finite automota"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_NFA

inherit

	LX_AUTOMATON
		redefine
			copy, is_equal
		end

creation

	make, make_symbol, make_epsilon, make_symbol_class

feature {NONE} -- Initialization

	make (some_states: like states) is
			-- Create a new NFA with `some_states' as states.
		require
			some_states_not_void: some_states /= Void
			no_void_states: not some_states.has (Void)
			start_and_final: some_states.count >= 2
		do
			states := some_states
			in_trail_context := final_state.in_trail_context
		ensure
			start_state_set: start_state = some_states.first
			final_state_set: final_state = some_states.last
		end

	make_symbol (symbol: INTEGER; in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- a symbol transition labeled `symbol'.
		local
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			!! states.make (Initial_max_state_nb)
			!! state1.make (in_context)
			!! state2.make (in_context)
			!! transition.make (symbol, state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

	make_epsilon (in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- an epsilon transition.
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			!! states.make (Initial_max_state_nb)
			!! state1.make (in_context)
			!! state2.make (in_context)
			!! transition.make (state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

	make_symbol_class (symbols: LX_SYMBOL_CLASS; in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- a symbol class transition labeled `symbols'.
		require
			symbols_not_void: symbols /= Void
		local
			transition: LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE]
			state1, state2: like start_state
		do
			in_trail_context := in_context
			!! states.make (Initial_max_state_nb)
			!! state1.make (in_context)
			!! state2.make (in_context)
			!! transition.make (symbols, state2)
			state1.set_transition (transition)
			states.put_first (state1)
			states.put_last (state2)
		ensure
			trail: in_trail_context = in_context
		end

feature -- Access

	start_state: LX_NFA_STATE is
			-- Automaton's start state
		do
			Result := states.first
		ensure then
			definition: Result = states.first
		end

	final_state: LX_NFA_STATE is
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

	has (a_state: like start_state): BOOLEAN is
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

	copy (other: like Current) is
			-- Copy `other' to current automaton.
		local
			old_states: like states
			new_state, old_state: like start_state
			i, nb: INTEGER
			transition: LX_TRANSITION [LX_NFA_STATE]
			epsilon_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			standard_copy (other)
			old_states := states
			!! states.make (old_states.capacity)
			nb := old_states.count
			from i := 1 until i > nb loop
				old_state := old_states.item (i)
				old_state.set_id (i)
				states.put_last (clone (old_state))
				i := i + 1
			end
			from i := 1 until i > nb loop
				new_state := states.item (i)
				transition := new_state.transition
				if transition /= Void then
					transition := clone (transition)
					old_state := transition.target
					transition.set_target (states.item (old_state.id))
					new_state.set_transition (transition)
				end
				epsilon_transition := new_state.epsilon_transition
				if epsilon_transition /= Void then
					epsilon_transition := clone (epsilon_transition)
					old_state := epsilon_transition.target
					epsilon_transition.set_target (states.item (old_state.id))
					new_state.set_epsilon_transition (epsilon_transition)
				end
				i := i + 1
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current automaton equal to `other'?
		do
				-- This routine has been redefined to follow 
				-- the redefinition of `copy'. The new implementation
				-- is not really impressive but a better implementation
				-- would take too much effort to write for little
				-- benefits!
			Result := states.count = other.states.count
		end

feature -- Setting

	set_accepted_rule (a_rule: LX_RULE) is
			-- Make `final_state' be an accepting state
			-- for `a_rule'.
		do
			final_state.set_accepted_rule (a_rule)
		ensure
			accepted_rule_set: final_state.accepted_rule = a_rule
		end

	set_beginning_as_normal is
			-- Set each state of the epsilon closure of
			-- `start_state' as normal (i.e. not in trailing
			-- context).
		do
			start_state.set_beginning_as_normal
		end

feature -- Operation

	concatenation, infix "&" (other: like Current): like Current is
			-- Concatenation of the current automaton with `other' to
			-- produce an automaton which will pattern-match first the
			-- current automaton and then `other', and will fail if
			-- either of the sub-patterns fails
			-- (`other' might be altered!)
		require
			other_not_void: other /= Void
			not_current: other /= Current
		local
			a_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			!! a_transition.make (other.start_state)
			final_state.set_transition (a_transition)
			states.append_last (other.states)
			Result := Current
		ensure
			automaton: Result = Current
		end
			
	union, infix "|" (other: like Current): like Current is
			-- Automaton which matches either current NFA or `other'
			-- (`other' might be altered!)
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
				!! transition.make (state2)
				state1.set_epsilon_transition (transition)
			elseif state2.epsilon_transition = Void then
				!! transition.make (state1)
				state2.set_epsilon_transition (transition)
				states.replace (state2, 1)
				other.states.replace (state1, 1)
			else
				!! state3.make (in_trail_context)
				!! transition.make (state1)
				state3.set_transition (transition)
				!! transition.make (state2)
				state3.set_epsilon_transition (transition)
				states.replace (state3, 1)
				state3 := final_state
				states.replace (state1, states.count)
				states.force_last (state3)
			end
			state1 := final_state
			state2 := other.final_state
			if not state2.is_accepting then
				!! transition.make (state2)
				state1.set_transition (transition)
				states.append_last (other.states)
			elseif not state1.is_accepting then
				!! transition.make (state1)
				state2.set_transition (transition)
				states.replace (state2, states.count)
				other.states.replace (state1, other.states.count)
				states.append_last (other.states)
			else
				!! state3.make (in_trail_context)
				!! transition.make (state3)
				state1.set_transition (transition)
				!! transition.make (state3)
				state2.set_transition (transition)
				states.append_last (other.states)
				states.force_last (state3)
			end
			Result := Current
		ensure
			automaton: Result = Current
		end

	optional, prefix "|?|": like Current is
			-- Automaton which optionally matches wathever
			-- current NFA matched
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2, state3: like start_state
		do
			if start_state.epsilon_transition = Void then
				!! transition.make (final_state)
				start_state.set_epsilon_transition (transition)
			else
				state1 := start_state
				state2 := final_state
				!! state3.make (in_trail_context)
				!! transition.make (state1)
				state3.set_transition (transition)
				!! transition.make (state2)
				state3.set_epsilon_transition (transition)
				states.replace (state3, 1)
				states.replace (state1, states.count)
				states.force_last (state2)
			end
			Result := Current
		ensure
			automaton: Result = Current
		end

	closure, prefix "|*|": like Current is
			-- Closure of current automaton
		do
			Result := |?| |+| Current
		ensure
			automaton: Result = Current
		end

	positive_closure, prefix "|+|": like Current is
			-- Positive closure of current automaton
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state1, state2, state3: like start_state
		do
			state1 := start_state
			state2 := final_state
			!! transition.make (state1)
			state2.set_transition (transition)
			!! state3.make (in_trail_context)
			!! transition.make (state1)
			state3.set_transition (transition)
			states.replace (state3, 1)
			!! state3.make (in_trail_context)
			!! transition.make (state3)
			state2.set_epsilon_transition (transition)
			states.force_last (state1)
			states.force_last (state3)
			Result := Current
		ensure
			automaton: Result = Current
		end

	iteration, infix "|{n}|" (nb: INTEGER): like Current is
			-- Automaton that matches whatever current
			-- NFA matched `nb' number of times
		require
			nb_positive: nb > 0
		local
			i: INTEGER
		do
			if nb = 1 then
				Result := Current
			else
				Result := clone (Current)
				from i := 2 until i >= nb loop
					Result := Result & clone (Current)
					i := i + 1
				end
				Result := Current & Result
			end
		ensure
			automaton: Result = Current
		end

	unbounded_iteration, infix "|{n,}|"  (nb: INTEGER): like Current is
			-- Automaton which matches `nb' or more
			-- occurrences of current automaton
		require
			nb_positive: nb > 0
		do
			Result := |*| clone (Current)
			Result := (Current |{n}| nb) & Result
		ensure
			automaton: Result = Current
		end

	bounded_iteration (lb, ub: INTEGER): like Current is
			-- Automaton that matches whatever matched current automaton
			-- from `lb' number of times to `ub' number of times
		require
			lb_positive: lb > 0
			valid_ub: ub >= lb
		local
			i: INTEGER
		do
			if lb = ub then
				Result := Current |{n}| lb
			else
				Result := |?| clone (Current)
				from i := lb + 1 until i >= ub loop
					Result := |?| (clone (Current) & Result)
					i := i + 1
				end
				Result := (Current |{n}| lb) & Result
			end
		ensure
			automaton: Result = Current
		end

feature {NONE} -- Constants

	Initial_max_state_nb: INTEGER is 100
			-- Initial maximum number of states

invariant

	states_not_void: states /= Void
	no_void_state: not states.has (Void)
	start_and_final: states.count >= 2
	final_state: not final_state.has_transition
	-- valid_transitions: forall state in states,
	--		state.transition /= Void implies
	--			states.has (state.transition.target)
	-- valid_epsilon_transitions: forall state in states,
	--		state.epsilon_transition /= Void implies
	--			states.has (state.epsilon_transition.target)

end -- class LX_NFA
