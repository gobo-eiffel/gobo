indexing

	description:

		"Cursors for in-order traversal of containers using red-black tree algorithms"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
		redefine
			container,
			position,
			next_cursor
		end

feature -- Access

	container: DS_RED_BLACK_TREE_CONTAINER [G, K]
			-- Container traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
