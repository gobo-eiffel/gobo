indexing

	description:

		"Eiffel expression assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPRESSION_ASSERTION

inherit

	ET_ASSERTION

creation

	make

feature {NONE} -- Initialization

	make (a_tag: like tag; an_expression: like expression) is
			-- Create a new assertion.
		require
			an_expression_not_void: an_expression /= Void
		do
			tag := a_tag
			expression := an_expression
		ensure
			tag_set: tag = a_tag
			expression_set: expression = an_expression
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

invariant

	expression_not_void: expression /= Void

end -- class ET_EXPRESSION_ASSERTION
