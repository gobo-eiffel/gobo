indexing

	description:

		"Cursors for sparse set traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_SPARSE_SET_CURSOR [G]

inherit

	DS_SPARSE_CONTAINER_CURSOR [G, G]
		redefine
			container, next_cursor
		end

	DS_SET_CURSOR [G]
		undefine
			off
		redefine
			next_cursor
		end

create

	make

feature -- Access

	container: DS_SPARSE_SET [G]
			-- Set traversed

feature {DS_SPARSE_SET} -- Implementation

	next_cursor: DS_SPARSE_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
