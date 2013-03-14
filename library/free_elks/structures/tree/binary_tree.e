note
	description: "Binary tree: each node may have a left child and a right child"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: binary_tree, tree, fixed_tree;
	representation: recursive, array;
	access: cursor, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class
	BINARY_TREE [G]

inherit
	CELL [G]
		undefine
			copy, is_equal
		end

	TREE [G]
		redefine
			parent,
			is_leaf,
			subtree_has,
			subtree_count,
			fill_list,
			child_remove,
			child_after,
			child_capacity,
			child_start,
			child_forth,
			clone_node
		end

create
	make

feature -- Initialization

	make (v: like item)
			-- Create a root node with value `v'.
		do
			item := v
		ensure
			node_item: item = v
			is_root: is_root
			is_leaf: is_leaf
		end

feature -- Access

	parent: detachable like Current
			-- Parent of current node

	child_index: INTEGER
			-- Index of cursor position

	left_child: like parent
			-- Left child, if any

	right_child: like parent
			-- Right child, if any

	left_item: like item
			-- Value of left child
		require
			has_left: left_child /= Void
		do
			check attached left_child as l then
				Result := l.item
			end
		end

	right_item: like item
			-- Value of right child
		require
			has_right: right_child /= Void
		do
			check attached right_child as r then
				Result := r.item
			end
		end

	first_child: like parent
			-- Left child
		do
			Result := left_child
		end

	last_child: like parent
			-- Right child
		do
			Result := right_child
		end

	child: like parent
			-- Child at cursor position
		do
			inspect
				child_index
			when 1 then
				Result := left_child
			when 2 then
				Result := right_child
			else
				Result := Void
			end
		end

	child_cursor: ARRAYED_LIST_CURSOR
			-- Current cursor position
		do
			create Result.make (child_index)
		end

	left_sibling: like parent
			-- Left neighbor, if any
		local
			p: like parent
		do
			p := parent
			if p /= Void and then p.right_child = Current then
				Result := p.left_child
			end
		end

	right_sibling: like parent
			-- Right neighbor, if any
		local
			p: like parent
		do
			p := parent
			if p /= Void and then p.left_child = Current then
				Result := p.right_child
			end
		end

feature -- Measurement

	arity: INTEGER
			-- Number of children
		do
			if has_left then
				Result := Result + 1
			end
			if has_right then
				Result := Result + 1
			end
		ensure then
			valid_arity: Result <= child_capacity
		end

	child_capacity: INTEGER = 2
			-- Maximum number of children

feature -- Status report

	child_after: BOOLEAN
			-- Is there no valid child position to the right of cursor?
		do
			Result := child_index >= child_capacity + 1
		end

	is_leaf, has_none: BOOLEAN
			-- Are there no children?
		do
			Result := left_child = Void and right_child = Void
		end

	has_left: BOOLEAN
			-- Has current node a left child?
		do
			Result := left_child /= Void
		ensure
			Result = (left_child /= Void)
		end

	has_right: BOOLEAN
			-- Has current node a right child?
		do
			Result := right_child /= Void
		ensure
			Result = (right_child /= Void)
		end

	has_both: BOOLEAN
			-- Has current node two children?
		do
			Result := left_child /= Void and right_child /= Void
		ensure
			Result = (has_left and has_right)
		end

feature	-- Cursor movement

	child_go_to (p: ARRAYED_LIST_CURSOR)
			-- Move cursor to child remembered by `p'.
		do
			child_index := p.index
		end

	child_start
			-- Move to first child.
		do
			if has_left then
				child_index := 1
			elseif has_right then
				child_index := 2
			else
				child_index := 0
			end
		end

	child_finish
			-- Move cursor to last child.
		do
			child_index := arity
		end

	child_forth
			-- Move cursor to next child.
		do
			child_index := child_index + 1
		end

	child_back
			-- Move cursor to previous child.
		do
			child_index := child_index - 1
		end

	child_go_i_th (i: INTEGER)
			-- Move cursor to `i'-th child.
		do
			child_index := i
		end

feature -- Element change

	put_left_child (n: like parent)
			-- Set `left_child' to `n'.
		require
			no_parent: n = Void or else n.is_root
		local
			l: like left_child
		do
			if n /= Void then
				if object_comparison then
					n.compare_objects
				else
					n.compare_references
				end
			end
			l := left_child
			if l /= Void then
				l.attach_to_parent (Void)
			end
			if n /= Void then
				n.attach_to_parent (Current)
			end
			left_child := n
		end

	put_right_child (n: like parent)
			-- Set `right_child' to `n'.
		require
			no_parent: n = Void or else n.is_root
		local
			c: like right_child
		do
			if n /= Void then
				if object_comparison then
					n.compare_objects
				else
					n.compare_references
				end
			end
			c := right_child
			if c /= Void then
				c.attach_to_parent (Void)
			end
			if n /= Void then
				n.attach_to_parent (Current)
			end
			right_child := n
		end

	child_put, child_replace (v: like item)
			-- Put `v' at current child position.
		local
			node: like Current
			c: like child
		do
			c := child
			if c /= Void then
				if object_comparison then
					c.compare_objects
				else
					c.compare_references
				end
				c.put (v)
			else
				create node.make (v)
				if object_comparison then
					node.compare_objects
				end
				put_child (node)
			end
		end

	put_child, replace_child (n: like new_tree)
			-- Put `n' at current child position.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			n.attach_to_parent (Void)
			if not has_left and not has_right then
				child_index := 1
			end

			inspect
				child_index
			when 1 then
				put_left_child (n)
			when 2 then
				put_right_child (n)
			end
		end

