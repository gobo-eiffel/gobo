note

	description:

		"Non-deterministic finite automaton states"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_NFA_STATE

inherit

	LX_STATE
		redefine
			is_equal
		end

	KL_COMPARABLE
		redefine
			is_equal
		end

create

	make

feature {NONE} -- Initialization

	make (in_context: like in_trail_context)
			-- Create a new NFA state.
		do
			in_trail_context := in_context
		ensure
			in_trail_context_set: in_trail_context = in_context
		end

feature -- Access

	transition: LX_TRANSITION [LX_NFA_STATE]
			-- Out-transition

	epsilon_transition: LX_EPSILON_TRANSITION [LX_NFA_STATE]
			-- Epsilon out-transition

	accepted_rule: LX_RULE
			-- Rule that current state is accepting,
			-- Void otherwise

	id: INTEGER
			-- State identifier
			-- (This is used for optimization purposes in routines
			-- `copy' from LX_NFA and `make' from LX_DFA_STATE.)

feature -- Status report

	in_trail_context: BOOLEAN
			-- Is state part of a trailing context?

	is_accepting: BOOLEAN
			-- Is current state an accepting state?
		do
			Result := accepted_rule /= Void
		ensure then
			definition: Result = (accepted_rule /= Void)
		end

	is_accepting_head: BOOLEAN
			-- Is current state an accepting state for the
			-- head part of a trailing context rule?
		do
			Result := is_accepting and not in_trail_context and has_transition
		ensure
			is_accepting: Result implies is_accepting
		end

	has_transition: BOOLEAN
			-- Is current state connected to another state?
		do
			Result := transition /= Void or epsilon_transition /= Void
		ensure
			has_transition: Result implies (transition /= Void or epsilon_transition /= Void)
		end

	has_epsilon_transition: BOOLEAN
			-- Is `transition' an epsilon transition?
		do
			Result := attached {LX_EPSILON_TRANSITION [LX_NFA_STATE]} transition
		ensure
			has_transition: Result implies has_transition
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current state equal to `other'?
		do
				-- This routine has been redefined to follow
				-- the redefinition of `is_less' (for details,
				-- see postconditions in class COMPARABLE.)
			Result := id = other.id
		end

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current state less than `other'?
			-- (This is used for optimization purposes
			-- in routine `make' from LX_DFA_STATE.)
		do
			Result := id < other.id
		end

feature -- Setting

	set_transition (xtion: like transition)
			-- Set `transition' to `xtion'.
		do
			transition := xtion
		ensure
			transition_set: transition = xtion
		end

	set_epsilon_transition (xtion: like epsilon_transition)
			-- Set `epsilon_transition' to `xtion'.
		do
			epsilon_transition := xtion
		ensure
			epsilon_transition_set: epsilon_transition = xtion
		end

	set_id (an_id: INTEGER)
			-- Set `id' to `an_id'.
			-- (This is used for optimization purposes in routines
			-- `copy' from LX_NFA and `make' from LX_DFA_STATE.)
		do
			id := an_id
		ensure
			id_set: id = an_id
		end

feature -- Status setting

	set_accepted_rule (a_rule: LX_RULE)
			-- Set `accepted_rule' to `a_rule'.
		do
			accepted_rule := a_rule
		ensure
			accepted_rule_set: accepted_rule = a_rule
		end

	set_beginning_as_normal
			-- Set each state of the epsilon closure as normal
			-- (i.e not in trailing context).
		do
			if in_trail_context then
				in_trail_context := False
				if attached {LX_EPSILON_TRANSITION [LX_NFA_STATE]} transition as epsilon_xtion then
					epsilon_xtion.target.set_beginning_as_normal
				end
				if epsilon_transition /= Void then
					epsilon_transition.target.set_beginning_as_normal
				end
			end
		ensure
			not_in_trail_context: not in_trail_context
		end

end
