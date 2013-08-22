note

	description:
	"[
		Containers using red-black tree algorithm.

		Red-black trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2013, Daniel Tuser and others"
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

	new_cursor: DS_RED_BLACK_TREE_CONTAINER_CURSOR [G, K]
			-- New external cursor
		deferred
		end

feature {NONE} -- Element change

	on_node_added (a_node: attached like root_node)
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
					check attached l_node.parent as l_parent then
							-- Insert case 2.
						if l_parent.is_black then
								-- Stop condition.
							l_node := Void
						else
								-- Insert case 3.
							l_uncle := l_node.uncle
							l_grand_parent := l_node.grand_parent
							check attached l_grand_parent then
								if l_uncle /= Void and then l_uncle.is_red then
									insert_case_3 (l_node, l_uncle, l_grand_parent)
										-- Back to insert case 1.
									l_node := l_grand_parent
								else
										-- Insert case 4.
									l_node := insert_case_4 (l_node, l_grand_parent)
										-- Insert case 5.
									l_grand_parent := l_node.grand_parent
									check attached l_grand_parent then
										insert_case_5 (l_node, l_grand_parent)
									end
										-- Stop condition.
									l_node := Void
								end
							end
						end
					end
				end
			end
		end

	insert_case_3 (a_node, a_uncle, a_grand_parent: attached like root_node)
			-- Case 3.
		require
			a_node_not_void: a_node /= Void
			a_uncle_not_void: a_uncle /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		do
			check attached a_node.parent as l_parent then
				l_parent.set_is_red (False)
				a_uncle.set_is_red (False)
				a_grand_parent.set_is_red (True)
			end
		ensure
			parent_is_black: attached a_node.parent as l_parent and then l_parent.is_black
			a_uncle_is_black: a_uncle.is_black
			a_grand_parens_is_red: a_grand_parent.is_red
		end

	insert_case_4 (a_node, a_grand_parent: attached like root_node): attached like root_node
			-- Case 4.
		require
			a_node_not_void: a_node /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		do
			check attached a_node.parent as l_parent then
				if a_node = l_parent.right_child and l_parent = a_grand_parent.left_child then
					rotate_left (a_node)
					check attached a_node.left_child as l_left_child then
						Result := l_left_child
					end
				elseif a_node = l_parent.left_child and l_parent = a_grand_parent.right_child then
					rotate_right (a_node)
					check attached a_node.right_child as l_right_child then
						Result := l_right_child
					end
				else
					Result := a_node
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	insert_case_5 (a_node, a_grand_parent: attached like root_node)
			-- Case 5.
		require
			a_node_not_void: a_node /= Void
			a_grand_parent_not_void: a_grand_parent /= Void
		do
			check attached a_node.parent as l_parent then
				l_parent.set_is_red (False)
				a_grand_parent.set_is_red (True)
				if a_node = l_parent.left_child and l_parent = a_grand_parent.left_child then
					rotate_right (l_parent)
				else
					check
						else_case_1: a_node = l_parent.right_child
						else_case_2: l_parent = a_grand_parent.right_child
					end
					rotate_left (l_parent)
				end
			end
		end

