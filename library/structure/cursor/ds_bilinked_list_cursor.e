indexing

	description:

		"Cursors for bilinked list traversals"

	library:    "Gobo Eiffel Structures Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST_CURSOR [G]

inherit

	DS_LINKED_LIST_CURSOR [G]
		redefine
			back, container, current_cell
		end

creation

	make

feature -- Access

	container: DS_BILINKED_LIST [G]
			-- List traversed

feature -- Cursor movement

	back is
			-- Move cursor to previous position.
		do
			if after then
				after := False
				current_cell := container.last_cell
			else
				current_cell := current_cell.left
			end
			before := current_cell = Void
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_SEARCHER} -- Implementation

	current_cell: DS_BILINKABLE [G]
			-- Cell at cursor position

end -- class DS_BILINKED_LIST_CURSOR
