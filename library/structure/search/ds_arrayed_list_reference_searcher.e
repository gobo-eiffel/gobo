indexing

	description:

		"Arrayed list searchers using reference comparison criterion"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_LIST_REFERENCE_SEARCHER [G]

inherit

	DS_ARRAYED_LIST_SEARCHER [G]

feature -- Search

	search_forth (a_cursor: like cursor; v: G) is
			-- Move to first position at or after `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `after' if not found.
		local
			i, nb: INTEGER
			list: like container
		do
			from
				i := a_cursor.index
				list := a_cursor.container
				nb := list.count
			until
				i > nb or else list.item (i) = v
			loop
				i := i + 1
			end
			a_cursor.go_to (i)
		ensure then
			found: not a_cursor.after implies a_cursor.item = v
		end

	search_back (a_cursor: like cursor; v: G) is
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		local
			i: INTEGER
			list: like container
		do
			from
				i := a_cursor.index
				list := a_cursor.container
			until
				i < 1 or else list.item (i) = v
			loop
				i := i - 1
			end
			a_cursor.go_to (i)
		ensure then
			found: not a_cursor.before implies a_cursor.item = v
		end

end -- class DS_ARRAYED_LIST_REFERENCE_SEARCHER
