indexing

	description:

		"Eiffel unary free operators"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PREFIX_FREE_OPERATOR

inherit

	ET_PREFIX_FREE

	ET_PREFIX_OPERATOR
		undefine
			is_prefix_free
		end

	ET_TOKEN
		rename
			text as free_operator_name
		end

creation

	make, make_with_position

end -- class ET_PREFIX_FREE_OPERATOR
