indexing

	description:

		"Reverse total order comparators"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_REVERSE_COMPARATOR [G]

inherit

	DS_REVERSE_PART_COMPARATOR [G]
		redefine
			comparator
		end

	DS_COMPARATOR [G]

creation

	make

feature -- Access

	comparator: DS_COMPARATOR [G]
			-- Base comparator

end -- class DS_REVERSE_COMPARATOR
