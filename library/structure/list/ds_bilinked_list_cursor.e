indexing

	description:

		"Cursors for bilinked list traversals"

	library:    "Gobo Eiffel Structures Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST_CURSOR [G]

inherit

	DS_LINKED_LIST_CURSOR [G]
		redefine
			container, current_cell, next_cursor
		end

creation

	make

feature -- Access

	container: DS_BILINKED_LIST [G]
			-- List traversed

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	current_cell: DS_BILINKABLE [G]
			-- Cell at cursor position

feature {DS_BILINKED_LIST} -- Implementation

	next_cursor: DS_BILINKED_LIST_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end -- class DS_BILINKED_LIST_CURSOR
