indexing

	description:

		"Comparators based on COMPARABLE"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_COMPARABLE_COMPARATOR [G -> COMPARABLE]

obsolete

	"[020707] Use KL_COMPARABLE_COMPARATOR instead."

inherit

	KL_COMPARABLE_COMPARATOR [G]
	DS_COMPARATOR [G]

create

	make

end
