indexing

	description:

		"Eiffel binary expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_BINARY_EXPRESSION

inherit

	ET_EXPRESSION

feature -- Access

	left, right: ET_EXPRESSION is
			-- Left- and right-hand-sides
		deferred
		end

invariant

	left_not_void: left /= Void
	right_not_void: right /= Void

end -- class ET_BINARY_EXPRESSION
