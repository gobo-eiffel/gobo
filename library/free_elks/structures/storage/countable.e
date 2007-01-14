indexing

	description: "[
		Infinite containers whose items are in one-to-one 
		correspondence with the integers.
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: countable, infinite, storage ;
	date: "$Date$"
	revision: "$Revision$"

deferred class COUNTABLE [G] inherit

	INFINITE [G]

feature -- Access

	item (i: INTEGER): G is
			-- The `i'-th item
		require
			positive_argument: i > 0
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







end -- class COUNTABLE



