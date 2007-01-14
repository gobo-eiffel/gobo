indexing

	description:
		"Cursors for circular lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: circular_cursor, cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class CIRCULAR_CURSOR

 inherit
	CURSOR

create
	make

feature {NONE} -- Initialization

	make (curs: like cursor; int: BOOLEAN; start: INTEGER) is
			-- Create a cursor and set it up on `active_element'.
		do
			cursor := curs
			internal_exhausted := int
			starter := start
		end

feature {CIRCULAR} -- Implementation

	cursor: CURSOR
			-- Current element in implementation

	internal_exhausted: BOOLEAN
			-- Has traversal passsed the start?

	starter: INTEGER;
			-- Index of start position

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







end -- class CIRCULAR_CURSOR



