note

	description:

		"Cursors for data structures that may be traversed forward and backward"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BILINEAR_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container,
			next_cursor,
			off
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
		deferred
		ensure
-- The following postcondition has been commented out in order
-- to make the ISE Eiffel compiler 13.11 happy when compiling in
-- void-safe mode. No qualified call is allowed when calling
-- containers' routine 'new_cursor' from their creation procedure.
-- And 'implies' is considered as a qualified call.
--			before_constraint: Result implies off
		end

	off: BOOLEAN
			-- Is there no item at cursor position?
		do
			Result := after or before
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

	next_cursor: detachable DS_BILINEAR_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

invariant

-- The following invariant has been commented out in order
-- to make the ISE Eiffel compiler 13.11 happy when compiling in
-- void-safe mode. No qualified call is allowed when calling
-- containers' routine 'new_cursor' from their creation procedure.
-- And 'not' and 'and' are considered as a qualified calls.
--	not_both: not (after and before)

end
