indexing

	description:

		"Comparators based on COMPARABLE"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

end
