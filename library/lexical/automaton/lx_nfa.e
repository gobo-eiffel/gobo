indexing

	description:

		"Non-deterministic finite automota"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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

	make (start, final: like start_state) is
			-- Create a new NFA with start state `start'
			-- and final state `final'.
		require
			start_not_void: start /= Void
			final_not_void: final /= Void
			connected: start.connected (final)
			valid_automaton: start /= final
		local
			states: DS_LINKED_LIST [LX_NFA_STATE]
			state, new_state: like start_state
			cursor: DS_LINKED_LIST_CURSOR [LX_NFA_STATE]
		do
			!! states.make
			states.put_first (start)
			cursor := states.new_cursor
			from cursor.start until cursor.after loop
				state := cursor.item
				if state.transition /= Void then
					new_state := state.transition.target
					if not states.has (new_state) then
						states.put_last (new_state)
					end
				end
				if state.epsilon_transition /= Void then
					new_state := state.epsilon_transition.target
					if not states.has (new_state) then
						states.put_last (new_state)
					end
				end
				cursor.forth
			end
			count := states.count
			start_state := start
			final_state := final
			in_trail_context := final.in_trail_context
		ensure
			start_state_set: start_state = start
			final_state_set: final_state = final
		end

	make_symbol (symbol: INTEGER; in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- a symbol transition labeled `symbol'.
		local
			transition: LX_SYMBOL_TRANSITION [LX_NFA_STATE]
		do
			in_trail_context := in_context
			!! start_state.make (in_context)
			!! final_state.make (in_context)
			!! transition.make (symbol, final_state)
			start_state.set_transition (transition)
			count := 2
		ensure
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
			trail: in_trail_context = in_context
		end

	make_epsilon (in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- an epsilon transition.
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			in_trail_context := in_context
			!! start_state.make (in_context)
			!! final_state.make (in_context)
			!! transition.make (final_state)
			start_state.set_transition (transition)
			count := 2
		ensure
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
			trail: in_trail_context = in_context
		end

	make_symbol_class (symbols: LX_SYMBOL_CLASS; in_context: BOOLEAN) is
			-- Create a new NFA made of two states and
			-- a symbol class transition labeled `symbols'.
		require
			symbols_not_void: symbols /= Void
		local
			transition: LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE]
		do
			in_trail_context := in_context
			!! start_state.make (in_context)
			!! final_state.make (in_context)
			!! transition.make (symbols, final_state)
			start_state.set_transition (transition)
			count := 2
		ensure
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
			trail: in_trail_context = in_context
		end

feature -- Access

	start_state, final_state: LX_NFA_STATE
			-- Automaton's start and final states

feature -- Measurement

	count: INTEGER
			-- Number of states in automaton

