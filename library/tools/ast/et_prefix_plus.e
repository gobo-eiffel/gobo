indexing

	description:

		"Eiffel prefix + feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PREFIX_PLUS

inherit

	ET_PREFIX_NAME

creation

	make

feature -- Access

	hash_code: INTEGER is 22
			-- Hash code

end -- class ET_PREFIX_PLUS
