indexing

	description:

		"Eiffel assignment instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSIGNMENT

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; an_assign: like assign_symbol; a_source: like source) is
			-- Create a new assignment instruction.
		require
			a_target_not_void: a_target /= Void
			an_assign_not_void: an_assign /= Void
			a_source_not_void: a_source /= Void
		do
			target := a_target
			assign_symbol := an_assign
			source := a_source
		ensure
			target_set: target = a_target
			assign_symbol_set: assign_symbol = an_assign
			source_set: source = a_source
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

	assign_symbol: ET_SYMBOL
			-- ':=' symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := target.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := source.break
		end

invariant

	target_not_void: target /= Void
	source_not_void: source /= Void
	assign_symbol_not_void: assign_symbol /= Void

end -- class ET_ASSIGNMENT
