﻿note

	description:

		"Cursors for in-order traversal of containers using avl tree algorithms"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2009-2013, Daniel Tuser and others"
	license: "MIT License"

deferred class DS_AVL_TREE_CONTAINER_CURSOR [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
		redefine
			container,
			position,
			next_cursor
		end

feature -- Access

	container: DS_AVL_TREE_CONTAINER [G, K]
			-- Container traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: detachable DS_AVL_TREE_CONTAINER_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: detachable DS_AVL_TREE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
