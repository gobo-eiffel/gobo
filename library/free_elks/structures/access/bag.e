indexing

	description: "[
		Collections of items, where each item may occur zero
		or more times, and the number of occurrences is meaningful.
		]"

	status: "See notice at end of class"
	names: bag, access;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class BAG [G] inherit

	COLLECTION [G]
		redefine
			extend
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in structure
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		deferred
		ensure
			non_negative_occurrences: Result >= 0
		end

feature -- Element change

	extend (v: G) is
			-- Add a new occurrence of `v'.
		deferred
		ensure then
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
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

end -- class BAG



