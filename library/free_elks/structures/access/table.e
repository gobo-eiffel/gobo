indexing

	description:
		"Containers whose items are accessible through keys"

	status: "See notice at end of class"
	names: table, access;
	access: key, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class TABLE [G, H] inherit

	BAG [G]
		rename
			put as bag_put
		end

feature -- Access

	item alias "[]", infix "@" (k: H): G assign put is
			-- Entry of key `k'.
		require
			valid_key: valid_key (k)
		deferred
		end

feature -- Status report

	valid_key (k: H): BOOLEAN is
			-- Is `k' a valid key?
		deferred
		end

feature -- Element change

	put (v: G; k: H) is
			-- Associate value `v' with key `k'.
		require
			valid_key: valid_key (k)
		deferred
		end

feature {NONE} -- Inapplicable

	bag_put (v: G) is
		do
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

end -- class TABLE



