note

	description:

		"Dynamic primary type comparators by id"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PRIMARY_TYPE_COMPARATOR_BY_ID

inherit

	KL_COMPARATOR [ET_DYNAMIC_PRIMARY_TYPE]
		redefine
			less_than
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new comparator.
		do
		end

feature -- Status report

	less_than, attached_less_than (u, v: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (u.id < v.id)
		end

end
