indexing

	description:

		"Indexed cursors for structure traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_INDEXED_CURSOR [G]

inherit

	DS_CURSOR [G]

feature -- Access

	index: INTEGER is
			-- Index of current position
		require
			valid_cursor: is_valid
		deferred
		ensure
			valid_index: valid_index (Result)
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value?
		deferred
		end

feature -- Cursor movement

	go_to (i: INTEGER) is
			-- Move cursor to `i'-th position.
		require
			valid_cursor: is_valid
			valid_index: valid_index (i)
		deferred
		ensure
			moved: index = i
		end

end -- class DS_INDEXED_CURSOR
