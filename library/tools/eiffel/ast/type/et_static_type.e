indexing

	description:

		"Eiffel types in static feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_STATIC_TYPE

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
