note
	description: "[
		Sequential lists where the cells are sorted in ascending order
		according to the relational operators of PART_COMPARABLE
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: sorted_list, sorted_struct, sequence;
	access: index, cursor, membership, min, max;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

deferred class SORTED_LIST [G -> COMPARABLE] inherit

	PART_SORTED_LIST [G]

feature -- Measurement

	min: like item
			-- Minimum item
		require
			not_empty: not is_empty
		do
			Result := first
		ensure
			min_is_first: Result = first
			-- smallest: For every item `it' in list, `Result' <= `it'
		end

	max: like item
			-- Maximum item
		require
			not_empty: not is_empty
		do
			Result := last
		ensure
			max_is_last: Result = last
			-- largest: For every item `it' in list, `it' <= `Result'
		end

	median: like item
			-- Median item
		require
			not_empty: not is_empty
		do
			Result := i_th ((count + 1) // 2)
		ensure
			median_definition: Result = i_th ((count + 1) // 2)
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
