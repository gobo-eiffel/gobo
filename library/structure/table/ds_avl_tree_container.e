indexing

	description:
	"[
		Containers using AVL tree algorithm.
		
		AVL trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_AVL_TREE_CONTAINER [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER [G, K]
		redefine
			new_cursor,
			root_node
		end

feature -- Access

	new_cursor: DS_AVL_TREE_CONTAINER_CURSOR [G, K] is
			-- New external cursor
		deferred
		end

feature {NONE} -- Element change

	on_node_added (a_node: like root_node) is
			-- `a_node' was just added to the binary search tree.
			-- If some modifications need to be made, they should
			-- take place in here. So the algorithms stay as
			-- readable as possible
		local
			l_parent, l_child: like root_node
			l_is_left_child: BOOLEAN
		do
				-- The `balance' of `a_node' is zero.
				-- Update the `balance' of the `parent's.
			from
				l_child := a_node
				l_parent := l_child.parent
				if l_parent /= Void and then l_parent.left_child = l_child then
					l_is_left_child := True
				end
			invariant
				correct_parent: l_parent /= Void implies l_child.parent = l_parent
				left_child: l_parent /= Void and l_is_left_child implies l_parent.left_child = l_child
				right_child: l_parent /= Void and not l_is_left_child implies l_parent.right_child = l_child
			until
				l_parent = Void
			loop
				if l_parent.balance /= 0 then
						-- All cases after which the loop can be stopped.
					if l_is_left_child = (l_parent.balance = 1) then
							-- We just need to set the balance of the parent to
							-- zero. The node was inserted on the lighter side
							-- and thus the new balance becomes zero.
						l_parent.set_balance (0)
					elseif l_is_left_child = (l_child.balance = -1) then
						insert_case_2 (l_child, l_parent, l_is_left_child)
					elseif l_is_left_child then
						insert_case_3_a (l_child, l_parent)
					else
						insert_case_3_b (l_child, l_parent)
					end
						-- Stop condition.
					l_parent := Void
				else
						-- The only case where the loop can not be left. Here
						-- the parent's balance is zero.
					if l_is_left_child then
						l_parent.set_balance (-1)
					else
						l_parent.set_balance (1)
					end
						-- Update the data for the next walk through the loop.
					l_child := l_parent
					l_parent := l_parent.parent
					if l_parent /= Void and then l_parent.left_child = l_child then
						l_is_left_child := True
					else
						l_is_left_child := False
					end
				end
			end
		end

	insert_case_2 (a_child, a_parent: like root_node; a_is_left_child: BOOLEAN) is
			-- The child was added on the side of the parent with
			-- the greater weight and the child itself has a greater
			-- weight on this side as well.
		require
			a_child_not_void: a_child /= Void
			a_parent_not_void: a_parent /= Void
			child_is_left_child: a_is_left_child implies a_parent.left_child = a_child
			child_is_right_child: not a_is_left_child implies a_parent.right_child = a_child
			parant_balance_1: a_is_left_child implies (a_parent.balance = -1)
			parant_balance_2: not a_is_left_child implies (a_parent.balance = 1)
			child_balance_1: a_is_left_child implies (a_child.balance = -1)
			child_balance_2: not a_is_left_child implies (a_child.balance = 1)
		do
			if a_is_left_child then
				rotate_right (a_child)
			else
				rotate_left (a_child)
			end
			a_parent.set_balance (0)
			a_child.set_balance (0)
		ensure
			parent_balance: a_parent.balance = 0
			child_balance: a_child.balance = 0
			rotated: a_parent.parent = a_child
		end

	insert_case_3_a (a_child, a_parent: like root_node) is
			-- Perform a double rotation to `a_child'.
		require
			a_child_not_void: a_child /= Void
			a_parent_not_void: a_parent /= Void
			a_child_is_left_child: a_parent.left_child = a_child
			a_child_balance_is_one: a_child.balance = 1
			correct_sub_structure: a_child.right_child.balance = 0 implies a_child.right_child.left_child = Void
		local
			l_grand_child: like root_node
		do
			l_grand_child := a_child.right_child
			rotate_left_right (a_child)
			check
				correctly_moved_1: l_grand_child.left_child = a_child
				correctly_moved_2: l_grand_child.right_child = a_parent
			end
				-- Balance must be correct.
			if l_grand_child.balance = -1 then
				a_child.set_balance (0)
				a_parent.set_balance (1)
			elseif l_grand_child.balance = 1 then
				a_child.set_balance (-1)
				a_parent.set_balance (0)
			else
				a_child.set_balance (0)
				a_parent.set_balance (0)
			end
			l_grand_child.set_balance (0)
		end

	insert_case_3_b (a_child, a_parent: like root_node) is
			-- Perform a double rotation to `a_child'.
		require
			a_child_not_void: a_child /= Void
			a_parent_not_void: a_parent /= Void
			a_child_is_right_child: a_parent.right_child = a_child
			a_child_balance_is_minus_one: a_child.balance = -1
			correct_sub_structure: a_child.left_child.balance = 0 implies a_child.left_child.left_child = Void
		local
			l_grand_child: like root_node
		do
			l_grand_child := a_child.left_child
			rotate_right_left (a_child)
			check
				correctly_moved_1: l_grand_child.left_child = a_parent
				correctly_moved_2: l_grand_child.right_child = a_child
			end
				-- Balance must be correct.
			if l_grand_child.balance = -1 then
				a_child.set_balance (1)
				a_parent.set_balance (0)
			elseif l_grand_child.balance = 1 then
				a_child.set_balance (0)
				a_parent.set_balance (-1)
			else
				a_child.set_balance (0)
				a_parent.set_balance (0)
			end
			l_grand_child.set_balance (0)
		end

feature {NONE} -- Removal

	on_node_removed (a_old_node, a_node: like root_node; a_was_left_child: BOOLEAN) is
			-- The previsous `left_child' or `right_child' -
			-- depending on `a_was_left_child' - of `a_node'
			-- was just removed.
		local
			l_parent, l_child, l_grand_child: like root_node
			l_is_left_child: BOOLEAN
		do
			from
				l_parent := a_node
				l_is_left_child := a_was_left_child
			until
				l_parent = Void
			loop
				if l_parent.balance = 0 then
					remove_case_1 (l_parent, l_is_left_child)
						-- Stop condition.
					l_parent := Void
				else
					if l_is_left_child then
						l_child := l_parent.right_child
					else
						l_child := l_parent.left_child
					end
					if l_is_left_child = (l_parent.balance = 1) and then l_child.balance = 0 then
						remove_case_2 (l_child, l_is_left_child)
							-- Stop condition.
						l_parent := Void
					else
							-- All cases where the loop can not be exited after this pass.
						if l_is_left_child = (l_parent.balance = -1) then
							l_parent.set_balance (0)
							l_child := l_parent
							l_parent := l_parent.parent
						else
								-- Take the child balance into account as
								-- `is_left_child = (parent.balance = 1)'.
							if l_is_left_child = (l_child.balance = 1) then
								remove_case_3 (l_child, l_parent, l_is_left_child)
								l_parent := l_child.parent
							else
								check
									l_is_left_child = (l_child.balance = -1)
								end
								l_grand_child := remove_case_4 (l_child, l_is_left_child)
								remove_case_5 (l_grand_child, l_child, l_parent, l_is_left_child)
								l_child := l_grand_child
								l_parent := l_child.parent
							end
						end
							-- Update the data for the next walk through the loop.
						if l_parent /= Void and then l_parent.left_child = l_child then
							l_is_left_child := True
						else
							l_is_left_child := False
						end
					end
				end
			end
		end

	remove_case_1 (a_parent: like root_node; a_is_left_child: BOOLEAN) is
			-- Set `a_parent''s balance according to `a_is_left_child'.
		require
			a_parent_not_void: a_parent /= Void
		do
			if a_is_left_child then
				a_parent.set_balance (1)
			else
				a_parent.set_balance (-1)
			end
		end

	remove_case_2 (a_child: like root_node; a_is_left_child: BOOLEAN) is
			-- Rotate `a_child' according to `a_is_left_child' and
			-- set the balance of `a_child'.
		require
			a_child_nod_void: a_child /= Void
		do
			if a_is_left_child then
				rotate_left (a_child)
				a_child.set_balance (-1)
			else
				rotate_right (a_child)
				a_child.set_balance (1)
			end
		end

	remove_case_3 (a_child, a_parent: like root_node; a_is_left_child: BOOLEAN) is
			-- Case 3.
		require
			a_child_not_void: a_child /= Void
			a_parent_not_void: a_parent /= Void
		do
			if a_is_left_child then
				rotate_left (a_child)
			else
				rotate_right (a_child)
			end
			a_parent.set_balance (0)
			a_child.set_balance (0)
		end

	remove_case_4 (a_child: like root_node; a_is_left_child: BOOLEAN): like root_node is
			-- Return the left or right child of `a_child' according to `a_is_left_child'
			-- and performs a double rotation.
		require
			a_child_not_void: a_child /= Void
		do
			if a_is_left_child then
				Result := a_child.left_child
				rotate_right_left (a_child)
			else
				Result := a_child.right_child
				rotate_left_right (a_child)
			end
		ensure
			result_not_void: Result /= Void
		end

	remove_case_5 (a_grand_child, a_child, a_parent: like root_node; a_is_left_child: BOOLEAN) is
			-- Case 5.
		require
			a_grand_child_not_void: a_grand_child /= Void
			a_child_not_void: a_child /= Void
			a_parent_not_void: a_parent /= Void
		do
			if a_grand_child.balance = 0 then
				a_parent.set_balance (0)
				a_child.set_balance (0)
			elseif a_is_left_child = (a_grand_child.balance = -1) then
				a_parent.set_balance (0)
				a_grand_child.set_balance (0)
				if a_is_left_child then
					a_child.set_balance (1)
				else
					a_child.set_balance (-1)
				end
			else
				a_child.set_balance (0)
				a_grand_child.set_balance (0)
				if a_is_left_child then
					a_parent.set_balance (-1)
				else
					a_parent.set_balance (1)
				end
			end
		end

feature {NONE} -- Implementation

	root_node: DS_AVL_TREE_CONTAINER_NODE [G, K]
			-- Root node of the tree

end
