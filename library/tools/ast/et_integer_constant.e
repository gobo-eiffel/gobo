indexing

	description:

		"Eiffel integer constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INTEGER_CONSTANT

inherit

	ET_EXPRESSION

feature -- Access

	literal: STRING
			-- Literal integer absolute value

	is_negative: BOOLEAN
			-- Is integer value negative?

	position: ET_POSITION
			-- Position in source code

feature -- Setting

	set_negative is
			-- Set `is_negative' to True.
		do
			is_negative := True
		ensure
			is_negative: is_negative
		end

invariant

	literal_not_void: literal /= Void
	position_not_void: position /= Void

end -- class ET_INTEGER_CONSTANT
