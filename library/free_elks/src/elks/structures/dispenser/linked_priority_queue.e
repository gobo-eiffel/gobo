note
	description: "Priority queues implemented as sorted lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: priority_queue, queue
	contents: generic
	date: "$Date: 2021-06-18 16:58:32 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105547 $"

class LINKED_PRIORITY_QUEUE [G -> COMPARABLE] inherit

	SORTED_TWO_WAY_LIST [G]
		rename
			item as sl_item,
			put as sl_put,
			sequence_put as put
		export
			{NONE} all
			{LINKED_PRIORITY_QUEUE}
				cursor, start, forth, go_to, index, after,
				first_element, last_element, valid_cursor, sl_item
			{ANY}
				off
		redefine
			put, remove
		end

	PRIORITY_QUEUE [G]
		rename
			item as sl_item
		export
			{LINKED_PRIORITY_QUEUE} sl_item
		undefine
			copy, is_equal,
			prune_all, append, readable, writable, fill
		end

create
	make,
	make_from_iterable

create {LINKED_PRIORITY_QUEUE}
	make_sublist

convert
	make_from_iterable ({ARRAY [G]})

feature -- Access

	item: G
			-- Entry at top of heap.
		do
			Result := i_th (count)
		end

feature -- Removal

	remove
			-- Remove item of highest value.
		do
			go_i_th (count)
			Precursor {SORTED_TWO_WAY_LIST}
			go_i_th (count)
		end

feature -- Element change

	put (v: like item)
			-- Insert item `v' at its proper position.
		do
			extend (v)
		end

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
