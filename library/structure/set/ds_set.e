indexing

	description:

		"Data structures whose items appear only once"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SET [G]

inherit

	DS_LINEAR [G]
		redefine
			new_cursor, occurrences
		end

feature -- Access

	infix "@", item (v: G): G is
			-- Item equal to `v' held in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		require
			has_v: has (v)
		deferred
		ensure
			definition: same_items (Result, v)
		end

	new_cursor: DS_SET_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in set
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		do
			if has (v) then
				Result := 1
			end
		ensure then
			has: has (v) implies (Result = 1)
			not_has: not has (v) implies (Result = 0)
		end

feature -- Element change

	put (v: G) is
			-- Add `v' to set, replacing any existing item.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			inserted: has (v) and then item (v) = v
			same_count: (old has (v)) implies (count = old count)
			one_more: (not old has (v)) implies (count = old count + 1)
		end

feature -- Removal

	remove (v: G) is
			-- Remove item equal to `v' from set.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
		deferred
		ensure
			same_count: (not old has (v)) implies (count = old count)
			one_less: (old has (v)) implies (count = old count - 1)
			removed: not has (v)
		end

end -- class DS_SET
