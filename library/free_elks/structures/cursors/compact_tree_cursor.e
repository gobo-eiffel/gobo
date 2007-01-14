indexing

	description:
		"Cursors for compact trees"
	legal: "See notice at end of class."

	status: "See notice at end of class."
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







end -- class COMPACT_TREE_CURSOR



