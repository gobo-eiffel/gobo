indexing

	description:

		"EiffelBase CELL class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class CELL [G]

inherit

	DS_CELL [G]
		rename
			make as replace
		end

creation

	put

end -- class CELL
