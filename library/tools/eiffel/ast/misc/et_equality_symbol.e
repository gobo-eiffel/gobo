indexing

	description:

		"Eiffel '=' or '/=' symbols"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EQUALITY_SYMBOL

inherit

	ET_SYMBOL

feature -- Status report

	is_not_equal: BOOLEAN is
			-- Is symbol '/='?
		deferred
		end

end -- class ET_EQUALITY_SYMBOL
