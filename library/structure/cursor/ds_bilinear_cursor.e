indexing

	description:

		"Cursors for structures that may be traversed forward and backward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINEAR_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container, off,
			valid_index
		end

feature -- Access

	container: DS_BILINEAR [G] is
			-- Structure to be traversed
		deferred
		end

feature -- Status report

	is_last: BOOLEAN is
			-- Is cursor on last item?
		require
			valid_cursor: is_valid
		deferred
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
			definition: Result implies (item = container.last)
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		require
			valid_cursor: is_valid
		deferred
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := after or before
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value?
		do
			Result := 0 <= i and i <= container.count + 1
		end

feature -- Cursor movement

	finish is
			-- Move cursor to last position.
		require
			valid_cursor: is_valid
		deferred
		ensure
			empty_behavior: container.is_empty implies before
			not_empty_behavior: not container.is_empty implies is_last
		end

	back is
			-- Move cursor to previous position.
		require
			valid_cursor: is_valid
			not_before: not before
		deferred
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `searcher''s comparison criterion from `container'.)
			-- Move `before' if not found.
		require
			valid_cursor: is_valid
			not_off: not off or before
		do
			container.searcher.search_back (Current, v)
		end

invariant

	not_both: not (after and before)
	before_constraint: before implies off

end -- class DS_BILINEAR_CURSOR
