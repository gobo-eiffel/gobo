note

	description:
	"[
		Containers using binary search tree algorithms.

		Implementation details:
		Binary search tree nodes contain two children and a
		parent. Parents would be avoidable in most cases, but
		they are very helpful to make the code more readable
		and understandable.
		The insertion and removal implementation is very general,
		such that binary search tree variants only need to
		redefine specific parts of the removal and insertion
		operations.
		Avoiding recursive feature calls if possible, was a decision
		leading to the current design, where most of the functionality
		is not in the node classes. Instead there are loops in
		the binary search tree container classes.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BINARY_SEARCH_TREE_CONTAINER [G, K]

inherit

	DS_BILINEAR [G]
		undefine
			has,
			equality_tester_settable
		redefine
			new_cursor
		end

feature {NONE} -- Initialization

	make (a_comparator: KL_COMPARATOR [K])
			-- Create a new binary search tree node.
			-- `a_comparator' is used for the comparison of keys.
		require
			a_comparator_not_void: a_comparator /= Void
		do
			internal_set_key_comparator (a_comparator)
			count := 0
			set_internal_cursor (new_cursor)
		ensure
			comparator_set: key_comparator = a_comparator
		end

	make_default
			-- Cannot be used as a `comparator' is needed.
		do
		end

feature -- Access

	first: G
			-- First item in container
		do
			Result := first_node.item
		end

	last: G
			-- Last item in container
		do
			Result := last_node.item
		end

	new_cursor: DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
			-- New external cursor
		deferred
		end

feature {NONE} -- Access

	at alias "@", item (k: K): G
			-- Item associated with key `k'
			-- (Performance: O(height).)
		require
			has_k: has_key (k)
		do
			search_node (k)
			check
				found_node_not_void: found_node /= Void
			end
			Result := found_node.item
		end

	value (k: K): G
			-- Item associated with key `k', if `k' exists;
			-- Default value otherwise
			-- (Performance: O(height).)
		local
			l_node: like root_node
		do
			search_node (k)
			l_node := found_node
			if l_node /= Void then
				Result := l_node.item
			end
		end

	key_comparator: KL_COMPARATOR [K]
			-- Comparison criterion for keys
		deferred
		ensure
			key_comparator_not_void: Result /= Void
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	first_node: like root_node
			-- Left most binary tree node;
			-- The `key' of this node is less than the `key' of all other nodes in the tree.

	successor (v: like root_node): like root_node
			-- Successor of `v' if it exists, Void otherwise
			-- (Performance: O(height).)
		require
			v_not_void: v /= Void
		do
			if v.right_child /= Void then
				from
					Result := v.right_child
				until
					Result.left_child = Void
				loop
					Result := Result.left_child
				end
			elseif v.parent /= Void then
				Result := v.parent
				if Result.right_child = v then
					from
						Result := v.parent
					until
						Result.parent = Void or else Result.parent.left_child = Result
					loop
						Result := Result.parent
					end
					if Result.parent /= Void and then Result.parent.left_child = Result then
						Result := Result.parent
					else
						Result := Void
					end
				end
			end
		ensure
			successor_in_same_tree: Result /= Void implies are_nodes_in_same_tree (Result, v)
		end

	successor_for_removal (v: like root_node): like root_node
			-- Successor of `v'. Used by `remove'.
			-- (Performance: O(height).)
		require
			v_not_void: v /= Void
			v_has_right_child: v.right_child /= Void
			v_is_in_tree: is_node_in_tree (v)
		do
			from
				Result := v.right_child
			until
				Result.left_child = Void
			loop
				Result := Result.left_child
			end
		ensure
			successor_not_void: Result /= Void
			successor_is_in_tree: is_node_in_tree (Result)
		end

feature {NONE} -- Access

	last_node: like root_node
			-- Right most binary tree node;
			-- The `key' of this node is greater than the `key' of all other nodes in the tree.

	found_node: like root_node
			-- Node used as result for `search_node' and `search_insert_position'

	predecessor (v: like root_node): like root_node
			-- Predecessor of `v' if it exists, Void otherwise
			-- (Performance: O(height).)
		require
			v_not_void: v /= Void
			v_is_in_tree: is_node_in_tree (v)
		do
			if v.left_child /= Void then
				from
					Result := v.left_child
				until
					Result.right_child = Void
				loop
					Result := Result.right_child
				end
			elseif v.parent /= Void then
				Result := v.parent
				if Result.left_child = v then
					from
						Result := v.parent
					until
						Result.parent = Void or else Result.parent.right_child = Result
					loop
						Result := Result.parent
					end
					if Result.parent /= Void and Result.parent.right_child = Result then
						Result := Result.parent
					else
						Result := Void
					end
				end
			else
				Result := Void
			end
		ensure
			predecessor_is_in_tree: Result /= Void implies is_node_in_tree (Result)
		end

	new_tree_node (a_item: G; a_key: K): like root_node
			-- New tree node where `a_item' is associated with `a_key'
		deferred
		ensure
			node_not_void: Result /= Void
			item_set: Result.item = a_item
			key_set: Result.key = a_key
			no_parent: Result.parent = Void
			no_children: Result.left_child = Void and Result.right_child = Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in container

	height: INTEGER
			-- Maximum height of the binary search tree
			-- (Performance: O(count).)
		do
			if root_node /= Void then
				Result := root_node.height
			end
		ensure
			empty_tree_case: is_empty implies Result = 0
			non_empty_tree_case: not is_empty implies Result > 0
		end

