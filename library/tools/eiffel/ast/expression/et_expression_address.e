indexing

	description:

		"Eiffel addresses of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (d: like dollar; e: like expression) is
			-- Create a new expression address.
		require
			d_not_void: d /= Void
			e_not_void: e /= Void
		do
			dollar := d
			expression := e
		ensure
			dollar_set: dollar = d
			expression_set: expression = e
		end

feature -- Access

	expression: ET_PARENTHESIZED_EXPRESSION
			-- Expression

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

invariant

	expression_not_void: expression /= Void

end
