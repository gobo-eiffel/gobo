indexing

	description:

		"Cursors for hash table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE_CURSOR [G, K -> HASHABLE]

inherit

	DS_SPARSE_TABLE_CURSOR [G, K]
		redefine
			container
		end

creation

	make

feature -- Access

	container: DS_HASH_TABLE [G, K]
			-- Hash table traversed

end -- class DS_HASH_TABLE_CURSOR
