note

	description:

		"Eiffel expressions preceded by a keyword"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD_EXPRESSION

inherit

	ET_CONDITIONAL

create

	make

feature {NONE} -- Initialization

	make (a_keyword: like keyword; an_expression: like expression)
			-- Create a new keyword-expression.
		require
			a_keyword_not_void: a_keyword /= Void
			an_expression_not_void: an_expression /= Void
		do
			keyword := a_keyword
			expression := an_expression
		ensure
			keyword_set: keyword = a_keyword
			expression_set: expression = an_expression
		end

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword

	expression: ET_EXPRESSION
			-- Expression

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := keyword
		end

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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_keyword_expression (Current)
		end

invariant

	keyword_not_void: keyword /= Void
	expression_not_void: expression /= Void

end
