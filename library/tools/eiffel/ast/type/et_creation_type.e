indexing

	description:

		"Eiffel creation types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_TYPE

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE is
			-- Type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end
