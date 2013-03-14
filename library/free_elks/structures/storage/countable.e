note
	description: "[
		Infinite containers whose items are in one-to-one 
		correspondence with the integers.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: countable, infinite, storage ;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class COUNTABLE [G] inherit

	INFINITE [G]

feature -- Access

	item (i: INTEGER): G
			-- The `i'-th item
		require
			positive_argument: i > 0
		deferred
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
