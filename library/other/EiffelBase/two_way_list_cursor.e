indexing

	description:

		"EiffelBase TWO_WAY_LIST_CURSOR class interface"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_LIST_CURSOR [G]

inherit

	LINKED_LIST_CURSOR [G]
		redefine
			current_cell
		end

create

	make

feature -- Access

	current_cell: DS_BILINKABLE [G]
			-- Cell at cursor position

end
