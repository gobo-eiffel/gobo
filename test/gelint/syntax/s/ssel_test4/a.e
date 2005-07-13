indexing

	description:

		"Empty lines not allowed in multi-line manifest strings"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum License v2 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class A

create

	make

feature

	make is
		do
			print ("first line %
				%%
				% third line")
		end

end -- class A
