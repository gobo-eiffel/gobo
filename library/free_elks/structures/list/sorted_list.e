indexing

	description: "[
		Sequential lists where the cells are sorted in ascending order
		according to the relational operators of PART_COMPARABLE
		]"

	status: "See notice at end of class"
	names: sorted_list, sorted_struct, sequence;
	access: index, cursor, membership, min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class SORTED_LIST [G -> COMPARABLE] inherit

	PART_SORTED_LIST [G]

feature -- Measurement

	min: like item is
			-- Minimum item
		require
			not_empty: not is_empty
		do
			Result := first
		ensure
			min_is_first: Result = first
			-- smallest: For every item `it' in list, `Result' <= `it'
		end

	max: like item is
			-- Maximum item
		require
			not_empty: not is_empty
		do
			Result := last
		ensure
			max_is_last: Result = last
			-- largest: For every item `it' in list, `it' <= `Result'
		end

	median: like item is
			-- Median item
		require
			not_empty: not is_empty
		do
			Result := i_th ((count + 1) // 2)
		ensure
			median_definition: Result = i_th ((count + 1) // 2)
		end


indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class SORTED_LIST



