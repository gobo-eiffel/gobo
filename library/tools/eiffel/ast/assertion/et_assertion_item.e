indexing

	description:

		"Eiffel assertions in list of assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ASSERTION_ITEM

inherit

	ET_AST_NODE

feature -- Access

	assertion_item: ET_ASSERTION is
			-- Assertion in list of assertions
		deferred
		ensure
			assertion_item_not_void: Result /= Void
		end

end -- class ET_ASSERTION_ITEM
