indexing

	description:

		"Eiffel boolean constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_BOOLEAN_CONSTANT

inherit

	ET_EXPRESSION

feature -- Access

	position: ET_POSITION
			-- Position in source code

feature -- Status report

	is_true: BOOLEAN is
			-- Is boolean value true?
		deferred
		end

invariant

	position_not_void: position /= Void

end -- class ET_BOOLEAN_CONSTANT
