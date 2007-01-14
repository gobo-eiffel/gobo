indexing

	description:
		"Cursors for linked lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: linked_list_cursor, cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_LIST_CURSOR [G] inherit

	CURSOR

create
	make

feature {NONE} -- Initialization

	make (active_element: like active; aft, bef: BOOLEAN) is
			-- Create a cursor and set it up on `active_element'.
		do
			active := active_element
			after := aft
			before := bef
		end

feature {LINKED_LIST} -- Implementation

	active: LINKABLE [G]
			-- Current element in linked list

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

invariant
	not_both: not (before and after)
	no_active_not_on: active = Void implies (before or after)

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







end -- class LINKED_LIST_CURSOR



