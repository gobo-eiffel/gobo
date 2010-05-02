note

	description:

		"Test root"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "MIT License"
	date:       "$Date$"
	revision:   "$Revision$"

class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b
		end

end -- class AA
