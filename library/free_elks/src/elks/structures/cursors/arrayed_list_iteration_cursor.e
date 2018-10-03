note
	description: "External forward one-step iteration cursor for {ARRAYED_LIST}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date$"
	revision: "$Revision$"

class
	ARRAYED_LIST_ITERATION_CURSOR [G]

inherit
	GENERAL_SPECIAL_ITERATION_CURSOR [G, ARRAYED_LIST [G]]
		redefine
			is_valid
		end

create {ARRAYED_LIST, ARRAYED_LIST_ITERATION_CURSOR}
	make

feature {NONE} -- Creation

	make (t: like target)
			-- Initialize cursor for target `t'.
		require
			t_attached: attached t
		do
			target := t
			area := target.area
			area_last_index := t.upper - first_index
		ensure
			target_set: target = t
			is_valid: is_valid
			default_step: step = 1
			ascending_traversal: not is_reversed
			first_index_set: first_index = t.lower
			last_index_set: last_index = t.upper
		end

feature -- Access

	first_index: INTEGER = 1
			-- <Precursor>

	new_cursor: ARRAYED_LIST_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (target)
		end

feature -- Status report	

	is_valid: BOOLEAN
			-- <Precursor>
		do
			Result := target.area = area and then Precursor
		end

feature {TYPED_INDEXABLE_ITERATION_CURSOR} -- Access

	target: ARRAYED_LIST [G]
			-- <Precursor>

feature {NONE} -- Access

	area_first_index: INTEGER = 0
			-- <Precursor>

;note
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
