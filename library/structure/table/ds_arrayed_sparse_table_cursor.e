indexing

	description:

		"Cursors for arrayed sparse table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_SPARSE_TABLE_CURSOR [G, K]

inherit

	DS_SPARSE_TABLE_CURSOR [G, K]
		redefine
			container
		end

creation

	make

feature -- Access

	container: DS_ARRAYED_SPARSE_TABLE [G, K]
			-- Arrayed sparse table traversed

end -- class DS_ARRAYED_SPARSE_TABLE_CURSOR
