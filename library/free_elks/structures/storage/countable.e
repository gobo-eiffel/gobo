indexing

	description: "[
		Infinite containers whose items are in one-to-one 
		correspondence with the integers.
		]"

	status: "See notice at end of class"
	names: countable, infinite, storage ;
	date: "$Date$"
	revision: "$Revision$"

deferred class COUNTABLE [G] inherit

	INFINITE [G]

feature -- Access

	item (i: INTEGER): G is
			-- The `i'-th item
		require
			positive_argument: i > 0
		deferred
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

end -- class COUNTABLE



