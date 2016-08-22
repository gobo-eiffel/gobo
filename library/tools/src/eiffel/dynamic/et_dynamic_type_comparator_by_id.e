note

	description:

		"Dynamic type comparators by id"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE_COMPARATOR_BY_ID

inherit

	KL_COMPARATOR [ET_DYNAMIC_TYPE]

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new comparator.
		do
		end

feature -- Status report

	less_than (u, v: ET_DYNAMIC_TYPE): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (u.id < v.id)
		end

end
