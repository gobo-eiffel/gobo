indexing

	description: "[
		Stacks (last-in, first-out dispensers), without commitment
		to a particular representation
		]"

	status: "See notice at end of class"
	names: stack, dispenser;
	access: fixed, lifo, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class STACK [G] inherit

	DISPENSER [G]
		export
			{NONE} prune, prune_all
		redefine
			extend, force, put, fill
		end

feature -- Element change

	extend, force, put (v: like item) is
			-- Push `v' onto top.
		deferred
		ensure then
			item_pushed: item = v
		end

	replace (v: like item) is
			-- Replace top item by `v'.
		do
			remove
			extend (v)
		end

	fill (other: LINEAR [G]) is
			-- Fill with as many items of `other' as possible.
			-- Fill items with greatest index from `other' first.
			-- Items inserted with lowest index (from `other') will
			-- always be on the top of stack.
			-- The representations of `other' and current structure
			-- need not be the same.
		local
			temp: ARRAYED_STACK [G]
		do
			create temp.make (0)
			from
				other.start
			until
				other.off
			loop
				temp.extend (other.item)
				other.forth
			end
			from
			until
				temp.is_empty or else not extendible
			loop
				extend (temp.item)
				temp.remove
			end
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

end -- class STACK



