indexing

	description:

		"Cells containing two items"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_PAIR [G, H]

inherit

	DS_CELL [G]
		rename
			item as first,
			put as put_first,
			make as make_first
		export
			{NONE} make_first
		end

creation

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

end -- class DS_PAIR
