indexing

	description:

		"Bounded structures that can be resized"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_RESIZABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Measurement

	capacity: INTEGER is
			-- Maximum number of items in structure
		deferred
		end

feature -- Status report

	is_full: BOOLEAN is
			-- Is structure full?
		do
			Result := count = capacity
		end

feature -- Resizing

	resize (n: INTEGER) is
			-- Resize structure so that it can contain
			-- at least `n' items. Do not lose any item.
		require
			n_large_enough: n >= capacity
		deferred
		ensure
			capacity_set: capacity = n
		end

invariant

	count_constraint: count <= capacity
	full_definition: is_full = (count = capacity)

end -- class DS_RESIZABLE
