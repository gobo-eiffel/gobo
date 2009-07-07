indexing

	description:
	"[
		Sets using binary search tree algorithms.

		Note that it is not recommended to use direct instances in performance
		critical applications, as the trees may become unbalanced. The alternatives
		are DS_AVL_TREE_SET and DS_RED_BLACK_TREE_SET.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_BINARY_SEARCH_TREE_SET [G]

inherit

	DS_BILINEAR_SET [G]
		undefine
			has,
			equality_tester_settable,
			occurrences,
			cursor_off
		redefine
			equality_tester,
			has_void
		end

	DS_BINARY_SEARCH_TREE_CONTAINER [G, G]
		rename
			has_key as has,
			has_void_key as has_void,
			key_comparator as equality_tester,
			key_comparator_settable as equality_tester_settable,
			set_key_comparator as set_equality_tester
		redefine
			cursor_search_forth,
			cursor_search_back,
			equality_tester,
			has_void,
			root_node
		end

create

	make

feature -- Access

	new_cursor: DS_BINARY_SEARCH_TREE_SET_CURSOR [G] is
			-- New external cursor
		do
			create Result.make (Current)
		end

	equality_tester: KL_COMPARATOR [G]
			-- Comparison criterion for items

feature {NONE} -- Access

	new_tree_node (a_item, a_key: G): like root_node is
			-- New tree node with `a_item'
		do
			check
				item_and_key_equal: a_item = a_key
			end
			create Result.make (a_item)
		end

feature -- Status report

	has_void: BOOLEAN is
			-- Does container include Void?
		do
			if not is_empty then
				Result := first_node.item = Void
			end
		end

	is_subset (other: DS_SET [G]): BOOLEAN is
			-- Are all items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
				Result := True
			until
				not Result or else l_node = Void
			loop
				Result := other.has (l_node.item)
				l_node := successor (l_node)
			end
		end

	is_disjoint (other: DS_SET [G]): BOOLEAN is
			-- Are none of the items of current set included in `other'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
				Result := True
			until
				not Result or else l_node = Void
			loop
				Result := not other.has (l_node.item)
				l_node := successor (l_node)
			end
		end

	extendible (n: INTEGER): BOOLEAN is
			-- May container be extended with `n' items?
		do
			Result := True
		end

feature {NONE} -- Setting

	internal_set_key_comparator (a_tester: like equality_tester) is
			-- Set `equality_tester' to `a_tester'.
			-- (No "settable" precondition, to be used internally only.)
		do
			equality_tester := a_tester
		end

feature {DS_LINEAR_CURSOR} -- Cursor implementation

	cursor_search_forth (a_cursor: like new_cursor; v: G) is
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		do
			search_node (v)
			if found_node /= Void then
				a_cursor.set_position (found_node)
			else
				a_cursor.go_after
			end
		end

feature {DS_BILINEAR_CURSOR} -- Cursor implementation

	cursor_search_back (a_cursor: like new_cursor; v: G) is
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		do
			search_node (v)
			if found_node /= Void then
				a_cursor.set_position (found_node)
			else
				a_cursor.go_before
			end
		end

feature -- Element change

	put, put_last, force, force_last (v: G) is
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			internal_put (v, v)
		end

	put_new, force_new (v: G) is
			-- Add `v' to set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			internal_put_new (v, v)
		end

	extend, extend_last, append, append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to set, replacing any existing item.
			-- Add `other.first' first, etc.
		local
			l_cursor: DS_LINEAR_CURSOR [G]
			l_item: G
		do
			if other /= Void then
				l_cursor := other.new_cursor
				from
					l_cursor.start
				until
					l_cursor.after
				loop
					l_item := l_cursor.item
					if l_item /= Void then
						put (l_item)
					end
					l_cursor.forth
				end
			end
		end

feature {NONE} -- Element change

	on_node_added (a_node: like root_node) is
			-- `a_node' was just added to the binary search tree.
			-- This feature is basically used by balanced binary
			-- search tree variants. They are informed which
			-- node was just added and may rebalance the tree
			-- accordingly.
		do
		end

feature {NONE} -- Removal

	on_root_node_removed is
			-- The node that was previsously the `root_node'
			-- was removed. The old `root_node' had only
			-- one child and this child is now the `root_node'.
			-- This feature is used by the balanced binary
			-- search tree variants.
		do
		end

	on_node_removed (a_old_node, a_node: like root_node; a_was_left_child: BOOLEAN) is
			-- `a_old_node' was just removed from the tree.
			-- The parent of `a_old_node' was `a_node'.
			-- Depending on `a_was_left_child' `a_old_node'
			-- was the left or the right child of `a_node'.
			-- This feature is used by the balanced variants
			-- of binary search tree.
		do
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy `other' to current.
		local
			l_old_cursor_position: like root_node
			l_other_node: like root_node
		do
			if other /= Current then
				if not internal_cursor.off then
					l_old_cursor_position := internal_cursor.position
				end
				wipe_out
				equality_tester := other.equality_tester
				if not other.is_empty then
					from
						l_other_node := other.first_node
					until
						l_other_node = Void
					loop
						put_new (l_other_node.item)
						if l_old_cursor_position /= Void then
							if l_old_cursor_position.item = l_other_node.item then
								internal_cursor.set_position (l_old_cursor_position)
							end
						end
						l_other_node := successor (l_other_node)
					end
				end
			end
		end

feature -- Basic operations

	merge (other: DS_SET [G]) is
			-- Add all items of `other' to current set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_cursor: DS_SET_CURSOR [G]
			l_item: G
		do
			if other /= Void then
				l_cursor := other.new_cursor
				from
					l_cursor.start
				until
					l_cursor.after
				loop
					l_item := l_cursor.item
					if not has (l_item) then
						put_new (l_item)
					end
					l_cursor.forth
				end
			end
		end

	intersect (other: DS_SET [G]) is
			-- Remove all items not included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_cursor: like new_cursor
			l_item: G
		do
			if other = Current then
				move_all_cursors_after
			elseif other.is_empty then
				wipe_out
			else
				move_all_cursors_after
				from
					l_cursor := new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_item := l_cursor.item
					if not other.has (l_item) then
						remove_node (l_cursor.position)
					else
						l_cursor.forth
					end
				end
			end
		end

	subtract (other: DS_SET [G]) is
			-- Remove all items also included in `other'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_cursor: like new_cursor
			l_item: G
		do
			if other.is_empty then
				move_all_cursors_after
			elseif other = Current then
				wipe_out
			else
				move_all_cursors_after
				from
					l_cursor := new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					l_item := l_cursor.item
					if other.has (l_item) then
						remove_node (l_cursor.position)
					else
						l_cursor.forth
					end
				end
			end
		end

	symdif (other: DS_SET [G]) is
			-- Add items of `other' which are not included
			-- in current set and remove those which are.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			l_cursor: DS_SET_CURSOR [G]
			l_item: G
		do
			if other.is_empty then
				move_all_cursors_after
			elseif other = Current then
				wipe_out
			elseif is_empty then
				merge (other)
			else
				move_all_cursors_after
				l_cursor := other.new_cursor
				from
					l_cursor.start
				until
					l_cursor.after
				loop
					l_item := l_cursor.item
					if has (l_item) then
						remove (l_item)
					else
						put_new (l_item)
					end
					l_cursor.forth
				end
			end
		end

feature {NONE} -- Implementation

	root_node: DS_BINARY_SEARCH_TREE_SET_NODE [G]
			-- Root node

end
