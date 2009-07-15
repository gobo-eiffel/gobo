indexing

	description:
	"[
		Containers using red-black tree algorithm.

		Red-black trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2009, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_RED_BLACK_TREE_CONTAINER [G, K]

inherit

	DS_BINARY_SEARCH_TREE_CONTAINER [G, K]
		redefine
			new_cursor,
			root_node
		end

feature -- Access

	new_cursor: DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, K] is
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
			l_node: like root_node
			l_uncle: like root_node
			l_grand_parent: like root_node
		do
				-- Insert case 1.
			from
				l_node := a_node
			until
				l_node = Void
			loop
				if l_node = root_node then
					l_node.set_is_red (False)
						-- Stop condition.
					l_node := Void
				else
						-- Insert case 2.
					if l_node.parent.is_black then
							-- Stop condition.
						l_node := Void
					else
							-- Insert case 3.
						l_uncle := l_node.uncle
						l_grand_parent := l_node.grand_parent
						if l_uncle /= Void and then l_uncle.is_red then
							insert_case_3 (l_node, l_uncle, l_grand_parent)
								-- Back to insert case 1.
							l_node := l_grand_parent
						else
								-- Insert case 4.
							l_node := insert_case_4 (l_node, l_grand_parent)
								-- Insert case 5.
							l_grand_parent := l_node.grand_parent
							insert_case_5 (l_node, l_grand_parent)
								-- Stop condition.
							l_node := Void
						end
					end
				end
			end
		end

	insert_case_3 (a_node, a_uncle, a_grand_parent: like root_node) is
			-- Case 3.
		require
			a_node_not_void: a_node /= Void
			a_uncle_not_void: a_uncle /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		do
			a_node.parent.set_is_red (False)
			a_uncle.set_is_red (False)
			a_grand_parent.set_is_red (True)
		ensure
			parent_is_black: a_node.parent.is_black
			a_uncle_is_black: a_uncle.is_black
			a_grand_parens_is_red: a_grand_parent.is_red
		end

	insert_case_4 (a_node, a_grand_parent: like root_node): like root_node is
			-- Case 4.
		require
			a_node_not_void: a_node /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		local
			l_parent: like root_node
		do
			l_parent := a_node.parent
			if a_node = l_parent.right_child and l_parent = a_grand_parent.left_child then
				rotate_left (a_node)
				Result := a_node.left_child
			elseif a_node = l_parent.left_child and l_parent = a_grand_parent.right_child then
				rotate_right (a_node)
				Result := a_node.right_child
			else
				Result := a_node
			end
		ensure
			result_not_void: Result /= Void
		end

	insert_case_5 (a_node, a_grand_parent: like root_node) is
			-- Case 5.
		require
			a_node_not_void: a_node /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		local
			l_parent: like root_node
		do
			l_parent := a_node.parent
			l_parent.set_is_red (False)
			a_grand_parent.set_is_red (True)
			if a_node = l_parent.left_child and l_parent = a_grand_parent.left_child then
				rotate_right (a_node.parent)
			else
				check
					else_case_1: a_node = l_parent.right_child
					else_case_2: l_parent = a_grand_parent.right_child
				end
				rotate_left (l_parent)
			end
		end

