indexing

	description:

		"Structures that can hold zero or more items"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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
			-- Number of items in structure
		deferred
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is structure empty?
		do
			Result := count = 0
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current structure equal to `other'?
		deferred
		ensure then
			same_count: Result implies count = other.count
		end

feature -- Removal

	wipe_out is
			-- Remove all items from structure.
		deferred
		ensure
			wipe_out: is_empty
		end

invariant

	positive_count: count >= 0
	empty_definition: is_empty = (count = 0)

end -- class DS_CONTAINER
