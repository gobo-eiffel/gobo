indexing

	description:

		"Eiffel assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ASSERTION

inherit

	ET_ASSERTION_ITEM

feature -- Access

	assertion_item: ET_ASSERTION is
			-- Assertion in list of assertions
		do
			Result := Current
		end

end -- class ET_ASSERTION
