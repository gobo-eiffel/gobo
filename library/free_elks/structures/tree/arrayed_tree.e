indexing

	description:
		"Trees where the children of each node are kept in an array"

	status: "See notice at end of class"
	names: tree;
	representation: recursive, array;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class ARRAYED_TREE [G] inherit

	CELL [G]
		undefine
			copy, is_equal
		end

	DYNAMIC_TREE [G]
		rename
			empty as al_empty
		export
			{NONE} al_empty
		undefine
			child_after, readable_child,
			writable_child, child_off, child_before
		redefine
			parent, attach_to_parent, duplicate, extend,
			duplicate_all, fill_subtree
		end

create

	make

feature -- Initialization

	make (n: INTEGER; v: G) is
			-- Create node with item `v'.
			-- Allocate space for `n' children.
		require
			valid_number_of_children: n >= 0
		do
			create arrayed_list.make (n)
			al_make (n)
			replace (v)
		ensure
			node_item: item = v
		end

feature -- Access

	parent: ARRAYED_TREE [G]
			-- Parent of current node

	left_sibling: like parent is
			-- Left neighbor if any
		do
			if position_in_parent > 1 then
				Result := parent.array_item (position_in_parent - 1)
			end
		end

	right_sibling: like parent is
			-- Right neighbor if any
		do
			if position_in_parent < parent.arity then
				Result := parent.array_item (position_in_parent + 1)
			end
		end

feature -- Element change

	child_put, child_replace (v: like item) is
			-- Replace current child item with `v'.
		do
			if object_comparison then
				child.compare_objects
			else
				child.compare_references
			end
			child.replace (v)
		end

	replace_child (n: like parent) is
			-- Make `n' the node's current child.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			if child_off then
				al_extend (n)
			else
				al_replace (n)
			end
			n.attach_to_parent (Current)
		ensure then
			child_replaced: n.parent = Current
		end

	child_extend (v: like item) is
			-- Add `v' at end.
			-- Do not move child cursor.
		local
			n: like parent
		do
			n := new_cell (v)
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_extend (n)
		end

	child_put_left (v: like item) is
			-- Add `v' to the left of cursor position.
			-- Do not move child cursor.
		local
			n: like parent
		do
			n := new_cell (v)
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_put_left (n)
		end

	child_put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move child cursor.
		local
			n: like parent
		do
			n := new_cell (v)
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_put_right (n)
		end

	put_child_left (n: like parent) is
			-- Add `n' to the left of cursor position.
			-- Do not move cursor.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_put_left (n)
			n.attach_to_parent (Current)
		end

	put_child_right (n: like parent) is
			-- Add `n' to the right of the cursor position.
			-- Do not move cursor.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_put_right (n)
			n.attach_to_parent (Current)
		end

	put_child (n: like parent) is
			-- Add `n' to the list of children.
			-- Do not move child cursor.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			al_extend (n)
			n.attach_to_parent (Current)
		end

	merge_tree_before (other: ARRAYED_TREE [G]) is
			-- Merge children of `other' into current structure
			-- before cursor position. Do not move cursor.
			-- Make `other' a leaf.
		local
			l_list: ARRAYED_LIST [like other]
		do
			attach (other)
			create l_list.make (1)
			l_list.extend (other)
			al_merge_left (l_list)
		end

	merge_tree_after (other: ARRAYED_TREE [G]) is
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		local
			l_list: ARRAYED_LIST [like other]
		do
			attach (other)
			create l_list.make (1)
			l_list.extend (other)
			al_merge_left (l_list)
		end

feature -- Removal

	remove_child is
			-- Remove child at cursor position.
			-- Move cursor to the next sibling, or `after' if none.
		do
			child.attach_to_parent (Void)
			al_remove
		end

	remove_left_child is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			child_back
			remove_child
		end

	remove_right_child is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		do
			child_forth
			remove_child
			child_back
		end

	forget_left is
			-- Forget all left siblings.
		local
			i: INTEGER
			old_idx: INTEGER
		do
			if not is_root and then position_in_parent < parent.arity then
				old_idx := parent.child_index
				from
					i := 1
				until
					i = position_in_parent
				loop
					parent.child_go_i_th (i)
					parent.remove_child
					i := i + 1
				end
				parent.child_go_i_th (old_idx)
			end
		end

	forget_right is
			-- Forget all right siblings.
		local
			i: INTEGER
			old_idx: INTEGER
		do
			if not is_root and then position_in_parent < parent.arity then
				old_idx := parent.child_index
				from
					i := position_in_parent + 1
				until
					i > parent.arity
				loop
					parent.child_go_i_th (i)
					parent.remove_child
					i := i + 1
				end
				parent.child_go_i_th (old_idx)
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children.
		local
			counter: INTEGER
			pos: CURSOR
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
			until
				child_after or else (counter = n)
			loop
				if child /= Void then
					Result.replace_child (child.duplicate_all)
				end
				Result.child_forth
				child_forth
				counter := counter + 1
			end
			child_go_to (pos)
		end

