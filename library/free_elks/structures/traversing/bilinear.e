indexing

	description:
		"Structures that may be traversed forward and backward"

	status: "See notice at end of class"
	names: bidirectional, traversing;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class BILINEAR [G] inherit

	LINEAR [G]
		rename
			search as sequential_search
		export
			{NONE}
				sequential_search
		redefine
			off
		end

	LINEAR [G]
		redefine
			search, off
		select
			search
		end

feature -- Access

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := before or after
		end

feature -- Cursor movement

	before: BOOLEAN is
			-- Is there no valid position to the left of current one?
		deferred
		end

	back is
			-- Move to previous position.
		require
			not_before: not before
		deferred
		ensure then
			-- moved_forth_after_start: (not before) implies index = old index - 1
		end

	search (v: like item) is
			-- Move to first position (at or after current
			-- position) where `item' and `v' are equal.
			-- If structure does not include `v' ensure that
			-- `exhausted' will be true.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			if before and not is_empty then
				forth
			end
			sequential_search (v)
		end

invariant

	not_both: not (after and before)
	before_constraint: before implies off

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

end -- class BILINEAR



