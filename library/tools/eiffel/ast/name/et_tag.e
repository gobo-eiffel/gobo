indexing

	description:

		"Eiffel tags"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TAG

inherit

	ET_AST_NODE

feature -- Access

	identifier_item: ET_IDENTIFIER is
			-- Identifier
		deferred
		ensure
			identifier_item_not_void: Result /= Void
		end

end -- class ET_TAG