feature {NONE} -- Inapplicable

	extend (v: G) is
			-- Add `v' as new child.
		do
		end

	set_child (n: like parent) is
			-- Set child to `n'.
		do
		end

feature {ARRAYED_TREE} -- Implementation

	new_node: like Current is
			-- A newly created instance of the same type,
			-- with the same arity and node value.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (arity, item)
		end

	duplicate_all: like Current is
			-- Copy of sub-tree including all children
		local
			pos: CURSOR
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
				child_start
			until
				child_off
			loop
				if child /= Void then
					Result.replace_child (child.duplicate_all)
				end
				Result.child_forth
				child_forth
			end
			child_go_to (pos)
		end

	fill_subtree (other: TREE [G]) is
			-- Fill children with children of `other'
		local
			temp: like parent
		do
			from
				other.child_start
				child_start
			until
				child_after
			loop
				if other.child /= Void then
					create temp.make (other.arity, other.child_item)
					temp.fill_subtree (other.child)
				end
				replace_child (temp)
				child_forth
				other.child_forth
			end
		end

	attach_to_parent (n: like parent) is
			-- Make `n' parent of current node;
		do
			parent := n
		end

	cut_off_node is
			-- Cut off all links from current node.
		do
			make (arity, item)
		end

feature {NONE} -- Implementation

	arrayed_list: ARRAYED_LIST [ARRAYED_TREE [G]]
			-- arrayed list of arrayed_tree.

	new_tree: like Current is
			-- A newly created instance of the same type.
		do
			create Result.make (0, item)
		end

	new_cell (v: like item): like Current is
			-- New node with value `v' and no children.
		do
			create Result.make (0, v)
			Result.attach_to_parent (Current)
		end

	position_in_parent: INTEGER is
			-- Position of current node in parent
		do
			if parent /= Void then
				Result := parent.index_of (Current, 1)
			end
		end

	attach (other: ARRAYED_TREE [G]) is
			-- Attach all children of `other' to current node.
			-- Put `other' in mode `off'.
		local
			c: like child
		do
			from
				other.child_start
			until
				other.child_off
			loop
				c := other.child
				other.child_forth
				c.attach_to_parent (Current)
			end
		end

	do_all_internal (an_agent: PROCEDURE [ANY, TUPLE [G]]; a_tree_node: ARRAYED_TREE [G]) is
			-- Apply action to every child.
		require
			non_void_agent: an_agent /= Void
			non_void_tree_node: a_tree_node /= Void
		do
			an_agent.call ([a_tree_node.item])
			from
				a_tree_node.child_start
			until
				a_tree_node.child_off
			loop
				do_all_internal (an_agent, a_tree_node.child)
				a_tree_node.child_forth
			end
		end

