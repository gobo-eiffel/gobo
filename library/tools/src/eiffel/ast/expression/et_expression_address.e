note

	description:

		"Eiffel addresses of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_ADDRESS

inherit

	ET_ADDRESS_EXPRESSION
		redefine
			reset,
			is_instance_free
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

feature -- Status report

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := expression.is_instance_free
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
