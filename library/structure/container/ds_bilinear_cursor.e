indexing

	description:

		"Cursors for data structures that may be traversed forward and backward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINEAR_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container, off
		end

feature -- Access

	container: DS_BILINEAR [G] is
			-- Data structure traversed
		deferred
		end

feature -- Status report

	is_last: BOOLEAN is
			-- Is cursor on last item?
		deferred
		ensure
			not_empty: Result implies not container.is_empty
			not_off: Result implies not off
			definition: Result implies (item = container.last)
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		deferred
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := after or before
		end

feature -- Cursor movement

	finish is
			-- Move cursor to last position.
		deferred
		ensure
			empty_behavior: container.is_empty implies before
			not_empty_behavior: not container.is_empty implies is_last
		end

	back is
			-- Move cursor to previous position.
		require
			not_before: not before
		deferred
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		require
			not_off: not off or before
		deferred
		end

	go_before is
			-- Move cursor to `before' position.
		deferred
		ensure
			before: before
		end

invariant

	not_both: not (after and before)
	before_constraint: before implies off

end -- class DS_BILINEAR_CURSOR
