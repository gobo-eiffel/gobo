indexing

	description:
		"Trees, without commitment to a particular representation"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: tree;
	access: cursor, membership;
	representation: recursive;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class TREE [G] inherit

	CONTAINER [G]
		redefine
			copy, is_equal
		end

feature -- Access

	parent: ?TREE [G]
			-- Parent of current node

	child: like parent is
			-- Current child node
		require
			readable: readable_child
		deferred
		end

	item: G is
			-- Item in current node
		deferred
		end

	child_item: like item is
			-- Item in current child node
		require
			readable: child_readable
		local
			c: like child
		do
			c := child
			if c /= Void then
				Result := c.item
			end
		end

	child_cursor: CURSOR is
			-- Current cursor position
		deferred
		end

	child_index: INTEGER is
			-- Index of current child
		deferred
		ensure
			valid_index: Result >= 0 and Result <= arity + 1
		end

	first_child: like parent is
			-- Leftmost child
		require
			is_not_leaf: not is_leaf
		deferred
		end

	last_child: like first_child is
			-- Right most child
		require
			is_not_leaf: not is_leaf
		deferred
		end

	left_sibling: like parent is
			-- Left neighbor (if any)
		require
			is_not_root: not is_root
		deferred
		ensure
			is_sibling: Result /= Void implies is_sibling (Result)
			right_is_current: (Result /= Void) implies (Result.right_sibling = Current)
		end

	right_sibling: like parent is
			-- Right neighbor (if any)
		require
			is_not_root: not is_root
		deferred
		ensure
			is_sibling: Result /= Void implies is_sibling (Result)
			left_is_current: (Result /= Void) implies (Result.left_sibling = Current)
		end

feature -- Measurement

	arity: INTEGER is
			-- Number of children
		deferred
		end

	child_capacity: INTEGER is
			-- Maximal number of children
		do
			Result := arity
		end

	count: INTEGER is
			-- Number of items
		do
			Result := subtree_count + 1
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Does `other' contain the same elements?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if Current = other then
				Result := True
			else
				Result := (is_empty = other.is_empty) and
						(object_comparison = other.object_comparison) and
						(child_capacity = other.child_capacity)
				if Result and not is_empty then
					Result := tree_is_equal (Current, other)
				end
			end
		end

	node_is_equal (other: like Current): BOOLEAN is
			-- Is `other' equal to Current?
		require
			other_not_void: other /= Void
		do
			if object_comparison then
				Result := equal (item, other.item)
			else
				Result := item = other.item
			end
		end

feature -- Status report

	readable: BOOLEAN is True

	child_readable: BOOLEAN is
			-- Is there a current `child_item' to be read?
		do
			Result := not child_off and then (child /= Void)
		end

	readable_child: BOOLEAN is
			-- Is there a current child to be read?
		do
			Result := not child_off
		end

	writable: BOOLEAN is True
			-- Is there a current item that may be modified?

	child_writable: BOOLEAN is
			-- Is there a current `child_item' that may be modified?
		do
			Result := not child_off and then (child /= Void)
		end

	writable_child: BOOLEAN is
			-- Is there a current child that may be modified?
		do
			Result := not child_off
		end

	child_off: BOOLEAN is
			-- Is there no current child?
		do
			Result := child_before or child_after
		end

	child_before: BOOLEAN is
			-- Is there no valid child position to the left of cursor?
		do
			Result := child_index = 0
		end

	child_after: BOOLEAN is
			-- Is there no valid child position to the right of cursor?
		do
			Result := child_index = child_capacity + 1
		end

	is_empty: BOOLEAN is
			-- Is structure empty of items?
		do
			Result := False
		end

	is_leaf: BOOLEAN is
			-- Are there no children?
		do
			Result := arity = 0
		end

	is_root: BOOLEAN is
			-- Is there no parent?
		do
			Result := parent = Void
		end

	child_isfirst: BOOLEAN is
			-- Is cursor under first child?
		do
			Result := not is_leaf and child_index = 1
		ensure
			not_is_leaf: Result implies not is_leaf
		end

	child_islast: BOOLEAN is
			-- Is cursor under last child?
		do
			Result := not is_leaf and child_index = child_capacity
		ensure
			not_is_leaf: Result implies not is_leaf
		end

	valid_cursor_index (i: INTEGER): BOOLEAN is
			-- Is `i' correctly bounded for cursor movement?
		do
			Result := (i >= 0) and (i <= child_capacity + 1)
		ensure
			valid_cursor_index_definition: Result = (i >= 0) and
				(i <= child_capacity + 1)
		end

	has (v: G): BOOLEAN is
			-- Does subtree include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i: G
		do
			if object_comparison then
				i := item
				Result := v /= Void and then i /= Void and then (v.is_equal (i) or else subtree_has (v))
			else
				Result := v = item or else subtree_has (v)
			end
		end

	is_sibling (other: like parent): BOOLEAN is
			-- Are current node and `other' siblings?
		require
			other_exists: other /= Void
		do
			Result := not is_root and other.parent = parent
		ensure
			not_root: Result implies not is_root
			other_not_root: Result implies not other.is_root
			same_parent: Result = not is_root and other.parent = parent
		end

