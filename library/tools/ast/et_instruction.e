indexing

	description:

		"Eiffel instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INSTRUCTION

feature -- Access

	next: ET_INSTRUCTION
			-- Next instruction in compound

feature -- Setting

	set_next (an_instruction: like next) is
			-- Set `next' to `an_instruction'.
		do
			next := an_instruction
		ensure
			next_set: next = an_instruction
		end

end -- class ET_INSTRUCTION
