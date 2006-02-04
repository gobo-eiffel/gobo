indexing

	description:
		"Cursors for compact trees"

	status: "See notice at end of class"
	names: compact_tree_cursor, cursor;
	date: "$Date$"
	revision: "$Revision$"

class COMPACT_TREE_CURSOR inherit

	CURSOR

create

	make

feature {NONE} -- Initialization

	make (i: INTEGER; aft, bef, bel, abv: BOOLEAN) is
			-- Create a cursor and set it up on `i'.
		do
			active := i
			after := aft
			below := bel
			before := bef
			above := abv
		end

feature {COMPACT_CURSOR_TREE} -- Access

	active: INTEGER
			-- Index of current item

feature {COMPACT_CURSOR_TREE} -- Status report

	after: BOOLEAN
		-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
		-- Is there no valid cursor position to the left of cursor?

	below: BOOLEAN
		-- Is there no valid cursor position below cursor?

	above: BOOLEAN;
		-- Is there no valid cursor position above cursor?

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

end -- class COMPACT_TREE_CURSOR



