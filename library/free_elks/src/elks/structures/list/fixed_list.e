note
	description: "Lists with fixed maximum numbers of items, implemented by arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: fixed, sequence
	representation: array
	access: index, cursor, membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

class FIXED_LIST [G]

inherit
	ARRAYED_LIST [G]
		undefine
			resizable
		redefine
			capacity,
			extendible,
			make,
			make_filled,
			make_from_iterable
		end

	FIXED [G]
		undefine
			copy, is_equal,
			full
		end

create
	make,
	make_from_iterable,
	make_filled

feature -- Initialization

	make (n: INTEGER_32)
			-- <Precursor>
		do
			capacity := n
			Precursor (n)
		end

	make_filled (n: INTEGER_32)
			-- <Precursor>
		do
			capacity := n
			Precursor (n)
		end

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a list with all items obtained from `other`.
		do
			make (estimated_count_of (other))
			across
				other as o
			loop
				if not extendible then
					capacity := capacity + 1
				end
				extend (o.item)
			end
			capacity := count
		end

feature -- Status report

	capacity: INTEGER
			-- Requested capacity upon creation.

	extendible: BOOLEAN
			-- May new items be added?
		do
			Result := count < capacity
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
