indexing

	description:

		"Names of Eiffel infix '>=' features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INFIX_GE_NAME

inherit

	ET_INFIX_GE

	ET_INFIX_NAME
		undefine
			is_infix_ge
		end

creation

	make

end -- class ET_INFIX_GE_NAME
