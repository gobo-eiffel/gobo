indexing

	description:

		"Eiffel 'expanded' type marks"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPANDED_MARK

inherit

	ET_TYPE_MARK
		redefine
			is_expanded
		end

creation

	make, make_with_position

feature -- Status report

	is_expanded: BOOLEAN is True
			-- Is mark 'expanded'?

end -- class ET_EXPANDED_MARK
