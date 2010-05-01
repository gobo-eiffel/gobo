note

	description:

		"Cursors for in-order traversal of binary search trees"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_BINARY_SEARCH_TREE_CURSOR [G, K]

inherit

	DS_BILINEAR_TABLE_CURSOR [G, K]
		undefine
			item
		redefine
			next_cursor
		end

	DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
		export
			{ANY}
				key
		redefine
			container,
			position,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_BINARY_SEARCH_TREE [G, K]
			-- Binary search tree traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: DS_BINARY_SEARCH_TREE_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_BINARY_SEARCH_TREE_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
