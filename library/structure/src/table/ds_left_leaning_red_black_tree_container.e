note

	description:
	"[
		Containers using left-leaning red-black tree algorithm.

		Left-leaning red-black trees are a height balanced variant of binary search trees.
		It is guaranteed that `height' is always about `log_2 (count)'.
	]"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2017, Daniel Tuser and others"
	license: "MIT License"

deferred class DS_LEFT_LEANING_RED_BLACK_TREE_CONTAINER [G, K]

inherit

	DS_RED_BLACK_TREE_CONTAINER [G, K]
		redefine
			on_node_added,
			on_node_removed,
			search_node_for_removal,
			successor_for_removal,
			on_node_for_removal_not_found
		end

feature {NONE} -- Access

	successor_for_removal (v: attached like root_node): attached like root_node
			-- Successor of `v'
			-- (Performance: O(height).)
		do
			check v_has_right_child: attached v.right_child as l_right_child then
				Result := walk_left (l_right_child)
			end
		ensure then
			result_is_red: Result.is_red
		end

	not_found_node: like root_node
			-- If there was an attempt to remove a node with a non-existing key,
			-- this node is needed for the `fix_up'.

feature {NONE} -- Element change

	on_node_added (a_node: attached like root_node)
			-- `a_node' was just added to the binary search tree.
			-- If some modifications need to be made, they should
			-- take place in here. So the algorithms stay as
			-- readable as possible
		do
			check not_empty: attached root_node as l_root_node then
				if a_node /= l_root_node then
					fix_up (a_node, l_root_node)
				end
			end
			check not_empty: attached root_node as l_root_node then
				l_root_node.set_is_red (False)
			end
		end

feature {NONE} -- Removal

	on_node_removed (a_old_node, a_node: attached like root_node; a_was_left_child: BOOLEAN)
			-- The previsous `left_child' or `right_child' -
			-- depending on `a_was_left_child' - of `a_node'
			-- was just removed.
		do
			check attached root_node as l_root_node then
				fix_up (a_node, l_root_node)
			end
			check attached root_node as l_root_node then
				l_root_node.set_is_red (False)
			end
		end

	on_node_for_removal_not_found (a_key: K)
			-- The tree was modified during the search
			-- of a node with `a_key'. Now it needs to
			-- be fixed.
		do
			if attached root_node as l_root_node then
				check attached not_found_node as l_not_found_node then
					fix_up (l_not_found_node, l_root_node)
				end
				check attached root_node as l_new_root_node then
					l_new_root_node.set_is_red (False)
				end
			end
		end

feature {NONE} -- Basic operation

	search_node_for_removal (a_key: K)
			-- Set `found_node' to the node whose `key' is
			-- neither less nor greater than `a_key'.
			-- During the search the tree is manipulated as
			-- preparation for the removal of the node with `a_key'.
			-- (Performance: O(height).)
		local
			l_equality: BOOLEAN
			l_node: like root_node
			l_previous_node: like root_node
			l_found_node: like root_node
		do
			if attached root_node as l_root_node then
				l_root_node.set_is_red (True)
				if a_key = Void then
					l_previous_node := search_void_key_for_removal
					l_found_node := found_node
				else
					from
						l_found_node := l_root_node
					invariant
						all_paths_have_same_number_of_black_nodes:
							all_paths_have_same_number_of_black_nodes
						not_a_2_node:
							l_found_node /= Void implies
							(l_found_node.is_red or else
							(is_node_red (l_found_node.left_child) or
							is_node_red (l_found_node.right_child)))
					until
						l_found_node = Void or else l_equality
					loop
						l_node := l_found_node.left_child
						if
							attached l_found_node.key as l_found_node_key and then
							key_comparator.attached_less_than (a_key, l_found_node_key)
						then
							if
								l_node /= Void and then not l_node.is_red and then
								not is_node_red (l_node.left_child)
							then
								l_found_node := move_red_left (l_found_node)
							end

							l_previous_node := l_found_node
							l_found_node := l_found_node.left_child
						else
							if is_node_red (l_node) then
								check l_node /= Void then
									rotate_right (l_node)
								end
								set_colors_after_rotation (l_found_node)
								check attached l_found_node.parent as l_found_parent then
									l_found_node := l_found_parent
								end
							end
							l_node := l_found_node.right_child
							if
								attached l_found_node.key as l_found_node_key and then
								key_comparator.attached_order_equal (a_key, l_found_node_key) and
								l_node = Void
							then
								l_equality := True
							else
								if
									l_node /= Void and then
									not l_node.is_red and then
									not is_node_red (l_node.left_child)
								then
									l_found_node := move_red_right (l_found_node)
								end
								if
									attached l_found_node.key as l_found_node_key and then
									key_comparator.attached_order_equal (l_found_node_key, a_key) then
									l_equality := True
								else
									l_previous_node := l_found_node
									l_found_node := l_found_node.right_child
								end
							end
						end
					end
				end
				found_node := l_found_node
				if l_found_node = Void then
					not_found_node := l_previous_node
				end
				if is_node_red (l_root_node) and then l_found_node /= l_root_node then
					l_root_node.set_is_red (False)
				end
			end
		end

	search_void_key_for_removal: like root_node
			-- Search the node with Void as key for the removal.
		local
			l_found_node: like root_node
		do
			if attached root_node as l_root_node then
				l_found_node := walk_left (l_root_node)
				if l_found_node.key /= Void then
					unset_found_node
					Result := first_node
				else
					found_node := l_found_node
				end
			else
				unset_found_node
			end
		ensure
			find_node_or_result: (found_node = Void) = (Result /= Void)
			result_correct: Result /= Void implies Result = first_node
		end

	fix_up (a_node, a_destination_node: attached like root_node)
			-- Fixup from `a_node' to and including `a_destination_node'.
		require
			a_node_not_void: a_node /= Void
			a_destination_node_not_void: a_destination_node /= Void
			a_node_is_ancestor_of_destination: a_node.is_ancestor_of (a_destination_node)
		local
			l_node: like root_node
			l_parent: like root_node
			l_left_child: like root_node
			l_right_child: like root_node
		do
			from
				l_node := a_node
				l_parent := a_destination_node.parent
			invariant
				l_node_not_void: l_node /= l_parent implies l_node /= Void
			until
				l_node = l_parent
			loop
				check l_node /= Void then
					l_right_child := l_node.right_child
					if is_node_red (l_right_child) then
						check l_right_child /= Void then
							rotate_left (l_right_child)
							set_colors_after_rotation (l_node)
							check attached l_node.parent as l_node_parent then
								l_node := l_node_parent
							end
						end
					end
					l_left_child := l_node.left_child
					if attached l_left_child and then is_node_red (l_left_child) and then is_node_red (l_left_child.left_child) then
						rotate_right (l_left_child)
						set_colors_after_rotation (l_node)
						check attached l_node.parent as l_node_parent then
							l_node := l_node_parent
						end
					end
					l_left_child := l_node.left_child
					l_right_child := l_node.right_child
					if is_node_red (l_left_child) and is_node_red (l_right_child) then
						flip_colors (l_node)
					end
					l_node := l_node.parent
				end
			end
		ensure
			all_paths_have_same_number_of_black_nodes: all_paths_have_same_number_of_black_nodes
		end

	walk_left (a_node: attached like root_node): attached like root_node
			-- Start at `a_node' and walk the left path down and stop
			-- just before `Void' is reached. Return that node.
		require
			a_node_not_void: a_node /= Void
			a_node_is_from_tree: is_node_in_tree (a_node)
		local
			l_node: like root_node
		do
			from
				Result := a_node
				l_node := Result.left_child
			invariant
				result_not_void: Result /= Void
				result_is_node_2: Result.is_red or else is_node_red (Result.left_child) or else is_node_red (Result.right_child)
				l_node_set: l_node = Result.left_child
			until
				l_node = Void
			loop
				if not l_node.is_red and not is_node_red (l_node.left_child) then
					Result := move_red_left (Result)
				end
				check attached Result.left_child as l_left_child then
					Result := l_left_child
				end
				l_node := Result.left_child
			end
		ensure
			result_not_void: Result /= Void
			result_is_in_same_tree: are_nodes_in_same_tree (Result, a_node)
			result_is_red: Result.is_red
		end

	flip_colors (a_node: attached like root_node)
			-- Flip the colors of `a_node' and its children.
		require
			a_node_not_void: a_node /= Void
			left_child_not_void: a_node.left_child /= Void
			right_child_not_void: a_node.right_child /= Void
			same_color: a_node.is_right_child_red = a_node.is_left_child_red
			different_colors: a_node.is_red = a_node.is_left_child_black
		do
			a_node.set_is_red (not a_node.is_red)
			check left_child_not_void: attached a_node.left_child as l_left_child then
				l_left_child.set_is_red (not l_left_child.is_red)
			end
			check right_child_not_void: attached a_node.right_child as l_right_child then
				l_right_child.set_is_red (not l_right_child.is_red)
			end
		ensure
			a_node_flipped_color: (old a_node.is_red) = a_node.is_black
			left_child_flipped_color: (old a_node.is_left_child_red) = a_node.is_left_child_black
			right_child_flipped_color: (old a_node.is_right_child_red) = a_node.is_right_child_black
		end

	set_colors_after_rotation (a_node: attached like root_node)
			-- After a simple left or right rotation after which
			-- a child of `a_node' became its new parent, change
			-- the colors according to that situation.
		require
			a_node_not_void: a_node /= Void
			a_node_parent_not_void: a_node.parent /= Void
			a_node_parent_is_red: attached a_node.parent as l_parent and then l_parent.is_red
		do
			check a_node_parent_not_void: attached a_node.parent as l_parent then
				l_parent.set_is_red (a_node.is_red)
				a_node.set_is_red (True)
			end
		ensure
			parent_got_color_from_a_node: attached a_node.parent as l_parent and then (old a_node.is_red) = l_parent.is_red
			a_node_is_red: a_node.is_red
		end

	move_red_left (a_node: attached like root_node): attached like root_node
			-- Move the red node to the left.
		require
			a_node_not_void: a_node /= Void
			a_node_is_red: a_node.is_red
			left_child_not_void: a_node.left_child /= Void
			left_child_is_black: a_node.is_left_child_black
			right_child_not_void: a_node.right_child /= Void
			right_child_is_black: a_node.is_right_child_black
		local
			l_node: like root_node
		do
			Result := a_node
			l_node := Result.right_child_left_child
			flip_colors (Result)
			if is_node_red (l_node) then
				check l_node /= Void then
					Result := l_node
					rotate_right (Result)
					check attached Result.right_child as l_right_child then
						set_colors_after_rotation (l_right_child)
					end
					rotate_left (Result)
					check attached Result.left_child as l_left_child then
						set_colors_after_rotation (l_left_child)
					end
					flip_colors (Result)
				end
			end
		ensure
			not_void: Result /= Void
		end

	move_red_right (a_node: attached like root_node): attached like root_node
			-- Move the red node to the right.
		require
			a_node_not_void: a_node /= Void
			a_node_is_red: a_node.is_red
			left_child_not_void: a_node.left_child /= Void
			left_child_is_black: a_node.is_left_child_black
			right_child_not_void: a_node.right_child /= Void
			right_child_is_black: a_node.is_right_child_black
		do
			Result := a_node
			check left_child_not_void: attached Result.left_child as l_node then
				flip_colors (Result)
				if is_node_red (l_node.left_child) then
					Result := l_node
					rotate_right (Result)
					check attached Result.right_child as l_right_child then
						set_colors_after_rotation (l_right_child)
					end
					flip_colors (Result)
				end
			end
		ensure
			not_void: Result /= Void
		end

feature {NONE} -- Status report

	is_left_leaning: BOOLEAN
			-- Are all nodes left-leaning?
		local
			l_node: like root_node
		do
			from
				l_node := first_node
				Result := True
			until
				not Result or else l_node = Void
			loop
				if is_node_red (l_node.right_child) then
					Result := is_node_red (l_node.left_child)
				end
				l_node := successor (l_node)
			end
		end

	two_reds_in_a_row: BOOLEAN
			-- Are there two reds in a row?
		local
			l_node: like root_node
		do
			from
				l_node := first_node
			until
				Result or else l_node = Void
			loop
				if l_node.is_red then
					Result := is_node_red (l_node.left_child) or is_node_red (l_node.right_child)
				end
				l_node := successor (l_node)
			end
		end

invariant

	is_left_leaning: is_left_leaning
	not_two_reds_in_a_row: not two_reds_in_a_row

end
