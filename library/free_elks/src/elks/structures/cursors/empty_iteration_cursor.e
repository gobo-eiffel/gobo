note
	description: "External iteration cursor for an ITERABLE without any elements."

class
	EMPTY_ITERATION_CURSOR [G]

inherit
	ITERATION_CURSOR [G]

feature -- Access

	item: G
			-- <Precursor>
		do
			check from_precondition: False then end
		end

feature -- Status report

	after: BOOLEAN = True
			-- <Precursor>
			-- True for an empty ITERABLE.

feature -- Cursor movement

	forth
			-- <Precursor>
		do
		end

note
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
