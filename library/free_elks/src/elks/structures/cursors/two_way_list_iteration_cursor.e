note
	description: "Concrete of an external iteration cursor for {TWO_WAY_LIST}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	copyright: "Copyright (c) 1984-2011, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	date: "$Date: 2012-09-28 19:31:43 +0200 (Fri, 28 Sep 2012) $"
	revision: "$Revision: 576 $"

class
	TWO_WAY_LIST_ITERATION_CURSOR [G]

inherit
	LINKED_LIST_ITERATION_CURSOR [G]
		redefine
			start,
			item,
			after,
			forth,
			target,
			active
		end

create
	make

feature -- Access

	item: G
			-- <Precursor>
		do
				-- Required because `start' sets `active' and `active' can become detached
				-- when falling off the end of the list.
			check
				active_attached: attached active as a
			then
				Result := a.item
			end
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		do
			Result := not is_valid or active = Void
		end

feature -- Cursor movement

	start
			-- <Precursor>
		local
			l_list: like target
			l_index_set: like index_set
		do
			l_index_set := index_set
			if is_reversed then
				first_index := l_index_set.upper
				last_index := l_index_set.lower
			else
				last_index := l_index_set.upper
				first_index := l_index_set.lower
			end
			target_index := first_index
			l_list := target
			if is_reversed then
				active := l_list.last_element
			else
				active := l_list.first_element
			end
		end

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
					i > step or else not attached active as l_active
				loop
					active := l_active.left
					i := i + 1
				end
			else
				target_index := target_index + step
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

	target: TWO_WAY_LIST [G]
			-- <Precursor>

feature {NONE} -- Access

	active: detachable BI_LINKABLE [G];
			-- Currrently active linkable node for ascending traversal

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
