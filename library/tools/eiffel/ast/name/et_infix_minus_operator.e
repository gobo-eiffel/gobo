indexing

	description:

		"Eiffel binary '-' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_MINUS_OPERATOR

inherit

	ET_INFIX_MINUS

	ET_INFIX_SYMBOL_OPERATOR
		undefine
			is_infix_minus
		end

creation

	make, make_with_position

end -- class ET_INFIX_MINUS_OPERATOR