feature -- Status report

	sorted: BOOLEAN
			-- Is the binary search tree sorted?
		do
			if root_node = Void then
				Result := True
			else
				Result := root_node.sorted (key_comparator)
			end
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Status report

	has_key (a_key: K): BOOLEAN
			-- Is there an item associated with `a_key'?
			-- (Performance: O(height).)
		do
			if root_node /= Void then
				search_node (a_key)
				Result := found_node /= Void
			end
		end

feature {NONE} -- Status report

	valid_key (k: K): BOOLEAN
			-- Is `k' a valid key?
		do
			Result := True
		end

	has_void_key: BOOLEAN
			-- Is there an item associated with Void?
			-- (Performance: O(height).)
		local
			k: detachable K
			l_current: detachable DS_BINARY_SEARCH_TREE_CONTAINER [G, detachable K]
		do
			l_current ?= Current
			if l_current /= Void and k = Void then
				Result := l_current.has_key (k)
			end
		end

	key_comparator_settable (a_comparator: like key_comparator): BOOLEAN
			-- Can `set_key_comparator' be called with `a_comparator'
			-- as argument in current state of container?
		do
			Result := a_comparator /= Void and then is_empty
		ensure
			comparator_not_void: Result implies a_comparator /= Void
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Status report

	is_node_in_tree (a_node: like root_node): BOOLEAN
			-- Is `a_node' in current tree?
		require
			a_node_not_void: a_node /= Void
		do
			if root_node /= Void then
				Result := are_nodes_in_same_tree (a_node, root_node)
			end
		end

	are_nodes_in_same_tree (a_node_1, a_node_2: like root_node): BOOLEAN
			-- Has `a_node_1' the same `root_node' as `a_node_2'?
		require
			a_node_1_not_void: a_node_1 /= Void
			a_node_2_not_void: a_node_2 /= Void
		local
			l_root_node_1, l_root_node_2: like root_node
		do
			from
				l_root_node_1 := a_node_1
			invariant
				l_root_node_1_not_void: l_root_node_1 /= Void
			until
				l_root_node_1.parent = Void
			loop
				l_root_node_1 := l_root_node_1.parent
			end
			from
				l_root_node_2 := a_node_2
			invariant
				l_root_node_2_not_void: l_root_node_2 /= Void
			until
				l_root_node_2.parent = Void
			loop
				l_root_node_2 := l_root_node_2.parent
			end
			Result := l_root_node_1 = l_root_node_2
		end

feature {NONE} -- Status report

	is_first_node_correct: BOOLEAN
			-- Is the first node correctly set?
		local
			l_node: like root_node
		do
			if root_node = Void then
				Result := first_node = Void
			else
				from
					l_node := root_node
				until
					l_node.left_child = Void
				loop
					l_node := l_node.left_child
				end
				Result := first_node = l_node
			end
		end

	is_last_node_correct: BOOLEAN
			-- Is the last node correctly set?
		local
			l_node: like root_node
		do
			if root_node = Void then
				Result := last_node = Void
			else
				from
					l_node := root_node
				until
					l_node.right_child = Void
				loop
					l_node := l_node.right_child
				end
				Result := last_node = l_node
			end
		end

	is_removing: BOOLEAN
			-- During `remove' that flag is True,
			-- else it if False. It is needed for
			-- some invariants.

	exact_insert_position_found: BOOLEAN
			-- Was a tree node found during the last call to
			-- `search_insert_position (a_key: K)', with a
			-- key equal to `a_key'?

	insert_position_is_left: BOOLEAN
			-- The key of tree node found during the last call to
			-- `search_insert_position (a_key: K)' was not equal
			-- to `a_key'. If we inserted `a_key', would it be
			-- the left child of the found tree node? Else it
			-- would be the right child.

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is container considered equal to `other'?
			-- Does not take cursor positions or
			-- `equality_tester' into account.
			-- (Performance: O(count).)
		local
			l_current_node, l_other_node: like root_node
		do
			if Current = other then
				Result := True
			elseif ANY_.same_types (Current, other) and count = other.count then
				from
					l_current_node := first_node
					l_other_node := other.first_node
					Result := True
				until
					not Result or else l_current_node = Void
				loop
					Result := l_current_node.item = l_other_node.item
					l_current_node := successor (l_current_node)
					l_other_node := successor (l_other_node)
				end
			end
		end

feature {NONE} -- Setting

	set_key_comparator (a_comparator: like key_comparator)
			-- Set `key_comparator' to `a_comparator'.
		require
			key_comparator_settable: key_comparator_settable (a_comparator)
		deferred
		ensure
			key_comparator_set: key_comparator = a_comparator
		end

	internal_set_key_comparator (a_comparator: like key_comparator)
			-- Set `key_comparator' to `a_comparator'.
			-- (No "settable" precondition, to be used internally only.)
		require
			a_comparator_not_void: a_comparator /= Void
		deferred
		ensure
			key_comparator_set: key_comparator = a_comparator
		end

feature {DS_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): G
			-- Item at `a_cursor' position.
		do
			Result := a_cursor.position.item
		end

	cursor_key (a_cursor: like new_cursor): K
			-- Key at `a_cursor' position.
		do
			Result := a_cursor.position.key
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		do
			Result := a_cursor.position = other.position
			if Result and a_cursor.position = Void then
				Result := a_cursor.is_before = other.is_before
			end
		end

	cursor_go_to (a_cursor, other: like new_cursor)
			-- Move `a_cursor' to `other''s position.
		local
			l_was_off: BOOLEAN
		do
			l_was_off := a_cursor.off
			if other.position = Void then
				a_cursor.set_is_before (other.is_before)
				if not l_was_off then
					remove_traversing_cursor (a_cursor)
				end
			else
				a_cursor.set_position (other.position)
				if l_was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

