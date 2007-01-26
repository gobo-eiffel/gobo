indexing

	description:

		"Reverse comparators based on COMPARABLE"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_REVERSE_COMPARABLE_COMPARATOR [G -> COMPARABLE]

obsolete

	"[020707] Use KL_REVERSE_COMPARABLE_COMPARATOR instead."

inherit

	KL_REVERSE_COMPARABLE_COMPARATOR [G]

	DS_COMPARABLE_COMPARATOR [G]
		undefine
			less_than
		end

create

	make

end