feature -- Status report

	has (a_state: like start_state): BOOLEAN is
			-- Is `a_state' part of current automaton?
		require
			a_state_not_void: a_state /= Void
		local
			visited_states: DS_HASH_TABLE [LX_NFA_STATE, INTEGER]
			old_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			a_target, old_state: LX_NFA_STATE
			i, nb: INTEGER
		do
			if a_state = start_state or a_state = final_state then
				Result := True
			else
				from
					!! visited_states.make (count * 3 // 2)
					!! old_states.make (count)
					old_state := start_state
					old_states.put_first (old_state)
					visited_states.put (old_state, old_state.id)
					i := 1
					nb := count
				until
					Result or i > nb
				loop
					old_state := old_states.item (i)
					if old_state.transition /= Void then
						a_target := old_state.transition.target
						if a_target = a_state then
							Result := True
						elseif not visited_states.has (a_target.id) then
							old_states.put_last (a_target)
							visited_states.put (a_target, a_target.id)
						end
					end
					if not Result and old_state.epsilon_transition /= Void then
						a_target := old_state.epsilon_transition.target
						if a_target = a_state then
							Result := True
						elseif not visited_states.has (a_target.id) then
							old_states.put_last (a_target)
							visited_states.put (a_target, a_target.id)
						end
					end
					i := i + 1
				end
			end
		end

	in_trail_context: BOOLEAN
			-- Is automaton part of a trailing context rule?

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current automaton.
		local
			new_states: DS_HASH_TABLE [LX_NFA_STATE, INTEGER]
			old_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			state, new_state, old_state: LX_NFA_STATE
			cursor: DS_HASH_TABLE_CURSOR [LX_NFA_STATE, INTEGER]
			transition: LX_TRANSITION [LX_NFA_STATE]
			epsilon_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			i, nb: INTEGER
		do
			standard_copy (other)
			!! new_states.make (count * 3 // 2)
			!! old_states.make (count)
			state := start_state
			old_states.put_first (state)
			new_state := clone (state)
			new_state.reset_id
			new_states.put (new_state, state.id)
			nb := count
			from i := 1 until i > nb loop
				old_state := old_states.item (i)
				if old_state.transition /= Void then
					state := old_state.transition.target
					if not new_states.has (state.id) then
						old_states.put_last (state)
						new_state := clone (state)
						new_state.reset_id
						new_states.put (new_state, state.id)
					end
				end
				if old_state.epsilon_transition /= Void then
					state := old_state.epsilon_transition.target
					if not new_states.has (state.id) then
						old_states.put_last (state)
						new_state := clone (state)
						new_state.reset_id
						new_states.put (new_state, state.id)
					end
				end
				i := i + 1
			end
			cursor := new_states.new_cursor
			from cursor.start until cursor.after loop
				new_state := cursor.item
				transition := clone (new_state.transition)
				if transition /= Void then
					state := transition.target
					transition.set_target (new_states.item (state.id))
					new_state.set_transition (transition)
				end
				epsilon_transition := clone (new_state.epsilon_transition)
				if epsilon_transition /= Void then
					state := epsilon_transition.target
					epsilon_transition.set_target (new_states.item (state.id))
					new_state.set_epsilon_transition (epsilon_transition)
				end
				cursor.forth
			end
			start_state := new_states.item (other.start_state.id)
			final_state := new_states.item (other.final_state.id)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current automaton equal to `other'?
		do
			Result := count = other.count
			--| Should use `deep_equal', but don't because of `id'
			--| in `LX_NFA_STATE'.
			--| Result := deep_equal (Current, other)
		end

feature -- Setting

	set_accepting_id (acc_id: INTEGER) is
			-- Make `final_state' be an accepting state.
		do
			final_state.set_accepting_id (acc_id)
		ensure
			accepting_id_set: final_state.accepting_id = acc_id
		end

	set_beginning_as_normal is
			-- Set each state of the epsilon closure of
			-- `start_state' as normal (i.e. not trailing
			-- context-associated).
		do
			start_state.set_beginning_as_normal
		end

feature -- Operation

	concatenation, infix "&" (other: like Current): like Current is
			-- Concatenation of the current automaton with `other' to
			-- produce an automaton which will pattern-match first the
			-- current automaton and then `other', and will fail if
			-- either of the sub-patterns fails
		require
			other_not_void: other /= Void
			not_current: other /= Current
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
			constraint3: not other.start_state.connected (other.start_state)
			constraint4: not other.final_state.has_transition
		local
			a_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			!! a_transition.make (other.start_state)
			final_state.set_transition (a_transition)
			final_state := other.final_state
			count := count + other.count
			Result := Current
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end
			
	union, infix "|" (other: like Current): like Current is
			-- Automaton which matches either current NFA or `other'
		require
			other_not_void: other /= Void
			not_current: other /= Current
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
			constraint3: not other.start_state.connected (other.start_state)
			constraint4: not other.final_state.has_transition
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state: like start_state
		do
			if start_state.epsilon_transition = Void then
				!! transition.make (other.start_state)
				start_state.set_epsilon_transition (transition)
			elseif other.start_state.epsilon_transition = Void then
				!! transition.make (start_state)
				start_state := other.start_state
				start_state.set_epsilon_transition (transition)
			else
				!! state.make (in_trail_context)
				!! transition.make (start_state)
				state.set_transition (transition)
				!! transition.make (other.start_state)
				state.set_epsilon_transition (transition)
				start_state := state
				count := count + 1
			end
			if not final_state.is_accepting then
				!! transition.make (final_state)
				other.final_state.set_transition (transition)
			elseif not other.final_state.is_accepting then
				!! transition.make (other.final_state)
				final_state.set_transition (transition)
				final_state := other.final_state
			else
				!! state.make (in_trail_context)
				!! transition.make (state)
				final_state.set_transition (transition)
				!! transition.make (state)
				other.final_state.set_transition (transition)
				final_state := state
				count := count + 1
			end
			count := count + other.count
			Result := Current
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	optional, prefix "|?|": like Current is
			-- Automaton which optionally matches wathever
			-- current NFA matched
		require
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state: like start_state
		do
			if start_state.epsilon_transition = Void then
				!! transition.make (final_state)
				start_state.set_epsilon_transition (transition)
			else
				!! state.make (in_trail_context)
				!! transition.make (start_state)
				state.set_transition (transition)
				!! transition.make (final_state)
				state.set_epsilon_transition (transition)
				start_state := state
				count := count + 1
			end
			Result := Current
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	closure, prefix "|*|": like Current is
			-- Closure of current automaton
		require
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
		do
			Result := |?| |+| Current
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	positive_closure, prefix "|+|": like Current is
			-- Positive closure of current automaton
		require
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
		local
			transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			state: like start_state
		do
			!! transition.make (start_state)
			final_state.set_transition (transition)
			!! state.make (in_trail_context)
			!! transition.make (start_state)
			state.set_transition (transition)
			start_state := state
			!! state.make (in_trail_context)
			!! transition.make (state)
			final_state.set_epsilon_transition (transition)
			final_state := state
			count := count + 2
			Result := Current
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	iteration, infix "|{n}|" (nb: INTEGER): like Current is
			-- Automaton that matches whatever current
			-- NFA matched `nb' number of times
		require
			nb_positive: nb > 0
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
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
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	unbounded_iteration, infix "|{n,}|"  (nb: INTEGER): like Current is
			-- Automaton which matches `nb' or more
			-- occurrences of current automaton
		require
			nb_positive: nb > 0
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
		do
			Result := |*| clone (Current)
			Result := (Current |{n}| nb) & Result
		ensure
			automaton: Result = Current
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

	bounded_iteration (lb, ub: INTEGER): like Current is
			-- Automaton that matches whatever matched current automaton
			-- from `lb' number of times to `ub' number of times
		require
			lb_positive: lb > 0
			valid_ub: ub >= lb
			constraint1: not start_state.connected (start_state)
			constraint2: not final_state.has_transition
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
			start_state: not start_state.connected (start_state)
			final_state: not final_state.has_transition
		end

invariant
		
	final_state_not_void: final_state /= Void
	connected: start_state.connected (final_state)
	valid_automaton: start_state /= final_state

end -- class LX_NFA