feature -- Cursor movement

	child_go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		deferred
		end

	child_start is
			-- Move cursor to first child.
		deferred
		end

	child_finish is
			-- Move cursor to last child.
		deferred
		end

	child_forth is
			-- Move cursor to next child.
		deferred
		end

	child_back is
			-- Move cursor to previous child.
		deferred
		end

	child_go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th child.
		deferred
		ensure then
			position: child_index = i
		end

feature -- Element change

	sprout is
			-- Make current node a root.
		local
			p: like parent
		do
			p := parent
			if p /= Void then
				p.prune (Current)
			end
		end

	put, replace (v: like item) is
			-- Replace element at cursor position by `v'.
		require
			is_writable: writable
		deferred
		ensure
			item_inserted: item = v
		end

	child_put, child_replace (v: like item) is
			-- Put `v' at current child position.
		require
			child_writable: child_writable
		deferred
		ensure
			item_inserted: child_item = v
		end

	put_child (n: like parent) is
			-- Add `n' to the list of children.
			-- Do not move child cursor.
		require
			non_void_argument: n /= Void
		deferred
		end

	replace_child (n: like parent) is
			-- Put `n' at current child position.
		require
			writable_child: writable_child
--			was_root: n.is_root
		deferred
		ensure
			child_replaced: child = n
		end

	prune (n: like Current) is
			-- Remove `n' from the children.
		require
			is_child: n.parent = Current
		deferred
		ensure
			n_is_root: n.is_root
		end

	fill (other: TREE [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current node
			-- need not be the same.
		do
			replace (other.item)
			fill_subtree (other)
		end

feature -- Removal

	wipe_out is
			-- Remove all children.
		deferred
		ensure
			is_leaf: is_leaf
		end

	forget_left is
			-- Forget all left siblings.
		deferred
		end

	forget_right is
			-- Forget all right siblings.
		deferred
		end

feature -- Conversion

	linear_representation: LINEAR [G] is
			-- Representation as a linear structure
		local
			al: ARRAYED_LIST [G]
		do
			create al.make (count)
			al.start
			al.extend (item)
			fill_list (al)
			Result := al
		end

	binary_representation: BINARY_TREE [G] is
			-- Convert to binary tree representation:
			-- first child becomes left child,
			-- right sibling becomes right child.
		local
			current_sibling: ?BINARY_TREE [G]
			c: like first_child
		do
			create Result.make (item)
			if not is_leaf then
				c := first_child
				if c /= Void then
					Result.put_left_child (c.binary_representation)
				end
				from
					child_start
					child_forth
					current_sibling := Result.left_child
				until
					child_after
				loop
					if current_sibling /= Void then
						c := child
						if c /= Void then
							current_sibling.put_right_child (c.binary_representation)
						end
						current_sibling := current_sibling.right_child
					end
					child_forth
				end
			end
		ensure
			Result_is_root: Result.is_root
			Result_has_no_right_child: not Result.has_right
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy contents from `other'.
		local
			i: INTEGER
			old_idx: INTEGER
			tmp_tree: like Current
			c: like child
		do
			tmp_tree := clone_node (other)
			if not other.is_leaf then
				tree_copy (other, tmp_tree)
			end
			standard_copy (tmp_tree)
			old_idx := child_index
			from
				i := 1
			until
				i > child_capacity
			loop
				child_go_i_th (i)
				c := child
				if c /= Void then
					c.attach_to_parent (Current)
				end
				i := i + 1
			end
			child_go_i_th (old_idx)
		end

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-tree beginning at cursor position and
			-- having min (`n', `arity' - `child_index' + 1)
			-- children.
		require
			not_child_off: not child_off
			valid_sublist: n >= 0
		deferred
		end

