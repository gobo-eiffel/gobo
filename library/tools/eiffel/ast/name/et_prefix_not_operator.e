indexing

	description:

		"Eiffel unary 'not' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_NOT_OPERATOR

inherit

	ET_PREFIX_NOT

	ET_PREFIX_KEYWORD_OPERATOR
		undefine
			is_prefix_not
		end

creation

	make, make_with_position

end
