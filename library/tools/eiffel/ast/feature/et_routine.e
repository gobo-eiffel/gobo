indexing

	description:

		"Eiffel routines"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ROUTINE

inherit

	ET_FEATURE

feature -- Access

	arguments: ET_FORMAL_ARGUMENTS
			-- Formal arguments

	obsolete_message: ET_OBSOLETE
			-- Obsolete message

	preconditions: ET_PRECONDITIONS
			-- Preconditions

	postconditions: ET_POSTCONDITIONS
			-- Postconditions

end -- class ET_ROUTINE
