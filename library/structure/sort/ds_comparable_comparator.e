indexing

	description:

		"Comparators based on COMPARABLE"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_COMPARABLE_COMPARATOR [G -> COMPARABLE]

inherit

	DS_COMPARATOR [G]

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new comparator.
		do
		end

feature -- Status report

	less_than (u, v: G): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := (u < v)
		end

end -- class DS_COMPARABLE_COMPARATOR
