indexing

	description:

		"Eiffel 'separate' type marks"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_SEPARATE_MARK

inherit

	ET_TYPE_MARK
		redefine
			is_separate
		end

creation

	make, make_with_position

feature -- Status report

	is_separate: BOOLEAN is True
			-- Is mark 'separate'?

end -- class ET_SEPARATE_MARK
