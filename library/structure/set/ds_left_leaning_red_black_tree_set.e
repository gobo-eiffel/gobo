indexing

	description:
	"[
		Sets using left-leaning red-black tree algorithm.

		Left-leaning red-black trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_LEFT_LEANING_RED_BLACK_TREE_SET [G]

inherit

	DS_RED_BLACK_TREE_SET [G]
		undefine
			search_node_for_removal,
			successor_for_removal,
			on_node_added,
			on_node_removed,
			on_node_for_removal_not_found
		redefine
			equality_tester,
			root_node
		end

	DS_LEFT_LEANING_RED_BLACK_TREE_CONTAINER [G, G]
		rename
			has_key as has,
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

	equality_tester: KL_COMPARATOR [G]
			-- Comparison criterion for items

feature {NONE} -- Implementation

	root_node: DS_RED_BLACK_TREE_SET_NODE [G]
			-- Root node of tree

end
