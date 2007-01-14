indexing

	description:
		"Cursors for multi-array trees"
	legal: "See notice at end of class."

	status: "See notice at end of class."
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







end -- class MULTAR_LIST_CURSOR



