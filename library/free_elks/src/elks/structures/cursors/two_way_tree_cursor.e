note
	description: "Cursors for two-way trees"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: two_way_tree, cursor;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class TWO_WAY_TREE_CURSOR [G]

inherit
	TWO_WAY_LIST_CURSOR [G]
		redefine
			active
		end

create
	make

feature {TWO_WAY_TREE} -- Access

	active: detachable TWO_WAY_TREE [G];
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
