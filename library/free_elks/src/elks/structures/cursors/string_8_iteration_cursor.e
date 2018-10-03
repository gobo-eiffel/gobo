note
	description: "External forward one-step iteration cursor for {STRING_8}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date$"
	revision: "$Revision$"

class
	STRING_8_ITERATION_CURSOR

inherit
	GENERAL_SPECIAL_ITERATION_CURSOR [CHARACTER_8, READABLE_STRING_8]
		redefine
			is_valid
		end

create {READABLE_STRING_8, STRING_8_ITERATION_CURSOR}
	make

feature {NONE} -- Creation

	make (t: like target)
			-- Initialize cursor for target `t'.
		require
			t_attached: attached t
		local
			l: INTEGER
		do
			target := t
			area := target.area
			l := t.area_lower
			area_index := l
			area_first_index := l
			area_last_index := t.area_upper
		ensure
			target_set: target = t
			is_valid: is_valid
			default_step: step = 1
			ascending_traversal: not is_reversed
			first_index_set: first_index = t.lower
			last_index_set: last_index = t.count
		end

feature -- Access

	first_index: INTEGER = 1
			-- <Precursor>

	new_cursor: STRING_8_ITERATION_CURSOR
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

	target: READABLE_STRING_8
			-- <Precursor>

feature {NONE} -- Access

	area_first_index: INTEGER
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
