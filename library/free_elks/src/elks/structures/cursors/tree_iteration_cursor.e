note
	description: "External forward one-step iteration cursor for descendants of {TREE}."

class
	TREE_ITERATION_CURSOR [G]

inherit
	ITERATION_CURSOR [G]

create {TREE}
	make

feature {NONE} -- Creation

	make (target: like node)
			-- Initialize the cursor with a target tree `target`.
		do
			node := target
			create {ARRAYED_STACK [like {TREE [G]}.child_index]} child_index.make (1)
			child_index.put (0)
		ensure
			node_set: node = target
			child_index_set: child_index.count = 1 and then child_index.item = 0
		end

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := node.item
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		do
			Result := child_index.is_empty
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		local
			index: like child_index.item
			child_cursor: CURSOR
			child: like node
			maximum_index: like node.child_capacity
		do
			index := child_index.item
			maximum_index := node.child_capacity
			from
					-- Record current node cursor.
				child_cursor := node.child_cursor
			until
				index >= maximum_index or else attached child
			loop
					-- Advance current child index.
				index := index + 1
					-- Switch to the child at the new index.
				node.child_go_i_th (index)
					-- Use child node if available.
				if node.child_readable then
					child := node.child
				end
			end
				-- Restore current node cursor.
			node.child_go_to (child_cursor)
			if attached child then
					-- There is a child that has not been iterated over.
					-- Make it the current node and start nested iteration from the beginning.
				node := child
				child_index.replace (index)
				child_index.put (0)
			else
					-- All children have been iterated over.
					-- Go one level up in the tree (if possible).
				child_index.remove
				if attached node.parent as p then
					node := p
				end
			end
		end

feature {NONE} -- Iteration state

	node: TREE [G]
			-- Current node with an item.

	child_index: STACK [like {TREE [G]}.child_index]
			-- Indexes of children to iterate over.

;note
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date$"
	revision: "$Revision$"
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
