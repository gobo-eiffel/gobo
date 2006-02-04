
indexing

	description:
		"Collection, where each element must be unique."

	status: "See notice at end of class"
	names: set;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class SET [G] inherit

	COLLECTION [G]
		redefine
			changeable_comparison_criterion
		end

feature -- Measurement

	count: INTEGER is
			-- Number of items
		deferred
		end

feature -- Element change

	extend, put (v: G) is
			-- Ensure that set includes `v'.
		deferred
		ensure then
			in_set_already: old has (v) implies (count = old count)
			added_to_set: not old has (v) implies (count = old count + 1)
		end

feature -- Removal

	prune (v: G) is
			-- Remove `v' if present.
		deferred
		ensure then
			removed_count_change: old has (v) implies (count = old count - 1)
			not_removed_no_count_change: not old has (v) implies (count = old count)
			item_deleted: not has (v)
		end

	changeable_comparison_criterion: BOOLEAN is
			-- May `object_comparison' be changed?
			-- (Answer: only if set empty; otherwise insertions might
			-- introduce duplicates, destroying the set property.)
		do
			Result := is_empty
		ensure then
			only_on_empty: Result = is_empty
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

end -- class SET



