indexing

	description:

		"Eiffel qualified precursor instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_QUALIFIED_PRECURSOR_INSTRUCTION

inherit

	ET_PRECURSOR_INSTRUCTION
		rename
			make as make_unqualfied_precursor
		undefine
			parent, position, break
		end

	ET_QUALIFIED_PRECURSOR

creation

	make

end -- class ET_QUALIFIED_PRECURSOR_INSTRUCTION
