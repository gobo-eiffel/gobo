note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_5 [G, H]

create

	make

feature {NONE} -- Initialization

	make (f: detachable G; s: attached H)
		do
			first := f
			second := s
			create first_cell.put (f)
			create second_cell.put (s)
		end

feature -- Access

	first: detachable G
	second: attached H
	first_cell: CELL [detachable G]
	second_cell: CELL [attached H]

end
