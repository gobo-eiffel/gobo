indexing

	description:

		"EiffelBase RESIZABLE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class RESIZABLE [G]

inherit

	CONTAINER [G]
		rename
			put as bag_put
		end

feature -- Measurement

	capacity: INTEGER is
			-- Number of items that may be stored
		deferred
		end

	Growth_percentage: INTEGER is 50
			-- Percentage by which structure will grow automatically

	Minimal_increase: INTEGER is 5
			-- Minimal number of additional items

	additional_space: INTEGER is
			-- Proposed number of additional items
			--| Result is a reasonable value, resulting from a space-time tradeoff.
		local
			nb: INTEGER
		do
			nb := (capacity * Growth_percentage // 100)
			if nb >= Minimal_increase then
				Result := nb
			else
				Result := Minimal_increase
			end
		ensure
			At_least_one: Result >= 1
		end

feature -- Status report

	empty: BOOLEAN is
			-- Is structure empty?
		do
			Result := (count = 0)
		end

	full: BOOLEAN is
			-- Is structure full?
		do
			Result := (count = capacity)
		end

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

	valid_count: count <= capacity
	full_definition: full = (count = capacity)
	increase_by_at_least_one: Minimal_increase >= 1

end -- class RESIZABLE
