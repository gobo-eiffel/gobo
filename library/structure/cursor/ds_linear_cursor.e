indexing

	description:

		"Cursors for data structures that can be traversed forward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINEAR_CURSOR [G]

inherit

	DS_CURSOR [G]
		redefine
			container
		end

feature -- Access

	container: DS_LINEAR [G] is
			-- Data structure traversed
		deferred
		end

feature -- Status report

	is_first: BOOLEAN is
			-- Is cursor on first item?
		deferred
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
			definition: Result implies (item = container.first)
		end

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		deferred
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := after
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		deferred
		ensure
			empty_behavior: container.is_empty implies after
			not_empty_behavior: not container.is_empty implies is_first
		end

	forth is
			-- Move cursor to next position.
		require
			not_after: not after
		deferred
		end

	search_forth (v: G) is
			-- Move to first position at or after current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		require
			not_off: not off or after
		deferred
		end

	go_after is
			-- Move cursor to `after' position.
		deferred
		ensure
			after: after
		end

invariant

	after_constraint: after implies off

end -- class DS_LINEAR_CURSOR
