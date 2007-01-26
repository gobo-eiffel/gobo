indexing

	description:

		"Bounded data structures that can be resized"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_RESIZABLE [G]

inherit

	DS_CONTAINER [G]
		redefine
			make_default
		end

feature {NONE} -- Initialization

	make_default is
			-- Create an empty container and allocate memory
			-- space for at least `default_capacity' items.
		deferred
		ensure then
			capacity_set: capacity = default_capacity
		end

feature -- Measurement

	capacity: INTEGER is
			-- Maximum number of items in container
		deferred
		end

	default_capacity: INTEGER is
			-- Initial capacity in `make_default'
			-- (Default value: 10)
		do
			Result := 10
		ensure
			default_capacity_positive: Result >= 0
		end

feature -- Status report

	is_full: BOOLEAN is
			-- Is container full?
		do
			Result := count = capacity
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize container so that it can contain
			-- at least `n' items. Do not lose any item.
		require
			n_large_enough: n >= capacity
		deferred
		ensure
			capacity_set: capacity = n
		end

feature {NONE} -- Configuration

	new_capacity (n: INTEGER): INTEGER is
			-- New capacity which could accommodate at least
			-- `n' items (Used as argument of `resize'.)
		require
			n_large_enough: n >= capacity
		do
			Result := (n + 1) * 3 // 2
		ensure
			definition: Result >= n
		end

invariant

	count_constraint: count <= capacity
	full_definition: is_full = (count = capacity)

end
