﻿note

	description:

		"Eiffel expressions followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_EXPRESSION_COMMA

inherit

	ET_EXPRESSION_ITEM

create

	make

feature {NONE} -- Initialization

	make (an_expression: like expression; a_comma: like comma)
			-- Create a new expression-comma.
		require
			an_expression_not_void: an_expression /= Void
			a_comma_not_void: a_comma /= Void
		do
			expression := an_expression
			comma := a_comma
		ensure
			expression_set: expression = an_expression
			comma_set: comma = a_comma
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

feature -- Setting

	set_expression (an_expression: like expression)
			-- Set `expression' to `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			expression := an_expression
		ensure
			expression_set: expression = an_expression
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_expression_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
