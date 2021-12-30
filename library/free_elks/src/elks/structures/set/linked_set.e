note
	description: "Sets implemented by linked lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linked_set, set, linked_list
	representation: linked
	access: membership
	contents: generic
	date: "$Date: 2021-06-18 17:01:52 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105548 $"

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
			has as has alias "∋",
			put as ll_put,
			prune as ll_prune
		export
			{NONE} ll_extend, ll_put, ll_prune
		undefine
			changeable_comparison_criterion, is_inserted
		redefine
			make_from_iterable
		end

create

	make,
	make_from_iterable

convert
	make_from_iterable ({ARRAY [G]})

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a set with all items obtained from `other`.
		do
			make
			⟳ o: other ¦ extend (o) ⟲
		end

feature -- Element change

	put, extend (v: G)
			-- Ensure that set includes `v'.
		do
			if is_empty or else not has (v) then
				ll_extend (v)
			end
		end

feature -- Removal

	prune (v: like item)
		-- Remove `v' if present.
		do
			start
			ll_prune (v)
		end

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