feature -- Removal

	remove_left_child
			-- Remove left child.
		local
			l: like left_child
		do
			l := left_child
			if l /= Void then
				l.attach_to_parent (Void)
			end
			left_child := Void
		ensure
			not has_left
		end

	remove_right_child
			-- Remove right child.
		local
			r: like right_child
		do
			r := right_child
			if r /= Void then
				r.attach_to_parent (Void)
			end
			right_child := Void
		ensure
			not has_right
		end

	child_remove
			-- Remove current child.
		local
			c: like left_child
		do
			inspect
		 		child_index
			when 1 then
				c := left_child
				if c /= Void then
					c.attach_to_parent (Void)
				end
				left_child := Void
			when 2 then
				c := right_child
				if c /= Void then
					c.attach_to_parent (Void)
				end
				right_child := Void
			end
		end

	prune (n: like new_tree)
			-- Prune `n' from child nodes.
		do
			if left_child = n then
				remove_left_child
			elseif right_child = n then
				remove_right_child
			end
		end

	wipe_out
			-- Remove all children.
		do
			remove_left_child
			remove_right_child
		end

	forget_left
			-- Forget left sibling.
		local
			p: like parent
		do
			p := parent
			if p /= Void and then p.right_child = Current then
				p.remove_left_child
			end
		end

	forget_right
			-- Forget right sibling.
		local
			p: like parent
		do
			p := parent
			if p /= Void and then p.left_child = Current then
				p.remove_right_child
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children.
		local
			c: like left_child
		do
			Result := new_tree
			c := left_child
			if child_index <= 1 and child_index + n >= 1 and c /= Void then
				Result.put_left_child (c.duplicate_all)
			end
			c := right_child
			if child_index <= 2 and child_index + n >= 2 and c /= Void then
				Result.put_right_child (c.duplicate_all)
			end
		end

	duplicate_all: like Current
		local
			c: like child
		do
			Result := new_tree
			c := left_child
			if c /= Void then
				Result.put_left_child (c.duplicate_all)
			end
			c := right_child
			if c /= Void then
				Result.put_right_child (c.duplicate_all)
			end
		end

feature {BINARY_TREE} -- Implementation

	fill_list (al: ARRAYED_LIST [G])
			-- Fill `al' with all the children's items.
		local
			c: like left_child
		do
			c := left_child
			if c /= Void then
				al.extend (c.item)
				c.fill_list (al)
			end
			c := right_child
			if c /= Void then
				al.extend (c.item)
				c.fill_list (al)
			end
		end

feature {BINARY_TREE} -- Implementation

	clone_node (n: like Current): like Current
			-- Clone node `n'.
		do
			create Result.make (n.item)
			Result.copy_node (n)
		end

	copy_node (n: like Current)
			-- Copy content of `n' except tree data into Current.
		do
			standard_copy (n)
			child_index := 0
			left_child := Void
			right_child := Void
			parent := Void
		end

feature {NONE} -- Implementation

	subtree_has (v: G): BOOLEAN
			-- Does subtree contain `v'?
		local
			c: like left_child
		do
			c := left_child
			if c /= Void then
				Result := c.has (v)
			end
			c := right_child
			if c /= Void and not Result then
				Result := c.has (v)
			end
		end

	subtree_count: INTEGER
			-- Number of items in subtree
		local
			c: like left_child
		do
			c := left_child
			if c /= Void then
				Result := c.count
			end
			c := right_child
			if c /= Void then
				Result := Result + c.count
			end
		end

	fill_subtree (other: TREE [G])
			-- Copy `other' to subtree.
		local
			c: like left_child
		do
			if attached {like Current} other as l_other then
				if not l_other.is_leaf then
					c := l_other.left_child
					if c /= Void then
						put_left_child (c.duplicate_all)
					end
				end
				if l_other.arity >= 2 then
					c := l_other.right_child
					if c /= Void then
						put_right_child (c.duplicate_all)
					end
				end
			end
		end

	new_tree: like Current
			-- New tree node
		do
			create Result.make (item)
			if object_comparison then
				Result.compare_objects
			end
		end

invariant

	tree_is_binary: child_capacity = 2

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
