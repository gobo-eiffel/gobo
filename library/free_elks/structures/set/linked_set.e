indexing

	description:
		"Sets implemented by linked lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
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
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class LINKED_SET



