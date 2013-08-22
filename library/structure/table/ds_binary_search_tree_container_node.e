note

	description:
	"[
		Binary search tree nodes which associate keys and items.
		Nodes may be linked to other binary search tree nodes.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2013, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE, DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR} -- Access

	item: G
			-- Item
		deferred
		end

	key: K
			-- Key

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Access

	parent: detachable like Current
			-- Parent

	left_child: like parent
			-- First child

	right_child: like parent
			-- Second child

	grand_parent: like parent
			-- Parent of `parent';
			-- May be Void
		do
			if attached parent as l_parent then
				Result := l_parent.parent
			else
				Result := Void
			end
		end
		
	parent_left_child: like left_child
			-- Left child of `parent'
			-- May be Void
		do
			if attached parent as l_parent then
				Result := l_parent.left_child
			end
		end

	parent_right_child: like right_child
			-- Right child of `parent'
			-- May be Void
		do
			if attached parent as l_parent then
				Result := l_parent.right_child
			end
		end

	left_child_left_child: like left_child
			-- Left child of `left_child'
			-- May be Void
		do
			if attached left_child as l_left_child then
				Result := l_left_child.left_child
			end
		end

	left_child_right_child: like right_child
			-- Right child of `left_child'
			-- May be Void
		do
			if attached left_child as l_left_child then
				Result := l_left_child.right_child
			end
		end

	right_child_left_child: like left_child
			-- Left child of `right_child'
			-- May be Void
		do
			if attached right_child as l_right_child then
				Result := l_right_child.left_child
			end
		end

	right_child_right_child: like right_child
			-- Right child of `right_child'
			-- May be Void
		do
			if attached right_child as l_right_child then
				Result := l_right_child.right_child
			end
		end
		
feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Measurement

	count: INTEGER
			-- Number of nodes, including the current node and
			-- recursively the number of nodes in its children
		do
			Result := 1
			if attached left_child as l_left_child then
				Result := Result + l_left_child.count
			end
			if attached right_child as l_right_child then
				Result := Result + l_right_child.count
			end
		ensure
			count_positive: Result > 0
		end

	height: INTEGER
			-- Height of the branch in which `Current' is seen as root node
		do
			Result := height_of_left_child.max (height_of_right_child) + 1
		ensure
			height_positive: Result > 0
		end

	height_of_left_child: INTEGER
			-- Height of the branch where `left_child' is seen as root node
		do
			if attached left_child as l_left_child then
				Result := l_left_child.height
			end
		ensure
			height_not_negative: Result >= 0
			zero_iff_child_is_void: (left_child = Void) = (Result = 0)
		end

	height_of_right_child: INTEGER
			-- Height of branch where `right_child' is seen as root node
		do
			if attached right_child as l_right_child then
				Result := l_right_child.height
			end
		ensure
			height_not_negative: Result >= 0
			zero_iff_child_is_void: (right_child = Void) = (Result = 0)
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Status report

	sorted (a_comparator: KL_COMPARATOR [K]): BOOLEAN
			-- Definition: A binary search tree is sorted iff the `key' of the `left_child'
			-- of every node in the tree is less than the `key' of the node itself and the `key'
			-- of the `right_child' is greater than the `key' of the node itself. `Void' is
			-- the smallest key.
		require
			a_comparator_not_void: a_comparator /= Void
		local
			l_left_child_key: like key
		do
			if key = Void then
				if left_child = Void then
					if attached right_child as l_right_child then
						Result := l_right_child.sorted (a_comparator)
					else
						Result := True
					end
				end
			else
				if attached left_child as l_left_child then
					l_left_child_key := l_left_child.key
					if l_left_child_key /= Void then
						Result := a_comparator.less_than (l_left_child_key, key)
					else
						Result := True
					end
					Result := Result and then l_left_child.sorted (a_comparator)
				else
					Result := True
				end
				if Result then
					if attached right_child as l_right_child then
						Result := a_comparator.greater_than (l_right_child.key, key) and then l_right_child.sorted (a_comparator)
					else
						Result := True
					end
				end
			end
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Duplication

	copy_item_and_key_to (other: like Current)
			-- Copy `item' and `key' to `other'.
		require
			other_not_void: other /= Void
		deferred
		ensure
			item_set: other.item = item
			key_set: other.key = key
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER, DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Setting

	set_key (a_key: like key)
			-- Set `key' to `a_key'.
		do
			key := a_key
		ensure
			key_set: key = a_key
		end

	set_item (a_item: like item)
			-- Set `item' to `a_item'.
		deferred
		ensure
			item_set: item = a_item
		end

	set_left_child (a_child: like parent)
			-- Set `left_child' to `a_child'.
		require
			a_child_orphan: a_child /= Void implies a_child.parent = Void
		do
				-- The current child will not any more have `Current' as `parent'.
			if attached left_child as l_left_child then
				l_left_child.set_parent (Void)
			end
			left_child := a_child
			if a_child /= Void then
				a_child.set_parent (Current)
			end
		ensure
			left_child_set: left_child = a_child
			correct_parent: attached left_child as l_left_child implies l_left_child.parent = Current
			old_child_has_void_parent: attached (old left_child) as l_old_left_child implies l_old_left_child.parent = Void
		end

	set_right_child (a_child: like parent)
			-- Set `right_child' to `a_child'.
		require
			a_child_orphan: a_child /= Void implies a_child.parent = Void
		do
				-- The current child will not any more have `Current' as `parent'.
			if attached right_child as l_right_child then
				l_right_child.set_parent (Void)
			end
			right_child := a_child
			if a_child /= Void then
				a_child.set_parent (Current)
			end
		ensure
			right_child_set: right_child = a_child
			correct_parent: attached right_child as l_right_child implies l_right_child.parent = Current
			old_child_has_void_parent: attached (old right_child) as l_old_right_child implies l_old_right_child.parent = Void
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER_NODE} -- Setting

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		require
			current_is_already_child_of_a_parent: a_parent /= Void implies (a_parent.left_child = Current or a_parent.right_child = Current)
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

end
