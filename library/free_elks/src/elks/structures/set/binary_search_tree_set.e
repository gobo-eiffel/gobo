note
	description: "Sorted sets implemented as binary search trees"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: binary_search_tree_set, set, binary_search_tree
	representation: recursive, array
	access: membership, min, max
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

class BINARY_SEARCH_TREE_SET [G -> COMPARABLE] inherit

	COMPARABLE_SET [G]
		redefine
			min, max, has, off
		end

	TRAVERSABLE_SUBSET [G]

create

	make,
	make_from_iterable

feature {NONE} -- Initialization

	make
			-- Create set.
		do
			before := True
		end

	make_from_iterable (other: ITERABLE [G])
			-- Create a set with all items obtained from `other`.
		do
			make
			across
				other as o
			loop
				extend (o.item)
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in tree
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				Result := t.count
			end
		end

	min: like item
			-- Minimum item in tree
		do
			check attached tree as t then
				Result := t.min
			end
		end

	max: like item
			-- Maximum item in tree
		do
			check attached tree as t then
				Result := t.max
			end
		end

	item: G
			-- Current item
		do
			check attached active_node as a then
				Result := a.item
			end
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is set empty?
		do
			Result := tree = Void
		end

	extendible: BOOLEAN = True
		-- Can new items be added? (Answer: yes.)

	prunable: BOOLEAN = True
		-- Can items be removed? (Answer: yes.)

	after: BOOLEAN
		-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
		-- Is there no valid cursor position to the left of cursor?

	has alias "∋" (v: like item): BOOLEAN
			-- Is there a node with item `v' in tree?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				Result := t.has (v)
			end
		end

	off: BOOLEAN
			-- Is there no current item?
			-- `off' only if tree `is_empty' or if
			-- it is `before' or `after'.
		do
			Result := is_empty or Precursor {COMPARABLE_SET}
		end

feature -- Iteration

	new_cursor: ITERATION_CURSOR [G]
			-- <Precursor>
		do
			if attached tree as t then
				Result := t.new_cursor
			else
				create {EMPTY_ITERATION_CURSOR [G]} Result
			end
		end

feature -- Cursor movement

	start
			-- Move cursor to first node.
		local
			t: like tree
		do
			before := False
			t := tree
			if t = Void then
				after := True
			else
				after := False
				active_node := t.min_node
			end
		end

	finish
			-- Move cursor to last node.
		local
			t: like tree
		do
			after := False
			t := tree
			if t = Void then
				before := True
			else
				before := False
				active_node := t.max_node
			end
		end

	forth
			-- Move cursor to next node.
		local
			prev_node: like tree
			a: like active_node
			r: like active_node
		do
			if before then
				before := False
				if is_empty then
					after:= True
				end
			else
				a := active_node
				if a /= Void then
					r := a.right_child
					if r /= Void then
						active_node := r.min_node
					else
						from
							prev_node := a
							a := a.parent
						until
							a = Void
							or else prev_node = a.left_child
						loop
							prev_node := a
							a := a.parent
						end
						if a = Void then
							active_node := tree
							after := True
						else
							active_node := a
						end
					end
				end
			end
		end

	back
			-- Move cursor to previous node.
		local
			prev_node: like tree
			a: like active_node
			l: like active_node
		do
			if after then
				after := False
				if is_empty then
					before:= True
				end
			else
				a := active_node
				if a /= Void then
					l := a.left_child
					if l /= Void then
						active_node := l.max_node
					else
						from
							prev_node := a
							a := a.parent
						until
							a = Void
							or else prev_node = a.right_child
						loop
							prev_node := a
							a := a.parent
						end
						if a = Void then
							active_node := tree
							before := True
						else
							active_node := a
						end
					end
				end
			end
		end

feature -- Element change

	put, extend (v: like item)
			-- Put `v' at proper position in set
			-- (unless one already exists).
		require else
			item_exists: v /= Void
		local
			t: like tree
		do
			t := tree
			if t = Void then
				tree := new_tree (v)
			elseif not has (v) then
				t.extend (v)
			end
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		do
			tree := Void
		end

	prune (v: like item)
			-- Remove `v'.
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				tree := t.pruned (v, t.parent)
			end
		end

	remove
			-- Remove current item.
		local
			l_item: like item
			l_next_item: detachable like item
		do
			if attached tree as t then
					-- Let's first get the item we want to remove.
				l_item := item
					-- Let's move the cursor to the next item
				forth
					-- Store the new item if not after, we will
					-- use it later to update `active_node'
				if not after then
					l_next_item := item
				end
					-- Remove item from tree
				tree := t.pruned (l_item, t.parent)
					-- If there is still a tree and there was a next item,
					-- find it in the tree, it will become our new `active_node'.
				if l_next_item /= Void and attached tree as t2 then
					active_node := t2.tree_item (l_next_item)
				end
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): BINARY_SEARCH_TREE_SET [G]
			-- New structure containing min (`n', `count')
			-- items from current structure
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
		local
			t: like tree
		do
			create Result.make
			t := tree
			if t /= Void then
				Result.set_tree (t.duplicate (n))
			end
		end

feature {BINARY_SEARCH_TREE_SET} -- Implementation

	tree: detachable BINARY_SEARCH_TREE [G]

	active_node: like tree

	set_tree (t: like tree)
			-- Set `tree' and `active_node' to `t'
		do
			tree := t
			active_node := t
		end

feature {NONE} -- Implementation

	new_tree (v: like item): like tree
			-- New allocated node with `item' set to `v'
		do
			create Result.make (v)
			if object_comparison then
				Result.compare_objects
			end
		end

	subset_strategy_selection (v: G; other: TRAVERSABLE_SUBSET [G]):
								SUBSET_STRATEGY [G]
			-- Strategy to calculate several subset features selected depending
			-- on the dynamic type of `v' and `other'
		do
			if attached {HASHABLE} v as h then
				create {SUBSET_STRATEGY_HASHABLE [G]} Result
			elseif object_comparison and same_type (other) then
				create {SUBSET_STRATEGY_TREE [G]} Result
			else
				create {SUBSET_STRATEGY_GENERIC [G]} Result
			end
		end

invariant

	comparison_mode_equal: attached tree as t implies
				object_comparison = t.object_comparison

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
