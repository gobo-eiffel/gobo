indexing

	description:

		"Bilinked list searchers using reference comparison criterion"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST_REFERENCE_SEARCHER [G]

inherit

	DS_BILINKED_LIST_SEARCHER [G]

	DS_LINKED_LIST_REFERENCE_SEARCHER [G]
		undefine
			container, cursor, cell
		redefine
			search_back
		end

feature -- Search

	search_back (a_cursor: like cursor; v: G) is
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		local
			a_cell: like cell
		do
			from
				a_cell := a_cursor.current_cell
			until
				a_cell = Void or else a_cell.item = v
			loop
				a_cell := a_cell.left
			end
			a_cursor.set (a_cell, a_cell = Void, False)
		end

end -- class DS_BILINKED_LIST_REFERENCE_SEARCHER
