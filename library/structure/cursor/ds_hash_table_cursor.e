indexing

	description:

		"Cursors for hash table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE_CURSOR [G, K -> HASHABLE]

inherit

	DS_SPARSE_TABLE_CURSOR [G, K]

creation

	make

feature {NONE} -- Initialization

	make (a_table: like container) is
			-- Create a new cursor for `a_table'.
		require
			a_table_not_void: a_table /= Void
		do
			container := a_table
			position := Before_position
		ensure
			container_set: container = a_table
			before: before
		end

feature -- Access

	container: DS_HASH_TABLE [G, K]
			-- Hash table traversed

end -- class DS_HASH_TABLE_CURSOR
