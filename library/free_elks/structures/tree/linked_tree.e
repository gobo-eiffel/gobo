indexing

	description:
		"Trees implemented using a linked list representation"

	status: "See notice at end of class"
	names: linked_tree, tree, linked_list;
	representation: recursive, linked;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_TREE [G] inherit

	DYNAMIC_TREE [G]
		rename
			empty as ll_empty
		export
			{NONE} ll_empty
		undefine
			child_after, child_before, child_item,
			child_off
		redefine
			parent
		select
			has
		end

	LINKABLE [G]
		rename
			right as right_sibling,
			put_right as l_put_right
		export
			{ANY} put, replace
			{LINKED_TREE} l_put_right, forget_right
		undefine
			copy, is_equal
		end

	LINKED_LIST [G]
		rename
			active as child,
			put_left as child_put_left,
			put_right as child_put_right,
			after as child_after,
			back as child_back,
			before as child_before,
			count as arity,
			cursor as child_cursor,
			duplicate as ll_duplicate,
			empty as ll_empty,
			is_empty as is_leaf,
			extend as child_extend,
			extendible as child_extendible,
			fill as ll_fill,
			finish as child_finish,
			first_element as first_child,
			forth as child_forth,
			full as ll_full,
			go_i_th as child_go_i_th,
			go_to as child_go_to,
			has as ll_has,
			index as child_index,
			isfirst as child_isfirst,
			islast as child_islast,
			item as child_item,
			last_element as last_child,
			make as ll_make,
			merge_left as ll_merge_left,
			merge_right as ll_merge_right,
			new_chain as new_tree,
			off as child_off,
			prune as ll_prune,
			put as child_put,
			readable as child_readable,
			remove as remove_child,
			remove_left as remove_left_child,
			remove_right as remove_right_child,
			replace as child_replace,
			search as search_child,
			start as child_start,
			writable as child_writable
		export
			{ANY}
				child
			{NONE}
				ll_make, ll_has,
			 	ll_merge_left, ll_merge_right,
			 	ll_fill, ll_duplicate, ll_full, ll_empty
		undefine
			child_readable, is_leaf,
			child_writable,
			linear_representation,
			child_isfirst, child_islast, valid_cursor_index,
			copy, is_equal
		redefine
			first_child, new_cell, new_tree, child_cursor
		select
			is_leaf
		end

create

	make

feature -- Initialization

	make (v: like item) is
			-- Create single node with item `v'.
		do
			put (v)
			ll_make
		ensure
			is_root
			is_leaf
		end

feature -- Access

	parent: LINKED_TREE [G]
			-- Parent of current node

	first_child: like parent
			-- Leftmost child

	left_sibling: like parent is
			-- Left neighbor (if any)
		do
			if parent /= Void then
				from
					Result := parent.first_child
				until
					Result = Void or else Result.right_sibling = Current
				loop
					Result := Result.right_sibling
				end
			end
		end
		
	child_cursor: LINKED_TREE_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (child, child_after, child_before)
		end

feature {RECURSIVE_CURSOR_TREE} -- Element change

	set_child (n: like parent) is
			-- Set the child of parent to `n'.
		do
			child := n
		ensure then
			child_set: child = n
		end

feature -- Element change

	put_child (n: like parent) is
			-- Add `n' to the list of children.
			-- Do not move child cursor.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			if is_leaf then
				first_child := n
				child := n
			else
				last_child.l_put_right (n)
				if child_after then
					child := n
				end
			end
			n.attach_to_parent (Current)
			arity := arity + 1
		end

	replace_child (n: like parent) is
			-- Replace current child by `n'.
		do
			put_child_right (n)
			remove_child
		end

	put_child_left (n: like parent) is
			-- Add `n' to the left of cursor position.
			-- Do not move cursor.
		do
			child_back
			put_child_right (n)
			child_forth
			child_forth
		end

	put_child_right (n: like parent) is
			-- Add `n' to the right of cursor position.
			-- Do not move cursor.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			if child_before then
				n.l_put_right (first_child)
				first_child := n
			else
				n.l_put_right (child.right_sibling)
				child.l_put_right (n)
			end
			n.attach_to_parent (Current)
			arity := arity + 1
		end

	merge_tree_before (other: like first_child) is
			-- Merge children of `other' into current structure
			-- before cursor position. Do not move cursor.
			-- Make `other' a leaf.
		do
			attach (other)
			ll_merge_left (other)
		end

	merge_tree_after (other: like first_child) is
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		do
			attach (other)
			ll_merge_right (other)
		end

feature -- Removal

	prune (n: like first_child) is
			-- Prune `n' from children.
		local
			l_child: like first_child
			left_child: like first_child
		do
			from
				l_child := first_child
			until
				l_child = Void or l_child = n
			loop
				left_child := l_child
				l_child := l_child.right_sibling
			end
			if l_child /= Void then
				if left_child /= Void then
					-- when `n' is after the first item.
					left_child.l_put_right (l_child.right_sibling)
					if child = n then
						child := left_child
					end
				else
					-- when `n' is the first item.
					first_child := first_child.right_sibling
					if n = child then
						child := first_child
					end
				end

				arity := arity - 1
				if is_leaf and not child_before then
					child_after := True
				end

				n.attach_to_parent (Void)
				n.forget_right
			end
		end

feature {NONE} -- Inapplicable

	forget_left is
			-- Forget all left siblings.
		do
		end

feature {LINKED_TREE} -- Implementation

		
	new_cell (v: like item): like first_child is
			-- New cell containing `v'
		do
			create Result.make (v)
			Result.attach_to_parent (Current)
		end

	new_tree: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (item)
		end

	cut_off_node is
			-- Cut off all links from current node.
		do
			make (item)
			wipe_out
			forget_right
			parent := Void
		end

feature {NONE} -- Implementation

	attach (other: like first_child) is
				-- Attach all children of `other' to current node.
		local
			cursor: CURSOR
		do
			cursor := other.child_cursor
			from
				other.child_start
			until
				other.child_off
			loop
				other.child.attach_to_parent (Current)
				other.child_forth
			end
			other.child_go_to (cursor)
		end

invariant

	no_void_child: readable_child = child_readable

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

end -- class LINKED_TREE
