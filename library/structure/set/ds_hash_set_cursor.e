indexing

	description:

		"Cursors for hash set traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_SET_CURSOR [G -> HASHABLE]

inherit

	DS_SPARSE_SET_CURSOR [G]

creation

	make

feature {NONE} -- Initialization

	make (a_set: like container) is
			-- Create a new cursor for `a_set'.
		require
			a_set_not_void: a_set /= Void
		do
			container := a_set
			position := Before_position
		ensure
			container_set: container = a_set
			before: before
		end

feature -- Access

	container: DS_HASH_SET [G]
			-- Hash set traversed

end -- class DS_HASH_SET_CURSOR
