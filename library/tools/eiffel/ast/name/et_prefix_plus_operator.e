indexing

	description:

		"Eiffel unary '+' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_PLUS_OPERATOR

inherit

	ET_PREFIX_PLUS

	ET_PREFIX_SYMBOL_OPERATOR
		undefine
			is_prefix_plus
		end

creation

	make, make_with_position

end -- class ET_PREFIX_PLUS_OPERATOR
