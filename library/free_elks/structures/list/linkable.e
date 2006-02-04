indexing

	description:
		"Linkable cells containing a reference to their right neighbor"

	status: "See notice at end of class"
	names: linkable, cell;
	representation: linked;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKABLE [G] inherit

	CELL [G]
		export
			{CELL, CHAIN}
				put
			{ANY}
				item
		end

feature -- Access

	right: like Current
			-- Right neighbor

feature {CELL, CHAIN} -- Implementation

	put_right (other: like Current) is
			-- Put `other' to the right of current cell.
		do
			right := other
		ensure
			chained: right = other
		end

	forget_right is
			-- Remove right link.
		do
			right := Void
		ensure
			not_chained: right = Void
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

end -- class LINKABLE



