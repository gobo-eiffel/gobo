indexing

	description:

		"Bilinked list searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINKED_LIST_SEARCHER [G]

inherit

	DS_LINKED_LIST_SEARCHER [G]
		redefine
			container, cursor, cell
		end

feature {NONE} -- Anchor types

	container: DS_BILINKED_LIST [G] is do end
	cursor: DS_BILINKED_LIST_CURSOR [G] is do end
	cell: DS_BILINKABLE [G] is do end
			-- Anchor types

end -- class DS_BILINKED_LIST_SEARCHER
