note

	description:

		"Red-back tree nodes with a color"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]

feature {DS_RED_BLACK_TREE_CONTAINER, DS_RED_BLACK_TREE_CONTAINER_NODE} -- Access

	grand_parent: like parent
			-- Parent of `parent';
			-- May be Void
		do
			if parent /= Void then
				Result := parent.parent
			else
				Result := Void
			end
		end

	uncle: like parent
			-- The other child of `grand_parent'
		require
			grand_parent_not_void: grand_parent /= Void
		local
			tmp_grand_parent: like parent
		do
			tmp_grand_parent := grand_parent
			if parent = tmp_grand_parent.left_child then
				Result := tmp_grand_parent.right_child
			else
				Result := tmp_grand_parent.left_child
			end
		end

feature {DS_RED_BLACK_TREE_CONTAINER} -- Status report

	is_red: BOOLEAN
			-- Is the node red?

	is_black: BOOLEAN
			-- Is the node black?
		do
			Result := not is_red
		end

	is_ancestor_of (a_node: like Current): BOOLEAN
			-- Is `Current' an ancestor of `a_node'?
		require
			a_node_not_void: a_node /= Void
		local
			l_node: like Current
		do
			from
				l_node := Current
			until
				Result or else l_node = Void
			loop
				Result := l_node = a_node
				l_node := l_node.parent
			end
		end

feature {DS_RED_BLACK_TREE_CONTAINER} -- Status setting

	set_is_red (a_bool: BOOLEAN)
			-- Set `is_red' to `a_bool'.
		do
			is_red := a_bool
		ensure
			set_is_red: is_red = a_bool
		end

feature {DS_RED_BLACK_TREE_CONTAINER, DS_RED_BLACK_TREE_CONTAINER_NODE} -- Measurement

	number_of_black_nodes_in_branches: INTEGER
			-- Number of black nodes in all branches if they are all equal,
			-- otherwise -1
		local
			left, right: INTEGER
		do
			if left_child /= Void then
				left := left_child.number_of_black_nodes_in_branches
			end
			if right_child /= Void then
				right := right_child.number_of_black_nodes_in_branches
			end
			if left = right then
				Result := left
				if is_black then
					Result := Result + 1
				end
			else
				Result := -1
			end
		end

end
