indexing

	description:

		"Structures that may be traversed forward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LINEAR [G]

inherit

	DS_TRAVERSABLE [G]
		redefine
			new_cursor
		end

	DS_SEARCHABLE [G]
		redefine
			searcher
		end

feature -- Access

	new_cursor: DS_LINEAR_CURSOR [G] is
			-- New cursor for traversal
		deferred
		end

	first: G is
			-- First item in structure
		require
			not_empty: not is_empty
		deferred
		ensure
			has_first: has (Result)
		end

	searcher: DS_LINEAR_SEARCHER [G]
			-- Structure searcher

end -- class DS_LINEAR
