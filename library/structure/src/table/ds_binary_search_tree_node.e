note

	description:
	"[
		Binary search tree nodes which associate keys and items.
		Nodes may be linked to other binary search tree nodes.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_BINARY_SEARCH_TREE_NODE [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]

create {DS_BINARY_SEARCH_TREE}

	make

feature {NONE} -- Initialization

	make (a_item: like item; a_key: like key)
			-- Create a binary search tree node which associates
			-- `a_key' with `a_item'.
		do
			item := a_item
			key := a_key
		ensure
			item_set: item = a_item
			key_set: key = a_key
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE, DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR} -- Access

	item: G
			-- Item of current tree node

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Duplication

	copy_item_and_key_to (other: like Current)
			-- Copy `item' and `key' to `other'.
		do
			other.set_item (item)
			other.set_key (key)
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Status setting

	set_item (a_item: like item)
			-- Set `item' to `a_item'.
		do
			item := a_item
		end

end
