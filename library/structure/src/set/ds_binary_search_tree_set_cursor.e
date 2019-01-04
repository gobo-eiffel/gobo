note

	description:

		"Cursors for in-order traversal of sets using binary search tree algorithms"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2019, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_BINARY_SEARCH_TREE_SET_CURSOR [G]

inherit

	DS_BILINEAR_SET_CURSOR [G]
		undefine
			item
		redefine
			next_cursor
		end

	DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, G]
		rename
			go_at_or_before_key as go_at_or_before,
			go_at_or_after_key as go_at_or_after
		redefine
			container,
			position,
			next_cursor
		end

create

	make

feature -- Access

	container: DS_BINARY_SEARCH_TREE_SET [G]
			-- Binary search tree set traversed

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: detachable DS_BINARY_SEARCH_TREE_SET_NODE [G]
			-- Current position in the underlying tree

feature {DS_BILINEAR} -- Implementation

	next_cursor: detachable DS_BINARY_SEARCH_TREE_SET_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