feature -- Access

	child: like parent is
		do
			Result := arrayed_list.item
		end

	array_item (n: INTEGER): ARRAYED_TREE [G] is
		do
			Result := arrayed_list.i_th (n)
		end

	last_child: like first_child is
		do
			Result := arrayed_list.last
		end

	first_child: like parent is
		do
			Result := arrayed_list.first
		end

	search_child (v: ARRAYED_TREE [like item]) is
		do
			arrayed_list.search (v)
		end

	readable_child: BOOLEAN is
		do
			Result := arrayed_list.readable
		end

	writable_child: BOOLEAN is
		do
			Result := arrayed_list.writable
		end

	arity: INTEGER is
		do
			Result := arrayed_list.count
		end

	child_start is
		do
			arrayed_list.start
		end

	child_finish is
		do
			arrayed_list.finish
		end

	child_forth is
		do
			arrayed_list.forth
		end

	child_back is
		do
			arrayed_list.back
		end

	child_go_i_th (i: INTEGER) is
		do
			arrayed_list.go_i_th (i)
		end

	child_index: INTEGER is
		do
			Result := arrayed_list.index
		end

	child_off: BOOLEAN is
		do
			Result := arrayed_list.off
		end

	child_after: BOOLEAN is
		do
			Result := arrayed_list.after
		end

	child_before: BOOLEAN is
		do
			Result := arrayed_list.before
		end

	child_cursor: CURSOR is
		do
			Result := arrayed_list.cursor
		end

	child_go_to (p: CURSOR) is
		do
			arrayed_list.go_to (p)
		end

	index_of (v: ARRAYED_TREE [like item]; i: INTEGER): INTEGER is
		do
			Result := arrayed_list.index_of (v, i)
		end

	prune (n: like parent) is
		do
			arrayed_list.prune (n)
		end
	
	wipe_out is
		do
			arrayed_list.wipe_out
		end

	move (i: INTEGER) is
			-- Move child
		obsolete
			"Use feature `child_move' instead"
		do
			child_move (i)
		end

	child_move (i: INTEGER) is
		do
			arrayed_list.move (i)
		end

	do_all (an_agent: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `an_agent' to every child nodes in the tree.
		do
			do_all_internal (an_agent, Current)
		end

feature {NONE} -- private access arrayed_list

	al_make (n: INTEGER)is
		do
			arrayed_list.make (n)
		end

	al_extend (v: ARRAYED_TREE [like item]) is
		do
			arrayed_list.extend (v)
		end

	al_duplicate (n: INTEGER): ARRAYED_LIST [like Current] is
		do
			Result := arrayed_list.duplicate (n)
		end

	al_remove is
		do
			arrayed_list.remove
		end

	al_remove_left is
		do
			arrayed_list.remove_left
		end

	al_remove_right is
		do
			arrayed_list.remove_right
		end

	al_put_left (v: ARRAYED_TREE [like item]) is
		do
			arrayed_list.put_left (v)
		end

	al_put_right (v: ARRAYED_TREE [like item]) is
		do
			arrayed_list.put_right (v)
		end

	al_merge_left (v: ARRAYED_LIST [ARRAYED_TREE [like item]]) is
		do
			arrayed_list.merge_left (v)
		end

	al_merge_right (v: ARRAYED_LIST [ARRAYED_TREE [like item]]) is
		do
			arrayed_list.merge_right (v)
		end

	al_object_comparison: BOOLEAN is
		do
			Result := arrayed_list.object_comparison
		end

	al_full: BOOLEAN is
		do
			Result := arrayed_list.full
		end

	al_extendible: BOOLEAN is
		do
			Result := arrayed_list.extendible
		end

	al_put (v: ARRAYED_TREE [like item]) is
		do
			arrayed_list.put (v)
		end

	al_replace (v: ARRAYED_TREE [G]) is
		do
			arrayed_list.replace (v)
		end

	al_fill (other: CONTAINER [ARRAYED_TREE [G]]) is
		do
			arrayed_list.fill (other)
		end

	al_lin_rep: LINEAR [ARRAYED_TREE [G]] is
		do
			Result := arrayed_list.linear_representation
		end

	al_has (v: ARRAYED_TREE [like item]): BOOLEAN is
		do
			Result := arrayed_list.has (v)
		end

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

end -- class ARRAYED_TREE
