note
	description: "External iteration cursor for {ARRAYED_QUEUE}."

class
	ARRAYED_QUEUE_ITERATION_CURSOR [G]

inherit
	ITERATION_CURSOR [G]

create {ARRAYED_QUEUE}
	make

feature {NONE} -- Creation

	make (target: ARRAYED_QUEUE [G])
			-- Initialize the cursor with a target queue `target`.
		do
			area := target.area
			area_index := target.out_index - {ARRAYED_QUEUE [G]}.lower
			remaining_count := target.count
		ensure
			area_set: area = target.area
			area_index_set: area_index = target.out_index - {ARRAYED_QUEUE [G]}.lower
			remaining_count_set: remaining_count = target.count
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
			Result := remaining_count = 0
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		do
			area_index := area_index + 1
			if area_index >= area.count then
				area_index := 0
			end
			remaining_count := remaining_count - 1
		end

feature {NONE} -- Access

	area: SPECIAL [G]
			-- Underlying storage to iterate over.

	area_index: like {SPECIAL [G]}.lower
			-- Index of the current item.

	remaining_count: like {ARRAYED_QUEUE [G]}.count
			-- Number of items to be iterated over.

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
