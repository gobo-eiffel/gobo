note
	description: "Queues with a bounded physical size, implemented by arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dispenser, array;
	representation: array;
	access: fixed, fifo, membership;
	size: fixed;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class BOUNDED_QUEUE [G] inherit

	ARRAYED_QUEUE [G]
		redefine
			correct_mismatch, extendible
		end

	BOUNDED [G]
		undefine
			copy, is_equal, is_empty
		end

create
	make

feature -- Status report

	extendible: BOOLEAN
		do
			Result := not full
		end

feature {NONE} -- Retrieval

	correct_mismatch
		local
			i, nb: INTEGER
		do
			if
				attached {ARRAY [G]} mismatch_information.item ("fl") as a and then
				attached {INTEGER} mismatch_information.item ("in_index") as l_in_index and then
				attached {INTEGER} mismatch_information.item ("out_index") as l_out_index and then
				attached {BOOLEAN} mismatch_information.item ("object_comparison") as c
			then
				out_index := 1
				create area.make_empty (a.capacity)
				if l_out_index > l_in_index then
					from
						i := l_out_index
						nb := a.count
					until
						i >= nb
					loop
						extend (a.item (i))
						i := i + 1
					end
					from
						i := 0
					until
						i >= l_in_index
					loop
						extend (a.item (i))
						i := i + 1
					end
				else
					from
						i := l_out_index
					until
						i >= l_in_index
					loop
						extend (a.item (i))
						i := i + 1
					end
				end
				object_comparison := c
			else
				Precursor
			end
		end

invariant
	valid_count: count <= capacity

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
