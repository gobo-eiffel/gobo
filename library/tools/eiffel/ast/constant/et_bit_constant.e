indexing

	description:

		"Eiffel bit constants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_BIT_CONSTANT

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_position: like position) is
			-- Create a new Bit constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-1]+[bB]
			a_position_not_void: a_position /= Void
		do
			literal := a_literal
			position := a_position
		ensure
			literal_set: literal = a_literal
			position_set: position = a_position
		end

feature -- Access

	literal: STRING
			-- Literal bit value

	position: ET_POSITION
			-- Position in source code

invariant

	literal_not_void: literal /= Void
	-- valid_literal: regexp: [0-1]+[bB]
	position_not_void: position /= Void

end -- class ET_BIT_CONSTANT
