indexing

	description:

		"Cursors for multi-arrayed hash set traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_MULTIARRAYED_HASH_SET_CURSOR [G -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_SET_CURSOR [G]
		redefine
			container
		end

creation

	make

feature -- Access

	container: DS_MULTIARRAYED_HASH_SET [G]
			-- Hash set traversed

end -- class DS_MULTIARRAYED_HASH_SET_CURSOR