feature {DS_LINEAR_CURSOR} -- Cursor implementation

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on first item?
		do
			if first_node /= Void then
				Result := a_cursor.position = first_node
			end
		end

	cursor_after (a_cursor: like new_cursor): BOOLEAN
			-- Is there no valid position to right of `a_cursor'?
		do
			Result := a_cursor.position = Void and then not a_cursor.is_before
		end

	cursor_start (a_cursor: like new_cursor)
			-- Move `a_cursor' to first position.
		local
			l_was_off: BOOLEAN
		do
			if is_empty then
				cursor_go_after (a_cursor)
			else
				l_was_off := a_cursor.off
				a_cursor.set_position (first_node)
				if l_was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

	cursor_forth (a_cursor: like new_cursor)
			-- Move `a_cursor' to next position.
		local
			l_position: like root_node
			l_has_cursor, l_add_cursor: BOOLEAN
		do
			l_position := a_cursor.position
			l_has_cursor := l_position /= Void
			l_add_cursor := True
			if a_cursor.before then
				l_position := first_node
			else
				l_position := successor_for_cursor (l_position)
			end
			if l_position = Void then
				a_cursor.set_is_before (False)
				l_add_cursor := False
			else
				a_cursor.set_position (l_position)
			end
			if l_has_cursor and not l_add_cursor then
				remove_traversing_cursor (a_cursor)
			elseif not l_has_cursor and l_add_cursor then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_search_forth (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			l_was_off: BOOLEAN
		do
			if a_cursor.before then
				a_cursor.forth
				l_was_off := True
			end
			if equality_tester = Void then
				from
				until
					a_cursor.after or else a_cursor.item = v
				loop
					a_cursor.forth
				end
			else
				from
				until
					a_cursor.after or else equality_tester.test (a_cursor.item, v)
				loop
					a_cursor.forth
				end
			end
			if l_was_off and not a_cursor.after then
				add_traversing_cursor (a_cursor)
			elseif not l_was_off and a_cursor.after then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_after (a_cursor: like new_cursor)
			-- Move `a_cursor' to `after' position.
		local
			l_was_off: BOOLEAN
		do
			l_was_off := a_cursor.off
			a_cursor.set_is_before (False)
			if not l_was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

feature {DS_BILINEAR_CURSOR} -- Cursor implementation

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on last item?
		do
			if last_node /= Void then
				Result := a_cursor.position = last_node
			end
		end

	cursor_before (a_cursor: like new_cursor): BOOLEAN
			-- Is there no valid position to left of `a_cursor'?
		do
			Result := a_cursor.position = Void and then a_cursor.is_before
		end

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
		local
			l_was_off: BOOLEAN
		do
			if is_empty then
				cursor_go_before (a_cursor)
			else
				l_was_off := a_cursor.off
				a_cursor.set_position (last_node)
				if l_was_off then
					add_traversing_cursor (a_cursor)
				end
			end
		end

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
		local
			l_position: like root_node
			l_has_cursor, l_add_cursor: BOOLEAN
		do
			l_position := a_cursor.position
			l_has_cursor := l_position /= Void
			if a_cursor.after then
				l_position := last_node
				l_add_cursor := True
			else
				l_position := predecessor_for_cursor (l_position)
			end
			if l_position = Void then
				a_cursor.set_is_before (True)
				l_add_cursor := False
			else
				a_cursor.set_position (l_position)
			end
			if l_has_cursor and not l_add_cursor then
				remove_traversing_cursor (a_cursor)
			elseif not l_has_cursor and l_add_cursor then
				add_traversing_cursor (a_cursor)
			end
		end

	cursor_search_back (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			l_was_off: BOOLEAN
		do
			if a_cursor.after then
				a_cursor.back
				l_was_off := True
			end
			if equality_tester = Void then
				from
				until
					a_cursor.before or else a_cursor.item = v
				loop
					a_cursor.back
				end
			else
				from
				until
					a_cursor.before or else equality_tester.test (a_cursor.item, v)
				loop
					a_cursor.back
				end
			end
			if l_was_off and not a_cursor.before then
				add_traversing_cursor (a_cursor)
			elseif not l_was_off and a_cursor.before then
				remove_traversing_cursor (a_cursor)
			end
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
		local
			l_was_off: BOOLEAN
		do
			l_was_off := a_cursor.off
			a_cursor.set_is_before (True)
			if not l_was_off then
				remove_traversing_cursor (a_cursor)
			end
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR} -- Cursor implementation

	cursor_go_at_or_before_key (a_cursor: like new_cursor; k: K)
			-- Move `a_cursor' to last position with a smaller key than `k'.
		require
			a_cursor_not_void: a_cursor /= Void
		local
			l_was_off: BOOLEAN
		do
			l_was_off := a_cursor.off
			if is_empty then
				a_cursor.set_is_before (True)
			elseif k = Void then
				a_cursor.set_is_before (True)
				if not l_was_off then
					remove_traversing_cursor (a_cursor)
				end
			else
				search_insert_position (k)
				a_cursor.set_position (found_node)
				if found_node.key = Void or else key_comparator.less_than (k, found_node.key) then
					a_cursor.back
				end
			end
		ensure
			has_key_k_implies_a_cursor_points_to_it:
				has_key (k) and k /= Void and a_cursor.position.key /= Void implies
					key_comparator.order_equal (a_cursor.position.key, k)
			k_greater_equal_cursor_positions_key:
				not a_cursor.off and then a_cursor.position.key /= Void and k /= Void implies
					key_comparator.greater_equal (k, a_cursor.position.key)
			a_cursor_not_after: not a_cursor.after
		end

	cursor_go_at_or_after_key (a_cursor: like new_cursor; k: K)
			-- Move `a_cursor' to first position with a greater key than `k'.
		require
			a_cursor_not_void: a_cursor /= Void
		local
			l_was_off: BOOLEAN
		do
			l_was_off := a_cursor.off
			if is_empty then
				a_cursor.set_is_before (False)
			elseif k = Void then
				a_cursor.set_position (first_node)
			else
				search_insert_position (k)
				a_cursor.set_position (found_node)
				if found_node.key = Void or else key_comparator.greater_than (k, found_node.key) then
					a_cursor.forth
				end
			end
		ensure
			has_key_k_implies_a_cursor_points_to_it:
				has_key (k) and k /= Void and a_cursor.position.key /= Void implies
					key_comparator.order_equal (a_cursor.position.key, k)
			k_less_equal_cursors_key:
				not a_cursor.off and then a_cursor.position.key /= Void and k /= Void implies
					key_comparator.less_equal (k, a_cursor.position.key)
			a_cursor_not_before: not a_cursor.before
		end


feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Cursor implementation

	predecessor_for_cursor (v: like root_node): like root_node
			-- Predecessor of `v' if it exists, Void otherwise
			-- (Performance: O(height).)
		require
			v_not_void: v /= Void
			v_is_in_tree: is_node_in_tree (v)
		do
			if v.left_child /= Void then
				from
					Result := v.left_child
				until
					Result.right_child = Void
				loop
					Result := Result.right_child
				end
			elseif v.parent /= Void then
				Result := v.parent
				if Result.left_child = v then
					from
						Result := v.parent
					until
						Result.parent = Void or else Result.parent.right_child = Result
					loop
						Result := Result.parent
					end
					if Result.parent /= Void and Result.parent.right_child = Result then
						Result := Result.parent
					else
						Result := Void
					end
				end
			else
				Result := Void
			end
		ensure
			predecessor_is_in_tree: Result /= Void implies is_node_in_tree (Result)
		end

	successor_for_cursor (v: like root_node): like root_node
			-- Successor of `v' if it exists, Void otherwise
			-- (Performance: O(height).)
		require
			v_not_void: v /= Void
		do
			if v.right_child /= Void then
				from
					Result := v.right_child
				until
					Result.left_child = Void
				loop
					Result := Result.left_child
				end
			elseif v.parent /= Void then
				Result := v.parent
				if Result.right_child = v then
					from
						Result := v.parent
					until
						Result.parent = Void or else Result.parent.left_child = Result
					loop
						Result := Result.parent
					end
					if Result.parent /= Void and then Result.parent.left_child = Result then
						Result := Result.parent
					else
						Result := Void
					end
				end
			end
		ensure
			successor_in_same_tree: Result /= Void implies are_nodes_in_same_tree (Result, v)
		end

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		do
			internal_cursor := c
		end

	internal_cursor: like new_cursor
			-- Internal cursor

feature {NONE} -- Cursor movement

	move_cursors_after (a_last_position: like root_node)
			-- Move `after' all cursors at last position.
		require
			a_last_position_not_void: a_last_position /= Void
		local
			l_cursor: like new_cursor
			l_previous_cursor: like new_cursor
		do
			from
				if internal_cursor.position = a_last_position then
					cursor_go_after (internal_cursor)
				end
				l_previous_cursor := internal_cursor
				l_cursor := l_previous_cursor.next_cursor
			until
				l_cursor = Void
			loop
				if l_cursor.position = a_last_position then
					cursor_go_after (l_cursor)
					l_cursor := l_previous_cursor.next_cursor
				else
					l_previous_cursor := l_cursor
					l_cursor := l_cursor.next_cursor
				end
			end
		end

	move_all_cursors (a_old_node, a_new_node: like root_node)
			-- Move all cursors at position `a_old_node' to `a_new_node'.
		require
			a_old_node_not_void: a_old_node /= Void
			a_new_node_not_void: a_new_node /= Void
		local
			l_cursor: like new_cursor
		do
			from
				l_cursor := internal_cursor
			until
				l_cursor = Void
			loop
				if l_cursor.position = a_old_node then
					l_cursor.set_position (a_new_node)
				end
				l_cursor := l_cursor.next_cursor
			end
		end

	move_all_cursors_after
			-- Move `after' all cursors.
		local
			l_cursor: like new_cursor
		do
			from
				if not internal_cursor.off then
					cursor_go_after (internal_cursor)
				end
				l_cursor := internal_cursor.next_cursor
			until
				l_cursor = Void
			loop
				cursor_go_after (l_cursor)
				l_cursor := internal_cursor.next_cursor
			end
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [G]])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				l_node = Void
			loop
				an_action.call ([l_node.item])
				l_node := successor (l_node)
			end
		end

	do_all_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			i: INTEGER
			l_node: like root_node
		do
			from
				l_node := first_node
				i := 1
			until
				l_node = Void
			loop
				an_action.call ([l_node.item, i])
				l_node := successor (l_node)
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [G]]; a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				l_node = Void
			loop
				if a_test.item ([l_node.item]) then
					an_action.call ([l_node.item])
				end
				l_node := successor (l_node)
			end
		end

	do_if_with_index (an_action: PROCEDURE [ANY, TUPLE [G, INTEGER]]; a_test: FUNCTION [ANY, TUPLE [G, INTEGER], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			i: INTEGER
			l_node: like root_node
		do
			from
				l_node := first_node
				i := 1
			until
				l_node = Void
			loop
				if a_test.item ([l_node.item, i]) then
					an_action.call ([l_node.item, i])
				end
				l_node := successor (l_node)
				i := i + 1
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				Result or else l_node = Void
			loop
				if a_test.item ([l_node.item]) then
					Result := True
				else
					l_node := successor (l_node)
				end
			end
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			l_node: like root_node
		do
			from
				l_node := first_node
				Result := True
			until
				not Result or else l_node = Void
			loop
				if not a_test.item ([l_node.item]) then
					Result := False
				else
					l_node := successor (l_node)
				end
			end
		end

feature {NONE} -- Iteration

	do_all_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its key.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		require
			an_action_not_void: an_action /= Void
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				l_node = Void
			loop
				an_action.call ([l_node.item, l_node.key])
				l_node := successor (l_node)
			end
		end

	do_if_with_key (an_action: PROCEDURE [ANY, TUPLE [G, K]]; a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its key.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				l_node = Void
			loop
				if a_test.item ([l_node.item, l_node.key]) then
					an_action.call ([l_node.item, l_node.key])
				end
				l_node := successor (l_node)
			end
		end

	there_exists_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item and its key?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				Result or else l_node = Void
			loop
				if a_test.item ([l_node.item, l_node.key]) then
					Result := True
				else
					l_node := successor (l_node)
				end
			end
		end

	for_all_with_key (a_test: FUNCTION [ANY, TUPLE [G, K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items and their keys?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		require
			a_test_not_void: a_test /= Void
		local
			l_node: like root_node
		do
			from
				l_node := first_node
				Result := True
			until
				not Result or else l_node = Void
			loop
				if not a_test.item ([l_node.item, l_node.key]) then
					Result := False
				else
					l_node := successor (l_node)
				end
			end
		end

feature {NONE} -- Element change

	internal_put (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		require
			valid_key: valid_key (k)
		local
			l_newest_tree_node: like root_node
			l_node: like root_node
		do
			if root_node = Void then
					-- The binary search tree is empty.
					-- Just set the necessary values.
				l_newest_tree_node := new_tree_node (v, k)
				root_node := l_newest_tree_node
				first_node := root_node
				last_node := root_node
				count := 1
				on_node_added (l_newest_tree_node)
			else
				search_insert_position (k)
				l_node := found_node
				check
					l_node_not_void: l_node /= Void
				end
				if exact_insert_position_found then
						-- Just update the `item'.
					l_node.set_item (v)
				elseif insert_position_is_left then
					l_newest_tree_node := new_tree_node (v, k)
					l_node.set_left_child (l_newest_tree_node)
						-- Check if `first_node'
						-- needs to be updated.
					if l_node = first_node then
						first_node := l_newest_tree_node
					end
					count := count + 1
					on_node_added (l_newest_tree_node)
				else
					l_newest_tree_node := new_tree_node (v, k)
					l_node.set_right_child (l_newest_tree_node)
						-- Check if `last_node'
						-- needs to be updated.
					if l_node = last_node then
						last_node := l_newest_tree_node
					end
					count := count + 1
					on_node_added (l_newest_tree_node)
				end
			end
		ensure
			inserted: has_key (k) and then item (k) = v
			same_count: (old has_key (k)) implies (count = old count)
			one_more: (not old has_key (k)) implies (count = old count + 1)
		end

	internal_put_new (v: G; k: K)
			-- Associate `v' with key `k'.
			-- (Performance: O(height).)
		require
			valid_key: valid_key (k)
			new_item: not has_key (k)
		local
			l_newest_tree_node: like root_node
			l_node: like root_node
		do
			l_newest_tree_node := new_tree_node (v, k)
			if root_node = Void then
					-- The binary search tree is empty.
					-- Just set the necessary values.
				root_node := l_newest_tree_node
				first_node := root_node
				last_node := root_node
			else
				search_insert_position (k)
				l_node := found_node
				check
					l_node_not_void: l_node /= Void
					key_does_not_exist: not exact_insert_position_found
				end
				if insert_position_is_left then
					l_node.set_left_child (l_newest_tree_node)
						-- Check if the `first_node'
						-- needs to be updated.
					if l_node = first_node then
						first_node := l_newest_tree_node
					end
				else
					l_node.set_right_child (l_newest_tree_node)
						-- Check if the `last_node'
						-- needs to be updated.
					if l_node = last_node then
						last_node := l_newest_tree_node
					end
				end
			end
			count := count + 1
			on_node_added (l_newest_tree_node)
		ensure
			one_more: count = old count + 1
			inserted: has_key (k) and then item (k) = v
		end

