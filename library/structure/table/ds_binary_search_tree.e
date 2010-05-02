note

	description:
	"[
		Tables using binary search tree algorithms.

		Note that it is not recommended to use direct instances in performance
		critical applications, as the trees may become unbalanced. The alternatives
		are DS_AVL_TREE and DS_RED_BLACK_TREE.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_BINARY_SEARCH_TREE [G, K]

inherit

	DS_BILINEAR_TABLE [G, K]
		undefine
			value, has_void
		end

	DS_BINARY_SEARCH_TREE_CONTAINER [G, K]
		rename
			has as has_item,
			has_void as has_void_item,
			has_key as has,
			has_void_key as has_void
		export
			{ANY}
				key_comparator_settable
		redefine
			root_node
		end

create

	make

feature -- Access

	new_cursor: DS_BINARY_SEARCH_TREE_CURSOR [G, K]
			-- New external cursor
		do
			create Result.make (Current)
		end

	key_comparator: KL_COMPARATOR [K]
			-- Comparison criterion for keys

feature {NONE} -- Access

	new_tree_node (a_item: G; a_key: K): like root_node
			-- Returns a new tree node instance where `a_item' is
			-- associated with `a_key'.
		do
			create Result.make (a_item, a_key)
		end

feature -- Setting

	set_key_comparator (a_comparator: like key_comparator)
			-- Set `key_comparator' to `a_comparator'.
		do
			key_comparator := a_comparator
		end

feature {NONE} -- Setting

	internal_set_key_comparator (a_comparator: like key_comparator)
			-- Set `key_comparator' to `a_comparator'.
			-- (No "settable" precondition, to be used internally only.)
		do
			key_comparator := a_comparator
		end

feature -- Element change

	replace (v: G; k: K)
			-- Replace item associated with `k' by `v'.
			-- (Performance: O(height).)
		local
			l_node: like root_node
		do
			search_insert_position (k)
			l_node := found_node
			check
				found: exact_insert_position_found
			end
			l_node.set_item (v)
		end

	put (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		do
			internal_put (v, k)
		end

	put_new (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		do
			internal_put_new (v, k)
		end

	force (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		do
			internal_put (v, k)
		ensure
			inserted: has (k) and then item (k) = v
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
		end

	force_new (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		require
			new_item: not has (k)
		do
			internal_put_new (v, k)
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
		end

feature {NONE} -- Element change

	on_node_added (a_node: like root_node)
			-- `a_node' was just added to the binary search tree.
			-- This feature is basically used by balanced binary
			-- search tree variants. They are informed which
			-- node was just added and may rebalance the tree
			-- accordingly.
		do
		end

feature {NONE} -- Removal

	on_root_node_removed
			-- The node that was previsously the `root_node'
			-- was removed. The old `root_node' had only
			-- one child and this child is now the `root_node'.
			-- This feature is used by the balanced binary
			-- search tree variants.
		do
		end

	on_node_removed (a_old_node, a_node: like root_node; a_was_left_child: BOOLEAN)
			-- `a_old_node' was just removed from the tree.
			-- The parent of `a_old_node' was `a_node'.
			-- Depending on `a_was_left_child' `a_old_node'
			-- was the left or the right child of `a_node'.
			-- This feature is used by the balanced variants
			-- of binary search tree.
		do
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current.
		local
			l_other_node: like root_node
		do
			if other /= Current then
				if internal_cursor = Void then
					set_internal_cursor (new_cursor)
				end
				key_comparator := other.key_comparator
				wipe_out
				if not other.is_empty then
					from
						l_other_node := other.first_node
					until
						l_other_node = Void
					loop
						put_new (l_other_node.item, l_other_node.key)
						l_other_node := successor (l_other_node)
					end
				end
			end
		end

feature {NONE} -- Implementation

	root_node: DS_BINARY_SEARCH_TREE_NODE [G, K]
			-- Root node

end
