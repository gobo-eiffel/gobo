note
	description: "References to special objects, for direct access to arrays and strings"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class TO_SPECIAL [T]

create
	make_empty_area,
	make_filled_area

feature {NONE} -- Initialization

	make_empty_area (n: INTEGER)
			-- Creates a special object for `n' entries.
		require
			non_negative_argument: n >= 0
		do
			create area.make_empty (n)
		ensure
			area_allocated: area /= Void
			capacity_set: area.capacity = n
			count_set: area.count = 0
		end

	make_filled_area (a_default_value: T; n: INTEGER)
			-- Creates a special object for `n' entries.
		require
			non_negative_argument: n >= 0
		do
			create area.make_filled (a_default_value, n)
		ensure
			area_allocated: area /= Void
			capacity_set: area.capacity = n
			count_set: area.count = n
			area_filled: area.filled_with (a_default_value, 0, n - 1)
		end

feature -- Access

	area: SPECIAL [T]
			-- Special data zone.

	item alias "[]", at alias "@" (i: INTEGER): T assign put
			-- Entry at index `i', if in index interval.
		require
			valid_index: valid_index (i)
		do
			Result := area.item (i)
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of Current?
		do
			Result := area.valid_index (i)
		end

feature -- Element change

	put (v: T; i: INTEGER)
			-- Replace `i'-th entry, if in index interval, by `v'.
		require
			valid_index: valid_index (i)
		do
			area.put (v, i)
		ensure
			inserted: item (i) = v
		end

feature {NONE} -- Element change

	set_area (other: like area)
			-- Make `other' the new `area'.
		do
			area := other
		ensure
			area_set: area = other
		end

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
