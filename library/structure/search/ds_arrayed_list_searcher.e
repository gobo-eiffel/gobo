indexing

	description:

		"Arrayed list searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_ARRAYED_LIST_SEARCHER [G]

inherit

	DS_BILINEAR_SEARCHER [G]
		redefine
			container, cursor
		end

feature {NONE} -- Anchor types

	container: DS_ARRAYED_LIST [G] is do end
	cursor: DS_ARRAYED_LIST_CURSOR [G] is do end
			-- Anchor types

end -- class DS_ARRAYED_LIST_SEARCHER
