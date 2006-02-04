indexing

	description: "[
		``Active'' data structures, which at every stage have
		a possibly undefined ``current item''.
		Basic access and modification operations apply to the current item.
		]"

	status: "See notice at end of class"
	names: active, access
	access: membership
	contents: generic
	date: "$Date$"
	revision: "$Revision$"

deferred class ACTIVE [G] inherit

	BAG [G]

feature -- Access

	item: G is
			-- Current item
		require
			readable: readable
		deferred
		end

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		deferred
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		deferred
		end

feature -- Element change

	replace (v: G) is
			-- Replace current item by `v'.
		require
			writable: writable
		deferred
		ensure
			item_replaced: item = v
		end

feature -- Removal

	remove is
			-- Remove current item.
		require
			prunable: prunable
			writable: writable
		deferred
		end

invariant

	writable_constraint: writable implies readable
	empty_constraint: is_empty implies (not readable) and (not writable)

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

end -- class ACTIVE



