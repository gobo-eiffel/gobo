indexing

	description:

		"Eiffel false constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FALSE_CONSTANT

inherit

	ET_BOOLEAN_CONSTANT

creation

	make

feature {NONE} -- Initialization

	make (a_position: like position) is
			-- Create a new False constant.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Status report

	is_true: BOOLEAN is False
			-- Is boolean value true?

invariant

	is_false: not is_true

end -- class ET_FALSE_CONSTANT
