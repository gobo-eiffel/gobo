indexing

	description:

		"Eiffel true constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_TRUE_CONSTANT

inherit

	ET_BOOLEAN_CONSTANT

creation

	make

feature {NONE} -- Initialization

	make (a_position: like position) is
			-- Create a new True constant.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature -- Status report

	is_true: BOOLEAN is True
			-- Is boolean value true?

invariant

	is_true: is_true

end -- class ET_TRUE_CONSTANT
