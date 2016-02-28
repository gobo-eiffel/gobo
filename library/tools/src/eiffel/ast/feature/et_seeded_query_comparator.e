note

	description:

		"Eiffel query comparators by first seed"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEEDED_QUERY_COMPARATOR

inherit

	KL_PART_COMPARATOR [ET_QUERY]

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new query comparator by first seed.
		do
		end

feature -- Status report

	less_than (u, v: ET_QUERY): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (u.first_seed < v.first_seed)
		end

end
