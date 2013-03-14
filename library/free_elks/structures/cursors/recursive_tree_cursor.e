note
	description: "Cursors for recursive trees"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: recursive_tree_cursor, cursor;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class RECURSIVE_TREE_CURSOR [G] inherit

	CURSOR

create
	make

feature {NONE} -- Initialization

	make (active_node, parent_of_active: like active;
			aft, bef, bel: BOOLEAN)
			-- Create a cursor and set it up on `active_node'.
		do
			active := active_node
			active_parent := parent_of_active
			after := aft
			before := bef
			below := bel
		end

feature {RECURSIVE_CURSOR_TREE} -- Access

	active: detachable DYNAMIC_TREE [G]
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
