indexing

	description:

		"Eiffel assertion lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSERTIONS

creation

	make

feature {NONE} -- Initialization

	make (an_assertion: like assertions) is
			-- Create a new assertion list with initially
			-- one assertion `an_assertion'.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			assertions := an_assertion
		ensure
			assertions_set: assertions = an_assertion
		end

feature -- Access

	assertions: ET_ASSERTION
			-- Assertions

feature -- Element change

	put_first (an_assertion: like assertions) is
			-- Add `an_assertion' to the list of assertions.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			an_assertion.set_next (assertions)
			assertions := an_assertion
		ensure
			one_more: assertions.next = old assertions
			assertion_added: assertions = an_assertion
		end

invariant

	assertions_not_void: assertions /= Void

end -- class ET_ASSERTIONS
