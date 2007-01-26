indexing

	description:

		"Cursors for hash set traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASH_SET_CURSOR [G -> HASHABLE]

inherit

	DS_ARRAYED_SPARSE_SET_CURSOR [G]
		redefine
			container, next_cursor
		end

create

	make

feature -- Access

	container: DS_HASH_SET [G]
			-- Hash set traversed

feature {DS_HASH_SET} -- Implementation

	next_cursor: DS_HASH_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
