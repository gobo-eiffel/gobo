note
	description: "Stacks with a bounded physical size, implemented by arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dispenser, array
	representation: array
	access: fixed, lifo, membership
	size: fixed
	contents: generic
	date: "$Date: 2021-06-18 16:58:32 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105547 $"

class BOUNDED_STACK [G] inherit

	ARRAYED_STACK [G]
		redefine
			extendible, correct_mismatch
		end

	BOUNDED [G]
		undefine
			copy, is_equal
		end

create
	make,
	make_from_iterable

convert
	make_from_iterable ({ARRAY [G]})

feature -- Status report

	extendible: BOOLEAN
		do
			Result := not full
		ensure then
			Result = not full
		end

feature -- Correction

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			i: INTEGER
		do
				-- Convert `content' from ARRAY to SPECIAL
			if
				attached {ARRAY [G]} mismatch_information.item ("fl") as array_content and then
				attached {INTEGER} mismatch_information.item ("count") as l_count and then
				attached {BOOLEAN} mismatch_information.item ("object_comparison") as l_comp and then
				attached {INTEGER} mismatch_information.item ("index") as l_index
			then
				create area_v2.make_empty (array_content.count - 1)
				from
					i := 1
				until
					i > l_count
				loop
					extend (array_content.area.item (i))
					i := i + 1
				end
				object_comparison := l_comp
				index := l_index
			else
					-- If it is not redefined then we raise an exception.
				Precursor
			end
		end

invariant
	count_small_enough: count <= capacity

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
