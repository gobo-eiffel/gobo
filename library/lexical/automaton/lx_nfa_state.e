indexing

	description:

		"Non-deterministic finite automaton states"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_NFA_STATE

inherit

	LX_STATE
		redefine
			is_equal
		end

	COMPARABLE
		redefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (in_context: like in_trail_context) is
			-- Create a new NFA state.
		do
			id := new_id
			in_trail_context := in_context
		ensure
			in_trail_context_set: in_trail_context = in_context
		end

feature -- Access

	id: INTEGER
			-- State identifier
			--| This should definitely be implemented by `object_id'.
			--| (ISE Eiffel does not support this feature yet.)

	transition: LX_TRANSITION [LX_NFA_STATE]
			-- Out-transition

	epsilon_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			-- Epsilon out-transition

	accepted_rule: LX_RULE
			-- Rule that current state is accepting,
			-- Void otherwise

feature -- Status report

	in_trail_context: BOOLEAN
			-- Is state part of a trailing context?

	is_accepting: BOOLEAN is
			-- Is current state an accepting state?
		do
			Result := accepted_rule /= Void
		ensure then
			definition: Result = (accepted_rule /= Void)
		end

	is_accepting_head: BOOLEAN is
			-- Is current state an accepting state for the
			-- head part of a trailing context rule?
		do
			Result := is_accepting and
				not in_trail_context and
				has_transition
		ensure
			is_accepting: Result implies is_accepting
		end

	has_transition: BOOLEAN is
			-- Is current state connected to another state?
		do
			Result := transition /= Void or epsilon_transition /= Void
		ensure
			has_transition: Result implies
				(transition /= Void or epsilon_transition /= Void)
		end

	has_epsilon_transition: BOOLEAN is
			-- Is `transition' an epsilon transition?
		local
			xtion: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			xtion ?= transition
			Result := xtion /= Void
		ensure
			has_transition: Result implies has_transition
		end

	connected (other: like Current): BOOLEAN is
			-- Is current state connected to `other'
			-- through one or more transitions?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			marked_states: DS_ARRAYED_LIST [LX_NFA_STATE]
			state, cursor_state: LX_NFA_STATE
		do
			from
				!! marked_states.make (50)
				marked_states.put_first (Current)
				nb := 1
				i := 1
			until
				Result or i > nb
			loop
				cursor_state := marked_states.item (i)
				if cursor_state.transition /= Void then
					state := cursor_state.transition.target
					if state = other then
						Result := True
					elseif not marked_states.has (state) then
						marked_states.put_last (state)
						nb := nb + 1
					end
				end
				if not Result and cursor_state.epsilon_transition /= Void then
					state := cursor_state.epsilon_transition.target
					if state = other then
						Result := True
					elseif not marked_states.has (state) then
						marked_states.put_last (state)
						nb := nb + 1
					end
				end
				i := i + 1
			end
		ensure
			has_transition: Result implies has_transition
		end
	
feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current state equal to `other'?
		do
			Result := id = other.id
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is current state less than `other'?
			-- (`id' comparison)
		do
			Result := id < other.id
		end

feature -- Setting

	set_transition (xtion: like transition) is
			-- Set `transition' to `xtion'.
		do
			transition := xtion
		ensure
			transition_set: transition = xtion
		end

	set_epsilon_transition (xtion: like epsilon_transition) is
			-- Set `epsilon_transition' to `xtion'.
		do
			epsilon_transition := xtion
		ensure
			epsilon_transition_set: epsilon_transition = xtion
		end

	reset_id is
			-- Give a new id to current state.
		do
			id := new_id
		end

feature -- Status setting

	set_accepted_rule (a_rule: LX_RULE) is
			-- Set `accepted_rule' to `a_rule'.
		do
			accepted_rule := a_rule
		ensure
			accepted_rule_set: accepted_rule = a_rule
		end

	set_beginning_as_normal is
			-- Set each state of the epsilon closure as normal
			-- (i.e not in trailing context).
		local
			epsilon_xtion: LX_EPSILON_TRANSITION [LX_NFA_STATE]
		do
			if in_trail_context then
				in_trail_context := False
				epsilon_xtion ?= transition
				if epsilon_xtion /= Void then
					epsilon_xtion.target.set_beginning_as_normal
				end
				if epsilon_transition /= Void then
					epsilon_transition.target.set_beginning_as_normal
				end
			end
		ensure
			not_in_trail_context: not in_trail_context
		end

feature {NONE} -- Implementation

	new_id: INTEGER is
			-- New NFA state id
		do
			Result := Counter.item + 1
			Counter.put (Result)
		end

	Counter: DS_CELL [INTEGER] is
			-- NFA state id counter
		once
			!! Result.make (0)
		ensure
			counter_not_void: Result /= Void
		end

end -- class LX_NFA_STATE
