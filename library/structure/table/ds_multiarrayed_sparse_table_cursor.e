note

	description:

		"Cursors for multi-arrayed sparse table traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_SPARSE_TABLE_CURSOR [G, K]

inherit

	DS_SPARSE_TABLE_CURSOR [G, K]
		redefine
			container,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_MULTIARRAYED_SPARSE_TABLE [G, K]
			-- Multi-arrayed sparse table traversed

feature {DS_MULTIARRAYED_SPARSE_TABLE} -- Implementation

	next_cursor: DS_MULTIARRAYED_SPARSE_TABLE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
