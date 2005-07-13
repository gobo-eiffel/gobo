indexing

	description:

		"Comparators based on COMPARABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2000-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_COMPARABLE_COMPARATOR [G -> COMPARABLE]

inherit

	KL_COMPARATOR [G]

create

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
