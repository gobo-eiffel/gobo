indexing

	description:

		"Reverse comparators based on COMPARABLE"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_REVERSE_COMPARABLE_COMPARATOR [G -> COMPARABLE]

inherit

	DS_COMPARABLE_COMPARATOR [G]
		redefine
			less_than
		end

creation

	make

feature -- Status report

	less_than (u, v: G): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := (v < u)
		end

end -- class DS_REVERSE_COMPARABLE_COMPARATOR
