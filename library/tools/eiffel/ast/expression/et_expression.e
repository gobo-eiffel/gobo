indexing

	description:

		"Eiffel expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION

inherit

	ET_EXPRESSION_ITEM
	ET_ASSERTION

feature -- Access

	expression_item: ET_EXPRESSION is
			-- Expression in comma-separated list
		do
			Result := Current
		end

end -- class ET_EXPRESSION
