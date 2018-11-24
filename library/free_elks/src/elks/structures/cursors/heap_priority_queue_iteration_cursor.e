note
	description: "External iteration cursor for {HEAP_PRIORITY_QUEUE}."

class
	HEAP_PRIORITY_QUEUE_ITERATION_CURSOR [G -> COMPARABLE]

inherit
	ITERATION_CURSOR [G]

create {HEAP_PRIORITY_QUEUE}
	make

feature {NONE} -- Creation

	make (target: HEAP_PRIORITY_QUEUE [G])
			-- Initialize the cursor with a target queue `target`.
		do
			area := target.area
			area_last_index := target.count - 1
		ensure
			area_set: area = target.area
			area_index_set: area_index = 0
			area_last_index_set: area_last_index = target.count - 1
		end

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := area [area_index]
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		do
			Result := area_index > area_last_index
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		do
			area_index := area_index + 1
		end

feature {NONE} -- Access

	area: SPECIAL [G]
			-- Underlying storage to iterate over.

	area_index: like area.lower
			-- Index of the current item.

	area_last_index: like area.lower
			-- Last valid index of `area`.

;note
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date$"
	revision: "$Revision$"
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
