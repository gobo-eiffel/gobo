indexing

	description:

		"Data structures that can be traversed forward and backward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINEAR [G]

inherit

	DS_LINEAR [G]
		redefine
			new_cursor
		end

feature -- Access

	last: G is
			-- Last item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			has_last: has (Result)
		end

	new_cursor: DS_BILINEAR_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	is_last: BOOLEAN is
			-- Is internal cursor on last item?
		do
			Result := internal_cursor.is_last
		ensure
			not_empty: Result implies not is_empty
			not_off: Result implies not off
			definition: Result implies (item_for_iteration = last)
		end

	before: BOOLEAN is
			-- Is there no valid position to left of internal cursor?
		do
			Result := internal_cursor.before
		end

feature -- Cursor movement

	finish is
			-- Move internal cursor to last position.
		do
			internal_cursor.finish
		ensure
			empty_behavior: is_empty implies before
			not_empty_behavior: not is_empty implies is_last
		end

	back is
			-- Move internal cursor to previous position.
		require
			not_before: not before
		do
			internal_cursor.back
		end

	search_back (v: G) is
			-- Move internal cursor to first position at or before current
			-- position where `item_for_iteration' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		require
			not_off: not off or before
		do
			internal_cursor.search_back (v)
		end

	go_before is
			-- Move cursor to `before' position.
		do
			internal_cursor.go_before
		ensure
			before: before
		end

invariant

	not_both: not (after and before)
	before_constraint: before implies off

end -- class DS_BILINEAR
