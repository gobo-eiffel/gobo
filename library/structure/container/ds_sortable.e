indexing

	description:

		"Structures that can be sorted"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_SORTABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Status report

	sorted (sorter: DS_SORTER [G]): BOOLEAN is
			-- Is structure sorted according to `sorter''s criterion?
		require
			sorter_not_void: sorter /= Void
		do
			Result := sorter.sorted (Current)
		end

feature -- Sort

	sort (sorter: DS_SORTER [G]) is
			-- Sort structure using `sorter''s algorithm.
		require
			sorter_not_void: sorter /= Void
		do
			sorter.sort (Current)
		ensure
			sorted: sorted (sorter)
		end

end -- class DS_SORTABLE
