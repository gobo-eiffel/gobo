note

	description:

		"AVL tree nodes with a balance factor"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_AVL_TREE_CONTAINER_NODE [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]

feature {DS_AVL_TREE_CONTAINER, DS_AVL_TREE_CONTAINER_NODE} -- Access

	balance: INTEGER
			-- Balance of current node
			--
			-- Note: For a balanced AVL tree this value is either -1, 0 or 1 for all nodes.

feature {DS_AVL_TREE_CONTAINER, DS_AVL_TREE_CONTAINER_NODE} -- Setting

	set_balance (a_balance: INTEGER)
			-- Set `balance' to `a_balance'.
		require
			range: -1 <= a_balance and a_balance <= 1
			definition: a_balance = height_of_right_child - height_of_left_child
		do
			balance := a_balance
		ensure
			balance_set: balance = a_balance
		end

invariant

	correct_balance_value: -1 <= balance and balance <= 1

end
