indexing

	description:

		"Eiffel class parents in semicolon-separated list of class parents"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_PARENT_ITEM

inherit

	ET_AST_NODE

feature -- Access

	parent_item: ET_PARENT is
			-- Class parent in semicolon-separated list
		deferred
		ensure
			parent_item_not_void: Result /= Void
		end

end -- class ET_PARENT_ITEM
