indexing

	description:

		"Hash table searchers using value comparison criterion"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE_VALUE_SEARCHER [G, K -> HASHABLE]

inherit

	DS_HASH_TABLE_SEARCHER [G, K]

feature -- Search

	search_forth (a_cursor: like cursor; v: G) is
			-- Move to first position at or after `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `after' if not found.
		do
			from until
				a_cursor.after or else equal (a_cursor.item, v)
			loop
				a_cursor.forth
			end
		ensure then
			found: not a_cursor.after implies equal (a_cursor.item, v)
		end

	search_back (a_cursor: like cursor; v: G) is
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		do
			from until
				a_cursor.before or else equal (a_cursor.item, v)
			loop
				a_cursor.back
			end
		ensure then
			found: not a_cursor.before implies equal (a_cursor.item, v)
		end

end -- class DS_HASH_TABLE_VALUE_SEARCHER
