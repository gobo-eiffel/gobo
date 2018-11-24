note
	description: "Trees implemented using a two way linked list representation"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: two_way_tree, tree, two_way_list
	representation: recursive, linked
	access: cursor, membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_TREE [G] inherit

	DYNAMIC_TREE [G]
		undefine
			child_after, child_before, child_item,
			child_off, child_islast
		redefine
			parent, clone_node
		select
			has,
			new_cursor
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
			new_cursor as twl_new_cursor,
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
				twl_fill,
				twl_duplicate,
				twl_full,
				twl_new_cursor,
				split
		undefine
			copy, child_readable, is_leaf,
			child_writable,
			linear_representation,
			child_isfirst, valid_cursor_index,
			is_equal
		redefine
			first_child, child_islast, last_child, new_cell, child_cursor, split, new_chain
		select
			is_leaf
		end

create
	make

feature {NONE} -- Initialization

	make (v: like item)
			-- Create single node with item `v'.
		do
			put (v)
			twl_make
		end

feature -- Access

	parent: detachable like new_cell
			-- Parent node

	first_child: like parent
			-- Leftmost child

	last_child: like parent

	child_cursor: TWO_WAY_TREE_CURSOR [G]
			-- Current cursor position
		do
			create Result.make (child, child_after, child_before)
		end

feature -- Status report

	child_islast: BOOLEAN
			-- Is cursor under last child?
		do
			Result := not is_leaf and Precursor {TWO_WAY_LIST}
		end

feature {RECURSIVE_CURSOR_TREE} -- Element change

	set_child (n: like parent)
			-- Set the child of parent to `n'.
		do
			child := n
		ensure then
			child_set: child = n
		end

feature -- Element change

	put_child (n: like new_cell)
			-- Add `n' to the list of children.
			-- Do not move child cursor.
		local
			c: like last_child
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
				c := last_child
				if c /= Void then
					c.bl_put_right (n)
				end
				if child_after then
					child := n
				end
			end
			last_child := n
			n.attach_to_parent (Current)
			arity := arity + 1
		end

	replace_child (n: like new_cell)
			-- Replace current child by `n'.
		do
			remove_child
			put_child_right (n)
		end

	put_child_left (n: like new_cell)
			-- Add `n' to the left of cursor position.
			-- Do not move cursor.
		do
			child_back
			put_child_right (n)
			child_forth; child_forth
		end

	put_child_right (n: like new_cell)
			-- Add `n' to the right of cursor position.
			-- Do not move cursor.
		local
			c: like child
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
				c := child
				if c /= Void then
					c.bl_put_right (n)
				end
				last_child := n
			else
				c := child
				if c /= Void then
					n.bl_put_right (c.right_sibling)
				end
				n.bl_put_left (c)
			end
			n.attach_to_parent (Current)
			arity := arity + 1
		end

	merge_tree_before (other: like new_cell)
			-- Merge children of `other' into current structure
			-- before cursor position. Do not move cursor.
			-- Make `other' a leaf.
		do
			attach (other)
			twl_merge_left (other)
		end

	merge_tree_after (other: like new_cell)
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		do
			attach (other)
			twl_merge_right (other)
		end

	prune (n: like new_cell)
			-- Prune `n' from children.
		local
			l_child: like first_child
			c: like child
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
					first_child := l_child.right_sibling
					if child = n then
						child := first_child
					end
					if l_child = last_child then
						last_child := l_child.left_sibling
					end
				elseif l_child = last_child then
					last_child := l_child.left_sibling
					if child = n then
						child := last_child
					end
				else
					c := l_child.right_sibling
					if c /= Void then
						c.bl_put_left (l_child.left_sibling)
					end
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

feature -- Removal

	split (n: INTEGER)
			-- Do nothing.
		do
		end

feature {TWO_WAY_TREE} -- Implementation

	new_cell (v: like item): like Current
			-- New cell containing `v'
		do
			create Result.make (v)
			if object_comparison then
				Result.compare_objects
			end
			Result.attach_to_parent (Current)
		end

	new_tree: like Current
			-- A newly created instance of the same type, with
			-- the same node value.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		obsolete "Create and initialize a new tree explicitly. [2018-11-30]"
		do
			create Result.make (item)
		end

	new_chain: like Current
			-- <Precursor>
		obsolete "Use explicit creation instead. See also explanations for `duplicate`. [2018-11-30]"
		do
			Result := new_tree
		end

	clone_node (n: like Current): like Current
			-- Clone node `n'.
		do
			create Result.make (n.item)
			Result.copy_node (n)
		end

	copy_node (n: like Current)
			-- Copy content of `n' except tree data into Current.
		do
			standard_copy (n)
			arity := 0
			child := Void
			child_after := False
			child_before := True
			first_child := Void
			last_child := Void
			left_sibling := Void
			parent := Void
			right_sibling := Void
			sublist := Void
		end

feature {NONE} -- Implementation

	attach (other: like new_cell)
				-- Attach all children of `other' to current node.
		local
			cursor: like child_cursor
			c: like child
		do
			cursor := other.child_cursor
			from
				other.child_start
			until
				other.child_off
			loop
				c := other.child
				if c /= Void then
					c.attach_to_parent (Current)
				end
				other.child_forth
			end
			other.child_go_to (cursor)
		end

invariant

	off_constraint: (child = Void) implies child_off

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
