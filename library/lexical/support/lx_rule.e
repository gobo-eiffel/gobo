indexing

	description:

		"Rules associated with regular expressions, %
		%with semantic actions to be executed %
		%whenever an accepting state is reached"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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
			head_count := -1
			trail_count := -1
			line_count := -1
			column_count := -1
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
			head_count := -1
			trail_count := -1
			line_count := -1
			column_count := -1
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
			-- Negative when variable size

	line_count: INTEGER
			-- Number of new-line characters in the head part;
			-- Negative if unknown

	column_count: INTEGER
			-- Number of characters after last new-line in
			-- in the head part; Negative if unknown

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
				(head_count < 0 and trail_count < 0)
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

	set_trail_context (b: BOOLEAN) is
			-- Set `has_trail_context' to `b'.
		do
			has_trail_context := b
		ensure
			has_trail_context_set: has_trail_context = b
		end

	set_head_count (nb: INTEGER) is
			-- Set `head_count' to `nb'.
		do
			head_count := nb
		ensure
			head_count_set: head_count = nb
		end

	set_trail_count (nb: INTEGER) is
			-- Set `trail_count' to `nb'.
		do
			trail_count := nb
		ensure
			trail_count_set: trail_count = nb
		end

	set_line_count (nb: INTEGER) is
			-- Set `line_count' to `nb'.
		do
			line_count := nb
		ensure
			line_count_set: line_count = nb
		end

	set_column_count (nb: INTEGER) is
			-- Set `column_count' to `nb'.
		do
			column_count := nb
		ensure
			column_count_set: column_count = nb
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

end -- class LX_RULE
