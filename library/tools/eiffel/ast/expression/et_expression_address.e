indexing

	description:

		"Eiffel addresses of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			dollar := tokens.dollar_symbol
			expression := e
		ensure
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_expression_address (Current)
		end

invariant

	expression_not_void: expression /= Void

end
