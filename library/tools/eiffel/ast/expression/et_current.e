indexing

	description:

		"Eiffel current entities"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CURRENT

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_position: like position) is
			-- Create a new current entity.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Access

	position: ET_POSITION
			-- Position in source code

invariant

	position_not_void: position /= Void

end -- class ET_CURRENT
