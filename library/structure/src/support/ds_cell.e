note

	description:

		"Cells containing an item"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_CELL [G]

create

	make

feature -- Access

	item: G
			-- Content of cell

feature -- Status report

	has_void: BOOLEAN
			-- Does cell include Void?
		do
			Result := (item = Void)
		ensure
			item_void: (item = Void) implies Result
		end

feature -- Element change

	put, make (v: G)
			-- Insert `v' in cell.
		do
			item := v
		ensure
			inserted: item = v
		end

end
