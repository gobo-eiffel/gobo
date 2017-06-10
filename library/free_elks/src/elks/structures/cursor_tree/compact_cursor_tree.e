note
	description: "Compact trees as active structures that may be traversed using a cursor"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: compact_cursor_tree, cursor_tree;
	representation: array;
	access: cursor, membership;
	size: resizable;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class COMPACT_CURSOR_TREE [G] inherit

	CURSOR_TREE [G]
		rename
			index as linear_index
		redefine
			put_left, put_right, extend, has, occurrences
		end

create

	make

feature -- Initialization

	make (i: INTEGER)
			-- Create an empty tree.
			-- `i' is an estimate of the number of nodes.
		local
			l_default: G
		do
			last := 1
			active := 1
			above := True
			create item_table.make_filled (l_default, 1, i + 1)
			create next_sibling_table.make_filled (0, 1, i + 1)
			create first_child_table.make_filled (0, 1, i + 1)
		ensure
			is_above: above
			is_empty: is_empty
		end

feature -- Access

	has (v: like item): BOOLEAN
			-- Does structure include an occurrence of `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if object_comparison then
				item_table.compare_objects
			else
				item_table.compare_references
			end
			Result := item_table.has (v)
		end

	occurrences (v: G): INTEGER
			-- Number of times `v' appears.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if object_comparison then
				item_table.compare_objects
			else
				item_table.compare_references
			end
			Result := item_table.occurrences (v)
		end

	item: G
			-- Current item
		do
			Result := item_table.item (active)
		end

	cursor: COMPACT_TREE_CURSOR
			-- Current cursor position
		do
			create Result.make (active, after, before, below, above)
		end

feature -- Measurement

	arity: INTEGER
			-- Number of children
		local
			index: INTEGER
		do
			index := first_child_table.item (active)
			from
			until
				index <= 0
			loop
				Result := Result + 1
				index := next_sibling_table.item (index)
			end
		end

	count: INTEGER
			-- Number of items in subtree
		do
			Result := last - free_list_count - 1
		end

feature -- Status report

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?

	above: BOOLEAN
			-- Is there no valid cursor position above the cursor?

	isfirst: BOOLEAN
			-- Is cursor on first sibling?
		local
			index: INTEGER
		do
			if not off then
				from
					index := next_sibling_table.item (active)
				until
					index <= 0
				loop
					index := next_sibling_table.item (index)
				end
				Result := (index = 0) or else (first_child_table.item (- index) = active)
			end
		end

	islast: BOOLEAN
			-- Is cursor on last sibling?
		do
			if not off then
				Result := (next_sibling_table.item (active) <= 0)
			end
		end

	is_root: BOOLEAN
			-- Is cursor on root?
	 	do
			if not off then
				Result := next_sibling_table.item (active) = 0
			end
		end


	full: BOOLEAN = False
			-- Is tree filled to capacity? (Answer: no.)

	is_empty: BOOLEAN
		do
			Result := count = 0
		end

	prunable: BOOLEAN
		do
			Result := True
		end


	valid_cursor (p: CURSOR): BOOLEAN
			-- Can the cursor be moved to position `p'?
		do
			if attached {COMPACT_TREE_CURSOR} p as temp then
				Result := (first_child_table.item (temp.active) /= Removed_mark)
			end
		end

