indexing

	description:

		"Eiffel typed creation instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_TYPED_CREATION_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

feature -- Access

	type: ET_TYPE
			-- Type of object being created

invariant

	type_not_void: type /= Void

end -- class ET_TYPED_CREATION_INSTRUCTION
