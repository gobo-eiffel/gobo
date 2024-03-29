﻿note

	description:

		"Eiffel query comparators by first seed"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2017, Eric Bezault and others"
	license: "MIT License"

class ET_SEEDED_QUERY_COMPARATOR

inherit

	KL_PART_COMPARATOR [ET_QUERY]
		redefine
			less_than
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new query comparator by first seed.
		do
		end

feature -- Status report

	less_than, attached_less_than (u, v: ET_QUERY): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (u.first_seed < v.first_seed)
		end

end
