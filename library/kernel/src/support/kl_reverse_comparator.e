note

	description:

		"Reverse total order comparators"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_REVERSE_COMPARATOR [G]

inherit

	KL_REVERSE_PART_COMPARATOR [G]
		redefine
			comparator
		end

	KL_COMPARATOR [G]

create

	make

feature -- Access

	comparator: KL_COMPARATOR [G]
			-- Base comparator

end
