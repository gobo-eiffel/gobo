note
	description: "Finite structures whose item count is subject to change"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: storage;
	size: resizable;
	date: "$Date: 2010-03-23 11:11:37 +0100 (Tue, 23 Mar 2010) $"
	revision: "$Revision: 448 $"

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
		do
			grow (capacity + additional_space)
		ensure
			increased_capacity: capacity >= old capacity + old additional_space
		end

	grow (i: INTEGER)
			-- Ensure that capacity is at least `i'.
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
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2010, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class RESIZABLE
