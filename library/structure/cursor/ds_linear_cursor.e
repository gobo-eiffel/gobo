indexing

	description:

		"Cursors for structures that can be traversed forward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINEAR_CURSOR [G]

inherit

	DS_INDEXED_CURSOR [G]
		redefine
			container
		end

feature -- Access

	container: DS_LINEAR [G] is
			-- Structure traversed
		deferred
		end

feature -- Status report

	is_first: BOOLEAN is
			-- Is cursor on first item?
		require
			valid_cursor: is_valid
		deferred
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
			definition: Result implies (item = container.first)
		end

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		require
			valid_cursor: is_valid
		deferred
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := after
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value?
		do
			Result := 1 <= i and i <= container.count + 1
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		require
			valid_cursor: is_valid
		deferred
		ensure
			empty_behavior: container.is_empty implies after
			not_empty_behavior: not container.is_empty implies is_first
		end

	forth is
			-- Move cursor to next position.
		require
			valid_cursor: is_valid
			not_after: not after
		deferred
		end

	search_forth (v: G) is
			-- Move to first position at or after current
			-- position where `item' and `v' are equal.
			-- (Use `searcher''s comparison criterion from `container'.)
			-- Move `after' if not found.
		require
			valid_cursor: is_valid
			not_off: not off or after
		do
			container.searcher.search_forth (Current, v)
		end

invariant

	after_constraint: after implies off
	empty_property: container.is_empty implies off

end -- class DS_LINEAR_CURSOR
