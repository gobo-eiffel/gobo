indexing

	description:

		"Data structure sorters"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SORTER [G]

feature -- Status report

	sorted (a_container: DS_SORTABLE [G]): BOOLEAN is
			-- Is `a_container' sorted?
		require
			a_container_not_void: a_container /= Void
		deferred
		end

feature -- Sort

	sort (a_container: DS_SORTABLE [G]) is
			-- Sort `a_container'.
		require
			a_container_not_void: a_container /= Void
		deferred
		ensure
			sorted: sorted (a_container)
		end

end -- class DS_SORTER
