note

	description:

		"Comparators of strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_STRING_COMPARATOR

inherit

	KL_COMPARATOR [STRING]

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	less_than (u, v: STRING): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			Result := STRING_.three_way_comparison (u, v) = -1
		end

end
