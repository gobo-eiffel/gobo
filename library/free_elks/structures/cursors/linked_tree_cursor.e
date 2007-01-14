indexing
	description: "Cursors for linked trees"
	legal: "See notice at end of class."
	status: "See notice at end of class."
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







end -- class LINKED_TREE_CURSOR



