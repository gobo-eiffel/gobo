indexing

	description:

		"Eiffel assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSERTION

feature -- Access

	tag: ET_IDENTIFIER
			-- Tag

	next: ET_ASSERTION
			-- Next assertion in assertion list

feature -- Setting

	set_next (an_assertion: like next) is
			-- Set `next' to `an_assertion'.
		do
			next := an_assertion
		ensure
			next_set: next = an_assertion
		end

end -- class ET_ASSERTION
