indexing

	description:

		"Eiffel parenthesized expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENTHESIZED_EXPRESSION

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (l: like left_parenthesis; e: like expression; r: like right_parenthesis) is
			-- Create a new parenthesized expression.
		require
			l_not_void: l /= Void
			e_not_void: e /= Void
			r_not_void: r /= Void
		do
			left_parenthesis := l
			expression := e
			right_parenthesis := r
		ensure
			left_parenthesis_set: left_parenthesis = l
			expression_set: expression = e
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	left_parenthesis: ET_SYMBOL
	right_parenthesis: ET_SYMBOL
			-- Parentheses

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

invariant

	expression_not_void: expression /= Void
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end -- class ET_PARENTHESIZED_EXPRESSION
