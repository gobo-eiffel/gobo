indexing

	description: "Sets represented as arrayed lists"
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
			put as al_put,
			prune as al_prune
		export
			{ANY} valid_cursor_index, readable, writable
			{ARRAYED_SET} go_to, area, cursor, full, i_th, lower, upper,
				subcopy, valid_cursor, subarray
			{NONE} all
		undefine
			is_inserted,
			changeable_comparison_criterion
		end

create 
	make
	
create {ARRAYED_SET}
	make_filled

feature -- Element change

	put, extend (v: G) is
			-- Insert `v' if not present.
		do
			if is_empty or else not has (v) then
				al_extend (v)
			end
		end

feature -- Removal

	prune (v: like item) is
			-- Remove `v' if present.
		do
			start
			al_prune (v)
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







end -- class ARRAYED_SET
