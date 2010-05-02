note

	description:

		"Cursors for data structures that may be traversed forward and backward"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BILINEAR_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container,
			next_cursor
		end

feature -- Access

	container: DS_BILINEAR [G]
			-- Data structure traversed
		deferred
		end

feature -- Status report

	is_last: BOOLEAN
			-- Is cursor on last item?
		do
			Result := container.cursor_is_last (Current)
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
		end

	before: BOOLEAN
			-- Is there no valid position to left of cursor?
		do
			Result := container.cursor_before (Current)
		end

feature -- Cursor movement

	finish
			-- Move cursor to last position.
		do
			container.cursor_finish (Current)
		ensure
			empty_behavior: container.is_empty implies before
			last_or_before: is_last xor before
		end

	back
			-- Move cursor to previous position.
		require
			not_before: not before
		do
			container.cursor_back (Current)
		end

	search_back (v: G)
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		require
			not_off: not off or before
		do
			container.cursor_search_back (Current, v)
		end

	go_before
			-- Move cursor to `before' position.
		do
			container.cursor_go_before (Current)
		ensure
			before: before
		end

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_BILINEAR_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

	not_both: not (after and before)
	before_constraint: before implies off

end
