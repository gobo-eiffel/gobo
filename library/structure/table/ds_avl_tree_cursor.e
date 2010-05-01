note

	description:

		"Cursors for in-order traversal of avl trees"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_AVL_TREE_CURSOR [G, K]

inherit

	DS_AVL_TREE_CONTAINER_CURSOR [G, K]
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

	container: DS_AVL_TREE [G, K]
			-- Binary search tree traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: DS_AVL_TREE_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_AVL_TREE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
