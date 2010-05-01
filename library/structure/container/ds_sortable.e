note

	description:

		"Data structures that can be sorted"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_SORTABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Status report

	sorted (a_sorter: DS_SORTER [G]): BOOLEAN is
			-- Is container sorted according to `a_sorter''s criterion?
		require
			a_sorter_not_void: a_sorter /= Void
		do
			Result := a_sorter.sorted (Current)
		end

feature -- Sort

	sort (a_sorter: DS_SORTER [G]) is
			-- Sort container using `a_sorter''s algorithm.
		require
			a_sorter_not_void: a_sorter /= Void
		do
			a_sorter.sort (Current)
		ensure
			sorted: sorted (a_sorter)
		end

end
