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
			container, next_cursor
		end

creation

	make

feature -- Access

	container: DS_MULTIARRAYED_HASH_TABLE [G, K]
			-- Hash table traversed

feature {DS_MULTIARRAYED_HASH_TABLE} -- Implementation

	next_cursor: DS_MULTIARRAYED_HASH_TABLE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end -- class DS_MULTIARRAYED_HASH_TABLE_CURSOR
