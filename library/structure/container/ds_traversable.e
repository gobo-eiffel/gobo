indexing

	description:

		"Structures that can be traversed"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_TRAVERSABLE [G]

inherit

	DS_CONTAINER [G]

feature -- Access

	new_cursor: DS_CURSOR [G] is
			-- New cursor for traversal
		deferred
		ensure
			cursor_not_void: Result /= Void
			valid_cursor: valid_cursor (Result)
		end

feature -- Status report

	valid_cursor (a_cursor: like new_cursor): BOOLEAN is
			-- Is `a_cursor' a valid cursor?
			-- (A cursor might become invalid if structure
			-- has been modified during traversal.)
		require
			a_cursor_not_void: a_cursor /= Void
		do
			Result := a_cursor.container = Current and a_cursor.is_valid
		ensure
			is_valid: Result implies a_cursor.is_valid
		end

end -- class DS_TRAVERSABLE
