indexing

	description:

		"Eiffel local variables whose names are followed by a colon"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COLON_LOCAL_VARIABLE

inherit

	ET_LOCAL_VARIABLE

creation

	make

feature -- Access

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := type.break
		end

end -- class ET_COLON_LOCAL_VARIABLE
