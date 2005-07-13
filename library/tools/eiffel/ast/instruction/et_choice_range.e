indexing

	description:

		"Eiffel choice ranges in when parts of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHOICE_RANGE

inherit

	ET_CHOICE
		redefine
			reset, is_range
		end

create

	make

feature {NONE} -- Initialization

	make (a_lower: like lower; an_upper: like upper) is
			-- Create a new choice range.
		require
			a_lower_not_void: a_lower /= Void
			an_upper_not_void: an_upper /= Void
		do
			lower := a_lower
			upper := an_upper
			dotdot := tokens.dotdot_symbol
		ensure
			lower_set: lower = a_lower
			upper_set: upper = an_upper
		end

feature -- Initialization

	reset is
			-- Reset choice range as it was when it was first parsed.
		do
			lower.reset
			upper.reset
		end

feature -- Status report

	is_range: BOOLEAN is True
			-- Is current choice a range?

feature -- Access

	lower: ET_CHOICE_CONSTANT
			-- Lower bound of current range

	upper: ET_CHOICE_CONSTANT
			-- Upper bound of current range

	dotdot: ET_SYMBOL
			-- '..' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := lower.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := lower.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := upper.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := upper.break
		end

feature -- Setting

	set_dotdot (a_dotdot: like dotdot) is
			-- Set `dotdot' to `a_dotdot'.
		require
			a_dotdot_not_void: a_dotdot /= Void
		do
			dotdot := a_dotdot
		ensure
			dotdot_set: dotdot = a_dotdot
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_choice_range (Current)
		end

invariant

	lower_not_void: lower /= Void
	upper_not_void: upper /= Void
	dotdot_not_void: dotdot /= Void

end
