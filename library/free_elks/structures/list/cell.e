indexing

	description:
		"Cells containing an item"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: cell;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class CELL [G]

create
	default_create,
	put

feature -- Access

	item: G
			-- Content of cell.

feature -- Element change

	put, replace (v: like item) is
			-- Make `v' the cell's `item'.
		do
			item := v
		ensure
			item_inserted: item = v
		end

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class CELL



