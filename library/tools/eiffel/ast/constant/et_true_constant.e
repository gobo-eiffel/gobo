indexing

	description:

		"Eiffel true constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TRUE_CONSTANT

inherit

	ET_BOOLEAN_CONSTANT

creation

	make, make_with_position

feature -- Status report

	is_true: BOOLEAN is True
			-- Is boolean value true?

invariant

	is_true: is_true

end -- class ET_TRUE_CONSTANT
