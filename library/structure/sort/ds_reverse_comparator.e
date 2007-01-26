indexing

	description:

		"Reverse total order comparators"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_REVERSE_COMPARATOR [G]

obsolete

	"[020707] Use KL_REVERSE_COMPARATOR instead."

inherit

	KL_REVERSE_COMPARATOR [G]
		redefine
			comparator
		end

	DS_REVERSE_PART_COMPARATOR [G]
		redefine
			comparator
		end

	DS_COMPARATOR [G]

create

	make

feature -- Access

	comparator: KL_COMPARATOR [G]
			-- Base comparator

end