feature {NONE} -- Removal

	on_root_node_removed
			-- There is a new `root_node', check that it is black.
		do
			check root_not_not_void: attached root_node as l_root_node then
				if l_root_node.is_red then
					l_root_node.set_is_red (False)
				end
			end
		end

	on_node_removed (a_old_node, a_node: attached like root_node; a_was_left_child: BOOLEAN)
			-- The previsous `left_child' or `right_child'
			-- (depending on `a_was_left_child') of `a_node'
			-- was just removed.
		local
			l_is_left_child: BOOLEAN
			l_parent: like root_node
			l_child: like root_node
			l_child_is_red: BOOLEAN
			l_sibling: attached like root_node
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
					check l_child /= Void then
						l_child.set_is_red (False)
					end
				else
					from
					until
						l_parent = Void
					loop
							-- Delete case 1.
						if l_child /= root_node then
								-- Delete case 2.
							if l_is_left_child then
								check attached l_parent.right_child as l_right_child then
									l_sibling := l_right_child
								end
							else
								check attached l_parent.left_child as l_left_child then
									l_sibling := l_left_child
								end
							end
							l_sibling_is_red := is_node_red (l_sibling)
							if l_sibling_is_red then
								l_sibling := remove_case_2 (l_parent, l_sibling, l_is_left_child)
								l_sibling_is_red := is_node_red (l_sibling)
							end
								-- Delete case 3.
							if
								l_parent.is_black and not l_sibling_is_red and
								(not attached l_sibling.left_child as l_left_child or else l_left_child.is_black) and
								(not attached l_sibling.right_child as l_right_child or else l_right_child.is_black)
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
									(not attached l_sibling.left_child as l_left_child or else l_left_child.is_black) and
									(not attached l_sibling.right_child as l_right_child or else l_right_child.is_black)
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

	remove_case_2 (a_parent, a_sibling: attached like root_node; a_is_left_child: BOOLEAN): attached like root_node
			-- Case 2.
		require
			a_parent_not_void: a_parent /= Void
			a_sibling_not_void: a_sibling /= Void
		do
			a_parent.set_is_red (True)
			a_sibling.set_is_red (False)
			if a_is_left_child then
				rotate_left (a_sibling)
				check attached a_parent.right_child as l_right_child then
					Result := l_right_child
				end
			else
				rotate_right (a_sibling)
				check attached a_parent.left_child as l_left_child then
					Result := l_left_child
				end
			end
		ensure
			not_void: Result /= Void
		end

	remove_case_5 (a_parent, a_sibling: attached like root_node; a_sibling_is_red, a_is_left_child: BOOLEAN): attached like root_node
			-- Case 5.
		require
			a_parent_not_void: a_parent /= Void
			a_sibling_not_void: a_sibling /= Void
		do
			if
				a_is_left_child and not a_sibling_is_red and
				(attached a_sibling.left_child as l_left_child and then l_left_child.is_red) and
				(not attached a_sibling.right_child as l_right_child or else l_right_child.is_black)
			then
				a_sibling.set_is_red (True)
				l_left_child.set_is_red (False)
				rotate_right (l_left_child)
				check attached a_parent.right_child as l_parent_right_child then
					Result := l_parent_right_child
				end
			elseif
				not a_is_left_child and a_sibling.is_black and
				(attached a_sibling.right_child as l_right_child and then l_right_child.is_red) and
				(not attached a_sibling.left_child as l_left_child or else l_left_child.is_black)
			then
				a_sibling.set_is_red (True)
				l_right_child.set_is_red (False)
				rotate_left (l_right_child)
				check attached a_parent.left_child as l_parent_left_child then
					Result := l_parent_left_child
				end
			else
				Result := a_sibling
			end
		ensure
			not_void: Result /= Void
		end

	remove_case_6 (a_parent, a_sibling: attached like root_node; a_is_left_child: BOOLEAN)
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
				check attached a_sibling.right_child as l_right_child then
					check
						right_red: l_right_child.is_red
					end
					l_right_child.set_is_red (False)
					rotate_left (a_sibling)
				end
			else
				check attached a_sibling.left_child as l_left_child then
					check
						left_red: l_left_child.is_red
					end
					l_left_child.set_is_red (False)
					rotate_right (a_sibling)
				end
			end
		end

feature {NONE} -- Status report

	is_node_red (a_node: like root_node): BOOLEAN
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

	all_paths_have_same_number_of_black_nodes: BOOLEAN
			-- Property of Red-Black Trees
		do
			Result := True
			if attached root_node as l_root_node then
				Result := l_root_node.number_of_black_nodes_in_branches >= 0
			end
		end

feature {NONE} -- Implementation

	root_node: detachable DS_RED_BLACK_TREE_CONTAINER_NODE [G, K]
			-- Root node of the tree

invariant

	root_node_is_black: (attached root_node as l_root_node and not is_removing) implies l_root_node.is_black
	all_paths_have_same_number_of_black_nodes: all_paths_have_same_number_of_black_nodes

end
