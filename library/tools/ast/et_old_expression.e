indexing

	description:

		"Eiffel old expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_OLD_EXPRESSION

inherit

	ET_UNARY_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (e: like expression) is
			-- Create a new old expression.
		require
			e_not_void: e /= Void
		do
			expression := e
		ensure
			expression_set: expression = e
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

end -- class ET_OLD_EXPRESSION
