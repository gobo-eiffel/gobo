indexing

	description:

		"Eiffel actual argument lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ACTUAL_ARGUMENTS

creation

	make

feature {NONE} -- Initialization

	make (an_expression: ET_EXPRESSION) is
			-- Create a new actual argument list.
		require
			an_expression_not_void: an_expression /= Void
		do
			!! arguments.make (an_expression)
		ensure
			arguments_set: arguments.expression = an_expression
		end

feature -- Access

	arguments: ET_ACTUAL_ARGUMENT
			-- Arguments

feature -- Element change

	add_argument (an_expression: ET_EXPRESSION) is
			-- Add `an_expression' to argument list.
		require
			an_expression_not_void: an_expression /= Void
		local
			an_argument: like arguments
		do
			!! an_argument.make (an_expression)
			an_argument.set_next (arguments)
			arguments := an_argument
		ensure
			argument_added: arguments.expression = an_expression
			one_more: arguments.next = old arguments
		end

invariant

	arguments_not_void: arguments /= Void

end -- class ET_ACTUAL_ARGUMENTS
