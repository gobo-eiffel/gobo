indexing

	description:

		"Cursors for set traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SET_CURSOR [G]

inherit

	DS_LINEAR_CURSOR [G]
		redefine
			container
		end

feature -- Access

	container: DS_SET [G] is
			-- Set traversed
		deferred
		end

end -- class DS_SET_CURSOR
