indexing

	description:

		"Linked list searchers using value comparison criterion";

	library:    "Gobo Eiffel Structure Library";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class DS_LINKED_LIST_VALUE_SEARCHER [G]

inherit

	DS_LINKED_LIST_SEARCHER [G]

feature -- Search

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	search_forth (a_cursor: DS_LINKED_LIST_CURSOR [G]; v: G) is
#else
	search_forth (a_cursor: like cursor; v: G) is
#endif
			-- Move to first position at or after `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `after' if not found.
		local
			cell: DS_LINKABLE [G]
		do
			from
				cell := a_cursor.current_cell
			until
				cell = Void or else equal (cell.item, v)
			loop
				cell := cell.right
			end
			a_cursor.set (cell, False, cell = Void)
		ensure then
			found: not a_cursor.after implies equal (a_cursor.item, v)
		end

#ifdef VE
--| [VE 2.0g - 24 May 1997]
--| VE compiler crashes because of 'like anchor'.
	search_back (a_cursor: DS_LINKED_LIST_CURSOR [G]; v: G) is
#else
	search_back (a_cursor: like cursor; v: G) is
#endif
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		local
			cell, cursor_cell, new_cell: DS_LINKABLE [G]
		do
			cursor_cell := a_cursor.current_cell
			if cursor_cell /= Void and not equal (cursor_cell.item, v) then
				from
					cell := a_cursor.container.first_cell
				until
					cell = cursor_cell
				loop
					if equal (cell.item, v) then
						new_cell := cell
					end
					cell := cell.right
				end
				a_cursor.set (new_cell, new_cell = Void, False)
			end
		ensure then
			found: not a_cursor.before implies equal (a_cursor.item, v)
		end

end -- class DS_LINKED_LIST_VALUE_SEARCHER
