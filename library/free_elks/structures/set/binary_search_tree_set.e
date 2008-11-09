indexing

	description:
		"Sorted sets implemented as binary search trees"
	legal: "See notice at end of class."

	status: "See notice at end of class."
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
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				Result := t.count
			end
		end

	min: like item is
			-- Minimum item in tree
		local
			t: like tree
		do
			t := tree
			check
				t_attached: t /= Void
			end
			Result := t.min
		end

	max: like item is
			-- Maximum item in tree
		local
			t: like tree
		do
			t := tree
			check
				t_attached: t /= Void
			end
			Result := t.max
		end

	item: G is
			-- Current item
		local
			a: like active_node
		do
			a := active_node
			check
				a_attached: a /= Void
			end
			Result := a.item
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
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				Result := t.has (v)
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

	finish is
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

	forth is
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

	back is
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

	put, extend (v: like item) is
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

	wipe_out is
			-- Remove all items.
		do
			tree := Void
		end

	prune (v: like item) is
			-- Remove `v'.
		local
			t: like tree
		do
			t := tree
			if t /= Void then
				t := t.pruned (v, t.parent)
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

	tree: ?BINARY_SEARCH_TREE [G]

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
		do
			if {h: HASHABLE} v then
				create {SUBSET_STRATEGY_HASHABLE [G]} Result
			elseif object_comparison and same_type (other) then
				create {SUBSET_STRATEGY_TREE [G]} Result
			else
				create {SUBSET_STRATEGY_GENERIC [G]} Result
			end
		end

invariant

	comparison_mode_equal: {t: like tree} tree implies
				object_comparison = t.object_comparison

indexing
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

end -- class BINARY_SEARCH_TREE_SET
