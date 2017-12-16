note
	description: "Finite structures whose item count is subject to change"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: storage;
	size: resizable;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class RESIZABLE [G] inherit

	BOUNDED [G]

feature -- Measurement

	Growth_percentage: INTEGER = 50
			-- Percentage by which structure will grow automatically

	Minimal_increase: INTEGER = 5
			-- Minimal number of additional items

	additional_space: INTEGER
			-- Proposed number of additional items
			--| Result is a reasonable value, resulting from a space-time tradeoff.
		do
				-- To prevent overflow we do not use `growth_percentage' but its known value.
			Result := (capacity // 2).max (Minimal_increase)
		ensure
			At_least_one: Result >= 1
		end

feature -- Status report

	resizable: BOOLEAN
			-- May `capacity' be changed? (Answer: yes.)
		do
			Result := True
		end

feature -- Resizing

	automatic_grow
			-- Change the capacity to accommodate at least
			-- `Growth_percentage' more items.
			--| Trades space for time:
			--| allocates fairly large chunks of memory but not very often.
		require
			resizable: resizable
		do
			grow (capacity + additional_space)
		ensure
			increased_capacity: capacity >= old capacity + old additional_space
		end

	grow (i: INTEGER)
			-- Ensure that capacity is at least `i'.
		require
			resizable: resizable
		deferred
		ensure
			new_capacity: capacity >= i
		end

	trim
			-- Decrease `capacity' to the minimum value.
			-- Apply to reduce allocated storage.
		deferred
		ensure
			same_count: count = old count
			minimal_capacity: capacity = count
		end

invariant

	increase_by_at_least_one: Minimal_increase >= 1

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
