indexing

	description:

		"Eiffel syntax errors"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_SYNTAX_ERROR

inherit

	ET_ERROR

feature {NONE} -- Initialization

	make (a_position: ET_POSITION) is
			-- Create a new Eiffel syntax error at position `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (a_position.out, 1)
		end

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = position

end -- class ET_SYNTAX_ERROR
