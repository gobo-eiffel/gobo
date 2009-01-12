note

	description:
		"Trees where the children of each node are kept in an array"
	legal: "See notice at end of class."

	status: "See notice at end of class."
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
			duplicate_all, fill_subtree, clone_node
		end

create

	make

feature -- Initialization

	make (n: INTEGER; v: G)
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

	parent: ?like child
			-- Parent of current node

	left_sibling: like parent
			-- Left neighbor if any
		local
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent > 1 then
				Result := p.array_item (position_in_parent - 1)
			end
		end

	right_sibling: like parent
			-- Right neighbor if any
		local
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				Result := p.array_item (position_in_parent + 1)
			end
		end

feature -- Element change

	child_put, child_replace (v: like item)
			-- Replace current child item with `v'.
		local
			c: like child
		do
			c := child
			if c /= Void then
				if object_comparison then
					c.compare_objects
				else
					c.compare_references
				end
				c.replace (v)
			end
		end

	replace_child (n: like child)
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

	child_extend (v: like item)
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

	child_put_left (v: like item)
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

	child_put_right (v: like item)
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

	put_child_left (n: like child)
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

	put_child_right (n: like child)
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

	put_child (n: like child)
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

	merge_tree_before (other: ARRAYED_TREE [G])
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

	merge_tree_after (other: ARRAYED_TREE [G])
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

	remove_child
			-- Remove child at cursor position.
			-- Move cursor to the next sibling, or `after' if none.
		local
			c: like child
		do
			c := child
			if c /= Void then
				c.attach_to_parent (Void)
			end
			al_remove
		end

	remove_left_child
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			child_back
			remove_child
		end

	remove_right_child
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		do
			child_forth
			remove_child
			child_back
		end

	forget_left
			-- Forget all left siblings.
		local
			i: INTEGER
			old_idx: INTEGER
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				old_idx := p.child_index
				from
					i := 1
				until
					i = position_in_parent
				loop
					p.child_go_i_th (i)
					p.remove_child
					i := i + 1
				end
				p.child_go_i_th (old_idx)
			end
		end

	forget_right
			-- Forget all right siblings.
		local
			i: INTEGER
			old_idx: INTEGER
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				old_idx := p.child_index
				from
					i := position_in_parent + 1
				until
					i > p.arity
				loop
					p.child_go_i_th (i)
					p.remove_child
					i := i + 1
				end
				p.child_go_i_th (old_idx)
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children.
		local
			counter: INTEGER
			pos: CURSOR
			c: like child
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
			until
				child_after or else (counter = n)
			loop
				c := child
				if c /= Void then
					Result.replace_child (c.duplicate_all)
				end
				Result.child_forth
				child_forth
				counter := counter + 1
			end
			child_go_to (pos)
		end

feature {NONE} -- Inapplicable

	extend (v: G)
			-- Add `v' as new child.
		do
		end

	set_child (n: like parent)
			-- Set child to `n'.
		do
		end

feature {ARRAYED_TREE} -- Implementation

	new_node: like Current
			-- A newly created instance of the same type,
			-- with the same arity and node value.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (arity, item)
		end

	duplicate_all: like Current
			-- Copy of sub-tree including all children
		local
			pos: CURSOR
			c: like child
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
				child_start
			until
				child_off
			loop
				c := child
				if c /= Void then
					Result.replace_child (c.duplicate_all)
				end
				Result.child_forth
				child_forth
			end
			child_go_to (pos)
		end

	fill_subtree (other: TREE [G])
			-- Fill children with children of `other'
		local
			temp: like parent
			c: ?TREE [G]
		do
			from
				other.child_start
				child_start
			until
				child_after
			loop
				c := other.child
				if c /= Void then
					create temp.make (other.arity, other.child_item)
					temp.fill_subtree (c)
					replace_child (temp)
				end
				child_forth
				other.child_forth
			end
		end

	attach_to_parent (n: like parent)
			-- Make `n' parent of current node;
		do
			parent := n
		end

	clone_node (n: like Current): like Current
			-- Clone node `n'.
		do
			create Result.make (n.arity, n.item)
			Result.copy_node (n)
		end

	copy_node (n: like Current)
			-- Copy content of `n' except tree data into Current.
		local
			l_arrayed_list: like arrayed_list
		do
				-- Store values that may be overriden by `standard_copy'.
			l_arrayed_list := arrayed_list
				-- Perform copy.
			standard_copy (n)
				-- Restore values that we wanted to preserve.			
			arrayed_list := l_arrayed_list
			parent := Void
		end

feature {NONE} -- Implementation

	arrayed_list: ARRAYED_LIST [ARRAYED_TREE [G]]
			-- arrayed list of arrayed_tree.

	new_tree: like Current
			-- A newly created instance of the same type.
		do
			create Result.make (0, item)
		end

	new_cell (v: like item): like Current
			-- New node with value `v' and no children.
		do
			create Result.make (0, v)
			Result.attach_to_parent (Current)
		end

	position_in_parent: INTEGER
			-- Position of current node in parent
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				Result := p.index_of (Current, 1)
			end
		end

	attach (other: ARRAYED_TREE [G])
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
				if c /= Void then
					c.attach_to_parent (Current)
				end
			end
		end

	do_all_internal (an_agent: PROCEDURE [ANY, TUPLE [G]]; a_tree_node: ARRAYED_TREE [G])
			-- Apply action to every child.
		require
			non_void_agent: an_agent /= Void
			non_void_tree_node: a_tree_node /= Void
		local
			c: like child
		do
			an_agent.call ([a_tree_node.item])
			from
				a_tree_node.child_start
			until
				a_tree_node.child_off
			loop
				c := a_tree_node.child
				if c /= Void then
					do_all_internal (an_agent, c)
				end
				a_tree_node.child_forth
			end
		end

