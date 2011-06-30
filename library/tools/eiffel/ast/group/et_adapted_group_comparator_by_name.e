note

	description:

		"Adapted group comparators by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_GROUP_COMPARATOR_BY_NAME

inherit

	KL_COMPARATOR [ET_ADAPTED_GROUP]

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new comparator.
		do
		end

feature -- Status report

	less_than (u, v: ET_ADAPTED_GROUP): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (STRING_.three_way_case_insensitive_comparison (u.name, v.name) = -1)
		end

end
