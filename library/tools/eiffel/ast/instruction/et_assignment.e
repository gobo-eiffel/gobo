indexing

	description:

		"Eiffel assignment instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSIGNMENT

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_source: like source) is
			-- Create a new assignment instruction.
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			target := a_target
			source := a_source
		ensure
			target_set: target = a_target
			source_set: source = a_source
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of assignment

	source: ET_EXPRESSION
			-- Source of assignment

invariant

	target_not_void: target /= Void
	source_not_void: source /= Void

end -- class ET_ASSIGNMENT
