indexing

	description:

		"Eiffel type descriptors in agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AGENT_TYPE

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
