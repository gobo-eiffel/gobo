indexing

	description:
		"Structures with a finite item count"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: finite, storage;
	date: "$Date$"
	revision: "$Revision$"

deferred class FINITE [G] inherit

	BOX [G]

feature -- Measurement

	count: INTEGER is
			-- Number of items
		deferred
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is structure empty?
		do
			Result := (count = 0)
		end

invariant

	empty_definition: is_empty = (count = 0)
	non_negative_count: count >= 0

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







end -- class FINITE



