indexing

	description:
		"Sets implemented by linked lists"

	status: "See notice at end of class"
	names: linked_set, set, linked_list;
	representation: linked;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_SET [G] inherit

	LINEAR_SUBSET [G]
		undefine
			prune_all, copy, is_equal, fill
		select
			extend, put, prune
		end

	LINKED_LIST [G]
		rename
			extend as ll_extend,
			put as ll_put,
			prune as ll_prune
		export
			{NONE} ll_extend, ll_put, ll_prune
		undefine
			changeable_comparison_criterion, is_inserted
		end

create

	make

feature -- Element change

	put, extend (v: G) is
			-- Ensure that set includes `v'.
		do
			if is_empty or else not has (v) then
				ll_extend (v)
			end
		end

feature -- Removal

	prune (v: like item) is
		-- Remove `v' if present.
		do
			start
			ll_prune (v)
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

end -- class LINKED_SET



