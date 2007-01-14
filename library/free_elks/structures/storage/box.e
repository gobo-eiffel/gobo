indexing

	description: "[
		Data structures of the most general kind,
		having the potential ability to become full,
		and characterized by their implementation properties.
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: storage;
	date: "$Date$"
	revision: "$Revision$"

deferred class BOX [G] inherit

	CONTAINER [G]

feature -- Status report

	full: BOOLEAN is
			-- Is structure filled to capacity?
		deferred
		end

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







end -- class BOX



