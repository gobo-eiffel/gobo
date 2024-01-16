note

	description:
	"[
		Sets using red-black tree algorithm.

		Red-black trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2019, Daniel Tuser and others"
	license: "MIT License"

class DS_RED_BLACK_TREE_SET [G]

inherit

	DS_BINARY_SEARCH_TREE_SET [G]
		undefine
			on_node_added,
			on_root_node_removed,
			on_node_removed
		redefine
			new_cursor,
			equality_tester,
			root_node
		end

	DS_RED_BLACK_TREE_CONTAINER [G, G]
		rename
			has_key as has,
			has_void_key as has_void,
			key_comparator as equality_tester,
			key_comparator_settable as equality_tester_settable,
			set_key_comparator as set_equality_tester
		undefine
			cursor_search_forth,
			cursor_search_back,
			has_void
		redefine
			equality_tester,
			root_node
		end

create

	make

feature -- Access

	new_cursor: DS_RED_BLACK_TREE_SET_CURSOR [G]
			-- New external cursor
		do
			create Result.make (Current)
		end

	equality_tester: KL_COMPARATOR [G]
			-- Comparison criterion for items

feature {NONE} -- Implementation

	root_node: detachable DS_RED_BLACK_TREE_SET_NODE [G]
			-- Root node of tree

end
