indexing

	description:

		"Eiffel addresses of expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPRESSION_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (e: like expression) is
			-- Create a new expression address.
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

invariant

	expression_not_void: expression /= Void

end -- class ET_EXPRESSION_ADDRESS
