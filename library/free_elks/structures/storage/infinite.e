note
	description: "Infinite containers."
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: infinite, storage ;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class INFINITE [G] inherit

	BOX [G]
		redefine
			is_empty
		end

feature -- Status report

	is_empty: BOOLEAN = False
			-- Is structure empty? (Answer: no.)

	full: BOOLEAN = True
			-- The structure is complete

invariant

	never_empty: not is_empty
	always_full: full

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