feature -- Cursor movement

	back
			-- Move cursor one position backward.
		local
			index, next: INTEGER
		do
			if below then
				check
					after
				end
					-- This is because:
					-- below implies (before or after),
					-- and before is false.
				after := False
				before := True
			elseif after then
				after := False
			else
				from
					index := next_sibling_table.item (active)
				until
					index <= 0
				loop
					index := next_sibling_table.item (index)
				end
				if index = 0 then -- is_root
					before := True
				elseif first_child_table.item (- index) = active then	-- is_first
					before := True
				else
					from
						index := first_child_table.item (- index)
						next := next_sibling_table.item (index)
					until
						next = active
					loop
						index := next
						next := next_sibling_table.item (index)
					end
					active := index
				end
			end
		end

	forth
			-- Move cursor one position forward.
		do
			if below then
				check
					before
				end
					-- This is because:
					-- below implies (before or after),
					-- and after is false.
				before := False
				after := True
			elseif before then
				before := False
			elseif islast then
				after := True
			else
				active := next_sibling_table.item (active)
			end
		end

	up
			-- Move cursor one level upward, to parent
			-- or `above' if `is_root' holds.
		local
			index: INTEGER
		do
			if below then
				below := False
			else
				from
					index := next_sibling_table.item (active)
				until
					index <= 0
				loop
					index := next_sibling_table.item (index)
				end
				if index = 0 then
					above := True
				else
					active := -index
				end
			end
			after := False
			before := False
		end

	down (i: INTEGER)
			-- Move cursor one level downward:
			-- to `i'-th child if there is one,
			-- or `after' if `i' = `arity' + 1,
			-- or `before' if `i' = 0.
		require else
			True
		local
			index, next, counter: INTEGER
		do
			index := first_child_table.item (active)
			if above then
				above := False
				below := is_empty
				before := is_empty
				after := False
			elseif index <= 0 then
				below := True
				if i = 0 then
					before := True
					after := False
				else
					after := True
					before := False
				end
			else
				from
					--counter := 1;
					next := next_sibling_table.item (index)
				until
					counter = i or next <= 0
				loop
					index := next
					next := next_sibling_table.item (index)
					counter := counter + 1
				end
				active := index
				if i = 0 then
					before := True
					after := False
				elseif counter < i then
					after := True
					before := False
				end
			end
		end

	go_to (p: CURSOR)
			-- Move cursor to position `p'.
		do
			if attached {COMPACT_TREE_CURSOR} p as temp then
				active := temp.active
				after := temp.after
				before := temp.before
				below := temp.below
				above := temp.above
			else
				check
					correct_cursor_type: False
				end
			end
		end

feature -- Element change

	replace (v: G)
			-- Replace current item by `v'
		require else
			is_writable: writable
		do
			item_table.put (v, active)
		end

	put_right (v: G)
			-- Add a leaf `v' to the right of cursor position.
		local
			new: INTEGER
		do
			new := new_cell_index
			first_child_table.put (0, new)
			if below then
				first_child_table.put (new, active)
				next_sibling_table.put (- active, new)
				item_table.put (v, new)
				active := new
			elseif before then
				item_table.put (item_table.item (active), new)
				next_sibling_table.put (next_sibling_table.item (active), new)
				first_child_table.put (first_child_table.item (active), new)
				item_table.put (v, active)
				next_sibling_table.put (new, active)
				first_child_table.put (0, active)
				active := new
			else
				next_sibling_table.put (next_sibling_table.item (active), new)
				next_sibling_table.put (new, active)
			end
		end

	put_left (v: G)
			-- Add `v' to the left of current position.
		require else
			not_above: not above
		local
			new: INTEGER
		do
			new := new_cell_index
			if below then
				first_child_table.put (new, active)
				next_sibling_table.put (- active, new)
				item_table.put (v, new)
			else
				item_table.put (item_table.item (active), new)
				next_sibling_table.put (next_sibling_table.item (active), new)
				first_child_table.put (first_child_table.item (active), new)
				item_table.put (v, active)
				next_sibling_table.put (new, active)
				first_child_table.put (0, active)
			end
			active := new
		end

	put_front (v: G)
			-- Add a leaf `v' as first child.
			-- If `above' and `is_empty', make `v' the root value
		local
			old_active: like active
			new: INTEGER
		do
			new := new_cell_index
			if below then
				item_table.put (v, new)
				first_child_table.put (0, new)
				next_sibling_table.put (- active, new)
				active := new
			elseif before then
				item_table.put (item_table.item (active), new)
				next_sibling_table.put (next_sibling_table.item (active), new)
				first_child_table.put (first_child_table.item (active), new)
				item_table.put (v, active)
				next_sibling_table.put (new, active)
				first_child_table.put (0, active)
				active := new
			else
				old_active := active
				up
				item_table.put (v, new)
				next_sibling_table.put (first_child_table.item (active), new)
				first_child_table.put (new, active)
				active := old_active
			end
		end

	put_parent (v: G)
			-- insert a new node, with value v, as parent of
			-- current node and
			-- with the same position
			--if above or on root, add a new root
		require
			not after
			not before
		local
			new, old_index: INTEGER
		do
			new := new_cell_index
			old_index := active
			if is_empty then
				active := new
				item_table.put (v, new)
				next_sibling_table.put (0, new)
				first_child_table.put (0, new)
			else
				item_table.put (item, new)
				first_child_table.put (first_child_table.item (active), new)
				next_sibling_table.put (- active, new)
				item_table.put (v, active)
			end
		end

	extend (v: G)
		local
			new, index, next: INTEGER
		do
			new := new_cell_index
			item_table.put (v, new)
			if below then
				first_child_table.put (0, new)
				next_sibling_table.put (- active, new)
				if first_child_table.item (active) = 0 then
					first_child_table.put (new, active)
				end
				active := new
				--below := false
			else
				from
					index := active
					next := next_sibling_table.item (index)
				until
					next <= 0
				loop
					index := next
					next := next_sibling_table.item (index)
				end
				check
					parent_exists: next < 0
				end
				next_sibling_table.put (next, new)
				next_sibling_table.put (new, index)
			end
		end

feature -- Removal

	remove
			-- Remove node at cursor position
			-- (and consequently the corresponding subtree).
			-- Move cursor to next sibling, or `after' if none.
		local
			removed, index, next: INTEGER
		do
			removed := active
			up
			if first_child_table.item (active) = removed then
					-- The removed child is the first sibling
				index := next_sibling_table.item (removed)
				if index > 0 then
						-- There is more than one sibling
					first_child_table.put (index, active)
					active := index
				else
					first_child_table.put (0, active)
					below := True
					after := True
				end
			else
				from
					index := first_child_table.item (active)
					next := next_sibling_table.item (index)
				until
					next = removed
				loop
					index := next
					next := next_sibling_table.item (index)
				end
				next_sibling_table.put (next_sibling_table.item (removed), index)
				if next_sibling_table.item (removed) > 0 then
					active := next_sibling_table.item (removed)
				else
					active := index
					after := True
				end
			end
			remove_subtree (removed)
		ensure then
			not_before: not before
		end

	remove_node
			-- Remove node at cursor position; insert children into
			-- parent's children at current position; move cursor up.
			-- If node is root, it must not have more than one child.
		require
			not_off: not off
			is_root implies arity <= 1
		local
			old_active, next, index,
			first_child_index: INTEGER
			l_default: detachable G
		do
			old_active := active
			first_child_index := first_child_table.item (old_active)
			up
			next := first_child_table.item (active)
			if next = old_active then
				first_child_table.put
					 (next_sibling_table.item (old_active), active)
			else
				from
				until
					next = old_active
				loop
					index := next
					next :=	next_sibling_table.item (index)
				end
				next_sibling_table.put (first_child_index, index)
				from
					next := first_child_index
				until
					next <= 0
				loop
					index := next
					next := next_sibling_table.item (index)
				end
				next_sibling_table.put (next_sibling_table.item (old_active), index)
			end
			if old_active = last then
				last := last - 1
			else
				item_table.area.put (l_default, old_active - 1)
				first_child_table.put (Removed_mark, old_active)
				next_sibling_table.put (free_list_index, old_active)
				free_list_index := old_active
				free_list_count := free_list_count + 1
			end
		end

	wipe_out
			-- Remove all items.
		local
			l_default: G
		do
			item_table.conservative_resize_with_default (l_default, 1, Block_threshold + 1)
			next_sibling_table.conservative_resize_with_default (0, 1, Block_threshold + 1)
			first_child_table.conservative_resize_with_default (0, 1, Block_threshold + 1)
			item_table.clear_all
			next_sibling_table.clear_all
			first_child_table.clear_all
			last := 1
			active := 1
			free_list_count := 0
			free_list_index := 0
			above := True
			after := False
			before := False
			below := False
		ensure then
			cursor_above: above
		end

