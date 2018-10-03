note
	description: "Concrete of an external iteration cursor for {LINKED_LIST}. Reversed traversal has a `(n (n + 1)) / 2' operations cost."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	copyright: "Copyright (c) 1984-2011, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	LINKED_LIST_ITERATION_CURSOR [G]

inherit
	READABLE_INDEXABLE_ITERATION_CURSOR [G]
		redefine
			after,
			forth,
			item,
			start,
			target
		end

create
	make

feature -- Access

	item: G
			-- <Precursor>
		do
			if is_reversed then
				Result := Precursor
			else
					-- Required because `start' sets `active' and `active' can become detached
					-- when falling off the end of the list.
				check active_attached: attached active as l_active then
					Result := l_active.item
				end
			end
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		do
			if is_reversed then
				Result := Precursor
			else
				Result := not is_valid or active = Void
			end
		end

feature -- Cursor movement

	start
			-- <Precursor>
		do
			Precursor
			if not is_reversed then
				active := target.first_element
			end
		end

	forth
			-- <Precursor>
		local
			i: like step
		do
			Precursor
			if not is_reversed then
				from
					i := 1
				until
					i > step or else not attached active as l_active
				loop
					active := l_active.right
					i := i + 1
				end
			end
		end

feature {ITERABLE, ITERATION_CURSOR} -- Access

	target: LINKED_LIST [G]
			-- <Precursor>

feature {NONE} -- Access

	active: detachable LINKABLE [G];
			-- Currrently active linkable node for ascending traversal

note
	copyright: "Copyright (c) 1984-2016, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
