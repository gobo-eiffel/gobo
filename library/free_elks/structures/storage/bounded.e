note

	description:
		"Bounded data structures, with a notion of capacity."
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: bounded, storage;
	date: "$Date$"
	revision: "$Revision$"

deferred class BOUNDED [G] inherit

	FINITE [G]

feature -- Measurement

	capacity: INTEGER
			-- Number of items that may be stored
		deferred
		end

feature -- Status report

	full: BOOLEAN
			-- Is structure full?
		do
			Result := (count = capacity)
		end

	resizable: BOOLEAN
			-- May `capacity' be changed?
		deferred
		end

invariant

	valid_count: count <= capacity
	full_definition: full = (count = capacity)

note
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







end -- class BOUNDED



