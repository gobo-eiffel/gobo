indexing

	description:

		"Data structures that may be traversed forward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINEAR [G]

inherit

	DS_TRAVERSABLE [G]
		redefine
			new_cursor
		end

	DS_SEARCHABLE [G]

feature -- Access

	first: G is
			-- First item in container
		require
			not_empty: not is_empty
		deferred
		ensure
			has_first: has (Result)
		end

	new_cursor: DS_LINEAR_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	is_first: BOOLEAN is
			-- Is internal cursor on first item?
		do
			Result := internal_cursor.is_first
		ensure
			not_empty: Result implies not is_empty
			not_off: Result implies not off
			definition: Result implies (item_for_iteration = first)
		end

	after: BOOLEAN is
			-- Is there no valid position to right of internal cursor?
		do
			Result := internal_cursor.after
		end

	has (v: G): BOOLEAN is
			-- Does container include `v'?
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.start
			a_cursor.search_forth (v)
			if not a_cursor.after then
				Result := True
				a_cursor.go_after
			end
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in container
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.search_forth (v)
				if not a_cursor.after then
					Result := Result + 1
					a_cursor.forth
				end
			end
		end

feature -- Cursor movement

	start is
			-- Move internal cursor to first position.
		do
			internal_cursor.start
		ensure
			empty_behavior: is_empty implies after
			not_empty_behavior: not is_empty implies is_first
		end

	forth is
			-- Move internal cursor to next position.
		require
			not_after: not after
		do
			internal_cursor.forth
		end

	search_forth (v: G) is
			-- Move internal cursor to first position at or after current
			-- position where `item_for_iteration' and `v' are equal.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		require
			not_off: not off or after
		do
			internal_cursor.search_forth (v)
		end

	go_after is
			-- Move cursor to `after' position.
		do
			internal_cursor.go_after
		ensure
			after: after
		end

invariant

	after_constraint: after implies off

end -- class DS_LINEAR
