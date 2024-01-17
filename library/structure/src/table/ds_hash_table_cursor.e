note

	description:

		"Cursors for hash table traversals"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2014, Eric Bezault and others"
	license: "MIT License"

class DS_HASH_TABLE_CURSOR [G, K -> detachable HASHABLE]

inherit

	DS_ARRAYED_SPARSE_TABLE_CURSOR [G, K]
		redefine
			container,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_HASH_TABLE [G, K]
			-- Hash table traversed

feature {DS_HASH_TABLE} -- Implementation

	next_cursor: detachable DS_HASH_TABLE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
