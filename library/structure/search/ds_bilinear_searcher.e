indexing

	description:

		"Bilinear structure searchers"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_BILINEAR_SEARCHER [G]

inherit

	DS_LINEAR_SEARCHER [G]
		redefine
			container, cursor
		end

feature -- Search

	search_back (a_cursor: like cursor; v: G) is
			-- Move to first position at or before `a_cursor'
			-- position where `item' and `v' are equal.
			-- Move `before' if not found.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: a_cursor.is_valid
			not_cursor_off: not a_cursor.off or a_cursor.before
		deferred
		end

feature {NONE} -- Anchor types

	container: DS_BILINEAR [G] is do end
	cursor: DS_BILINEAR_CURSOR [G] is do end
			-- Anchor types

end -- class DS_BILINEAR_SEARCHER
