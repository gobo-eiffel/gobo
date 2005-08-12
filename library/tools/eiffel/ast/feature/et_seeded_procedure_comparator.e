indexing

	description:

		"Eiffel procedure comparators by first seed"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEEDED_PROCEDURE_COMPARATOR

inherit

	KL_PART_COMPARATOR [ET_PROCEDURE]

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new procedure comparator by first seed.
		do
		end

feature -- Status report

	less_than (u, v: ET_PROCEDURE): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := (u.first_seed < v.first_seed)
		end

end
