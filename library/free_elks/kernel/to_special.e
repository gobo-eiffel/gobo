note
	description: "References to special objects, for direct access to arrays and strings"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TO_SPECIAL [T]

create
	make_area

feature -- Access

	area: SPECIAL [T]
			-- Special data zone

feature {NONE} -- Initialization

	make_area (n: INTEGER)
			-- Creates a special object for `n' entries.
		require
			non_negative_argument: n >= 0
		do
			create area.make (n)
		ensure
			area_allocated: area /= Void and then area.count = n
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

	item alias "[]", at alias "@" (i: INTEGER): T assign put
			-- Entry at index `i', if in index interval
		require
			valid_index: valid_index (i)
		do
			Result := area.item (i)
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' within the bounds of Current?
		do
			Result := (0 <= i) and then (i < area.count)
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
			-- Make `other' the new `area'
		do
			area := other
		ensure
			area_set: area = other
		end

end
