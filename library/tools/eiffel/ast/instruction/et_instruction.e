indexing

	description:

		"Eiffel instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INSTRUCTION

inherit

	ET_AST_NODE

feature -- Status report

	is_semicolon: BOOLEAN is
			-- Is current node a semicolon?
		do
			-- Result := False
		end

end -- class ET_INSTRUCTION
