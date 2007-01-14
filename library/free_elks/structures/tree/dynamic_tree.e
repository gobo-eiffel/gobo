indexing

	description:
		"Trees with a dynamically modifiable structure"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: dynamic_tree, tree;
	representation: recursive;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DYNAMIC_TREE [G] inherit

	TREE [G]
		redefine
			parent
		end

feature -- Access

	parent: DYNAMIC_TREE [G]
			-- Parent of current node.

feature -- Status report

	extendible: BOOLEAN is True
			-- May new items be added?

feature {RECURSIVE_CURSOR_TREE} -- Element change

	set_child (n: like parent) is
			-- Set the child of parent to `n'.
		require
			non_void_argument: n /= Void		
		deferred
		end

feature -- Element change

	extend (v: like item) is
			-- Add `v' as new child.
		do
			child_extend (v)
		end

	child_extend (v: like item) is
			-- Add `v' to the list of children.
			-- Do not move child cursor.
		deferred
		end

	child_put_left (v: like item) is
			-- Add `v' to the left of cursor position.
			-- Do not move child cursor.
		require
			not_child_before: not child_before
		deferred
		end

	child_put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move child cursor.
		require
			not_child_after: not child_after
		deferred
		end

	put_child_left (n: like parent) is
			-- Add `n' to the left of cursor position.
			-- Do not move cursor.
		require
			not_child_before: not child_before
			non_void_argument: n /= Void
		deferred
		end

	put_child_right (n: like parent) is
			-- Add `n' to the right of cursor position.
			-- Do not move cursor.
		require
			not_child_after: not child_after
			non_void_argument: n /= Void
		deferred
		end

	merge_tree_before (other: like first_child) is
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		require
			not_child_off: not child_off
			other_exists: (other /= Void)
		deferred
		ensure
			other_is_leaf: other.is_leaf
		end

	merge_tree_after (other: like first_child) is
			-- Merge children of `other' into current structure
			-- after cursor position. Do not move cursor.
			-- Make `other' a leaf.
		require
			not_child_off: not child_off
			other_exists: (other /= Void)
		deferred
		ensure
			other_is_leaf: other.is_leaf
		end

feature -- Removal

	remove_left_child is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		require
			is_not_first: not child_isfirst
		deferred
		ensure
	 		new_arity: arity = old arity - 1
	 		new_child_index: child_index = old child_index - 1
		end

	remove_right_child is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		require
			is_not_last: not child_islast
		deferred
		ensure
	 		new_arity: arity = old arity - 1
	 		new_child_index: child_index = old child_index
		end

	remove_child is
			-- Remove child at cursor position.
			-- Move cursor to next sibling, or `after' if none.
		require
			child_not_off: not child_off
		deferred
		ensure
			new_arity: arity = old arity - 1
			new_child_index: child_index = old child_index
		end

feature -- Conversion

	fill_from_binary (b: BINARY_TREE [G]) is
			-- Fill from a binary tree representation.
			-- Left child becomes first child.
			-- Right child becomes right sibling.
			-- Any right child of `b' is ignored.
		local
			current_node: BINARY_TREE [G]
		do
			replace (b.item)
			wipe_out
			if b.has_left then
				from
					current_node := b.left_child
				until
					current_node = Void
				loop
					child_put_right (current_node.item)
					child_forth
					child.fill_from_binary (current_node)
					current_node := current_node.right_child
				end
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children
		local
			pos: CURSOR
			counter: INTEGER
		do
			from
				Result := new_tree
				pos := child_cursor
			until
				child_after or else (counter = n)
			loop
				Result.put_child (child.duplicate_all)
				child_forth
				counter := counter + 1
			end
			child_go_to (pos)
		end

feature {DYNAMIC_TREE} -- Implementation

	new_tree: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		deferred
		ensure
			result_exists: Result /= Void
			result_item: Result.item = item
		end

	duplicate_all: like Current is
			-- Copy of sub-tree including all children
		local
			pos: CURSOR
		do
			from
				Result := new_tree
				pos := child_cursor
				child_start
			until
				child_off
			loop
				Result.put_child (child.duplicate_all)
				Result.child_forth
				child_forth
			end
			child_go_to (pos)
		end

	fill_subtree (other: TREE [G]) is
			-- Fill children with children of `other'.
		do
			from
				other.child_start
			until
				other.child_off
			loop
				child_extend (other.item)
				other.child_forth
			end
			from
				child_start
				other.child_start
			until
				child_off
			loop
				child.fill_subtree (other.child)
				other.child_forth
				child_forth
			end
		end

invariant

	extendible_definition: extendible
	child_after_definition: child_after = (child_index = arity + 1)

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







end -- class DYNAMIC_TREE



