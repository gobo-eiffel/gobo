indexing

	description:

		"Eiffel assertions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSERTION

inherit

	ET_ASSERTION_ITEM

feature -- Access

	expression: ET_EXPRESSION is
			-- Expression (may be Void)
		deferred
		end

	assertion: ET_ASSERTION is
			-- Assertion in list of assertions
		do
			Result := Current
		end

end
