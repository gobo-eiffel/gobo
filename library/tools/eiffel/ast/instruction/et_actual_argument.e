indexing

	description:

		"Eiffel actual arguments"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ACTUAL_ARGUMENT

creation

	make

feature {NONE} -- Initialization

	make (e: like expression) is
			-- Create a new actual argument.
		require
			e_not_void: e /= Void
		do
			expression := e
		ensure
			expression_set: expression = e
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Argument's expression

	next: ET_ACTUAL_ARGUMENT
			-- Next argument in argument list

feature -- Setting

	set_next (an_argument: like next) is
			-- Set `next' to `an_argument'.
		do
			next := an_argument
		ensure
			next_set: next = an_argument
		end

invariant

	expression_not_void: expression /= Void

end -- class ET_ACTUAL_ARGUMENT
