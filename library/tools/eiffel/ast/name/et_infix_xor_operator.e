indexing

	description:

		"Eiffel binary 'xor' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_XOR_OPERATOR

inherit

	ET_INFIX_XOR

	ET_INFIX_KEYWORD_OPERATOR
		undefine
			is_infix_xor
		end

creation

	make, make_with_position

end
