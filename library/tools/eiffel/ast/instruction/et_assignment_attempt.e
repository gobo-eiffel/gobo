indexing

	description:

		"Eiffel assignment-attempt instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSIGNMENT_ATTEMPT

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_reverse: like reverse_symbol; a_source: like source) is
			-- Create a new assignment-attempt instruction.
		require
			a_target_not_void: a_target /= Void
			a_reverse_not_void: a_reverse /= Void
			a_source_not_void: a_source /= Void
		do
			target := a_target
			reverse_symbol := a_reverse
			source := a_source
		ensure
			target_set: target = a_target
			reverse_symbol_set: reverse_symbol = a_reverse
			source_set: source = a_source
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

	reverse_symbol: ET_SYMBOL
			-- '?=' symbol

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
	reverse_symbol_not_void: reverse_symbol /= Void

end -- class ET_ASSIGNMENT_ATTEMPT
