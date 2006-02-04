indexing

	description: "[
		General container data structures, 
		characterized by the membership properties of their items.
		]"

	status: "See notice at end of class"
	names: collection, access;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class COLLECTION [G] inherit

	CONTAINER [G]

feature -- Status report

	extendible: BOOLEAN is
			-- May new items be added?
		deferred
		end

	prunable: BOOLEAN is
			-- May items be removed?
		deferred
		end

	is_inserted (v: G): BOOLEAN is
			-- Has `v' been inserted by the most recent insertion?
			-- (By default, the value returned is equivalent to calling 
			-- `has (v)'. However, descendants might be able to provide more
			-- efficient implementations.)
		do
			Result := has (v)
		end

feature -- Element change

	put, extend (v: G) is
			-- Ensure that structure includes `v'.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: is_inserted (v)
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		require
			other_not_void: other /= Void
			extendible: extendible
		local
			lin_rep: LINEAR [G]
		do
			lin_rep := other.linear_representation
			from
				lin_rep.start
			until
				not extendible or else lin_rep.off
			loop
				extend (lin_rep.item)
				lin_rep.forth
			end
		end

feature -- Removal

	prune (v: G) is
			-- Remove one occurrence of `v' if any.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			prunable: prunable
		deferred
		end

	prune_all (v: G) is
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			--|Default implementation, usually inefficient.
		require
			prunable: prunable
		do
			from
			until not has (v) loop
				prune (v)
			end
		ensure
			no_more_occurrences: not has (v)
		end

	wipe_out is
			-- Remove all items.
		require
			prunable: prunable
		deferred
		ensure
			wiped_out: is_empty
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

end -- class COLLECTION


