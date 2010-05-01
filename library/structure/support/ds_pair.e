note

	description:

		"Cells containing two items"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_PAIR [G, H]

inherit

	DS_CELL [G]
		rename
			item as first,
			put as put_first,
			make as make_first
		end

create

	make

feature {NONE} -- Initialization

	make (v: G; w: H) is
			-- Create a new cell containing `v' and `w'.
		do
			first := v
			second := w
		ensure
			first_set: first = v
			second_set: second = w
		end

feature -- Access

	second: H
			-- Second item of cell

feature -- Element change

	put_second (w: H) is
			-- Insert `w' in cell.
		do
			second := w
		ensure
			inserted: second = w
		end

end
