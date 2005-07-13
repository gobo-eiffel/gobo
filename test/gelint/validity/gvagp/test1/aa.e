indexing

	description:

		"Test root"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum License v2 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class AA

create

	make

feature

	make is
		local
			b: BB
		do
			create b
		end

end -- class AA
