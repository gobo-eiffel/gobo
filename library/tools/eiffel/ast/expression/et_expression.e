indexing

	description:

		"Eiffel expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION

inherit

	ET_EXPRESSION_ITEM
		rename
			expression as expression_item
		end

	ET_CONDITIONAL
		rename
			expression as expression_item
		end

	ET_ASSERTION
		rename
			expression as expression_item
		end

	ET_AGENT_ACTUAL_ARGUMENT

feature -- Access

	expression_item: ET_EXPRESSION is
			-- Current expression
		do
			Result := Current
		end

end