feature {NONE} -- Element change

	on_node_added (a_node: like root_node)
			-- `a_node' was just added to the binary search tree.
			-- This feature is basically used by balanced binary
			-- search tree variants. They are informed which
			-- node was just added and may rebalance the tree
			-- accordingly.
		require
			a_node_not_void: a_node /= Void
			has_key_of_node: has_key (a_node.key)
			a_node_is_in_tree: item (a_node.key) = a_node.item
		deferred
		end

feature -- Removal

	remove (v: K)
			-- Remove the item with key `v'.
			-- (Performance: O(height).)
		local
			l_node_for_removal: like root_node
		do
			is_removing := True
			search_node_for_removal (v)
			l_node_for_removal := found_node
			if l_node_for_removal /= Void then
				remove_node (l_node_for_removal)
			else
				on_node_for_removal_not_found (v)
			end
			unset_found_node
			is_removing := False
		ensure
			not_is_removing: not is_removing
		end

	wipe_out
			-- Remove all items and move all
			-- cursors `off'.
		do
			move_all_cursors_after
			root_node := Void
			first_node := Void
			last_node := Void
			count := 0
			unset_found_node
		end

feature {NONE} -- Removal

	remove_node (a_node: like root_node)
			-- Remove `a_node' from the tree.
		require
			a_node_not_void: a_node /= Void
			a_node_is_in_tree: is_node_in_tree (a_node)
		local
			l_in_order_successor: like root_node
			l_old_cursor_position: like root_node
			l_new_cursor_position: like root_node
		do
				-- Special case of `count = 1' to avoid
				-- contract violations.
			if count = 1 then
				move_all_cursors_after
			end
			count := count - 1
			l_old_cursor_position := a_node
			if a_node.left_child = Void and a_node.right_child = Void then
				l_new_cursor_position := remove_childless_node (a_node)
			elseif a_node.right_child = Void then
				l_new_cursor_position := remove_node_with_left_child (a_node)
			else
					-- `a_node' has to be replaced by its direct
					-- in-order predecessor or successor. Both
					-- exist. We use the successor.
				l_in_order_successor := successor_for_removal (a_node)
					-- Replace `a_node' by its `l_in_order_successor'.
				l_in_order_successor.copy_item_and_key_to (a_node)
				remove_successor_node (l_in_order_successor)
				l_old_cursor_position := l_in_order_successor
				l_new_cursor_position := a_node
			end
				-- Move the cursors to the correct positions.
			if count /= 0 then
				if l_new_cursor_position /= Void then
					move_all_cursors (l_old_cursor_position, l_new_cursor_position)
				else
					move_cursors_after (l_old_cursor_position)
				end
			end
		end

	remove_successor_node (a_successor: like root_node)
			-- Remove `a_successor'. Take care that the child
			-- is not lost.
		require
			a_successor_not_void: a_successor /= Void
			a_successor_has_parent: a_successor.parent /= Void
			a_successor_is_predecesor: a_successor.left_child = Void
			a_successor_is_from_tree: is_node_in_tree (a_successor)
		local
			l_parent: like root_node
			l_child: like root_node
		do
			l_parent := a_successor.parent
			l_child := a_successor.right_child
			a_successor.set_right_child (Void)
			if a_successor = l_parent.left_child then
				l_parent.set_left_child (l_child)
				on_node_removed (a_successor, l_parent, True)
			else
				check
					else_case: a_successor = l_parent.right_child
				end
				if a_successor = last_node then
					last_node := l_parent
				end
				l_parent.set_right_child (l_child)
				on_node_removed (a_successor, l_parent, False)
			end
		ensure
			a_successor_has_no_parent: a_successor.parent = Void
			a_successor_has_no_left_child: a_successor.left_child = Void
			a_successor_has_no_right_child: a_successor.right_child = Void
		end

	remove_childless_node (a_node: like root_node): like root_node
			-- Remove `a_node' from the tree and
			-- return its successor.
		require
			a_node_not_void: a_node /= Void
			a_node_has_no_left_child: a_node.left_child = Void
			a_node_has_no_right_child: a_node.right_child = Void
			a_node_is_from_tree: is_node_in_tree (a_node)
		local
			l_parent: like root_node
		do
			l_parent := a_node.parent
			if a_node = root_node then
				root_node := Void
				first_node := Void
				last_node := Void
			elseif a_node = l_parent.left_child then
				if a_node = first_node then
					first_node := l_parent
					Result := l_parent
				else
					Result := successor (a_node)
				end
				l_parent.set_left_child (Void)
				on_node_removed (a_node, l_parent, True)
			else
				check
					else_case: a_node = l_parent.right_child
				end
				if a_node = last_node then
					last_node := l_parent
				else
					Result := successor (a_node)
				end
				l_parent.set_right_child (Void)
				on_node_removed (a_node, l_parent, False)
			end
		end

	remove_node_with_left_child (a_node: like root_node): like root_node
			-- Remove `a_node' from the tree and return
			-- its successor.
		require
			a_node_not_void: a_node /= Void
			a_node_has_left_child: a_node.left_child /= Void
			a_node_has_no_right_child: a_node.right_child = Void
			a_node_is_from_tree: is_node_in_tree (a_node)
		local
			l_parent: like root_node
			l_child: like root_node
		do
			l_parent := a_node.parent
			if a_node = last_node then
				last_node := predecessor (last_node)
			else
				Result := successor (a_node)
			end
			l_child := a_node.left_child
			a_node.set_left_child (Void)
			if a_node = root_node then
				root_node := l_child
				on_root_node_removed
			elseif a_node = l_parent.left_child then
				l_parent.set_left_child (l_child)
				on_node_removed (a_node, l_parent, True)
			else
				check
					else_case: a_node = l_parent.right_child
				end
				l_parent.set_right_child (l_child)
				on_node_removed (a_node, l_parent, False)
			end
		end

	on_node_for_removal_not_found (a_key: K)
			-- There is no node in the tree which
			-- has `a_key' as key.
		do
		end

