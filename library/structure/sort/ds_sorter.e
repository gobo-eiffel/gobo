indexing

	description:

		"Structure sorters"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SORTER [G]

feature -- Status report

	sorted (container: DS_SORTABLE [G]): BOOLEAN is
			-- Is `container' sorted?
		require
			container_not_void: container /= Void
		deferred
		end

feature -- Sort

	sort (container: DS_SORTABLE [G]) is
			-- Sort `container'.
		require
			container_not_void: container /= Void
		deferred
		ensure
			sorted: sorted (container)
		end

end -- class DS_SORTER
