indexing

	description:

		"Eiffel creation instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION

feature -- Access

	type: ET_TYPE
			-- Type of object being created

	target: ET_WRITABLE
			-- Target of the creation

--	call: ET_CREATION_CALL
			-- Creation procedure call

end -- class ET_CREATION_INSTRUCTION
