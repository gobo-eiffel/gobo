indexing

	description:

		"Cells containing an item"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_CELL [G]

creation

	make

feature -- Access

	item: G 
			-- Content of cell

feature -- Element change

	make, put (v: G) is
			-- Insert `v' in cell.
		do
			item := v
		ensure
			inserted: item = v
		end

end -- class DS_CELL
