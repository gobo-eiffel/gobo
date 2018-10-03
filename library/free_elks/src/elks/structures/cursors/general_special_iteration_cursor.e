note
	description: "External forward one-step iteration cursor for structures that use {SPECIAL} for storage."
	library: "EiffelBase: Library of reusable components for Eiffel."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GENERAL_SPECIAL_ITERATION_CURSOR [G, H -> READABLE_INDEXABLE [G]]

inherit
	TYPED_INDEXABLE_ITERATION_CURSOR [G, H]
		redefine
			item
		end

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := area [area_index]
		end

	cursor_index: INTEGER
			-- <Precursor>
		do
			Result := area_index + 1 - area_first_index
		end

	target_index: INTEGER
			-- <Precursor>
		do
			Result := area_index + first_index - area_first_index
		end

	last_index: INTEGER
			-- <Precursor>
		do
			Result := area_last_index + first_index - area_first_index
		end

	step: INTEGER = 1
			-- <Precursor>

	reversed alias "-": READABLE_INDEXABLE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (target)
			Result.reverse
			Result.start
		end

	incremented alias "+" (n: like step): READABLE_INDEXABLE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (target)
			Result.set_step (step + n)
			Result.start
		end

	decremented alias "-" (n: like step): READABLE_INDEXABLE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (target)
			Result.set_step (step - n)
			Result.start
		end

	with_step (n: like step): READABLE_INDEXABLE_ITERATION_CURSOR [G]
			-- <Precursor>
		do
			create Result.make (target)
			Result.set_step (n)
			Result.start
		end

feature -- Status report	

	after: BOOLEAN
			-- <Precursor>
		do
			Result := area_index > area_last_index
		end

	is_reversed: BOOLEAN = False
			-- <Precursor>

	is_valid: BOOLEAN
			-- <Precursor>
		do
			Result := target.upper = last_index
		end

	is_first: BOOLEAN
			-- <Precursor>
		do
			Result := area_index = area_first_index
		end

	is_last: BOOLEAN
			-- <Precursor>
		do
			Result := area_index = area_last_index
		end

feature -- Cursor movement

	start
			-- <Precursor>
		do
			area_index := area_first_index
		end

	forth
			-- <Precursor>
		do
			area_index := area_index + 1
		end

feature {TYPED_INDEXABLE_ITERATION_CURSOR} -- Access

	area: SPECIAL [G]
			-- Associated storage used for iteration.

feature {NONE} -- Access

	area_index: INTEGER
			-- Index position in `area' for current iteration.

	area_first_index: INTEGER
			-- First valid index of `area'.
		deferred
		end

	area_last_index: INTEGER
			-- Last valid index of `area'.

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
