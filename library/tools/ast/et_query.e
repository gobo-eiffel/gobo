indexing

	description:

		"Eiffel queries (functions or attributes)"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_QUERY

inherit

	ET_FEATURE

feature -- Access

	type: ET_TYPE
			-- Return type

invariant

	type_not_void: type /= Void

end -- class ET_QUERY
