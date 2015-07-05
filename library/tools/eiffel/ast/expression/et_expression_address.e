note

	description:

		"Eiffel addresses of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression)
			-- Create a new expression address.
		require
			e_not_void: e /= Void
		do
			dollar := tokens.dollar_symbol
			expression := e
		ensure
			expression_set: expression = e
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			expression.reset
		end

feature -- Access

	expression: ET_PARENTHESIZED_EXPRESSION
			-- Expression

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_expression_address (Current)
		end

invariant

	expression_not_void: expression /= Void

end
