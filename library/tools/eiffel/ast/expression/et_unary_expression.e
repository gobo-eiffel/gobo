note

	description:

		"Eiffel unary expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_UNARY_EXPRESSION

inherit

	ET_EXPRESSION

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := expression.break
		end

invariant

	expression_not_void: expression /= Void

end
