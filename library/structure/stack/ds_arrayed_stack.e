indexing

	description:

		"Stacks (Last-In, First-Out) implemented with arrays"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_STACK [G]

inherit

	DS_STACK [G]
		redefine
			searcher
		end

	DS_RESIZABLE [G]

	DS_ARRAYED_LIST [G]
		rename
			last as item,
			put_last as put,
			force_last as force,
			extend_last as extend,
			append_last as append,
			remove_last as remove,
			prune_last as prune,
			keep_first as keep,
			item as i_th,
			put as put_i_th,
			force as force_i_th,
			extend as extend_i_th,
			append as append_i_th,
			replace as replace_i_th,
			remove as remove_i_th,
			prune as prune_i_th
		export
			{DS_ARRAYED_LIST} storage
			{NONE} all
		redefine
			searcher
		select
			item, put, force, extend,
			append, remove, prune
		end

creation

	make, make_equal

feature -- Element change

	replace (v: G) is
			-- Replace top item by `v'.
		do
			replace_i_th (v, count)
		end

feature -- Access

	searcher: DS_ARRAYED_LIST_SEARCHER [G]
			-- Stack searcher

end -- class DS_ARRAYED_STACK
