indexing

	description:

		"Eiffel labels"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_LABEL

inherit

	ET_AST_NODE

feature -- Access

	identifier: ET_IDENTIFIER is
			-- Identifier
		deferred
		ensure
			identifier_not_void: Result /= Void
		end

end
