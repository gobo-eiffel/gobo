indexing

	description:

		"Eiffel conditional expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONDITIONAL

inherit

	ET_AST_NODE

feature -- Access

	expression: ET_EXPRESSION is
			-- Conditional expression
		deferred
		ensure
			expression_not_void: Result /= Void
		end

end
