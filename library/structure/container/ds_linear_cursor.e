note

	description:

		"Cursors for data structures that can be traversed forward"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_LINEAR_CURSOR [G]

inherit

	DS_CURSOR [G]
		redefine
			container,
			next_cursor
		end

feature -- Access

	container: DS_LINEAR [G]
			-- Data structure traversed
		deferred
		end

feature -- Status report

	is_first: BOOLEAN
			-- Is cursor on first item?
		do
			Result := container.cursor_is_first (Current)
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
		end

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := container.cursor_after (Current)
		end

feature -- Cursor movement

	start
			-- Move cursor to first position.
		do
			container.cursor_start (Current)
		ensure
			empty_behavior: container.is_empty implies after
			first_or_after: is_first xor after
		end

	forth
			-- Move cursor to next position.
		require
			not_after: not after
		do
			container.cursor_forth (Current)
		end

	search_forth (v: G)
			-- Move to first position at or after current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		require
			not_off: not off or after
		do
			container.cursor_search_forth (Current, v)
		end

	go_after
			-- Move cursor to `after' position.
		do
			container.cursor_go_after (Current)
		ensure
			after: after
		end

feature {DS_LINEAR} -- Implementation

	next_cursor: DS_LINEAR_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

	after_constraint: after implies off

end
