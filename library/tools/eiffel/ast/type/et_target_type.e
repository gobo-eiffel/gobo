indexing

	description:

		"Eiffel types surrounded by braces"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TARGET_TYPE

inherit

	ET_AGENT_TARGET
	ET_AGENT_ACTUAL_ARGUMENT

feature -- Access

	type: ET_TYPE is
			-- Type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end
