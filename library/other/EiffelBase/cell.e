indexing

	description:

		"EiffelBase CELL class interface"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class CELL [G]

inherit

	DS_CELL [G]
		rename
			make as replace
		end

creation

	put

end
