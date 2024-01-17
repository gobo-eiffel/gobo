note

	description:

		"Comparators of strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"

class UC_STRING_COMPARATOR

inherit

	KL_COMPARATOR [STRING]
		redefine
			less_than
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Status report

	less_than, attached_less_than (u, v: STRING): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := STRING_.three_way_comparison (u, v) = -1
		end

end
