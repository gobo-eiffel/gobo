note
	description: "[
		Data structures of the most general kind,
		having the potential ability to become full,
		and characterized by their implementation properties.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: storage;
	date: "$Date$"
	revision: "$Revision$"

deferred class BOX [G] inherit

	CONTAINER [G]

feature -- Status report

	full: BOOLEAN
			-- Is structure filled to capacity?
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
