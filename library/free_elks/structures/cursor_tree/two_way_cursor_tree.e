indexing

	description:
		"Cursor trees implemented in two-way linked representation"

	status: "See notice at end of class"
	names: two_way_cursor_tree, cursor_tree;
	access: cursor, membership;
	representation: recursive, linked;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_CURSOR_TREE [G] inherit

	RECURSIVE_CURSOR_TREE [G]
		redefine
			put_right, subtree,
			active, cursor, is_leaf
		end

create

	make, make_root

feature -- Initialization

	make is
			-- Create an empty tree.
		local
			dummy: G
		do
			create above_node.make (dummy)
			active := above_node
		ensure
			is_above: above
			is_empty: is_empty
		end

	make_root (v: G) is
			-- Create a tree with `v' as root.
		do
			make
			put_root (v)
		end

feature -- Status report

	full: BOOLEAN is False
			-- Is tree filled to capacity? (Answer: no.)

	prunable: BOOLEAN is True

	is_leaf: BOOLEAN is
		do
			if not off then
				Result := not below and then active.arity = 0
			end
		end

feature -- Access

	cursor: TWO_WAY_CURSOR_TREE_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (active, active_parent, after, before, below)
		end
		
feature -- Element change

	put_right (v: G) is
			-- Add `v' to the right of cursor position.
		do
			if below then
				active.child_put_right (v)
				active.child_forth
				active_parent := active
				active := active_parent.child
				below := False
			elseif before then
				active_parent.child_put_left (v)
				active_parent.child_back
				active := active_parent.child
			else
				active_parent.child_put_right (v)
			end
		end

	put_root (v: G) is
			-- Put `v' as root of an empty tree.
		require
			is_empty: is_empty
		do
			above_node.child_put_right (v)
			active_parent := above_node
			active := active_parent.child
		ensure
			is_root: is_root
			count = 1
		end

	put_child (v: G) is
			-- Put `v' as child of a leaf.
		require
			is_leaf: is_leaf
		do
			down (0)
			put_right (v)
		end

feature -- Duplication

	subtree: like Current is
			-- Subtree rooted at current node.
		do
			create Result.make_root (item)
			Result.fill_from_active (Current)
		end

feature {LINKED_CURSOR_TREE} -- Implementation

	new_tree: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make
		end

feature {NONE} -- Implementation

	active: TWO_WAY_TREE [G];
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

end -- class TWO_WAY_CURSOR_TREE



