indexing

	description:

		"Stacks (Last-In, First-Out) implemented with linked cells"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_STACK [G]

inherit

	DS_STACK [G]
		redefine
			searcher
		end

	DS_LINKED_LIST [G]
		rename
			first as item,
			put_first as put,
			force_first as force,
			extend_first as extend,
			append_first as append,
			remove_first as remove,
			prune_first as prune,
			keep_last as keep,
			item as i_th,
			put as put_i_th,
			force as force_i_th,
			extend as extend_i_th,
			append as append_i_th,
			replace as replace_i_th,
			remove as remove_i_th,
			prune as prune_i_th
		export
			{NONE} all
		redefine
			searcher
		select
			keep
		end

creation

	make, make_equal

feature -- Element change

	replace (v: G) is
			-- Replace top item by `v'.
		do
			first_cell.put (v)
		end

feature -- Access

	searcher: DS_LINKED_LIST_SEARCHER [G]
			-- Stack searcher

end -- class DS_LINKED_STACK
