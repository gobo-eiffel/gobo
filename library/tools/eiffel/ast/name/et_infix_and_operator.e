indexing

	description:

		"Eiffel binary 'and' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_AND_OPERATOR

inherit

	ET_INFIX_AND

	ET_INFIX_KEYWORD_OPERATOR
		undefine
			is_infix_and
		end

creation

	make, make_with_position

end