feature {NONE} -- Removal

	on_root_node_removed
			-- The node that was previsously the `root_node'
			-- was removed. The old `root_node' had only
			-- one child and this child is now the `root_node'.
			-- This feature is used by the balanced binary
			-- search tree variants.
		require
			root_node_not_void: root_node /= Void
		deferred
		end

	on_node_removed (a_old_node, a_node: like root_node; a_was_left_child: BOOLEAN)
			-- `a_old_node' was just removed from the tree.
			-- The parent of `a_old_node' was `a_node'.
			-- Depending on `a_was_left_child' `a_old_node'
			-- was the left or the right child of `a_node'.
			-- This feature is used by the balanced variants
			-- of binary search tree.
		require
			a_old_node_not_void: a_old_node /= Void
			a_old_node_has_void_parent: a_old_node.parent = Void
			a_old_node_has_void_left_child: a_old_node.left_child = Void
			a_old_node_has_void_right_child: a_old_node.right_child = Void
			a_node_not_void: a_node /= Void
		deferred
		end

feature {NONE} -- Basic operation

	rotate_right (a_node: like root_node)
			-- Apply a right rotation to `a_node'. The tree height
			-- is decreased on the left and increased on the right
			-- hand side.
			-- The in-order is preserved.
			--
			-- (grand_parent)         (grand_parent)
			--      (|)                    (|)
			--     parent                 a_node
			--     /    \         =>      /    \
			--  a_node   c               a    parent
			--   /  \                         /    \
			--  a    b                       b      c
		require
			a_node_not_void: a_node /= Void
			a_node_parent_not_void: a_node.parent /= Void
			a_node_is_left_child_of_parent: a_node.parent.left_child = a_node
		local
			l_parent, l_grand_parent: like root_node
			b: like root_node
			l_parent_is_left: BOOLEAN
		do
			l_parent := a_node.parent
			l_grand_parent := l_parent.parent
			b := a_node.right_child
				-- Prepare `l_grand_parent'.
			if l_grand_parent /= Void then
				if l_grand_parent.left_child = l_parent then
					l_parent_is_left := True
					l_grand_parent.set_left_child (Void)
				else
					l_parent_is_left := False
					l_grand_parent.set_right_child (Void)
				end
			end
				-- Prepare `l_parent'.
			l_parent.set_left_child (Void)
				-- Prepare `b'.
			a_node.set_right_child (Void)
				-- Rebuild the tree.
			if l_grand_parent /= Void then
				if l_parent_is_left then
					l_grand_parent.set_left_child (a_node)
				else
					l_grand_parent.set_right_child (a_node)
				end
			end
			a_node.set_right_child (l_parent)
			l_parent.set_left_child (b)
				-- Make sure we have the correct `root_node'.
			if l_parent = root_node then
				root_node := a_node
			end
		ensure
			grand_parent_correct: a_node.parent = old (a_node.parent.parent)
			parent_correct: a_node.right_child = old (a_node.parent)
			a_correct: a_node.left_child = old (a_node.left_child)
			b_correct: a_node.right_child.left_child = old (a_node.right_child)
			c_correct: a_node.right_child.right_child = old (a_node.parent.right_child)
			root_node_corrected: (a_node = root_node) = old (a_node.parent = root_node)
		end

	rotate_left (a_node: like root_node)
			-- Apply a left rotation to `a_node'. The tree height
			-- is decreased on the right and increased on the left
			-- hand side.
			-- The in-order is preserved.
			--
			-- (grand_parent)         (grand_parent)
			--      (|)                    (|)
			--     parent                 a_node
			--     /    \        =>       /    \
			--    a    a_node          parent   c
			--         /    \           /  \
			--        b      c         a    b
		require
			a_node_not_void: a_node /= Void
			a_node_parent_not_void: a_node.parent /= Void
			a_node_is_right_child_of_parent: a_node.parent.right_child = a_node
		local
			l_parent, l_grand_parent: like root_node
			b: like root_node
			l_parent_is_left: BOOLEAN
		do
			l_parent := a_node.parent
			l_grand_parent := l_parent.parent
			b := a_node.left_child
				-- Prepare `l_grand_parent'
			if l_grand_parent /= Void then
				if l_grand_parent.left_child = l_parent then
					l_parent_is_left := True
					l_grand_parent.set_left_child (Void)
				else
					l_parent_is_left := False
					l_grand_parent.set_right_child (Void)
				end
			end
				-- Prepare `l_parent'.
			l_parent.set_right_child (Void)
				-- Prepare `b'.
			a_node.set_left_child (Void)
				-- Rebuild the tree.
			if l_grand_parent /= Void then
				if l_parent_is_left then
					l_grand_parent.set_left_child (a_node)
				else
					l_grand_parent.set_right_child (a_node)
				end
			end
			a_node.set_left_child (l_parent)
			l_parent.set_right_child (b)
				-- Make sure we have the correct `root_node'.
			if l_parent = root_node then
				root_node := a_node
			end
		ensure
			grand_parent_correct: a_node.parent = old (a_node.parent.parent)
			parent_correct: a_node.left_child = old (a_node.parent)
			a_correct: a_node.left_child.left_child = old (a_node.parent.left_child)
			b_correct: a_node.left_child.right_child = old (a_node.left_child)
			c_correct: a_node.right_child = old (a_node.right_child)
			root_node_corrected: (a_node = root_node) = old (a_node.parent = root_node)
		end

	rotate_right_left (a_node: like root_node)
			--
			-- (grand_parent)       (grand_parent)
			--      (|)                  (|)
			--    parent                child
			--    /    \               /     \
			--   a   a_node     =>  parent  a_node
			--       /    \          /  \    /  \
			--    child    d        a    b  c    d
			--    /   \
			--   b     c
		require
			a_node_not_void: a_node /= Void
			a_node_parent_not_void: a_node.parent /= Void
			a_node_left_child_not_void: a_node.left_child /= Void
		local
			l_grand_parent: like root_node
			l_parent: like root_node
			l_parent_is_left: BOOLEAN
			l_child: like root_node
			b, c: like root_node
		do
			l_parent := a_node.parent
			l_grand_parent := l_parent.parent
			l_child := a_node.left_child
			b := l_child.left_child
			c := l_child.right_child
				-- Prepare `l_grand_parent'.
			if l_grand_parent /= Void then
				if l_grand_parent.left_child = l_parent then
					l_parent_is_left := True
					l_grand_parent.set_left_child (Void)
				else
					l_parent_is_left := False
					l_grand_parent.set_right_child (Void)
				end
			end
				-- Prepare `l_parent'.
			l_parent.set_right_child (Void)
				-- Prepare `l_child'.
			a_node.set_left_child (Void)
			l_child.set_left_child (Void)
			l_child.set_right_child (Void)
				-- Rebuild the tree.
			if l_grand_parent /= Void then
				if l_parent_is_left then
					l_grand_parent.set_left_child (l_child)
				else
					l_grand_parent.set_right_child (l_child)
				end
			end
			l_child.set_left_child (l_parent)
			l_child.set_right_child (a_node)
			l_parent.set_right_child (b)
			a_node.set_left_child (c)
				-- Make sure we have the correct `root_node'.
			if l_parent = root_node then
				root_node := l_child
			end
		ensure
			grand_parent_correct: a_node.parent.parent = old (a_node.parent.parent)
			parent_correct: a_node.parent.left_child = old (a_node.parent)
			a_correct: a_node.parent.left_child.left_child = old (a_node.parent.left_child)
			b_correct: a_node.parent.left_child.right_child = old (a_node.left_child.left_child)
			c_correct: a_node.left_child = old (a_node.left_child.right_child)
			d_correct: a_node.right_child = old (a_node.right_child)
		end

	rotate_left_right (a_node: like root_node)
			--  (grand_parent)       (grand_parent)
			--       (|)                  (|)
			--     parent                child
			--     /    \               /     \
			--  a_node   d    =>    a_node   parent
			--  /    \               /  \     /  \
			-- a    child           a    b   c    d
			--      /   \
			--     b     c
		require
			a_node_not_void: a_node /= Void
			a_node_parent_not_void: a_node.parent /= Void
			a_node_right_child_not_void: a_node.right_child /= Void
		local
			l_grand_parent: like root_node
			l_parent: like root_node
			l_parent_is_left: BOOLEAN
			l_child: like root_node
			b, c: like root_node
		do
			l_parent := a_node.parent
			l_grand_parent := l_parent.parent
			l_child := a_node.right_child
			b := l_child.left_child
			c := l_child.right_child
				-- Prepare `l_grand_parent'.
			if l_grand_parent /= Void then
				if l_grand_parent.left_child = l_parent then
					l_parent_is_left := True
					l_grand_parent.set_left_child (Void)
				else
					l_parent_is_left := False
					l_grand_parent.set_right_child (Void)
				end
			end
				-- Prepare `l_parent'.
			l_parent.set_left_child (Void)
				-- Prepare `l_child'.
			a_node.set_right_child (Void)
			l_child.set_left_child (Void)
			l_child.set_right_child (Void)
				-- Rebuild the tree.
			if l_grand_parent /= Void then
				if l_parent_is_left then
					l_grand_parent.set_left_child (l_child)
				else
					l_grand_parent.set_right_child (l_child)
				end
			end
			l_child.set_left_child (a_node)
			l_child.set_right_child (l_parent)
			l_parent.set_left_child (c)
			a_node.set_right_child (b)
				-- Make sure we have the correct `root_node'.
			if l_parent = root_node then
				root_node := l_child
			end
		ensure
			grand_parent_correct: a_node.parent.parent = old (a_node.parent.parent)
			parent_correct: a_node.parent.right_child = old (a_node.parent)
			a_correct: a_node.left_child = old (a_node.left_child)
			b_correct: a_node.right_child = old (a_node.right_child.left_child)
			c_correct: a_node.parent.right_child.left_child = old (a_node.right_child.right_child)
			d_correct: a_node.parent.right_child.right_child = old (a_node.parent.right_child)
		end

	search_node, search_node_for_removal (a_key: K)
			-- Set `found_node' to the node whose `key' is
			-- neither less nor greater than `a_key'.
			-- (Performance: O(height).)
		local
			l_found_node: like root_node
			l_key_comparator: like key_comparator
			l_equality: BOOLEAN
		do
				-- Accessing references via local variables is faster. As the
				-- performance of the binary search trees heavily depends on
				-- this routine, we can optimize it by accessing `found_node'
				-- and `key_comparator' via local variables.
			l_found_node := found_node
			l_key_comparator := key_comparator
			if a_key = Void then
				if first_node /= Void and then first_node.key = Void then
					l_found_node := first_node
				else
					l_found_node := Void
				end
			else
				if l_found_node = Void or else (l_found_node.key = Void) or else not l_key_comparator.order_equal (a_key, l_found_node.key) then
					from
						l_found_node := root_node
					until
						l_found_node = Void or else l_equality
					loop
						if l_found_node.key = Void then
							l_found_node := l_found_node.right_child
						elseif l_key_comparator.less_than (a_key, l_found_node.key) then
							l_found_node := l_found_node.left_child
						elseif l_key_comparator.greater_than (a_key, l_found_node.key) then
							l_found_node := l_found_node.right_child
						else
							l_equality := True
						end
					end
				end
			end
			found_node := l_found_node
		end

	search_insert_position (a_key: K)
			-- Where would `a_key' need to be inserted?
			-- If there is a node in the tree whose
			-- `key' is `order_equal' to `a_key', then
			-- this `found_node' becomes that node and
			-- `exact_insert_position_found' becomes `True'.
			-- Else `found_node' becomes the node where the new
			-- potential node with `a_key' would have
			-- to be inserted. The side for the insertion
			-- is given by `insert_position_is_left'.
			-- This child on this side will always be `Void'.
			-- (Performance: O(height).)
		require
			tree_not_empty: not is_empty
		local
			l_found_node: like root_node
			l_key_comparator: like key_comparator
			l_stop: BOOLEAN
		do
				-- Accessing references via local variables is faster. As the
				-- performance of the binary search trees heavily depends on
				-- this routine, we can optimize it by accessing `found_node'
				-- and `key_comparator' via local variables.
			l_found_node := found_node
			l_key_comparator := key_comparator
			if a_key = Void then
				l_found_node := first_node
				if first_node.key = Void then
					exact_insert_position_found := True
				else
					exact_insert_position_found := False
					insert_position_is_left := True
				end
			else
				exact_insert_position_found := False
				from
					l_found_node := root_node
					l_stop := False
				invariant
					result_not_void: l_found_node /= Void
				until
					l_stop
				loop
					if l_found_node.key = Void then
						if l_found_node.right_child /= Void then
							l_found_node := l_found_node.right_child
						else
							insert_position_is_left := False
							l_stop := True
						end
					elseif l_key_comparator.less_than (a_key, l_found_node.key) then
						if l_found_node.left_child = Void then
							insert_position_is_left := True
							l_stop := True
						else
							l_found_node := l_found_node.left_child
						end
					elseif l_key_comparator.greater_than (a_key, l_found_node.key) then
						if l_found_node.right_child = Void then
							insert_position_is_left := False
							l_stop := True
						else
							l_found_node := l_found_node.right_child
						end
					else
						exact_insert_position_found := True
						l_stop := True
					end
				end
			end
			found_node := l_found_node
		ensure
			result_not_void: found_node /= Void
			no_left_child: insert_position_is_left and not exact_insert_position_found implies found_node.left_child = Void
			no_right_child: not insert_position_is_left and not exact_insert_position_found implies found_node.right_child = Void
		end

	unset_found_node
			-- Set `found_node' to Void.
		do
			found_node := Void
		ensure
			found_node_void: found_node = Void
		end

feature {NONE} -- Implementation

	root_node: DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]
			-- Root node

invariant

	sorted: sorted
	is_empty_iff_no_root_node: is_empty = (root_node = Void)
	correct_count: root_node /= Void implies count = root_node.count
	first_node_set: is_empty = (first_node = Void)
	first_node_is_in_tree: not is_empty implies is_node_in_tree (first_node)
	first_node_has_no_predecessor: not is_empty implies predecessor (first_node) = Void
	is_first_node_correct: is_first_node_correct
	last_node_set: is_empty = (last_node = Void)
	last_node_in_in_tree: not is_empty implies is_node_in_tree (last_node)
	last_node_has_no_successor: not is_empty implies successor (last_node) = Void
	is_last_node_correct: is_last_node_correct
	void_is_in_first_node: has_void implies first_node.key = Void

end