feature -- Access

	child: ARRAYED_TREE [G]
		do
			Result := arrayed_list.item
		end

	array_item (n: INTEGER): ARRAYED_TREE [G]
		do
			Result := arrayed_list.i_th (n)
		end

	last_child: like first_child
		do
			Result := arrayed_list.last
		end

	first_child: like parent
		do
			Result := arrayed_list.first
		end

	search_child (v: ARRAYED_TREE [like item])
		do
			arrayed_list.search (v)
		end

	readable_child: BOOLEAN
		do
			Result := arrayed_list.readable
		end

	writable_child: BOOLEAN
		do
			Result := arrayed_list.writable
		end

	arity: INTEGER
		do
			Result := arrayed_list.count
		end

	child_start
		do
			arrayed_list.start
		end

	child_finish
		do
			arrayed_list.finish
		end

	child_forth
		do
			arrayed_list.forth
		end

	child_back
		do
			arrayed_list.back
		end

	child_go_i_th (i: INTEGER)
		do
			arrayed_list.go_i_th (i)
		end

	child_index: INTEGER
		do
			Result := arrayed_list.index
		end

	child_off: BOOLEAN
		do
			Result := arrayed_list.off
		end

	child_after: BOOLEAN
		do
			Result := arrayed_list.after
		end

	child_before: BOOLEAN
		do
			Result := arrayed_list.before
		end

	child_cursor: CURSOR
		do
			Result := arrayed_list.cursor
		end

	child_go_to (p: CURSOR)
		do
			arrayed_list.go_to (p)
		end

	index_of (v: ARRAYED_TREE [like item]; i: INTEGER): INTEGER
		do
			Result := arrayed_list.index_of (v, i)
		end

	prune (n: like child)
		do
			arrayed_list.prune (n)
		end

	wipe_out
		do
			arrayed_list.wipe_out
		end

	move (i: INTEGER)
			-- Move child
		obsolete
			"Use feature `child_move' instead"
		do
			child_move (i)
		end

	child_move (i: INTEGER)
		do
			arrayed_list.move (i)
		end

	do_all (an_agent: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `an_agent' to every child nodes in the tree.
		do
			do_all_internal (an_agent, Current)
		end

feature {NONE} -- private access arrayed_list

	al_make (n: INTEGER)
		do
			arrayed_list.make (n)
		end

	al_extend (v: ARRAYED_TREE [like item])
		do
			arrayed_list.extend (v)
		end

	al_duplicate (n: INTEGER): ARRAYED_LIST [like Current]
		do
			Result := arrayed_list.duplicate (n)
		end

	al_remove
		do
			arrayed_list.remove
		end

	al_remove_left
		do
			arrayed_list.remove_left
		end

	al_remove_right
		do
			arrayed_list.remove_right
		end

	al_put_left (v: ARRAYED_TREE [like item])
		do
			arrayed_list.put_left (v)
		end

	al_put_right (v: ARRAYED_TREE [like item])
		do
			arrayed_list.put_right (v)
		end

	al_merge_left (v: ARRAYED_LIST [ARRAYED_TREE [like item]])
		do
			arrayed_list.merge_left (v)
		end

	al_merge_right (v: ARRAYED_LIST [ARRAYED_TREE [like item]])
		do
			arrayed_list.merge_right (v)
		end

	al_object_comparison: BOOLEAN
		do
			Result := arrayed_list.object_comparison
		end

	al_full: BOOLEAN
		do
			Result := arrayed_list.full
		end

	al_extendible: BOOLEAN
		do
			Result := arrayed_list.extendible
		end

	al_put (v: ARRAYED_TREE [like item])
		do
			arrayed_list.put (v)
		end

	al_replace (v: ARRAYED_TREE [G])
		do
			arrayed_list.replace (v)
		end

	al_fill (other: CONTAINER [ARRAYED_TREE [G]])
		do
			arrayed_list.fill (other)
		end

	al_lin_rep: LINEAR [ARRAYED_TREE [G]]
		do
			Result := arrayed_list.linear_representation
		end

	al_has (v: ARRAYED_TREE [like item]): BOOLEAN
		do
			Result := arrayed_list.has (v)
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class ARRAYED_TREE