feature {NONE} -- Removal

	on_root_node_removed is
			-- There is a new `root_node', check that it is black.
		do
			if root_node.is_red then
				root_node.set_is_red (False)
			end
		end

	on_node_removed (a_old_node, a_node: like root_node; a_was_left_child: BOOLEAN) is
			-- The previsous `left_child' or `right_child'
			-- (depending on `a_was_left_child') of `a_node'
			-- was just removed.
		local
			l_is_left_child: BOOLEAN
			l_parent: like root_node
			l_child: like root_node
			l_child_is_red: BOOLEAN
			l_sibling: like root_node
			l_sibling_is_red: BOOLEAN
		do
			l_is_left_child := a_was_left_child
			l_parent := a_node
			if l_is_left_child then
				l_child := l_parent.left_child
			else
				l_child := l_parent.right_child
			end
			l_child_is_red := is_node_red (l_child)
			if a_old_node.is_black then
				if l_child_is_red then
					l_child.set_is_red (False)
				else
					from
					until
						l_parent = Void
					loop
							-- Delete case 1.
						if l_child /= root_node then
								-- Delete case 2.
							if l_is_left_child then
								l_sibling := l_parent.right_child
							else
								l_sibling := l_parent.left_child
							end
							l_sibling_is_red := is_node_red (l_sibling)
							if l_sibling_is_red then
								l_sibling := remove_case_2 (l_parent, l_sibling, l_is_left_child)
								l_sibling_is_red := is_node_red (l_sibling)
							end
								-- Delete case 3.
							if
								l_parent.is_black and not l_sibling_is_red and
								(l_sibling.left_child = Void or else l_sibling.left_child.is_black) and
								(l_sibling.right_child = Void or else l_sibling.right_child.is_black)
							then
								l_sibling.set_is_red (True)
									-- Prepare for next loop.
								l_child := l_parent
								l_parent := l_parent.parent
								l_is_left_child := l_parent = Void or else l_parent.left_child = l_child
							else
									-- Delete case 4.
								if
									l_parent.is_red and not l_sibling_is_red and
									(l_sibling.left_child = Void or else l_sibling.left_child.is_black) and
									(l_sibling.right_child = Void or else l_sibling.right_child.is_black)
								then
									l_sibling.set_is_red (True)
									l_parent.set_is_red (False)
										-- Stop condition.
									l_parent := Void
								else
										-- Delete case 5.
									l_sibling := remove_case_5 (l_parent, l_sibling, l_sibling_is_red, l_is_left_child)
									l_sibling_is_red := is_node_red (l_sibling)
										-- Delete case 6.
									remove_case_6 (l_parent, l_sibling, l_is_left_child)
										-- Stop condition.
									l_parent := Void
								end
							end
						end
					end
				end
			end
		end

	remove_case_2 (a_parent, a_sibling: like root_node; a_is_left_child: BOOLEAN): like root_node is
			-- Case 2.
		require
			a_parent_not_void: a_parent /= Void
			a_sibling_not_void: a_sibling /= Void
		do
			a_parent.set_is_red (True)
			a_sibling.set_is_red (False)
			if a_is_left_child then
				rotate_left (a_sibling)
				Result := a_parent.right_child
			else
				rotate_right (a_sibling)
				Result := a_parent.left_child
			end
		end

	remove_case_5 (a_parent, a_sibling: like root_node; a_sibling_is_red, a_is_left_child: BOOLEAN): like root_node is
			-- Case 5.
		require
			a_sibling_not_void: a_sibling /= Void
		do
			if
				a_is_left_child and not a_sibling_is_red and
				(a_sibling.left_child /= Void and then a_sibling.left_child.is_red) and
				(a_sibling.right_child = Void or else a_sibling.right_child.is_black)
			then
				a_sibling.set_is_red (True)
				a_sibling.left_child.set_is_red (False)
				rotate_right (a_sibling.left_child)
				Result := a_parent.right_child
			elseif
				not a_is_left_child and a_sibling.is_black and
				(a_sibling.right_child /= Void and then a_sibling.right_child.is_red) and
				(a_sibling.left_child = Void or else a_sibling.left_child.is_black)
			then
				a_sibling.set_is_red (True)
				a_sibling.right_child.set_is_red (False)
				rotate_left (a_sibling.right_child)
				Result := a_parent.left_child
			else
				Result := a_sibling
			end
		end

	remove_case_6 (a_parent, a_sibling: like root_node; a_is_left_child: BOOLEAN) is
			-- Case 6.
		require
			a_parent_not_void: a_parent /= Void
			a_sibling_not_void: a_sibling /= Void
		do
			if a_parent.is_red then
				a_sibling.set_is_red (True)
			else
				a_sibling.set_is_red (False)
			end
			a_parent.set_is_red (False)
			if a_is_left_child then
				check
					right_red: a_sibling.right_child.is_red
				end
				a_sibling.right_child.set_is_red (False)
				rotate_left (a_sibling)
			else
				check
					left_red: a_sibling.left_child.is_red
				end
				a_sibling.left_child.set_is_red (False)
				rotate_right (a_sibling)
			end
		end

feature {NONE} -- Status report

	is_node_red (a_node: like root_node): BOOLEAN is
			-- Is `a_node' red?
			-- If `a_node' is Void, its color is black.
		do
			if a_node /= Void then
				Result := a_node.is_red
			end
		ensure
			void_case: a_node = Void implies not Result
			non_void_case: a_node /= Void implies Result = a_node.is_red
		end

	all_paths_have_same_number_of_black_nodes: BOOLEAN is
			-- Property of Red-Black Trees
		do
			Result := True
			if root_node /= Void then
				Result := root_node.number_of_black_nodes_in_branches >= 0
			end
		end

feature {NONE} -- Implementation

	root_node: DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]
			-- Root node of the tree

invariant

	root_node_is_black: root_node /= Void and not is_removing implies root_node.is_black
	all_paths_have_same_number_of_black_nodes: all_paths_have_same_number_of_black_nodes

end
