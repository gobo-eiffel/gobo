indexing

	description:
		"Trees as active structures that may be traversed using a cursor"

	status: "See notice at end of class"
	names: cursor_tree, tree;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class CURSOR_TREE [G] inherit

	HIERARCHICAL [G]
		rename
			successor_count as arity
		end

	CURSOR_STRUCTURE [G]
		rename
			fill as container_fill
		export
			{NONE} prune_all
		end

	LINEAR [G]
		rename
			forth as preorder_forth,
			finish as go_last_child,
			occurrences as linear_occurrences,
			has as linear_has,
			off as linear_off,
			do_all as linear_do_all,
			do_if as linear_do_if,
			there_exists as linear_there_exists,
			for_all as linear_for_all
		export
			{ANY} all
			{NONE} linear_occurrences, linear_has, linear_off
		end

	LINEAR [G]
		rename
			forth as preorder_forth,
			finish as go_last_child,
			do_all as linear_do_all,
			do_if as linear_do_if,
			there_exists as linear_there_exists,
			for_all as linear_for_all
		redefine
			occurrences,
			has,
			off
		select
			occurrences,
			has,
			off,
			linear_do_all, linear_do_if, linear_there_exists, linear_for_all
		end

feature -- Access

	parent_item: G is
			-- Item in parent.
		require
			not_on_root: not is_root
		local
			pos: CURSOR
		do
			pos := cursor
			up
			Result := item
			go_to (pos)
		end

	child_item (i: INTEGER): G is
			-- Item in `i'-th child
		require
			argument_within_bounds: i >= 1 and then i <= arity
			not_off: not off
		local
			pos: CURSOR
		do
			pos:= cursor
			down (i)
			Result := item
			go_to (pos)
		end

	has (v: G): BOOLEAN is
			-- Does structure include an occurrence of `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			pos: CURSOR
		do
			pos := cursor
			Result := linear_has (v)
			go_to (pos)
		end

	occurrences (v: G): INTEGER is
		local
			pos: CURSOR
		do
			pos := cursor
			Result := linear_occurrences (v)
			go_to (pos)
		end

