indexing

	description:
		"Trees implemented using a two way linked list representation"

	status: "See notice at end of class"
	names: two_way_tree, tree, two_way_list;
	representation: recursive, linked;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_TREE [G] inherit

	DYNAMIC_TREE [G]
		undefine
			child_after, child_before, child_item,
			child_off, child_islast
		redefine
			parent
		select
			has
		end

	BI_LINKABLE [G]
		rename
			left as left_sibling,
			right as right_sibling,
			put_left as bl_put_left,
			put_right as bl_put_right
		export
			{ANY}
				left_sibling, right_sibling
			{TWO_WAY_TREE}
				bl_put_left, bl_put_right,
				forget_left, forget_right
		undefine
			copy, is_equal
		end

	TWO_WAY_LIST [G]
		rename
			active as child,
			put_left as child_put_left,
			put_right as child_put_right,
			after as child_after,
			back as child_back,
			before as child_before,
			count as arity,
			cursor as child_cursor,
			duplicate as twl_duplicate,
			is_empty as is_leaf,
			extend as child_extend,
			extendible as child_extendible,
			fill as twl_fill,
			finish as child_finish,
			first_element as first_child,
			forth as child_forth,
			full as twl_full,
			go_i_th as child_go_i_th,
			go_to as child_go_to,
			has as twl_has,
			index as child_index,
			isfirst as child_isfirst,
			islast as child_islast,
			item as child_item,
			last_element as last_child,
			make as twl_make,
			merge_left as twl_merge_left,
			merge_right as twl_merge_right,
			off as child_off,
			prune as twl_prune,
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
				twl_make, twl_has,
				twl_fill, twl_duplicate,
				twl_full
		undefine
			copy, child_readable, is_leaf,
			child_writable,
			linear_representation,
			child_isfirst, valid_cursor_index,
			is_equal
		redefine
			first_child, child_islast, last_child, new_cell, child_cursor
		select
			is_leaf
		end

create
	make
	
create {TWO_WAY_TREE}
	twl_make, make_sublist

feature -- Initialization

	make (v: like item) is
			-- Create single node with item `v'.
		do
			put (v)
			twl_make
		end

feature -- Access

	parent: TWO_WAY_TREE [G]
			-- Parent node

	first_child: like parent
			-- Leftmost child

	last_child: like parent
	
	child_cursor: TWO_WAY_TREE_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (child, child_after, child_before)
		end

feature -- Status report

	child_islast: BOOLEAN is
			-- Is cursor under last child?
		do
			Result := not is_leaf and Precursor {TWO_WAY_LIST}
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
				last_child.bl_put_right (n)
				if child_after then
					child := n
				end
			end
			last_child := n
			n.attach_to_parent (Current)
			arity := arity + 1
		end

	replace_child (n: like parent) is
			-- Replace current child by `n'.
		do
			remove_child
			put_child_right (n)
		end

	put_child_left (n: like parent) is
			-- Add `n' to the left of cursor position.
			-- Do not move cursor.
		do
			child_back
			put_child_right (n)
			child_forth; child_forth
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
				if is_leaf then
					last_child := n
				end
				n.bl_put_right (first_child)
				first_child := n
				child := n
			elseif child_islast then
				child.bl_put_right (n)
				last_child := n
			else
				n.bl_put_right (child.right_sibling)
				n.bl_put_left (child)
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
			twl_merge_left (other)
		end

	merge_tree_after (other: like first_child) is
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		do
			attach (other)
			twl_merge_right (other)
		end

	prune (n: like first_child) is
			-- Prune `n' from children.
		local
			l_child: like first_child
		do
			from
				l_child := first_child
			until
				l_child = Void or l_child = n
			loop
				l_child := l_child.right_sibling
			end
			
			if l_child /= Void then
				if l_child = first_child then
					first_child := first_child.right_sibling
					if child = n then
						child := first_child
					end
					if l_child = last_child then
						last_child := last_child.left_sibling
					end
				elseif l_child = last_child then
					last_child := last_child.left_sibling
					if child = n then
						child := last_child
					end
				else
					l_child.right_sibling.bl_put_left (l_child.left_sibling)
					if child = n then
						child := l_child.left_sibling
					end
				end

				arity := arity - 1

				if is_leaf and not child_before then
					first_child := Void
					last_child := Void
					child_after := True
				end
				n.attach_to_parent (Void)
				n.simple_forget_left
				n.simple_forget_right
			end
		end

feature {TWO_WAY_TREE} -- Implementation

	new_cell (v: like item): like first_child is
			-- New cell containing `v'
		do
			create Result.make (v)
			Result.attach_to_parent (Current)
		end

	new_tree: like Current is
			-- A newly created instance of the same type, with
			-- the same node value.
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
			simple_forget_left
			simple_forget_right
			parent := Void
		end

feature {NONE} -- Implementation

	attach (other: like first_child) is
				-- Attach all children of `other' to current node.
		local
			cursor: CURSOR
		do
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

	off_constraint: (child = Void) implies child_off

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

end -- class TWO_WAY_TREE



