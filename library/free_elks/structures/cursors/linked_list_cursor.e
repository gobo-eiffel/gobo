indexing

	description:
		"Cursors for linked lists"

	status: "See notice at end of class"
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

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class LINKED_LIST_CURSOR



