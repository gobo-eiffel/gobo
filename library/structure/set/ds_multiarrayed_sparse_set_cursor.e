indexing

	description:

		"Cursors for multi-arrayed sparse set traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_SPARSE_SET_CURSOR [G]

inherit

	DS_SPARSE_SET_CURSOR [G]
		redefine
			container, next_cursor
		end

create

	make

feature -- Access

	container: DS_MULTIARRAYED_SPARSE_SET [G]
			-- Multi-arrayed sparse set traversed

feature {DS_MULTIARRAYED_SPARSE_SET} -- Implementation

	next_cursor: DS_MULTIARRAYED_SPARSE_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
