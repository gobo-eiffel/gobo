indexing

	description:

		"Names of Eiffel prefix '-' features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PREFIX_MINUS_NAME

inherit

	ET_PREFIX_MINUS

	ET_PREFIX_NAME
		undefine
			is_prefix_minus
		end

creation

	make

end -- class ET_PREFIX_MINUS_NAME
