note

	description:

		"Red-back tree nodes with a color"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_RED_BLACK_TREE_SET_NODE [G]

inherit

	DS_BINARY_SEARCH_TREE_SET_NODE [G]
		redefine
			make
		end

	DS_RED_BLACK_TREE_CONTAINER_NODE [G, G]
		rename
			key as item,
			set_key as set_item
		end

create {DS_RED_BLACK_TREE_SET}

	make

feature {NONE} -- Initialization

	make (a_item: like item)
			-- Create a red-black tree node.
		do
			item := a_item
			is_red := True
		ensure then
			is_red: is_red
		end

end
