indexing

	description:

		"Eiffel inspect choices which appear in a comma-separated list of choices"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHOICE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	choice: ET_CHOICE is
			-- Choice in comma-separated list
		deferred
		ensure
			choice_not_void: Result /= Void
		end

end
