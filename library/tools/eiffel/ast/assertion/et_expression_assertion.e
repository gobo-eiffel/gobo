indexing

	description:

		"Eiffel expression assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPRESSION_ASSERTION

inherit

	ET_ASSERTION

creation

	make

feature {NONE} -- Initialization

	make (an_expression: like expression) is
			-- Create a new assertion.
		require
			an_expression_not_void: an_expression /= Void
		do
			expression := an_expression
		ensure
			expression_set: expression = an_expression
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

invariant

	expression_not_void: expression /= Void

end -- class ET_EXPRESSION_ASSERTION
