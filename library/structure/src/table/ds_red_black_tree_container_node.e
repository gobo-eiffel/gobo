note

	description:

		"Red-back tree nodes with a color"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2013, Daniel Tuser and others"
	license: "MIT License"

deferred class DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]

feature {DS_RED_BLACK_TREE_CONTAINER, DS_RED_BLACK_TREE_CONTAINER_NODE} -- Access

	uncle: like parent
			-- The other child of `grand_parent'
		require
			grand_parent_not_void: grand_parent /= Void
		do
			check grand_parent_not_void: attached grand_parent as l_grand_parent then
				if parent = l_grand_parent.left_child then
					Result := l_grand_parent.right_child
				else
					Result := l_grand_parent.left_child
				end
			end
		end

feature {DS_RED_BLACK_TREE_CONTAINER, DS_RED_BLACK_TREE_CONTAINER_NODE} -- Status report

	is_red: BOOLEAN
			-- Is the node red?

	is_black: BOOLEAN
			-- Is the node black?
		do
			Result := not is_red
		end

	is_left_child_red: BOOLEAN
			-- Is `left_child' red?
		do
			if attached left_child as l_left_child then
				Result := l_left_child.is_red
			end
		end

	is_left_child_black: BOOLEAN
			-- Is `left_child' black?
		do
			if attached left_child as l_left_child then
				Result := l_left_child.is_black
			end
		end

	is_right_child_red: BOOLEAN
			-- Is `right_child' red?
		do
			if attached right_child as l_right_child then
				Result := l_right_child.is_red
			end
		end

	is_right_child_black: BOOLEAN
			-- Is `right_child' black?
		do
			if attached right_child as l_right_child then
				Result := l_right_child.is_black
			end
		end

	is_ancestor_of (a_node: like Current): BOOLEAN
			-- Is `Current' an ancestor of `a_node'?
		require
			a_node_not_void: a_node /= Void
		local
			l_node: detachable like Current
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
			if attached left_child as l_left_child then
				left := l_left_child.number_of_black_nodes_in_branches
			end
			if attached right_child as l_right_child then
				right := l_right_child.number_of_black_nodes_in_branches
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
