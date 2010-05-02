note

	description:

		"Keys of sparse tables, viewed as linear containers."

	remark: "[
		Ideally the sparse tables should be descendants of both
		DS_LINEAR [G] and DS_LINEAR [K], but this does not work
		in Eiffel.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_TABLE_KEYS [G, K]

inherit

	DS_BILINEAR [K]
		redefine
			equality_tester_settable
		end

create {DS_SPARSE_TABLE}

	make

feature {NONE} -- Initialization

	make (a_table: like table)
			-- Create a new linear representation of the keys of `a_table'.
		require
			a_table_not_void: a_table /= Void
		do
			table := a_table
			equality_tester := table.key_equality_tester
			set_internal_cursor (new_cursor)
		ensure
			table_set: table = a_table
		end

feature -- Access

	first: K
			-- First item in container
		local
			l_cursor: like new_cursor
		do
			l_cursor := new_cursor
			l_cursor.start
			Result := l_cursor.item
		end

	last: K
			-- Last item in container
		local
			l_cursor: like new_cursor
		do
			l_cursor := new_cursor
			l_cursor.finish
			Result := l_cursor.item
		end

	new_cursor: DS_SPARSE_TABLE_KEYS_CURSOR [G, K]
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in container
		do
			Result := table.count
		end

feature -- Status report

	equality_tester_settable (a_tester: like equality_tester): BOOLEAN
			-- Can `set_equality_tester' be called with `a_tester'
			-- as argument in current state of container?
		do
			Result := False
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [K]])
			-- Apply `an_action' to every item, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			l_cursor: like new_cursor
		do
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				an_action.call ([l_cursor.item])
				l_cursor.forth
			end
		end

	do_all_with_index (an_action: PROCEDURE [ANY, TUPLE [K, INTEGER]])
			-- Apply `an_action' to every item, from first to last.
			-- `an_action' receives the item and its index.
			-- (Semantics not guaranteed if `an_action' changes the structure.)
		local
			l_cursor: like new_cursor
			i: INTEGER
		do
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				i := i + 1
				an_action.call ([l_cursor.item, i])
				l_cursor.forth
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [K]]; a_test: FUNCTION [ANY, TUPLE [K], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			l_cursor: like new_cursor
			l_item: K
		do
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				l_item := l_cursor.item
				if a_test.item ([l_item]) then
					an_action.call ([l_item])
				end
				l_cursor.forth
			end
		end

	do_if_with_index (an_action: PROCEDURE [ANY, TUPLE [K, INTEGER]]; a_test: FUNCTION [ANY, TUPLE [K, INTEGER], BOOLEAN])
			-- Apply `an_action' to every item that satisfies `a_test', from first to last.
			-- `an_action' and `a_test' receive the item and its index.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the structure.)
		local
			l_cursor: like new_cursor
			i: INTEGER
			l_item: K
		do
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				i := i + 1
				l_item := l_cursor.item
				if a_test.item ([l_item, i]) then
					an_action.call ([l_item, i])
				end
				l_cursor.forth
			end
		end

	there_exists (a_test: FUNCTION [ANY, TUPLE [K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one item?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			l_cursor: like new_cursor
		do
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				if a_test.item ([l_cursor.item]) then
					Result := True
						-- Jump out of the loop.
					l_cursor.go_after
				else
					l_cursor.forth
				end
			end
		end

	for_all (a_test: FUNCTION [ANY, TUPLE [K], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for all items?
			-- (Semantics not guaranteed if `a_test' changes the structure.)
		local
			l_cursor: like new_cursor
		do
			Result := True
			l_cursor := new_cursor
			from
				l_cursor.start
			until
				l_cursor.after
			loop
				if not a_test.item ([l_cursor.item]) then
					Result := False
						-- Jump out of the loop.
					l_cursor.go_after
				else
					l_cursor.forth
				end
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current container equal to `other'?
		do
			Result := table.is_equal (other.table)
		end

feature -- Duplication

	copy (other: like Current)
			-- Copy `other' to current container.
			-- Move all cursors `off' (unless `other = Current').
		do
			if other /= Current then
				if table = Void then
						-- Called from `twin'.
					make (other.table.twin)
				else
					table.copy (other.table)
					equality_tester := table.key_equality_tester
				end
			end
		end

feature -- Removal

	wipe_out
			-- Remove all items from container.
		do
			table.wipe_out
		end

feature {NONE} -- Cursor implementation

	set_internal_cursor (c: like internal_cursor)
			-- Set `internal_cursor' to `c'.
		do
			internal_cursor := c
		end

	internal_cursor: like new_cursor
			-- Internal cursor

feature {DS_SPARSE_TABLE_KEYS_CURSOR} -- Cursor implementation

	cursor_item (a_cursor: like new_cursor): K
			-- Item at `a_cursor' position
		do
			Result := a_cursor.table_cursor.key
		end

	cursor_after (a_cursor: like new_cursor): BOOLEAN
			-- Is there no valid position to right of `a_cursor'?
		do
			Result := a_cursor.table_cursor.after
		end

	cursor_before (a_cursor: like new_cursor): BOOLEAN
			-- Is there no valid position to left of `a_cursor'?
		do
			Result := a_cursor.table_cursor.before
		end

	cursor_is_first (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on first item?
		do
			Result := a_cursor.table_cursor.is_first
		end

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on last item?
		do
			Result := a_cursor.table_cursor.is_last
		end

	cursor_same_position (a_cursor, other: like new_cursor): BOOLEAN
			-- Is `a_cursor' at same position as `other'?
		do
			Result := a_cursor.table_cursor.same_position (other.table_cursor)
		end

	cursor_start (a_cursor: like new_cursor)
			-- Move `a_cursor' to first position.
		do
			a_cursor.table_cursor.start
		end

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
		do
			a_cursor.table_cursor.finish
		end

	cursor_forth (a_cursor: like new_cursor)
			-- Move `a_cursor' to next position.
		do
			a_cursor.table_cursor.forth
		end

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
		do
			a_cursor.table_cursor.back
		end

	cursor_search_forth (a_cursor: like new_cursor; v: K)
			-- Move `a_cursor' to first position at or after its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from
				until
					cursor_after (a_cursor) or else a_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_forth (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					cursor_after (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_forth (a_cursor)
				end
			end
		end

	cursor_search_back (a_cursor: like new_cursor; v: K)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from
				until
					cursor_before (a_cursor) or else a_tester.test (cursor_item (a_cursor), v)
				loop
					cursor_back (a_cursor)
				end
			else
					-- Use `=' as comparison criterion.
				from
				until
					cursor_before (a_cursor) or else cursor_item (a_cursor) = v
				loop
					cursor_back (a_cursor)
				end
			end
		end

	cursor_go_after (a_cursor: like new_cursor)
			-- Move `a_cursor' to `after' position.
		do
			a_cursor.table_cursor.go_after
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
		do
			a_cursor.table_cursor.go_before
		end

	cursor_go_to (a_cursor, other: like new_cursor)
			-- Move `a_cursor' to `other''s position.
		do
			a_cursor.table_cursor.go_to (other.table_cursor)
		end

feature {DS_SPARSE_TABLE, DS_SPARSE_TABLE_KEYS, DS_SPARSE_TABLE_KEYS_CURSOR} -- Implementation

	table: DS_SPARSE_TABLE [G, K]
			-- Table to which the keys belong

feature {DS_SPARSE_TABLE} -- Implementation

	internal_set_equality_tester (a_tester: like equality_tester)
			-- Set `equality_tester' to `a_tester'.
			-- (No precondition, to be used internally only.)
		do
			equality_tester := a_tester
		ensure
			equality_tester_set: equality_tester = a_tester
		end

feature {NONE} -- Not applicable

	make_default
			-- Create an empty container.
		do
		end

invariant

	table_not_void: table /= Void

end
