indexing

	description: "[
		Data structures whose items may be compared
		according to a total order relation
		]"

	status: "See notice at end of class"
	names: comparable_struct;
	access: min, max;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPARABLE_STRUCT [G -> COMPARABLE] inherit

	BILINEAR [G]

feature -- Measurement

	min: like item is
			-- Minimum item
		require
			min_max_available

		do
			from
				start
				Result := item
				forth
			until
				off
			loop
				if item < Result then
					Result := item
				end
				forth
			end
		ensure
		--	smallest: For every item `it' in structure, `Result' <= `it'
		end

	max: like item is
			-- Maximum item
		require
			min_max_available

		do
			from
				start
				Result := item
				forth
			until
				off
			loop
				if item > Result then
					Result := item
				end
				forth
			end
		ensure
		--	largest: For every item `it' in structure, `it' <= `Result'
		end

	min_max_available: BOOLEAN is
			-- Can min and max be computed?
		do
			Result := not is_empty
		ensure
			Result implies not is_empty
		end

feature {NONE} -- Inapplicable

	index: INTEGER is
		do
		end

invariant

	empty_constraint: min_max_available implies not is_empty

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

end -- class COMPARABLE_STRUCT