feature {COMPACT_CURSOR_TREE} -- Implementation

	new_tree: like Current
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (Block_threshold)
		end

feature {NONE} -- Implementation

	item_table: ARRAY [detachable G]
			-- Array containing the items

	first_child_table: ARRAY [INTEGER]
			-- Indices to the first child

	next_sibling_table: ARRAY [INTEGER]
			-- Indices to siblings

	active: INTEGER
			-- Index of current item

	Removed_mark: INTEGER = - 1
			-- Mark for removed child in `first_child_table'

	last: INTEGER
			-- Index into `item_table'; yields last item

	free_list_index: INTEGER
			-- Index to first empty space in `item_table'

	free_list_count: INTEGER
			-- Number of empty spaces in `item_table'

	remove_subtree (i: INTEGER)
		local
			index, next: INTEGER
			l_default: detachable G
		do
			from
				index := first_child_table.item (i)
			until
				index <= 0
			loop
				next := next_sibling_table.item (index)
				remove_subtree (index)
				index := next
			end
			if i = last then
				last := last - 1
			else
				item_table.area.put (l_default, i - 1)
				first_child_table.put (Removed_mark, i)
				next_sibling_table.put (free_list_index, i)
				free_list_index := i
				free_list_count := free_list_count + 1
			end
		end

	new_cell_index: INTEGER
		local
			l_default: detachable G
		do
			if free_list_index > 0 then
				Result := free_list_index
				free_list_index := next_sibling_table.item (Result)
				free_list_count := free_list_count - 1
			else
				last := last + 1
				if item_table.count < last then
					item_table.grow (last)
				else
					item_table.area.put (l_default, last - 1)
				end
				next_sibling_table.force (0, last)
				first_child_table.force (0, last)
				Result := last
			end
		end

	block_threshold: INTEGER
		do
			Result := 10
		end


note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"


end
