indexing

	description: "[
			Dispensers: containers for which clients have no say
			as to what item they can access at a given time.
			Examples include stacks and queues.
		]"

	status: "See notice at end of class"
	names: dispenser, active;
	access: fixed, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DISPENSER [G] inherit

	ACTIVE [G]

	FINITE [G]

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not is_empty
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not is_empty
		end

feature -- Element change

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		do
			fill (s)
		end

	extend, force, put (v: like item) is
			-- Add item `v'.
		deferred
		end

invariant

	readable_definition: readable = not is_empty
	writable_definition: writable = not is_empty

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

end -- class DISPENSER



