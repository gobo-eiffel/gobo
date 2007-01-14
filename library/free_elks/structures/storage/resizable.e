indexing

	description:
		"Finite structures whose item count is subject to change"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: storage;
	size: resizable;
	date: "$Date$"
	revision: "$Revision$"

deferred class RESIZABLE [G] inherit

	BOUNDED [G]

feature -- Measurement


	Growth_percentage: INTEGER is 50
			-- Percentage by which structure will grow automatically

	Minimal_increase: INTEGER is 5
			-- Minimal number of additional items

	additional_space: INTEGER is
			-- Proposed number of additional items
			--| Result is a reasonable value, resulting from a space-time tradeoff.
		do
			Result := (capacity * Growth_percentage // 100).max (Minimal_increase)
		ensure
			At_least_one: Result >= 1
		end

feature -- Status report

	resizable: BOOLEAN is
			-- May `capacity' be changed? (Answer: yes.)
		do
			Result := True
		end

feature -- Resizing

	automatic_grow is
			-- Change the capacity to accommodate at least
			-- `Growth_percentage' more items.
			--| Trades space for time:
			--| allocates fairly large chunks of memory but not very often.
		do
			grow (capacity + additional_space)
		ensure
			increased_capacity:
				capacity >= old capacity + old capacity * Growth_percentage // 100
		end

	grow (i: INTEGER) is
			-- Ensure that capacity is at least `i'.
		deferred
		ensure
			new_capacity: capacity >= i
		end

invariant

	increase_by_at_least_one: Minimal_increase >= 1

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class RESIZABLE