feature {TREE} -- Implementation

	subtree_has (v: G): BOOLEAN is
			-- Do children include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			cursor: CURSOR
			c: like child
			i: G
		do
			cursor := child_cursor
			from
				child_start
			until
				child_off or else Result
			loop
				if child /= Void then
					if object_comparison then
						i := child_item
						Result := (v /= Void) and then (i /= Void) and then v.is_equal (i)
					else
						Result := v = child_item
					end
				end
				child_forth
			end
			from
				child_start
			until
				child_off or else Result
			loop
				c := child
				if c /= Void then
					Result := c.subtree_has (v)
				end
				child_forth
			end
			child_go_to (cursor)
		end

	subtree_count: INTEGER is
			-- Number of items in children
		local
			pos: CURSOR
			c: like child
		do
			Result := arity
			from
				pos := child_cursor
				child_start
			until
				child_off
			loop
				c := child
				if c /= Void then
					Result := Result + c.subtree_count
				end
				child_forth
			end
			child_go_to (pos)
		end

	fill_list (al: ARRAYED_LIST [G]) is
			-- Fill `al' with all the children's items.
		local
			c: like child
		do
			from
				child_start
			until
				child_off
			loop
				c := child
				if c /= Void then
					al.extend (child_item)
					c.fill_list (al)
				end
				child_forth
			end
		end

	attach_to_parent (n: like parent) is
			-- Make `n' parent of current node.
		do
			parent := n
		ensure
			new_parent: parent = n
		end

