indexing

	description:

		"Eiffel inspect choices which appear in a comma-separated list of choices"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_CHOICE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	choice_item: ET_CHOICE is
			-- Choice in comma-separated list
		deferred
		ensure
			choice_item_not_void: Result /= Void
		end

end -- class ET_CHOICE_ITEM
