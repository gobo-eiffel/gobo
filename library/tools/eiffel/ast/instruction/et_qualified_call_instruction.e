indexing

	description:

		"Eiffel qualified call instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_QUALIFIED_CALL_INSTRUCTION

inherit

	ET_CALL_INSTRUCTION
		rename
			make as make_unqualified_call
		undefine
			target, position
		end

	ET_QUALIFIED_FEATURE_CALL

creation

	make

end -- class ET_QUALIFIED_CALL_INSTRUCTION
