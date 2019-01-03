note
	description: "External forward iteration cursor for descendants of {LINKED_TREE}."

class
	LINKED_TREE_ITERATION_CURSOR [G]

inherit
	TREE_ITERATION_CURSOR [G]
		redefine
			forth,
			make,
			node
		end

	LINKED_LIST_ITERATION_CURSOR [G]
		rename
			active as node
		undefine
			after,
			item
		redefine
			forth,
			make,
			node,
			start
		end

create {LINKED_TREE}
	make

feature {NONE} -- Creation

	make (t: like node)
			-- <Precursor>
		do
			Precursor {TREE_ITERATION_CURSOR} (t)
			Precursor {LINKED_LIST_ITERATION_CURSOR} (t)
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		local
			i: like step
		do
			if is_reversed then
				target_index := target_index - step
				from
					i := 1
				until
					i > step or else after
				loop
						-- TODO: Implement `back` and use it here.
					Precursor {TREE_ITERATION_CURSOR}
					i := i + 1
				end
			else
				target_index := target_index + step
				from
					i := 1
				until
					i > step or else after
				loop
					Precursor {TREE_ITERATION_CURSOR}
					i := i + 1
				end
			end
		end

	start
			-- <Precursor>
		local
			n: like first_index
		do
			n := target.count
			if is_reversed then
				first_index := n
				target_index := n
				last_index := 1
			else
				first_index := 1
				target_index := 1
				last_index := n
			end
		end

feature {LINKED_LIST_ITERATION_CURSOR} -- Iteration state

	node: LINKED_TREE [G]
			-- <Precursor>

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
