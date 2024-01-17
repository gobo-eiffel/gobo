note

	description:

		"Cursors for in-order traversal of sets using red-black tree algorithms"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2009-2013, Daniel Tuser and others"
	license: "MIT License"

class DS_RED_BLACK_TREE_SET_CURSOR [G]

inherit

	DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, G]
		redefine
			container,
			position,
			next_cursor
		end

	DS_BINARY_SEARCH_TREE_SET_CURSOR [G]
		redefine
			container,
			position,
			next_cursor
		select
			go_at_or_before,
			go_at_or_after
		end

create

	make

feature -- Access

	container: DS_RED_BLACK_TREE_SET [G]
			-- Binary search tree traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: detachable DS_RED_BLACK_TREE_SET_NODE [G]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: detachable DS_RED_BLACK_TREE_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
