indexing

	description:

		"Eiffel character constants of the form 'A'"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_C1_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

creation

	make

feature {NONE} -- Initialization

	make (a_value: CHARACTER; a_position: like position) is
			-- Create a new character constant.
		require
			a_position_not_void: a_position /= Void
		do
			value := a_value
			position := a_position
		ensure
			value_set: value = a_value
			position_set: position = a_position
		end

feature -- Access

	value: CHARACTER
			-- Character value

end -- class ET_C1_CHARACTER_CONSTANT
