indexing

	description:

		"Eiffel '/=' symbols"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_NOT_EQUAL_SYMBOL

inherit

	ET_EQUALITY_SYMBOL

creation

	make, make_with_position

feature -- Status report

	is_not_equal: BOOLEAN is True
			-- Is symbol '/='?

end -- class ET_NOT_EQUAL_SYMBOL
