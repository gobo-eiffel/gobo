indexing

	description:

		"Data structures that can hold zero or more items"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_CONTAINER [G]

inherit

	ANY
		undefine
			copy, is_equal
		redefine
			is_equal
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items in container
		deferred
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is container empty?
		do
			Result := count = 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current container equal to `other'?
		deferred
		ensure then
				-- The following assertion has been commented out
				-- because of a bug in SmallEiffel -0.77b2 (implicit
				-- feature renaming in ACTIVE, COUNTABLE and LINEAR
				-- in cluster $GOBO/library/structure/base).
--			same_count: Result implies count = other.count
		end

feature -- Removal

	wipe_out is
			-- Remove all items from container.
		deferred
		ensure
			wiped_out: is_empty
		end

invariant

	positive_count: count >= 0
	empty_definition: is_empty = (count = 0)

end -- class DS_CONTAINER
