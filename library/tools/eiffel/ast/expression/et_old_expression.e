indexing

	description:

		"Eiffel old expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_OLD_EXPRESSION

inherit

	ET_UNARY_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (an_old: like old_keyword; e: like expression) is
			-- Create a new old expression.
		require
			an_old_not_void: an_old /= Void
			e_not_void: e /= Void
		do
			old_keyword := an_old
			expression := e
		ensure
			old_keyword_set: old_keyword = an_old
			expression_set: expression = e
		end

feature -- Access

	old_keyword: ET_KEYWORD
			-- "old" keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := old_keyword.position
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_old_expression (Current)
		end

invariant

	old_keyword_not_void: old_keyword /= Void

end
