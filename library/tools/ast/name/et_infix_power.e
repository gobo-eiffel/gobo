indexing

	description:

		"Eiffel infix ^ feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_POWER

inherit

	ET_INFIX_NAME

creation

	make

feature -- Access

	hash_code: INTEGER is 16
			-- Hash code

end -- class ET_INFIX_POWER
