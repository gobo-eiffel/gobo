indexing

	description:

		"Eiffel binary expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_BINARY_EXPRESSION

inherit

	ET_EXPRESSION

creation

feature -- Access

	left, right: ET_EXPRESSION
			-- Left- and right-hand-sides

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right.break
		end

invariant

	left_not_void: left /= Void
	right_not_void: right /= Void

end -- class ET_BINARY_EXPRESSION
