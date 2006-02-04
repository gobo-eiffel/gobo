indexing
	description: "Cursors for linked trees"
	status: "See notice at end of class"
	names: linked_tree_cursor, cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_TREE_CURSOR [G]

inherit
	LINKED_LIST_CURSOR [G]
		redefine
			active
		end

create
	make

feature {LINKED_TREE} -- Access

	active: LINKED_TREE [G];
			-- Current node

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

end -- class LINKED_TREE_CURSOR



