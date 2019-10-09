note
	description: "Sets represented as arrayed lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: arrayed_set, set, arrayed_list;
	representation: array;
	size: fixed;
	access: membership;
	contents: generic;
	date: "$Date$";
	revision: "$Revision$"

class ARRAYED_SET [G] inherit

	LINEAR_SUBSET [G]
		undefine
			prune_all, copy, is_equal, fill
		select
			extend, put, prune
		end

	ARRAYED_LIST [G]
		rename
			extend as al_extend,
			has as has alias "∋",
			put as al_put,
			prune as al_prune
		export
			{ANY} valid_cursor_index, readable, writable, to_array, new_cursor
			{ARRAYED_SET} go_to, area, area_v2, cursor, full, i_th, lower,
				valid_cursor
			{NONE} all
		undefine
			is_inserted,
			changeable_comparison_criterion
		redefine
			make_from_iterable
		end

create
	make,
	make_from_iterable

create {ARRAYED_SET}
	make_filled

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a circular chain with all items obtained from `other`.
		do
			make (estimated_count_of (other))
			across
				other as o
			loop
				extend (o.item)
			end
		end

feature -- Element change

	put, extend (v: G)
			-- Insert `v' if not present.
		do
			if is_empty or else not has (v) then
				al_extend (v)
			end
		end

feature -- Removal

	prune (v: like item)
			-- Remove `v' if present.
		do
			start
			al_prune (v)
		end

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
