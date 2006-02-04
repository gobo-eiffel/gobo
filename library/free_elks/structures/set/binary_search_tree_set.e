indexing

	description:
		"Sorted sets implemented as binary search trees"

	status: "See notice at end of class"
	names: binary_search_tree_set, set, binary_search_tree;
	representation: recursive, array;
	access: membership, min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class BINARY_SEARCH_TREE_SET [G -> COMPARABLE] inherit

	COMPARABLE_SET [G]
		redefine
			min, max, has, off
		end

	TRAVERSABLE_SUBSET [G]

create

	make

feature -- Initialization

	make is
			-- Create set.
		do
			before := True
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items in tree
		do
			if tree /= Void then
				Result := tree.count
			end
		end

	min: like item is
			-- Minimum item in tree
		do
			Result := tree.min
		end

	max: like item is
			-- Maximum item in tree
		do
			Result := tree.max
		end

	item: G is
			-- Current item
		do
			Result := active_node.item
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is set empty?
		do
			Result := tree = Void
		end

	extendible: BOOLEAN is True
		-- Can new items be added? (Answer: yes.)

	prunable: BOOLEAN is True
		-- Can items be removed? (Answer: yes.)

	after: BOOLEAN
		-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
		-- Is there no valid cursor position to the left of cursor?

	has (v: like item): BOOLEAN is
			-- Is there a node with item `v' in tree?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if tree /= Void then
				Result := tree.has (v)
			end
		end

	off: BOOLEAN is
			-- Is there no current item?
			-- `off' only if tree `is_empty' or if
			-- it is `before' or `after'.
		do
			Result := is_empty or Precursor {COMPARABLE_SET}
		end

feature -- Cursor movement

	start is
			-- Move cursor to first node.
		do
			before := False
			if tree = Void then
				after := True
			else
				after := False
				active_node := tree.min_node
			end
		end

	finish is
			-- Move cursor to last node.
		do
			after := False
			if tree = Void then
				before := True
			else
				before := False
				active_node := tree.max_node
			end
		end

	forth is
			-- Move cursor to next node.
		local
			prev_node: like tree
		do
			if before then
				before := False
				if is_empty then
					after:= True
				end
			else
				if active_node.has_right then
					active_node := 	active_node.right_child.min_node
				else
					prev_node := active_node
					active_node := active_node.parent
					from
					until
						active_node = Void
						or else prev_node = active_node.left_child
					loop
						prev_node := active_node
						active_node := active_node.parent
					end
					if active_node = Void then
						active_node := tree
						after := True
					end
				end
			end
		end

	back is
			-- Move cursor to previous node.
		local
			prev_node: like tree
		do
			if after then
				after := False
				if is_empty then
					before:= True
				end
			else
				if active_node.has_left then
					active_node := 	active_node.left_child.max_node
				else
					prev_node := active_node
					active_node := active_node.parent
					from
					until
						active_node = Void
						or else prev_node = active_node.right_child
					loop
						prev_node := active_node
						active_node := active_node.parent
					end
					if active_node = Void then
						active_node := tree
						before := True
					end
				end
			end
		end

feature -- Element change

	put, extend (v: like item) is
			-- Put `v' at proper position in set
			-- (unless one already exists).
		require else
			item_exists: v /= Void
		do
			if tree = Void then
				tree := new_tree (v)
			else
				if not has (v) then
					tree.extend (v)
				end
			end
		end

feature -- Removal

	wipe_out is
			-- Remove all items.
		do
			tree := Void
		end

	prune (v: like item) is
			-- Remove `v'.
		do
			if tree /= Void then
				tree := tree.pruned (v, tree.parent)
			end
		end

	remove is
			-- Remove current item.
		do
			prune (item)
		end

feature -- Duplication

	duplicate (n: INTEGER): BINARY_SEARCH_TREE_SET [G] is
			-- New structure containing min (`n', `count')
			-- items from current structure
		do
			create Result.make
			Result.set_tree (tree.duplicate (n))
		end

feature {BINARY_SEARCH_TREE_SET} -- Implementation

	tree: BINARY_SEARCH_TREE [G]

	active_node: like tree

	set_tree (t: like tree) is
			-- Set `tree' and `active_node' to `t'
		do
			tree := t
			active_node := t
		end

feature {NONE} -- Implementation

	new_tree (v: like item): like tree is
			-- New allocated node with `item' set to `v'
		do
			create Result.make (v)
			if object_comparison then
				Result.compare_objects
			end
		end

	subset_strategy_selection (v: G; other: TRAVERSABLE_SUBSET [G]): 
								SUBSET_STRATEGY [G] is
			-- Strategy to calculate several subset features selected depending
			-- on the dynamic type of `v' and `other'
		local
			h: HASHABLE
		do
			h ?= v
			if h /= Void then
				create {SUBSET_STRATEGY_HASHABLE [G]} Result
			elseif object_comparison and same_type (other) then
				create {SUBSET_STRATEGY_TREE [G]} Result
			else
				create {SUBSET_STRATEGY_GENERIC [G]} Result
			end
		end

invariant

	comparison_mode_equal: tree /= Void implies
				object_comparison = tree.object_comparison

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

end -- class BINARY_SEARCH_TREE_SET
