note

	description:

		"Data structures that can be traversed forward and backward"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BILINEAR [G]

inherit

	DS_LINEAR [G]
		redefine
			new_cursor,
			cursor_off
		end

feature -- Access

	last: G
			-- Last item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			has_last: has (Result)
		end

	new_cursor: DS_BILINEAR_CURSOR [G]
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	is_last: BOOLEAN
			-- Is internal cursor on last item?
		do
			Result := cursor_is_last (internal_cursor)
		ensure
			not_empty: Result implies not is_empty
			not_off: Result implies not off
			definition: Result implies (item_for_iteration = last)
		end

	before: BOOLEAN
			-- Is there no valid position to left of internal cursor?
		do
			Result := cursor_before (internal_cursor)
		end

feature -- Cursor movement

	finish
			-- Move internal cursor to last position.
		do
			cursor_finish (internal_cursor)
		ensure
			empty_behavior: is_empty implies before
			not_empty_behavior: not is_empty implies is_last
		end

	back
			-- Move internal cursor to previous position.
		require
			not_before: not before
		do
			cursor_back (internal_cursor)
		end

	search_back (v: G)
			-- Move internal cursor to first position at or before current
			-- position where `item_for_iteration' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		require
			not_off: not off or before
		do
			cursor_search_back (internal_cursor, v)
		end

	go_before
			-- Move internal cursor to `before' position.
		do
			cursor_go_before (internal_cursor)
		ensure
			before: before
		end

feature {DS_CURSOR} -- Cursor implementation

	cursor_off (a_cursor: like new_cursor): BOOLEAN
			-- Is there no item at `a_cursor' position?
		do
			Result := cursor_after (a_cursor) or cursor_before (a_cursor)
		end

feature {DS_BILINEAR_CURSOR} -- Cursor implementation

	cursor_is_last (a_cursor: like new_cursor): BOOLEAN
			-- Is `a_cursor' on last item?
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		ensure
			not_empty: Result implies not is_empty
			a_cursor_not_off: Result implies not cursor_off (a_cursor)
			definition: Result implies (cursor_item (a_cursor) = last)
		end

	cursor_before (a_cursor: like new_cursor): BOOLEAN
			-- Is there no valid position to left of `a_cursor'?
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		end

	cursor_finish (a_cursor: like new_cursor)
			-- Move `a_cursor' to last position.
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		ensure
			empty_behavior: is_empty implies cursor_before (a_cursor)
			not_empty_behavior: not is_empty implies cursor_is_last (a_cursor)
		end

	cursor_back (a_cursor: like new_cursor)
			-- Move `a_cursor' to previous position.
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			a_cursor_not_before: not cursor_before (a_cursor)
		deferred
		end

	cursor_search_back (a_cursor: like new_cursor; v: G)
			-- Move `a_cursor' to first position at or before its current
			-- position where `cursor_item (a_cursor)' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			a_cursor_not_off: not cursor_off (a_cursor) or cursor_before (a_cursor)
		deferred
		end

	cursor_go_before (a_cursor: like new_cursor)
			-- Move `a_cursor' to `before' position.
		require
			a_cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		ensure
			a_cursor_before: cursor_before (a_cursor)
		end

invariant

	not_both: initialized implies (not (after and before))
	before_constraint: initialized implies (before implies off)

end
