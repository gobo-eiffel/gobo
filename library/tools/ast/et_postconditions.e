indexing

	description:

		"Eiffel postcondition lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_POSTCONDITIONS

inherit

	ET_ASSERTIONS

creation

	make

feature -- Status report

	is_ensure_then: BOOLEAN
			-- Has postcondition clause been declared with "ensure then"?

feature -- Status setting

	set_ensure_then is
			-- Set `is_ensure_then'.
		do
			is_ensure_then := True
		ensure
			is_ensure_then: is_ensure_then
		end

end -- class ET_POSTCONDITIONS
