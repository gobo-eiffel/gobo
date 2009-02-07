note

	description: "[
		Trees where each node has a fixed number of children
		(The number of children is arbitrary but cannot be
		changed once the node has been created
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."

	names: fixed_tree, tree, fixed_list;
	representation: recursive, array;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class FIXED_TREE [G] inherit

	CELL [G]
		undefine
			copy, is_equal
		end

	TREE [G]
		rename
			empty as fl_empty
		export
			{NONE} fl_empty
		undefine
			child_off, child_after, child_before,
			child_item
		redefine
			parent, attach_to_parent, child_capacity, clone_node
		end

create
	make,
	make_filled

feature -- Initialization

	make (n: INTEGER; v: G)
			-- Create node with `n' void children and item `v'.
		require
			valid_number_of_children: n >= 0
		do
			arity := 0
			create fixed_list.make (n)
			replace (v)
		ensure
			node_item: item = v
			node_arity: arity = 0
		end

	make_filled (n: INTEGER; v: G)
			-- Create node with `n' void children and item `v'.
		require
			valid_number_of_children: n >= 0
		local
			l_default: ?G
		do
			check l_default_attached: l_default /= Void end
			arity := n
			create fixed_list.make_filled (n)
			replace (v)
				-- In order to ensure that no child is Void, we manually fill
				-- the tree with default values.
			from
				fixed_list.start
			until
				fixed_list.after
			loop
				replace_child (create {like Current}.make (0, l_default))
				fixed_list.forth
			end
		ensure
			node_item: item = v
			node_arity: arity = n
		end

feature -- Access

	parent: ?FIXED_TREE [G]
			-- Parent of current node

	child_item: like item
			-- Item of active child
		local
			c: like child
		do
			c := child
			check
				c_attached: c /= Void
			end
			Result := c.item
		end

	left_sibling: like parent
			-- Left neighbor, if any
		local
			p: like parent
		do
			if position_in_parent > 1 then
				p := parent
				if p /= Void then
					Result := p.array_item (position_in_parent - 1)
				end
			end
		end

	right_sibling: like parent
			-- Right neighbor, if any
		local
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				Result := p.array_item (position_in_parent + 1)
			end
		end

feature -- Status report

	child_contractable: BOOLEAN
			-- May items be removed?
		do
			Result := not child_off
		ensure
			Result = not child_off
		end

	full: BOOLEAN = True
			-- Is tree full?

feature -- Element change

	child_put, child_replace (v: like item)
			-- Replace current child item with `v'
		local
			c: like child
		do
			c := child
			if c /= Void then
				if object_comparison then
					c.compare_objects
				else
					c.compare_references
				end
				c.replace (v)
			end
		end

	put_left (v: like item)
			-- Add `v' to the left of current node.
		require
			is_not_root: not is_root
			has_left_sibling: left_sibling /= Void
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				p.child_go_i_th (position_in_parent - 1)
				p.child_replace (v)
			end
		ensure
			item_put: {l: like left_sibling} left_sibling and then l.item = v
		end

	put_right (v: like item)
			-- Add `v' to the right of current node.
		require
			is_not_root: not is_root
			has_right_sibling: right_sibling /= Void
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				p.child_go_i_th (position_in_parent + 1)
				p.child_replace (v)
			end
		ensure
			item_put: {r: like right_sibling} right_sibling and then r.item = v
		end

	put_child (n: like new_node)
			-- Make `n' the node's child.
		require else
			not_full: arity < capacity
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			arity := arity + 1
			fixed_list.extend (n)
			n.attach_to_parent (Current)
		ensure then
			child_replaced: n.parent = Current
		end

	replace_child (n: like new_node)
			-- Make `n' the node's child.
		do
			if object_comparison then
				n.compare_objects
			else
				n.compare_references
			end
			fl_replace (n)
			n.attach_to_parent (Current)
		ensure then
			child_replaced: n.parent = Current
		end

	put_left_sibling (other: like new_node)
			-- Make `other' the left sibling of current node.
		require
			is_not_root: not is_root
			has_left_sibling: left_sibling /= Void
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				p.child_go_i_th (position_in_parent - 1)
				p.replace_child (other)
			end
		ensure
			left_sibling_replaced: left_sibling = other
		end

	put_right_sibling (other: like new_node)
			-- Make `other' the right sibling of current node.
		require
			is_not_root: not is_root
			has_right_sibling: right_sibling /= Void
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				p.child_go_i_th (position_in_parent + 1)
				p.replace_child (other)
			end
		ensure
			right_sibling_replaced: right_sibling = other
		end

feature -- Removal

	remove_child
			-- Remove active child.
		do
			fl_replace (Void)
		ensure then
			child_removed: child = Void
		end

	forget_left
			-- Forget all left siblings.
		local
			i: INTEGER
			old_idx: INTEGER
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				old_idx := p.child_index
				from
					i := 1
				until
					i = position_in_parent
				loop
					p.child_go_i_th (i)
					p.remove_child
					i := i + 1
				end
				p.child_go_i_th (old_idx)
			end
		end

	forget_right
			-- Forget all right siblings.
		local
			i: INTEGER
			old_idx: INTEGER
			p: like parent
		do
			p := parent
			if p /= Void and then position_in_parent < p.arity then
				old_idx := p.child_index
				from
					i := position_in_parent + 1
				until
					i > p.arity
				loop
					p.child_go_i_th (i)
					p.remove_child
					i := i + 1
				end
				p.child_go_i_th (old_idx)
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children.
		local
			counter: INTEGER
			pos: CURSOR
			c: like child
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
			until
				child_after or else (counter = n)
			loop
				c := child
				if c /= Void then
					Result.replace_child (c.duplicate_all)
				end
				Result.child_forth
				child_forth
				counter := counter + 1
			end
			child_go_to (pos)
		end

feature {FIXED_TREE} -- Implementation

	new_node: like Current
			-- Instance of class `like Current'.
			-- New allocated node of arity `arity'
			-- and node value `item'
		do
			create Result.make (arity, item)
		end

	duplicate_all: like Current
			-- Copy of sub-tree including all children
		local
			pos: CURSOR
			c: like child
		do
			from
				Result := new_node
				pos := child_cursor
				Result.child_start
				child_start
			until
				child_off
			loop
				c := child
				if c /= Void then
					Result.replace_child (c.duplicate_all)
				end
				Result.child_forth
				child_forth
			end
			child_go_to (pos)
		end

	fill_subtree (other: TREE [G])
			-- Fill children with children of `other'
		local
			temp: like parent
			c: ?TREE [G]
		do
			from
				other.child_start
				child_start
			until
				child_after
			loop
				c := other.child
				if c /= Void then
					create temp.make (other.arity, other.child_item)
					temp.fill_subtree (c)
					replace_child (temp)
				end
				child_forth
				other.child_forth
			end
		end

	attach_to_parent (n: like parent)
			-- Make `n' parent of current node
			-- and set `position_in_parent'.
		do
			parent := n
			if n /= Void then
				position_in_parent := n.child_index
			else
				position_in_parent := 0
			end
		end

feature {NONE} -- Implementation

	position_in_parent: INTEGER
			-- Position of current node in parent

	extendible: BOOLEAN = False;
			-- May new items be added?

feature {FIXED_TREE} -- Implementation

	fixed_list: FIXED_LIST [?FIXED_TREE [G]]

	set_fixed_list (a_list: like fixed_list)
			-- Set `fixed_list' with `a_list'
		require
			non_void_list: a_list /= Void
		do
			fixed_list := a_list
		ensure
			fixed_list_set: fixed_list = a_list
		end

feature -- Redefinition

	child_capacity: INTEGER
			-- Maximal number of children
		do
			Result := fixed_list.count
		end

feature {FIXED_TREE} -- Implementation

	clone_node (n: like Current): like Current
			-- Clone node `n'.
		do
			create Result.make (n.arity, n.item)
			Result.copy_node (n)
		end

	copy_node (n: like Current)
			-- Copy content of `n' except tree data into Current.
		local
			l_list: like fixed_list
		do
				-- Store values that may be overriden by `standard_copy'.
			l_list := fixed_list
				-- Perform copy.
			standard_copy (n)
				-- Restore values that we wanted to preserve.
			arity := 0
			fixed_list := l_list
			position_in_parent := 0
			parent := Void
		end

feature -- Access

	child: like parent
		do
			Result := fixed_list.item
		end

	array_item (n: INTEGER): ?FIXED_TREE [G]
		do
			Result := fixed_list.i_th (n)
		end

	last_child: like first_child
		do
			Result := fixed_list.last
		end

	first_child: like parent
		do
			Result := fixed_list.first
		end

	search_child (v: FIXED_TREE [like item])
		do
			fixed_list.search (v)
		end

	arity: INTEGER

	child_start
		do
			fixed_list.start
		end

	child_finish
		do
			fixed_list.finish
		end

	child_forth
		do
			fixed_list.forth
		end

	child_back
		do
			fixed_list.back
		end

	child_go_i_th (i: INTEGER)
		do
			fixed_list.go_i_th (i)
		end

	child_index: INTEGER
		do
			Result := fixed_list.index
		end

	child_off: BOOLEAN
		do
			Result := fixed_list.off
		end

	child_after: BOOLEAN
		do
			Result := fixed_list.after
		end

	child_before: BOOLEAN
		do
			Result := fixed_list.before
		end

	child_cursor: CURSOR
		do
			Result := fixed_list.cursor
		end

	child_go_to (p: CURSOR)
		do
			fixed_list.go_to (p)
		end

	index_of (v: FIXED_TREE [like item]; i: INTEGER): INTEGER
		do
			Result := fixed_list.index_of (v, i)
		end

	prune (n: like new_node)
		do
		end

	wipe_out
		do
			create fixed_list.make (fixed_list.count)
		end

	put_i_th (v: FIXED_TREE [like item]; n: INTEGER)
		do
			fixed_list.put_i_th (v, n)
		end

	array_make (min_index: INTEGER; max_index: INTEGER)
		do
			fixed_list.array_make (min_index, max_index)
		end

	capacity: INTEGER
		do
			Result := fixed_list.capacity
		end

feature {NONE} -- private access fixed_list

	fl_make (n: INTEGER)
		do
			fixed_list.make (n)
		end

	fl_make_filled (n: INTEGER)
		do
			fixed_list.make_filled (n)
		end

	fl_extend (v: FIXED_TREE [like item])
		do
			fixed_list.extend (v)
		end

	fl_duplicate (n: INTEGER): FIXED_LIST [?like Current]
		do
			Result := fixed_list.duplicate (n)
		end

	fl_remove
		do
			fixed_list.remove
		end

	fl_object_comparison: BOOLEAN
		do
			Result := fixed_list.object_comparison
		end

	fl_full: BOOLEAN
		do
			Result := fixed_list.full
		end

	fl_extendible: BOOLEAN
		do
			Result := fixed_list.extendible
		end

	fl_put (v: FIXED_TREE [like item])
		do
			fixed_list.put (v)
		end

	fl_replace (v: ?FIXED_TREE [G])
		do
			fixed_list.replace (v)
		end

	fl_fill (other: CONTAINER [FIXED_TREE [G]])
		do
			--fixed_list.fill (other)
		end

	fl_lin_rep: LINEAR [?FIXED_TREE [G]]
		do
			Result := fixed_list.linear_representation
		end

	fl_has (v: FIXED_TREE [like item]): BOOLEAN
		do
			Result := fixed_list.has (v)
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class FIXED_TREE
