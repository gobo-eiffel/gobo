indexing

	description:

		"Rules associated with regular expressions, %
		%with semantic actions to be executed %
		%whenever an accepting state is reached"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_RULE

inherit

	COMPARABLE

creation

	make, make_default

feature {NONE} -- Initialization

	make (an_id: like id; a_pattern: like pattern; an_action: like action) is
			-- Create a new rule.
		require
			a_pattern_not_void: a_pattern /= Void
			an_action_not_void: an_action /= Void
		do
			id := an_id
			pattern := a_pattern
			action := an_action
		ensure
			id_set: id = an_id
			pattern_set: pattern = a_pattern
			action_set: action = an_action
		end

	make_default (an_id: like id) is
			-- Create a default rule.
		do
			id := an_id
			pattern := Dummy_pattern
			action := Dummy_action
		ensure
			id_set: id = an_id
		end

feature -- Access

	id: INTEGER
			-- Identification number

	action: UT_COMMAND
			-- Associated semantic action

	pattern: LX_NFA
			-- Associated pattern

	line_nb: INTEGER
			-- Line number associated of current rule

	head_count, trail_count: INTEGER
			-- Size of the head and trailing context,
			-- 0 when variable size

feature -- Status report

	is_useful: BOOLEAN
			-- Can `pattern' be matched?

	has_trail_context: BOOLEAN
			-- Does rule have a trailing context?

	variable_trail: BOOLEAN is
			-- Has rule a trailing context with both
			-- head and trail having variable size?
		do
			Result := has_trail_context and then
				(head_count = 0 and trail_count = 0)
		end

feature -- Setting

	set_action (an_action: like action) is
			-- Set `action' to `an_action'.
		require
			an_action_not_void: an_action /= Void
		do
			action := an_action
		ensure
			action_set: action = an_action
		end

	set_pattern (a_pattern: like pattern) is
			-- Set `pattern' to `a_pattern'.
		require
			a_pattern_not_void: a_pattern /= Void
		do
			pattern := a_pattern
		ensure
			pattern_set: pattern = a_pattern
		end

	set_id (an_id: like id) is
			-- Set `id' to `an_id'.
		do
			id := an_id
		ensure
			id_set: id = an_id
		end

	set_line_nb (nb: like line_nb) is
			-- Set `line_nb' to `nb'.
		do
			line_nb := nb
		ensure
			line_nb_set: line_nb = nb
		end

	set_useful (b: BOOLEAN) is
			-- Set `is_useful' to `b'.
		do
			is_useful := b
		ensure
			is_useful: is_useful = b
		end

	set_trail_context (variable: BOOLEAN; h, t: INTEGER) is
			-- If `variable' is true then current rule has trailing
			-- context and both the head and trail have variable
			-- size. Otherwise if `h' or `t' is non-zero then there
			-- is a trailing context and `h' is the number of characters
			-- in the matched part of the pattern (or zero if the
			-- matched part has variable length) and `t' is the
			-- number of characters in the trailing context (or zero
			-- if the trailing context has variable size).
		require
			positive_h: h >= 0
			positive_t: t >= 0
			variable: variable implies (h = 0 and t = 0)
		do
			has_trail_context := variable or h > 0 or t > 0
			head_count := h
			trail_count := t
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current rule less than `other'?
		do
			Result := id < other.id
		end

feature {NONE} -- Implementation

	Dummy_pattern: LX_NFA is
			-- Dummy pattern
		once
			!! Result.make_epsilon (False)
		ensure
			dummy_pattern_not_void: Result /= Void
		end

	Dummy_action: LX_ACTION is
			-- Dummy action
		once
			!! Result.make ("")
		ensure
			dummy_action_not_void: Result /= Void
		end

invariant

	action_not_void: action /= Void
	pattern_not_void: pattern /= Void
	positive_head_count: head_count >= 0
	positive_trail_count: trail_count >= 0

end -- class LX_RULE
