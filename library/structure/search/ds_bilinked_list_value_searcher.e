indexing

	description:

		"Bilinked list searchers using value comparison criterion";

	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class DS_BILINKED_LIST_VALUE_SEARCHER [G]

inherit

	DS_BILINKED_LIST_SEARCHER [G]

	DS_LINKED_LIST_VALUE_SEARCHER [G]
		undefine
			container, cursor
		redefine
			search_back
		end

feature -- Search

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	search_back (a_cursor: DS_BILINKED_LIST_CURSOR [G]; v: G) is
#else
	search_back (a_cursor: like cursor; v: G) is
#endif
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		local
			cell: DS_BILINKABLE [G]
		do
			from
				cell := a_cursor.current_cell
			until
				cell = Void or else equal (cell.item, v)
			loop
				cell := cell.left
			end
			a_cursor.set (cell, cell = Void, False)
		end

end -- class DS_BILINKED_LIST_VALUE_SEARCHER
