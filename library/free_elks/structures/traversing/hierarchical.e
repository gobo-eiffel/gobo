indexing

	description: "[
		Hierarchical structures in which each item has zero or
		one immediate predecessor, and zero or more successors.
		]"

	status: "See notice at end of class"
	names: hierarchical, traversing;
	access: cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class HIERARCHICAL [G] inherit

	TRAVERSABLE [G]

feature -- Access

	successor_count: INTEGER is
			-- Number of successors of current element
		require
			not_off: not off
		deferred
		end

feature -- Cursor movement

	up is
			-- Move to predecessor.
		require
			not_off: not off
		deferred
		end

	down (i: INTEGER) is
			-- Move to `i'-th successor.
		require
			not_off: not off
 			argument_within_bounds: i >= 1 and i <= successor_count
		deferred
		end

invariant

	non_negative_successor_count: successor_count >= 0

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

end -- class HIERARCHICAL



