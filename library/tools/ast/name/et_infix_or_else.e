indexing

	description:

		"Eiffel infix or else feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_OR_ELSE

inherit

	ET_INFIX_NAME

creation

	make

feature -- Access

	hash_code: INTEGER is 14
			-- Hash code

end -- class ET_INFIX_OR_ELSE
