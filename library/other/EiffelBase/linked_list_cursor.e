indexing

	description:

		"EiffelBase LINKED_LIST_CURSOR class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LINKED_LIST_CURSOR [G]

inherit

	CURSOR

creation

	make

feature {NONE} -- Initialization

	make (a_cell: like current_cell; b, a: BOOLEAN) is
			-- Set cursor.
		require
			consistent: (a_cell = Void) implies (a or b)
			not_both: not (a and b)
		do
			current_cell := a_cell
			before := b
			after := a
		ensure
			current_cell_set: current_cell = a_cell
			before_set: before = b
			after_set: after = a
		end

feature -- Access

	after: BOOLEAN
			-- Is there no valid position to right of cursor?

	before: BOOLEAN
			-- Is there no valid position to left of cursor?

	current_cell: DS_LINKABLE [G]
			-- Cell at cursor position

invariant

	not_both: not (after and before)
	off_definition: (after or before) = (current_cell = Void)

end -- class LINKED_LIST_CURSOR