feature {NONE} -- Implementation

	fill_subtree (s: TREE [G]) is
			-- Fill children with children of `other'.
		deferred
		end

	remove is
			-- Remove current item
		do
		end

	child_remove is
			-- Remove item of current child
		do
		end

	tree_is_equal (t1, t2: like Current): BOOLEAN is
			-- Are `t1' and `t2' recursively equal?
		require
			trees_exist: t1 /= Void and t2 /= Void
			trees_not_empty: not t1.is_empty and not t2.is_empty
			same_rule: t1.object_comparison = t2.object_comparison
		local
			p1, p2: like Current
			c1, c2: like child
			t1_stack, t2_stack: LINKED_STACK [like Current]
			orgidx1_stack, orgidx2_stack: LINKED_STACK [INTEGER]
			l_current_cursor, l_other_cursor: like child_cursor
		do
			l_current_cursor := t1.child_cursor
			l_other_cursor := t2.child_cursor

			if t1.is_leaf and t2.is_leaf then
				Result := equal (t1.item, t2.item)
			elseif t1.is_leaf xor t2.is_leaf then
				Result := False
			else
				create t1_stack.make
				create t2_stack.make
				create orgidx1_stack.make
				create orgidx2_stack.make
				orgidx1_stack.put (t1.child_index)
				orgidx2_stack.put (t2.child_index)
				from
					Result := True
					p1 := t1
					p2 := t2
					p1.child_start
					p2.child_start
				invariant
					same_count: t1_stack.count = t2_stack.count
				until
					not Result or else
						p1.child_after and t1_stack.is_empty
				loop
					check
						p1_not_void: p1 /= Void
						p2_not_void: p2 /= Void
							-- Because the loop is always terminated before a
							-- node pointer becomes Void.
					end
					if p1.child_readable and p2.child_readable and
						p1.child_capacity = p2.child_capacity then
						Result := p1.node_is_equal (p2)
						c1 := p1.child
						c2 := p2.child
						if c1 = Void or else c2 = Void then
							check
								False
							end
						else
							if not (c1.is_leaf or c2.is_leaf) then
								t1_stack.put (p1)
								t2_stack.put (p2)
								p1 := c1
								p2 := c2
								Result := p1.node_is_equal (p2)
								orgidx1_stack.put (p1.child_index)
								orgidx2_stack.put (p2.child_index)
								p1.child_start
								p2.child_start
							elseif c1.is_leaf xor c2.is_leaf then
								Result := False
							else
								Result := c1.node_is_equal (c2)
							end
						end
					elseif p1.child_capacity /= p2.child_capacity or else
							(p1.child_readable xor p2.child_readable) then
						Result := False
					end
					if not p1.child_after then
						p1.child_forth
						p2.child_forth
					else
						from
						invariant
							same_count: t1_stack.count = t2_stack.count
						until
							t1_stack.is_empty or else not p1.child_after --or else i <= p1.arity
						loop
							p1 := t1_stack.item
							p2 := t2_stack.item
							p1.child_forth
							p2.child_forth
							t1_stack.remove
							t2_stack.remove
							orgidx1_stack.remove
							orgidx2_stack.remove
						end
					end
				end
				if not Result then
					from
					invariant
						same_count: t1_stack.count = t2_stack.count and
								orgidx1_stack.count = orgidx2_stack.count
					until
						orgidx1_stack.count = 1
					loop
						p1.child_go_i_th (orgidx1_stack.item)
						p2.child_go_i_th (orgidx2_stack.item)
						p1 := t1_stack.item
						p2 := t2_stack.item
							check
								p1_not_void: p1 /= Void
								p2_not_void: p2 /= Void
									-- Because we never put Void references on the
									-- stack.
							end
						t1_stack.remove
						t2_stack.remove
						orgidx1_stack.remove
						orgidx2_stack.remove
					end
						check
							tree_stacks_empty: t1_stack.is_empty and
									t2_stack.is_empty
								-- Because we removed all items.
							at_root: p1 = t1 and p2 = t2
								-- Because the root nodes where the last item we
								-- removed.
							p1_not_void: p1 /= Void
							p2_not_void: p2 /= Void
								-- Because the root nodes cannot be Void.
						end
					p1.child_go_i_th (orgidx1_stack.item)
					p2.child_go_i_th (orgidx2_stack.item)
					orgidx1_stack.remove
					orgidx2_stack.remove
						check
							index_stacks_empty: orgidx1_stack.is_empty and
										orgidx2_stack.is_empty
								-- Because we also removed the roots from the index
								-- stacks now.
						end
				end
			end
			t1.child_go_to (l_current_cursor)
			t2.child_go_to (l_other_cursor)
		end

 	tree_copy (other, tmp_tree: like Current) is
			-- Generic implementation of `copy'. `other' is copied onto
			-- `Current'. `tmp_tree' is used as temporary storage during
			-- copying. Since it cannot be created locally because of the
			-- generic implementation, it has to be passed in.
		require
			other_not_empty: other /= Void and then not other.is_empty
			other_not_leaf: not other.is_leaf
			tmp_tree_exists: tmp_tree /= Void
			same_rule: object_comparison = other.object_comparison
		local
			i: INTEGER
			p1, p2, node: like Current
			c1: like child
			other_stack, tmp_stack: LINKED_STACK [like Current]
			idx_stack, orgidx_stack: LINKED_STACK [INTEGER]
		do
			create other_stack.make
			create tmp_stack.make
			create idx_stack.make
			create orgidx_stack.make
			if other.object_comparison then
				tmp_tree.compare_objects
			end
			orgidx_stack.put (other.child_index)
			from
				i := 1
				p1 := other
				p2 := tmp_tree
			invariant
				same_count: other_stack.count = tmp_stack.count and
							tmp_stack.count = idx_stack.count
			until
				i > p1.child_capacity and other_stack.is_empty
			loop
				p1.child_go_i_th (i)
				p2.child_go_i_th (i)
				if p1.child_readable then
					check
						source_tree_not_void: p1 /= Void
						target_tree_not_void: p2 /= Void
							-- Because we always point to valid parent nodes.
						source_child_not_void: p1.child /= Void
							-- Because we only get here when the child is
							-- readable.
						target_child_void: p2.readable_child implies p2.child = Void
							-- Because the target child has not been copied
							-- yet.
					end
					c1 := p1.child
					if c1 = Void then
						check
							source_child_not_void: p1.child /= Void
								-- Because we only get here when the child is
								-- readable.
						end
					else
						node := clone_node (c1)
							check
									-- Because `node' has been cloned.
								not_the_same: node /= p1.child
							end
						p2.put_child (node)
							check
								node_is_child: node = p2.child
									-- Because we inserted `node' as child.
								comparison_mode_ok: node.object_comparison =
											c1.object_comparison
									-- Because the comparson mode flag must be copied
									-- correctly, too.
								p1_consistent: c1.parent = p1
								p2_consistent: node.parent = p2
									-- Because the tree has to be consistent.
							end
						if not c1.is_leaf then
							other_stack.put (p1)
							tmp_stack.put (p2)
							idx_stack.put (i + 1)
							p1 := c1
							p2 := node
							orgidx_stack.put (p1.child_index)
							i := 0
						end
					end
				end
				if i <= p1.child_capacity then
					i := i + 1
				else
					from
					invariant
						same_count: other_stack.count = tmp_stack.count and
									tmp_stack.count = idx_stack.count
					until
						other_stack.is_empty or else i <= p1.child_capacity
					loop
						p1.child_go_i_th (orgidx_stack.item)
						p2.child_go_i_th (orgidx_stack.item)
							check
								child_indices_equal:
									p1.child_index = p2.child_index
										-- Because we have set them equal before.
							end
						p1 := other_stack.item
						p2 := tmp_stack.item
							check
								p1_not_void: p1 /= Void
								p2_not_void: p2 /= Void
									-- Because we never put Void references on the
									-- stack.
							end
						i := idx_stack.item
						other_stack.remove
						tmp_stack.remove
						idx_stack.remove
						orgidx_stack.remove
					end
				end
			end
			other.child_go_i_th (orgidx_stack.item)
			tmp_tree.child_go_i_th (orgidx_stack.item)
			orgidx_stack.remove
				check
					tree_stacks_empty: other_stack.is_empty and tmp_stack.is_empty
						-- Because we removed all items.
					at_root: p1 = other and p2 = tmp_tree
						-- Because the root nodes where the last item we removed.
					copy_correct: equal (other, tmp_tree)
						-- Because `other' has been copied to `tmp_tree'.

					index_stack_empty: orgidx_stack.is_empty
						-- Because we also removed the root from the index
						-- stack now.
				end
		end

	copy_node (n: like Current) is
			-- Copy content of `n' except tree data into Current.
		require
			is_root: is_root
			is_leaf: is_leaf
			not_void: n /= Void
		deferred
		ensure
			object_comparison_copied: object_comparison = n.object_comparison
			same_arity: arity = old arity
			same_item: item = old item
			result_is_root: is_root
			result_is_leaf: is_leaf
		end

feature {TREE} -- Implementation

	clone_node (n: like Current): like Current is
			-- Clone node `n'.
		require
			not_void: n /= Void
		deferred
		ensure
			result_is_root: Result.is_root
			result_is_leaf: Result.is_leaf
		end

invariant

	tree_consistency: child_readable implies ({c: like child} child and then c.parent = Current)
	leaf_definition: is_leaf = (arity = 0)
	child_off_definition: child_off = child_before or child_after
	child_before_definition: child_before = (child_index = 0)
	child_isfirst_definition: child_isfirst = (not is_leaf and child_index = 1)
	child_islast_definition:
			child_islast = (not is_leaf and child_index = child_capacity)
	child_after_definition: child_after = (child_index >= child_capacity + 1)

indexing
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

end -- class TREE
