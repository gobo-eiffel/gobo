indexing

	description:

		"Eiffel unary expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_UNARY_EXPRESSION

inherit

	ET_EXPRESSION

feature -- Access

	expression: ET_EXPRESSION is
			-- Expression
		deferred
		end

invariant

	expression_not_void: expression /= Void

end -- class ET_UNARY_EXPRESSION
