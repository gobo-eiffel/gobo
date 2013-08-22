note

	description:

		"Cursors for arrayed sparse set traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_ARRAYED_SPARSE_SET_CURSOR [G]

inherit

	DS_SPARSE_SET_CURSOR [G]
		redefine
			container,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_ARRAYED_SPARSE_SET [G]
			-- Arrayed sparse set traversed

feature {DS_ARRAYED_SPARSE_SET} -- Implementation

	next_cursor: detachable DS_ARRAYED_SPARSE_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
