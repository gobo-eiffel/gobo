indexing

	description:

		"Cursors for multi-arrayed hash table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_MULTIARRAYED_HASH_TABLE_CURSOR [G, K -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_TABLE_CURSOR [G, K]
		redefine
			container
		end

creation

	make

feature -- Access

	container: DS_MULTIARRAYED_HASH_TABLE [G, K]
			-- Hash table traversed

end -- class DS_MULTIARRAYED_HASH_TABLE_CURSOR
