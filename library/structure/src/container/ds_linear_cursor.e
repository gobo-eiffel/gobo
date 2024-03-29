﻿note

	description:

		"Cursors for data structures that can be traversed forward"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"

deferred class DS_LINEAR_CURSOR [G]

inherit

	DS_CURSOR [G]
		redefine
			container,
			next_cursor
		end

	ITERATION_CURSOR [G]
		undefine
			copy, is_equal
		redefine
			after
		end

	ITERABLE [G]
		rename
			new_cursor as new_iterator
		undefine
			copy,
			is_equal
		end

feature -- Access

	container: DS_LINEAR [G]
			-- Data structure traversed
		deferred
		end

	new_iterator: like Current
			-- New external cursor to be used in the 'across' construct
			-- to traverse `container'
		do
			Result := container.new_iterator
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
		deferred
		ensure then
			after_constraint: Result implies off
		end

	off: BOOLEAN
			-- Is there no item at cursor position?
		do
			Result := after
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

	next_cursor: detachable DS_LINEAR_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
