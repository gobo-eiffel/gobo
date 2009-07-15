indexing

	description:

		"Cursors for in-order traversal of red-black trees"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date: 2008-09-28 20:40:54 +0200 (Sun, 28 Sep 2008) $"
	revision: "$Revision: 6526 $"

class DS_RED_BLACK_TREE_CURSOR [G, K]

inherit

	DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, K]
		redefine
			container,
			position,
			next_cursor
		end

	DS_BINARY_SEARCH_TREE_CURSOR [G, K]
		redefine
			container,
			position,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_RED_BLACK_TREE [G, K]
			-- Binary search tree traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: DS_RED_BLACK_TREE_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_RED_BLACK_TREE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
