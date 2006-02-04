indexing

	description:
		"Sets whose items may be compared according to a total order relation"

	status: "See notice at end of class"
	names: comparable_set, comparable_struct;
	access: membership, min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPARABLE_SET [G -> COMPARABLE] inherit

	SUBSET [G]
		undefine
			disjoint, symdif
		end

	COMPARABLE_STRUCT [G]
		rename
			min as cs_min,
			max as cs_max
		export
			{NONE}
				all
		undefine
			changeable_comparison_criterion
		end

feature -- Measurement

	min: G is
			-- Minimum item
		require
			not_empty: not is_empty
		do
			Result := cs_min
		ensure
			-- smallest: For every item `it' in set, `Result' <= `it'
		end

	max: G is
			-- Maximum item
		require
			not_empty: not is_empty
		do
			Result := cs_max
		ensure
			-- largest: For every item `it' in set, `element' <= `it'
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

end -- class COMPARABLE_SET



