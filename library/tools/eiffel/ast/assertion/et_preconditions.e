indexing

	description:

		"Eiffel precondition lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PRECONDITIONS

inherit

	ET_ASSERTIONS

creation

	make

feature -- Status report

	is_require_else: BOOLEAN
			-- Has precondition clause been declared with "require else"?

feature -- Status setting

	set_require_else is
			-- Set `is_require_else'.
		do
			is_require_else := True
		ensure
			is_require_else: is_require_else
		end

end -- class ET_PRECONDITIONS
