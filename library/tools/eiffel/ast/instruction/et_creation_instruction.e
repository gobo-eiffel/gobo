indexing

	description:

		"Eiffel creation instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION

feature -- Access

	target: ET_WRITABLE
			-- Target of the creation

invariant

	target_not_void: target /= Void

end -- class ET_CREATION_INSTRUCTION
