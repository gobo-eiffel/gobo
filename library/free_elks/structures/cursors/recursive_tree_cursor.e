indexing

	description:
		"Cursors for recursive trees"

	status: "See notice at end of class"
	names: recursive_tree_cursor, cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class RECURSIVE_TREE_CURSOR [G] inherit

	CURSOR

create
	make

feature {NONE} -- Initialization

	make (active_node, parent_of_active: like active;
			aft, bef, bel: BOOLEAN) is
			-- Create a cursor and set it up on `active_node'.
		do
			active := active_node
			active_parent := parent_of_active
			after := aft
			before := bef
			below := bel
		end

feature {RECURSIVE_CURSOR_TREE} -- Access

	active: DYNAMIC_TREE [G]
			-- Current node

	active_parent: like active
			-- Parent of current node

feature {RECURSIVE_CURSOR_TREE} -- Status report

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?

	below: BOOLEAN;
			-- Is there no valid cursor position below cursor?

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

end -- class RECURSIVE_TREE_CURSOR



