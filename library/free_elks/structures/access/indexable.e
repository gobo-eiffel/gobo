indexing

	description:
		"Tables whose keys are integers in a contiguous interval"

	status: "See notice at end of class"
	names: indexable, access;
	access: index, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class INDEXABLE [G, H -> INTEGER] inherit

	TABLE [G, H]
		rename
			valid_key as valid_index
		redefine
			put, valid_index
		end

feature -- Measurement

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		deferred
		ensure
			not_void: Result /= Void
		end

feature -- Status report

	valid_index (i: H): BOOLEAN is
			-- Is `i' a valid index?
		deferred
		ensure then
			only_if_in_index_set:
				Result implies
					((i >= index_set.lower) and
					(i <= index_set.upper))
		end

feature -- Element change

	put (v: G; k: H) is
			-- Associate value `v' with key `k'.
		deferred
		ensure then
			insertion_done: item (k) = v
		end

invariant

	index_set_not_void: index_set /= Void

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

end -- class INDEXABLE



