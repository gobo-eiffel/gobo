indexing

	description:

		"Linked list searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINKED_LIST_SEARCHER [G]

inherit

	DS_BILINEAR_SEARCHER [G]
		redefine
			container, cursor
		end

feature {NONE} -- Anchor types

	container: DS_LINKED_LIST [G] is do end
	cursor: DS_LINKED_LIST_CURSOR [G] is do end
	cell: DS_LINKABLE [G] is do end
			-- Anchor types

end -- class DS_LINKED_LIST_SEARCHER
