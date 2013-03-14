note
	description: "Cursors for compact trees"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: compact_tree_cursor, cursor;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class COMPACT_TREE_CURSOR inherit

	CURSOR

create

	make

feature {NONE} -- Initialization

	make (i: INTEGER; aft, bef, bel, abv: BOOLEAN)
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

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
