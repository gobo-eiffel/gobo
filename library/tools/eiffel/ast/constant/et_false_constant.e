indexing

	description:

		"Eiffel false constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FALSE_CONSTANT

inherit

	ET_BOOLEAN_CONSTANT

creation

	make, make_with_position

feature -- Status report

	is_true: BOOLEAN is False
			-- Is boolean value true?

invariant

	is_false: not is_true

end -- class ET_FALSE_CONSTANT
