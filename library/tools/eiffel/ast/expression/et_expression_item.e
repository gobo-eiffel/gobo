indexing

	description:

		"Eiffel expressions which appear in a comma-separated list of expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EXPRESSION_ITEM

inherit

	ET_AST_NODE

feature -- Access

	expression_item: ET_EXPRESSION is
			-- Expression in comma-separated list
		deferred
		ensure
			expression_item_not_void: Result /= Void
		end

end -- class ET_EXPRESSION_ITEM
