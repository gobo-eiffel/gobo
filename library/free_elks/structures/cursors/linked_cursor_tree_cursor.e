note
	description: "Cursors for linked trees"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linked_tree_cursor, cursor;
	contents: generic;
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class LINKED_CURSOR_TREE_CURSOR [G]

inherit
	RECURSIVE_TREE_CURSOR [G]
		redefine
			active
		end

create
	make

feature {LINKED_CURSOR_TREE} -- Access

	active: detachable LINKED_TREE [G];
			-- Current node

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



