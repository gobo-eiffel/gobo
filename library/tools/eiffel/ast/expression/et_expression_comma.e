indexing

	description:

		"Eiffel expressions followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPRESSION_COMMA

inherit

	ET_EXPRESSION_ITEM

creation

	make

feature {NONE} -- Initialization

	make (an_expression: like expression_item; a_comma: like comma) is
			-- Create a new expression-comma.
		require
			an_expression_not_void: an_expression /= Void
		do
			expression_item := an_expression
		ensure
			expression_item_set: expression_item = an_expression
		end

feature -- Access

	expression_item: ET_EXPRESSION
			-- Expression in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := expression_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_EXPRESSION_COMMA
