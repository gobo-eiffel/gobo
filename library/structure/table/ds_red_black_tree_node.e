indexing

	description:

		"Red-back tree nodes with a color"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_RED_BLACK_TREE_NODE [G, K]

inherit

	DS_BINARY_SEARCH_TREE_NODE [G, K]
		redefine
			make
		end

	DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]

create {DS_RED_BLACK_TREE}

	make

feature {NONE} -- Initialization

	make (a_item: like item; a_key: like key) is
			-- Create a new red black tree node.
		do
			Precursor (a_item, a_key)
			is_red := True
		ensure then
			is_red: is_red
		end

end
