note
	description: "External forward one-step iteration cursor for {ARRAY}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date: 2016-04-13 06:29:38 -0700 (Wed, 13 Apr 2016) $"
	revision: "$Revision: 98619 $"

class
	ARRAY_ITERATION_CURSOR [G]

inherit
	GENERAL_SPECIAL_ITERATION_CURSOR [G, ARRAY [G]]
		redefine
			is_valid
		end

create {ARRAY, ARRAY_ITERATION_CURSOR}
	make

feature {NONE} -- Creation

	make (t: like target)
			-- Initialize cursor for target `t'.
		require
			t_attached: attached t
		do
			target := t
			area := target.area
			first_index := t.lower
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

	first_index: INTEGER
			-- <Precursor>

	new_cursor: ARRAY_ITERATION_CURSOR [G]
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

	target: ARRAY [G]
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
