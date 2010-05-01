note

	description:

		"Eiffel expressions which appear in a comma-separated list of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION_ITEM

inherit

	ET_AST_NODE

feature -- Access

	expression: ET_EXPRESSION is
			-- Expression in comma-separated list
		deferred
		ensure
			expression_not_void: Result /= Void
		end

end
