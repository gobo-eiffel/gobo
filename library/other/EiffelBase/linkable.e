indexing

	description:

		"EiffelBase LINKABLE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LINKABLE [G]

inherit

	CELL [G]
		select
			replace
		end

	DS_LINKABLE [G]

creation

	make

end -- class LINKABLE
