indexing

	description:

		"Cells containing an item"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_CELL [G]

create

	make

feature -- Access

	item: G
			-- Content of cell

feature -- Element change

	put, make (v: G) is
			-- Insert `v' in cell.
		do
			item := v
		ensure
			inserted: item = v
		end

end
