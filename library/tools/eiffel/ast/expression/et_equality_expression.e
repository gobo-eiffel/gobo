indexing

	description:

		"Eiffel equality expressions (i.e. = and /=)"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EQUALITY_EXPRESSION

inherit

	ET_BINARY_EXPRESSION

feature {NONE} -- Initialization

	make (l: like left; r: like right) is
			-- Create a new equality expression.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left := l
			right := r
		ensure
			left_set: left = l
			right_set: right = r
		end

feature -- Access

	left, right: ET_EXPRESSION
			-- Left- and right-hand-sides

end -- class ET_EQUALITY_EXPRESSION
