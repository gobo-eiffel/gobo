note
	description: "Structures with a finite item count"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: finite, storage;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class FINITE [G] inherit

	BOX [G]

feature -- Measurement

	count: INTEGER
			-- Number of items
		deferred
		ensure
			count_non_negative: Result >= 0
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is structure empty?
		do
			Result := count = 0
		end

invariant
	empty_definition: is_empty = (count = 0)

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
