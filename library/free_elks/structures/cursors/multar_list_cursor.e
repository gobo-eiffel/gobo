indexing

	description:
		"Cursors for multi-array trees"

	status: "See notice at end of class"
	names: cursor;
	date: "$Date$"
	revision: "$Revision$"

class MULTAR_LIST_CURSOR [G] inherit

	CURSOR

create
	make

feature {NONE} -- Initialization

	make (active_element: like active; current_active_index, current_index: INTEGER) is
			-- Create a cursor and set it up on `active_element'.
		do
			active := active_element
			active_index := current_active_index
			index := current_index
		end

feature {MULTI_ARRAY_LIST} -- Implementation

	active: BI_LINKABLE [ARRAYED_LIST [G]]
		-- Current element in array_sequence list

	active_index: INTEGER
		-- Index relative to `active.item'

	index: INTEGER;
		-- Index in array_sequence list

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

end -- class MULTAR_LIST_CURSOR



