indexing

	description:

		"Structures that can be traversed forward and backward"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINEAR [G]

inherit

	DS_LINEAR [G]
		redefine
			new_cursor, searcher
		end

feature -- Access

	new_cursor: DS_BILINEAR_CURSOR [G] is
			-- New cursor for traversal
		deferred
		end

	last: G is
			-- Last item in structure
		require
			not_empty: not is_empty
		deferred
		ensure
			has_last: has (Result)
		end

	searcher: DS_BILINEAR_SEARCHER [G]
			-- Structure searcher

end -- class DS_BILINEAR
