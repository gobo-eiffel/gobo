indexing

	description:

		"Linked list searchers using reference comparison criterion"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_LIST_REFERENCE_SEARCHER [G]

inherit

	DS_LINKED_LIST_SEARCHER [G]

feature -- Search

	search_forth (a_cursor: like cursor; v: G) is
			-- Move to first position at or after `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `after' if not found.
		local
			a_cell: like cell
		do
			from
				a_cell := a_cursor.current_cell
			until
				a_cell = Void or else a_cell.item = v
			loop
				a_cell := a_cell.right
			end
			a_cursor.set (a_cell, False, a_cell = Void)
		ensure then
			found: not a_cursor.after implies a_cursor.item = v
		end

	search_back (a_cursor: like cursor; v: G) is
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		local
			a_cell, cursor_cell, new_cell: like cell
		do
			cursor_cell := a_cursor.current_cell
			if cursor_cell /= Void and cursor_cell.item /= v then
				from
					a_cell := a_cursor.container.first_cell
				until
					a_cell = cursor_cell
				loop
					if a_cell.item = v then
						new_cell := a_cell
					end
					a_cell := a_cell.right
				end
				a_cursor.set (new_cell, new_cell = Void, False)
			end
		ensure then
			found: not a_cursor.before implies a_cursor.item = v
		end

end -- class DS_LINKED_LIST_REFERENCE_SEARCHER