feature -- Measurement

	depth: INTEGER is
			-- Depth of the tree
		local
			pos: CURSOR
		do
			if not is_empty then
				pos := cursor
				go_above
				Result := depth_from_active - 1
				go_to (pos)
			end
		end

	level: INTEGER is
			-- Level of current node in tree
			-- (Root is on level 1)
		local
			pos: CURSOR
		do
			from
				pos := cursor
			until
				above
			loop
				Result := Result + 1
				up
			end
			go_to (pos)
		end

	breadth: INTEGER is
			-- Breadth of current level
		local
			l: INTEGER
			pos: CURSOR
		do
			l := level
			if l > 0 then
				pos := cursor
				go_above
				Result := breadth_of_level_from_active (l + 1)
				go_to (pos)
			end
		end

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not off
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not off
		end

	extendible: BOOLEAN is
			-- May new items be added?
		do
			Result := not above and then (level = 1) implies is_empty
		end

	is_leaf: BOOLEAN is
			-- Is cursor on a leaf?
		do
			if not off then
				Result := (arity = 0)
			end
		end

	off: BOOLEAN is
			-- Is there no current item?
			-- (True if `is_empty')
		do
			Result := (after or before or below or above)
		end

	after: BOOLEAN is
			-- Is there no valid cursor position to the right of cursor?
		deferred
		end

	before: BOOLEAN is
			-- Is there no valid cursor position to the left of cursor?
		deferred
		end

	above: BOOLEAN is
			-- Is there no valid cursor position above cursor?
		deferred
		end

	below: BOOLEAN
			-- Is there no valid cursor position below cursor?

	isfirst: BOOLEAN is
			-- Is cursor on first sibling?
		deferred
		end

	islast: BOOLEAN is
			-- Is cursor on last sibling?
		deferred
		end

	is_root: BOOLEAN is
			-- Is cursor on root?
		deferred
		end

	valid_cursor_index (i: INTEGER): BOOLEAN is
			-- Can cursor be moved to `i'-th child?
			-- 0 is before and `arity' + 1 is after.
		do
			Result := i >= 0 and i <= (arity + 1)
		end

feature -- Cursor movement

	start is
			-- Move cursor to root.
			-- Leave cursor `off' if `is_empty'.
		do
			go_above
			if not is_empty then
				down (1)
			end
		ensure then
			on_root_unless_empty: not is_empty implies is_root
		end

	go_last_child is
			-- Go to the last child of current parent.
			-- No effect if below
		require else
			not_above: not above
		do
			up
			down (arity)
		end

	back is
			-- Move cursor one position backward.
		deferred
		end

	forth is
			-- Move cursor one position forward.
		deferred
		end

	up is
			-- Move cursor one level upward to parent,
			-- or `above' if `is_root' holds.
		require else
			not_above: not above
		deferred
		ensure then
			not_before: not before
			not_after: not after
			not_below: not below
			coherency: (not old off and above) = (old is_root)
		end

	down (i: INTEGER) is
			-- Move cursor one level downward:
			-- to `i'-th child if there is one,
			-- or `after' if `i' = `arity' + 1,
			-- or `before' if `i' = 0.
		require else
			not_before: not before
			not_after: not after
			not_below: not below
			valid_cursor_index: (above and i = 0) or else valid_cursor_index (i)
		deferred
		ensure then
			gone_before: (i = 0) implies before
			--gone_after: (i = old arity + 1) implies after;
			--gone_down: ((i > 0) and (i <= old arity)) implies not off;
			--gone_below: ((old arity) = 0) implies below
		end


	preorder_forth is
			-- Move cursor to next position in preorder.
			-- If the active node is the last in
			-- preorder, the cursor ends up `off'.
		do
			if is_leaf then
				from
				until
					not islast
				loop
					up
				end
				if not above then forth end
			else
				down (1)
			end
		end

	postorder_forth is
			-- Move cursor to next position in postorder.
			-- If the active node is the last in
			-- postorder, the cursor ends up `off'.
		require
			not_off: not off
		do
			if islast then
				up
			else
				forth
				from
				until
					is_leaf
				loop
					down (1)
				end
			end
		end

	breadth_forth is
			-- Move cursor to next position in breadth-first order.
			-- If the active node is the last in
			-- breadth-first order, the cursor ends up `off'.
		require
			not_off: not off
		local
			l: INTEGER
		do
			l := level
			level_forth
			if above and (l < depth) then
				start_on_level (l + 1)
			end
		end

	start_on_level (l: INTEGER) is
			-- Move the cursor to the first position
			-- of the `l'-th level counting from root.
		require
			argument_within_bounds: l >= 1 and then depth >= l
		do
			go_above
			start_on_level_from_active (l + 1)
		ensure
			level_expected: level = l
			is_first: isfirst
		end

	level_forth is
			-- Move cursor to next position of current level.
		do
			if not above and then not islast then
				forth
			elseif not above then
				from
					up
					level_forth
				until
					 above or else not is_leaf
				loop
					level_forth
				end
				if not above then down (1) end
			end
		end

	level_back is
			-- Move cursor to previous position of current level.
		do
			if not isfirst then
				back
			elseif not above then
				from
					up
					level_back
				until
					above or else not is_leaf
				loop
					level_back
				end
				if not above then down (arity) end
			end
		end

	postorder_start is
			-- Move cursor to first position in postorder.
			-- Leave cursor off if tree is empty.
		do
			from
				go_above
			until
				arity = 0
			loop
				down (1)
			end
		end

feature -- Element change

	put (v: G) is
			-- Put `v' at cursor position.
			-- (Synonym for `replace')
		do
			replace (v)
		end

	extend (v: G) is
			-- Add `v' after last child.
			-- Make `v' the `first_child' if `below' and place
			-- cursor `before'.
		local
			pos: CURSOR
		do
			pos := cursor
			go_last_child
			put_right (v)
			go_to (pos)
			if below then
				below := False
				down (0)
			end
		end

	put_left (v: G) is
			-- Add `v' to the left of cursor position.
		require
			not_before: not before
			not_above: not above
			only_one_root: (level = 1) implies is_empty
		do
			back
			put_right (v)
			forth
			forth
		end

	put_right (v: G) is
			-- Add `v' to the right of cursor position.
		require
			not_after: not after
			not_above: not above
			only_one_root: (level = 1) implies is_empty
		deferred
		end

	fill (other: CURSOR_TREE [G]) is
			-- Fill with as many items of `other'
			-- as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		require
			is_empty: is_empty
		do
			go_above
			if not other.is_empty then
				other.start
				down (0)
				put_right (other.item)
				forth
				fill_from_active (other)
			end
		end

	fill_from_active (other: CURSOR_TREE [G]) is
			-- Copy subtree of `other''s active node
			-- onto active node of current tree.
		require
			cursor_on_leaf: is_leaf
		do
			if not other.is_leaf then
				from
					other.down (1)
					down (0)
				until
					other.after
				loop
					put_right (other.item)
					forth
					fill_from_active (other)
					other.forth
				end
				other.up
				up
			end
		end

	merge_right (other: CURSOR_TREE [G]) is
			-- Merge the items of `other' into current structure to
			-- the right of cursor position.
		require
			other_exists: other /= Void
			not_after: not after
			not_above: not above
			only_one_root: (level = 1) implies is_empty
		local
			pos: CURSOR
		do
			if not other.is_empty then
				pos := other.cursor
				other.start
				put_right (other.item)
				forth
				if not other.is_leaf then
					down (0)
					other.down (0)
					from
					until
						other.islast
					loop
						other.forth
						merge_right (other.subtree)
					end
					up
				end
				other.go_to (pos)
			end
		end

	merge_left (other: CURSOR_TREE [G]) is
			-- Merge the items of `other' into current structure to
			-- the left of cursor position.
		require
			other_exists: other /= Void
			not_before: not before
			not_above: not above
			only_one_root: (level = 1) implies is_empty
		do
			back
			merge_right (other)
		end

feature -- Duplication

	subtree: like Current is
			-- Subtree rooted at current node
		require
			not_off: not off
		do
			Result := new_tree
			Result.go_above
			Result.down (0)
			Result.put_right (item)
			Result.forth
			Result.fill_from_active (Current)
		end

	parent_tree: like Current is
			-- Subtree rooted at parent
		require
			not_on_root: not is_root
			not_off: not off
		local
			pos: CURSOR
		do
			pos := cursor
			up
			Result := subtree
			go_to (pos)
		end

	child_tree (i: INTEGER): like Current is
			-- Subtree rooted at `i'-th child
		require
			argument_within_bounds: i >= 1 and then i <= arity
			not_off: not off
		local
			pos: CURSOR
		do
			pos := cursor
			down (i)
			Result := subtree
			go_to (pos)
		end

feature {NONE} -- Inapplicable

	prune (v: G) is
			-- Remove item `v'.
		do
		end

feature {CURSOR_TREE} -- Implementation

	new_tree: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		deferred
		ensure
			result_exists: Result /= Void
			result_is_empty: Result.is_empty
		end

	go_above is
			-- Move the cursor above the tree
		do
			from
			until
				above
			loop
				up
			end
		end

feature {NONE} -- Implementation

	depth_from_active: INTEGER is
			-- Depth of subtree starting at active
		do
			if not off and then arity = 0 then
				Result := 1
			else
				from
					down (1)
				until
					after
				loop
					Result := Result.max (depth_from_active + 1)
					forth
				end
				up
			end
		end

	breadth_of_level_from_active (a_level: INTEGER): INTEGER is
			-- Breadth of level `level' of subtree starting at current node
		do
			if (a_level = 2) or else is_leaf then
				Result := arity
			else
				from
					down (1)
				until
					after
				loop
					Result := Result + breadth_of_level_from_active (a_level - 1)
					forth
				end
				up
			end
		end

	start_on_level_from_active (l: INTEGER) is
			-- Move the cursor to the first position
			-- of the `l'-th level counting from active.
		require
			deep_enough: depth_from_active >= l
		do
			from
				down (1)
			until
				depth_from_active >= l - 1
			loop
				forth
			end
			if (l > 2) then
				start_on_level_from_active (l - 1)
			end
		end

feature {NONE} -- Not applicable

	index: INTEGER is
		do
		end

invariant

	non_negative_depth: depth >= 0
	non_negative_breadth: breadth >= 0
	is_leaf_definition: not off implies is_leaf = (arity = 0)
	above_property: above implies (arity <= 1)
	on_tree: (isfirst or islast or is_leaf or is_root) implies not off

-- The following clauses express the constraints
-- on the different legal cursor positions.

	off_definition: off = after or before or above or below
	below_constraint: below implies ((after or before) and not above)
	above_constraint: above implies not (before or after or below)
	after_constraint: after implies not (before or above)
	before_constaint: before implies not (after or above)
	empty_below_constraint: (is_empty and (after or before)) implies below

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

end -- class CURSOR_TREE



